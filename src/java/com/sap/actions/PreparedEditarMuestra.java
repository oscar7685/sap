/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.AdministrativoFacade;
import com.sap.ejb.AgenciagubernamentalFacade;
import com.sap.ejb.DirectorprogramaFacade;
import com.sap.ejb.DocenteFacade;
import com.sap.ejb.EgresadoFacade;
import com.sap.ejb.EmpleadorFacade;
import com.sap.ejb.EncabezadoFacade;
import com.sap.ejb.EstudianteFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.MuestraadministrativoFacade;
import com.sap.ejb.MuestraagenciaFacade;
import com.sap.ejb.MuestradirectorFacade;
import com.sap.ejb.MuestradocenteFacade;
import com.sap.ejb.MuestraegresadoFacade;
import com.sap.ejb.MuestraempleadorFacade;
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
public class PreparedEditarMuestra implements Action {

    AgenciagubernamentalFacade agenciagubernamentalFacade = lookupAgenciagubernamentalFacadeBean();
    MuestraagenciaFacade muestraagenciaFacade = lookupMuestraagenciaFacadeBean();
    DirectorprogramaFacade directorprogramaFacade = lookupDirectorprogramaFacadeBean();
    MuestradirectorFacade muestradirectorFacade = lookupMuestradirectorFacadeBean();
    EmpleadorFacade empleadorFacade = lookupEmpleadorFacadeBean();
    MuestraempleadorFacade muestraempleadorFacade = lookupMuestraempleadorFacadeBean();
    AdministrativoFacade administrativoFacade = lookupAdministrativoFacadeBean();
    MuestraadministrativoFacade muestraadministrativoFacade = lookupMuestraadministrativoFacadeBean();
    EgresadoFacade egresadoFacade = lookupEgresadoFacadeBean();
    MuestraegresadoFacade muestraegresadoFacade = lookupMuestraegresadoFacadeBean();
    DocenteFacade docenteFacade = lookupDocenteFacadeBean();
    MuestradocenteFacade muestradocenteFacade = lookupMuestradocenteFacadeBean();
    EncabezadoFacade encabezadoFacade = lookupEncabezadoFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Programa programa = (Programa) sesion.getAttribute("Programa");
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        String fuente = (String) sesion.getAttribute("selectorFuente");
        if (fuente.equals("Estudiante")) {
            List e = estudianteFacade.findByList2("programaId", programa, "semestre", sesion.getAttribute("Semestre"));
            sesion.setAttribute("listPoblacion", e);
            List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
            sesion.setAttribute("listEncabezado", le);
        } else {
            if (fuente.equals("Docente")) {
                Muestra m = (Muestra) sesion.getAttribute("Muestra");
                sesion.setAttribute("listMuestraSeleccionada", muestradocenteFacade.findByList("muestrapersonaId.muestraId", m));
                sesion.setAttribute("Fuente", fuenteFacade.find(2));
                List d = docenteFacade.findByList("programaId", programa);
                sesion.setAttribute("listPoblacion", d);
                List le = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                sesion.setAttribute("listEncabezado", le);
            } else {
                if (fuente.equals("Egresado")) {
                    Muestra m = (Muestra) sesion.getAttribute("Muestra");
                    sesion.setAttribute("listMuestraSeleccionada", muestraegresadoFacade.findByList("muestrapersonaId.muestraId", m));
                    sesion.setAttribute("Fuente", fuenteFacade.find(4));
                    List eg = egresadoFacade.findByList("programaId", programa);
                    sesion.setAttribute("listPoblacion", eg);
                    List leg = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                    sesion.setAttribute("listEncabezado", leg);
                } else {
                    if (fuente.equals("Administrativo")) {
                        Muestra m = (Muestra) sesion.getAttribute("Muestra");
                        sesion.setAttribute("listMuestraSeleccionada", muestraadministrativoFacade.findByList("muestrapersonaId.muestraId", m));
                        sesion.setAttribute("Fuente", fuenteFacade.find(3));
                        List eg = administrativoFacade.findByList("programaId", programa);
                        sesion.setAttribute("listPoblacion", eg);
                        List leg = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                        sesion.setAttribute("listEncabezado", leg);
                    } else {
                        if (fuente.equals("Empleador")) {
                            Muestra m = (Muestra) sesion.getAttribute("Muestra");
                            sesion.setAttribute("listMuestraSeleccionada", muestraempleadorFacade.findByList("muestrapersonaId.muestraId", m));
                            sesion.setAttribute("Fuente", fuenteFacade.find(6));
                            List emp = empleadorFacade.findByList("programaId", programa);
                            sesion.setAttribute("listPoblacion", emp);
                            List lemp = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                            sesion.setAttribute("listEncabezado", lemp);
                        } else if (fuente.equals("Visitante")) {
                            Muestra m = (Muestra) sesion.getAttribute("Muestra");
                            sesion.setAttribute("listMuestraSeleccionada", muestraagenciaFacade.findByList("muestrapersonaId.muestraId", m));
                            sesion.setAttribute("Fuente", fuenteFacade.find(7));
                            List vis = agenciagubernamentalFacade.findByList("programaId", programa);
                            sesion.setAttribute("listPoblacion", vis);
                            List lvis = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                            sesion.setAttribute("listEncabezado", lvis);
                        } else {
                            Muestra m = (Muestra) sesion.getAttribute("Muestra");
                            sesion.setAttribute("listMuestraSeleccionada", muestradirectorFacade.findByList("muestrapersonaId.muestraId", m));
                            sesion.setAttribute("Fuente", fuenteFacade.find(5));
                            List dir = directorprogramaFacade.findByList("programaId", programa);
                            sesion.setAttribute("listPoblacion", dir);
                            List ldir = encabezadoFacade.findByList2("procesoId", proceso, "fuenteId", sesion.getAttribute("Fuente"));
                            sesion.setAttribute("listEncabezado", ldir);
                        }
                    }
                }
            }

        }
        return "/WEB-INF/vista/comitePrograma/muestra/editarMuestra.jsp";
    }

    private FuenteFacade lookupFuenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FuenteFacade) c.lookup("java:global/sapenfermeria/FuenteFacade!com.sap.ejb.FuenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EstudianteFacade lookupEstudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EstudianteFacade) c.lookup("java:global/sapenfermeria/EstudianteFacade!com.sap.ejb.EstudianteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EncabezadoFacade lookupEncabezadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EncabezadoFacade) c.lookup("java:global/sapenfermeria/EncabezadoFacade!com.sap.ejb.EncabezadoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestradocenteFacade lookupMuestradocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestradocenteFacade) c.lookup("java:global/sapenfermeria/MuestradocenteFacade!com.sap.ejb.MuestradocenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private DocenteFacade lookupDocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DocenteFacade) c.lookup("java:global/sapenfermeria/DocenteFacade!com.sap.ejb.DocenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraegresadoFacade lookupMuestraegresadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraegresadoFacade) c.lookup("java:global/sapenfermeria/MuestraegresadoFacade!com.sap.ejb.MuestraegresadoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EgresadoFacade lookupEgresadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EgresadoFacade) c.lookup("java:global/sapenfermeria/EgresadoFacade!com.sap.ejb.EgresadoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraadministrativoFacade lookupMuestraadministrativoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraadministrativoFacade) c.lookup("java:global/sapenfermeria/MuestraadministrativoFacade!com.sap.ejb.MuestraadministrativoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private AdministrativoFacade lookupAdministrativoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AdministrativoFacade) c.lookup("java:global/sapenfermeria/AdministrativoFacade!com.sap.ejb.AdministrativoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraempleadorFacade lookupMuestraempleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraempleadorFacade) c.lookup("java:global/sapenfermeria/MuestraempleadorFacade!com.sap.ejb.MuestraempleadorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EmpleadorFacade lookupEmpleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EmpleadorFacade) c.lookup("java:global/sapenfermeria/EmpleadorFacade!com.sap.ejb.EmpleadorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestradirectorFacade lookupMuestradirectorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestradirectorFacade) c.lookup("java:global/sapenfermeria/MuestradirectorFacade!com.sap.ejb.MuestradirectorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private DirectorprogramaFacade lookupDirectorprogramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DirectorprogramaFacade) c.lookup("java:global/sapenfermeria/DirectorprogramaFacade!com.sap.ejb.DirectorprogramaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraagenciaFacade lookupMuestraagenciaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraagenciaFacade) c.lookup("java:global/sapenfermeria/MuestraagenciaFacade!com.sap.ejb.MuestraagenciaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private AgenciagubernamentalFacade lookupAgenciagubernamentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AgenciagubernamentalFacade) c.lookup("java:global/sapenfermeria/AgenciagubernamentalFacade!com.sap.ejb.AgenciagubernamentalFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
