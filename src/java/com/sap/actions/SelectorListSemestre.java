/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.EncabezadoFacade;
import com.sap.ejb.EstudianteFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.MuestraadministrativoFacade;
import com.sap.ejb.MuestradirectorFacade;
import com.sap.ejb.MuestradocenteFacade;
import com.sap.ejb.MuestraegresadoFacade;
import com.sap.ejb.MuestraempleadorFacade;
import com.sap.ejb.MuestraestudianteFacade;
import com.sap.entity.Muestra;
import com.sap.entity.Proceso;
import com.sap.entity.Programa;
import com.sap.interfaz.Action;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acreditacion
 */
public class SelectorListSemestre implements Action {

    MuestradirectorFacade muestradirectorFacade = lookupMuestradirectorFacadeBean();
    MuestraadministrativoFacade muestraadministrativoFacade = lookupMuestraadministrativoFacadeBean();
    MuestraempleadorFacade muestraempleadorFacade = lookupMuestraempleadorFacadeBean();
    MuestraegresadoFacade muestraegresadoFacade = lookupMuestraegresadoFacadeBean();
    MuestradocenteFacade muestradocenteFacade = lookupMuestradocenteFacadeBean();
    EncabezadoFacade encabezadoFacade = lookupEncabezadoFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    MuestraestudianteFacade muestraestudianteFacade = lookupMuestraestudianteFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Programa programa = (Programa) sesion.getAttribute("Programa");
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        String semestre = request.getParameter("semestre"); //parametro que viene x post
        sesion.setAttribute("Semestre", semestre);
        Muestra m = (Muestra) sesion.getAttribute("Muestra");
        String fuente;

        if (request.getParameter("fuente") == null) {
            fuente = (String) sesion.getAttribute("selectorFuente");
        } else {
            fuente = request.getParameter("fuente");
            sesion.setAttribute("selectorFuente", fuente);
        }
        if ("Estudiante".equals(fuente)) {
            if ( semestre != null && !semestre.equals("todos") ) {
                sesion.setAttribute("listMuestraSeleccionada", muestraestudianteFacade.findByList2("muestrapersonaId.muestraId", m, "semestre", semestre));
                sesion.setAttribute("Fuente", fuenteFacade.find(1));
                List e = estudianteFacade.findByList2("programaId", programa, "semestre", semestre);
                sesion.setAttribute("listPoblacion", e);
                List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                sesion.setAttribute("listEncabezado", le);
            }else{
                if(semestre != null && semestre.equals("todos")){
                sesion.setAttribute("listMuestraSeleccionada", muestraestudianteFacade.findByList("muestrapersonaId.muestraId", m));
                sesion.setAttribute("Fuente", fuenteFacade.find(1));
                List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                sesion.setAttribute("listEncabezado", le);
                }
            }

        } else {
            if ("Docente".equals(fuente)) {
                sesion.setAttribute("listMuestraSeleccionada", muestradocenteFacade.findByList("muestrapersonaId.muestraId", m));
            } else {
                if ("Egresado".equals(fuente)) {
                    sesion.setAttribute("listMuestraSeleccionada", muestraegresadoFacade.findByList("muestrapersonaId.muestraId", m));
                } else {
                    if ("Empleador".equals(fuente)) {
                        sesion.setAttribute("listMuestraSeleccionada", muestraempleadorFacade.findByList("muestrapersonaId.muestraId", m));
                    } else {
                        if ("Administrativo".equals(fuente)) {
                            sesion.setAttribute("listMuestraSeleccionada", muestraadministrativoFacade.findByList("muestrapersonaId.muestraId", m));
                        } else {
                            if ("Directivo".equals(fuente)) {
                                sesion.setAttribute("listMuestraSeleccionada", muestradirectorFacade.findByList("muestrapersonaId.muestraId", m));
                            }
                        }
                    }
                }
            }

        }

        return "/WEB-INF/vista/comitePrograma/muestra/selectorListMuestra.jsp";
    }

    private MuestraestudianteFacade lookupMuestraestudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraestudianteFacade) c.lookup("java:global/sapnaval/MuestraestudianteFacade!com.sap.ejb.MuestraestudianteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private FuenteFacade lookupFuenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FuenteFacade) c.lookup("java:global/sapnaval/FuenteFacade!com.sap.ejb.FuenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EstudianteFacade lookupEstudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EstudianteFacade) c.lookup("java:global/sapnaval/EstudianteFacade!com.sap.ejb.EstudianteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EncabezadoFacade lookupEncabezadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EncabezadoFacade) c.lookup("java:global/sapnaval/EncabezadoFacade!com.sap.ejb.EncabezadoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestradocenteFacade lookupMuestradocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestradocenteFacade) c.lookup("java:global/sapnaval/MuestradocenteFacade!com.sap.ejb.MuestradocenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraegresadoFacade lookupMuestraegresadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraegresadoFacade) c.lookup("java:global/sapnaval/MuestraegresadoFacade!com.sap.ejb.MuestraegresadoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraempleadorFacade lookupMuestraempleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraempleadorFacade) c.lookup("java:global/sapnaval/MuestraempleadorFacade!com.sap.ejb.MuestraempleadorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraadministrativoFacade lookupMuestraadministrativoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraadministrativoFacade) c.lookup("java:global/sapnaval/MuestraadministrativoFacade!com.sap.ejb.MuestraadministrativoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestradirectorFacade lookupMuestradirectorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestradirectorFacade) c.lookup("java:global/sapnaval/MuestradirectorFacade!com.sap.ejb.MuestradirectorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
