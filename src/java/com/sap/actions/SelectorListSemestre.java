/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.EncabezadoFacade;
import com.sap.ejb.EstudianteFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.MuestraFacade;
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
import java.util.Iterator;
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

    MuestraFacade muestraFacade = lookupMuestraFacadeBean();
    EncabezadoFacade encabezadoFacade = lookupEncabezadoFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    MuestraestudianteFacade muestraestudianteFacade = lookupMuestraestudianteFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        List<Muestra> lm = muestraFacade.findByList("procesoId", proceso);
        String fuente = request.getParameter("fuente");
        sesion.setAttribute("fuenteX", "" + fuente);
        Muestra m = null;


        String semestre = request.getParameter("semestre"); //parametro que viene x post
        sesion.setAttribute("Semestre", semestre);

        if (!lm.isEmpty()) {
            Iterator i = lm.iterator();
            while (i.hasNext()) {
                m = (Muestra) i.next();
                sesion.setAttribute("Muestra", m);

                if (semestre != null && semestre.equals("todos")) {
                    //ESTUDIANTES
                    sesion.setAttribute("listMuestraCon", muestraestudianteFacade.findByMuestraConEncabezado(proceso));
                    sesion.setAttribute("listMuestraSin", muestraestudianteFacade.findByMuestraSinEncabezado(proceso));
                    sesion.setAttribute("poblacion", estudianteFacade.findByList("procesoId", proceso));
                }else if (semestre != null && !semestre.equals("todos")){
                    sesion.setAttribute("listMuestraCon", muestraestudianteFacade.findByMuestraConEncabezado(proceso, semestre));
                    sesion.setAttribute("listMuestraSin", muestraestudianteFacade.findByMuestraSinEncabezado(proceso, semestre));
                    sesion.setAttribute("poblacion", estudianteFacade.findByList("procesoId", proceso));
                }
            }
        }

        if ("Estudiante".equals(fuente)) {
            if (semestre != null && !semestre.equals("todos")) {
            } else {
                if (semestre != null && semestre.equals("todos")) {
                    /*sesion.setAttribute("listMuestraSeleccionada", muestraestudianteFacade.findByList("muestrapersonaId.muestraId", m));
                     sesion.setAttribute("Fuente", fuenteFacade.find(1));
                     List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                     sesion.setAttribute("listEncabezado", le);
                     * */
                }
            }

        }

        return "/WEB-INF/vista/comitePrograma/muestra/selectorListMuestra.jsp";
    }

    private MuestraestudianteFacade lookupMuestraestudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraestudianteFacade) c.lookup("java:global/sap/MuestraestudianteFacade!com.sap.ejb.MuestraestudianteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private FuenteFacade lookupFuenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FuenteFacade) c.lookup("java:global/sap/FuenteFacade!com.sap.ejb.FuenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EstudianteFacade lookupEstudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EstudianteFacade) c.lookup("java:global/sap/EstudianteFacade!com.sap.ejb.EstudianteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EncabezadoFacade lookupEncabezadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EncabezadoFacade) c.lookup("java:global/sap/EncabezadoFacade!com.sap.ejb.EncabezadoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraFacade lookupMuestraFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraFacade) c.lookup("java:global/sap/MuestraFacade!com.sap.ejb.MuestraFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
