/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.AdministrativoFacade;
import com.sap.ejb.DirectorprogramaFacade;
import com.sap.ejb.DocenteFacade;
import com.sap.ejb.EgresadoFacade;
import com.sap.ejb.EmpleadorFacade;
import com.sap.ejb.EncabezadoFacade;
import com.sap.ejb.EstudianteFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.MuestraFacade;
import com.sap.ejb.MuestraadministrativoFacade;
import com.sap.ejb.MuestraagenciaFacade;
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
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author acreditacion
 */
public class SelectorListMuestra implements Action {

    private static final Logger LOGGER = Logger.getLogger(SelectorListMuestra.class);
    MuestraagenciaFacade muestraagenciaFacade = lookupMuestraagenciaFacadeBean();
    EmpleadorFacade empleadorFacade = lookupEmpleadorFacadeBean();
    MuestraempleadorFacade muestraempleadorFacade = lookupMuestraempleadorFacadeBean();
    DirectorprogramaFacade directorprogramaFacade = lookupDirectorprogramaFacadeBean();
    MuestradirectorFacade muestradirectorFacade = lookupMuestradirectorFacadeBean();
    AdministrativoFacade administrativoFacade = lookupAdministrativoFacadeBean();
    MuestraadministrativoFacade muestraadministrativoFacade = lookupMuestraadministrativoFacadeBean();
    EgresadoFacade egresadoFacade = lookupEgresadoFacadeBean();
    MuestraegresadoFacade muestraegresadoFacade = lookupMuestraegresadoFacadeBean();
    EncabezadoFacade encabezadoFacade = lookupEncabezadoFacadeBean();
    DocenteFacade docenteFacade = lookupDocenteFacadeBean();
    MuestradocenteFacade muestradocenteFacade = lookupMuestradocenteFacadeBean();
    MuestraestudianteFacade muestraestudianteFacade = lookupMuestraestudianteFacadeBean();
    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    MuestraFacade muestraFacade = lookupMuestraFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        try {
            HttpSession sesion = request.getSession();
            Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
            List<Muestra> lm = muestraFacade.findByList("procesoId", proceso);
            String fuente = request.getParameter("fuente");
            sesion.setAttribute("fuenteX", "" + fuente);
            Muestra m = null;
            if (!lm.isEmpty()) {
                Iterator i = lm.iterator();
                while (i.hasNext()) {
                    m = (Muestra) i.next();
                    sesion.setAttribute("Muestra", m);

                    if (fuente.equals("Estudiante")) {
                        //ESTUDIANTES
                        sesion.setAttribute("listMuestraCon", muestraestudianteFacade.findByMuestraConEncabezado(proceso));
                        sesion.setAttribute("listMuestraSin", muestraestudianteFacade.findByMuestraSinEncabezado(proceso));
                        sesion.setAttribute("poblacion", estudianteFacade.findByList("procesoId", proceso));
                    } else if (fuente.equals("Docente")) {
                        //DOCENTES
                        sesion.setAttribute("listMuestraCon", muestradocenteFacade.findByMuestraConEncabezado(proceso));
                        sesion.setAttribute("listMuestraSin", muestradocenteFacade.findByMuestraSinEncabezado(proceso));
                        sesion.setAttribute("poblacion", docenteFacade.findByList("procesoId", proceso));
                    } else if (fuente.equals("Egresado")) {
                        //EGRESADOS
                        sesion.setAttribute("listMuestraCon", muestraegresadoFacade.findByMuestraConEncabezado(proceso));
                        sesion.setAttribute("listMuestraSin", muestraegresadoFacade.findByMuestraSinEncabezado(proceso));
                        sesion.setAttribute("poblacion", egresadoFacade.findByList("procesoId", proceso));
                    } else if (fuente.equals("Administrativo")) {
                        //ADMINISTRATIVOS
                        sesion.setAttribute("listMuestraCon", muestraadministrativoFacade.findByMuestraConEncabezado(proceso));
                        sesion.setAttribute("listMuestraSin", muestraadministrativoFacade.findByMuestraSinEncabezado(proceso));
                        sesion.setAttribute("poblacion", administrativoFacade.findByList("procesoId", proceso));
                    } else if (fuente.equals("Directivo")) {
                        //DIRECTIVOS
                        sesion.setAttribute("listMuestraCon", muestradirectorFacade.findByMuestraConEncabezado(proceso));
                        sesion.setAttribute("listMuestraSin", muestradirectorFacade.findByMuestraSinEncabezado(proceso));
                        sesion.setAttribute("poblacion", directorprogramaFacade.findByList("procesoId", proceso));
                    } else if (fuente.equals("Empleador")) {
                        //EMPLEADORES
                        sesion.setAttribute("listMuestraCon", muestraempleadorFacade.findByMuestraConEncabezado(proceso));
                        sesion.setAttribute("listMuestraSin", muestraempleadorFacade.findByMuestraSinEncabezado(proceso));
                        sesion.setAttribute("poblacion", empleadorFacade.findByList("procesoId", proceso));
                    }
                }
            } else {
                sesion.setAttribute("Muestra", m); //null
                if (fuente.equals("Estudiante")) {
                        //ESTUDIANTES
                        sesion.setAttribute("poblacion", estudianteFacade.findByList("procesoId", proceso));
                    } else if (fuente.equals("Docente")) {
                        //DOCENTES
                        sesion.setAttribute("poblacion", docenteFacade.findByList("procesoId", proceso));
                    } else if (fuente.equals("Egresado")) {
                        //EGRESADOS
                        sesion.setAttribute("poblacion", egresadoFacade.findByList("procesoId", proceso));
                    } else if (fuente.equals("Administrativo")) {
                        //ADMINISTRATIVOS
                        sesion.setAttribute("poblacion", administrativoFacade.findByList("procesoId", proceso));
                    } else if (fuente.equals("Directivo")) {
                        //DIRECTIVOS
                        sesion.setAttribute("poblacion", directorprogramaFacade.findByList("procesoId", proceso));
                    } else if (fuente.equals("Empleador")) {
                        //EMPLEADORES
                        sesion.setAttribute("poblacion", empleadorFacade.findByList("procesoId", proceso));
                    }
                
            }
        } catch (Exception e) {
            LOGGER.error("Se ha presentado un error: ", e);
        } finally {
            return "/WEB-INF/vista/comitePrograma/muestra/selectorListMuestra.jsp";
        }

    }

    private FuenteFacade lookupFuenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FuenteFacade) c.lookup("java:global/sapnaval/FuenteFacade!com.sap.ejb.FuenteFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraestudianteFacade lookupMuestraestudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraestudianteFacade) c.lookup("java:global/sapnaval/MuestraestudianteFacade!com.sap.ejb.MuestraestudianteFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestradocenteFacade lookupMuestradocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestradocenteFacade) c.lookup("java:global/sapnaval/MuestradocenteFacade!com.sap.ejb.MuestradocenteFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private DocenteFacade lookupDocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DocenteFacade) c.lookup("java:global/sapnaval/DocenteFacade!com.sap.ejb.DocenteFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EncabezadoFacade lookupEncabezadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EncabezadoFacade) c.lookup("java:global/sapnaval/EncabezadoFacade!com.sap.ejb.EncabezadoFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraegresadoFacade lookupMuestraegresadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraegresadoFacade) c.lookup("java:global/sapnaval/MuestraegresadoFacade!com.sap.ejb.MuestraegresadoFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EgresadoFacade lookupEgresadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EgresadoFacade) c.lookup("java:global/sapnaval/EgresadoFacade!com.sap.ejb.EgresadoFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraadministrativoFacade lookupMuestraadministrativoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraadministrativoFacade) c.lookup("java:global/sapnaval/MuestraadministrativoFacade!com.sap.ejb.MuestraadministrativoFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private AdministrativoFacade lookupAdministrativoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AdministrativoFacade) c.lookup("java:global/sapnaval/AdministrativoFacade!com.sap.ejb.AdministrativoFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestradirectorFacade lookupMuestradirectorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestradirectorFacade) c.lookup("java:global/sapnaval/MuestradirectorFacade!com.sap.ejb.MuestradirectorFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private DirectorprogramaFacade lookupDirectorprogramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DirectorprogramaFacade) c.lookup("java:global/sapnaval/DirectorprogramaFacade!com.sap.ejb.DirectorprogramaFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraempleadorFacade lookupMuestraempleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraempleadorFacade) c.lookup("java:global/sapnaval/MuestraempleadorFacade!com.sap.ejb.MuestraempleadorFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EmpleadorFacade lookupEmpleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EmpleadorFacade) c.lookup("java:global/sapnaval/EmpleadorFacade!com.sap.ejb.EmpleadorFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraagenciaFacade lookupMuestraagenciaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraagenciaFacade) c.lookup("java:global/sapnaval/MuestraagenciaFacade!com.sap.ejb.MuestraagenciaFacade");
        } catch (NamingException ne) {
            LOGGER.error("exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraFacade lookupMuestraFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraFacade) c.lookup("java:global/sapnaval/MuestraFacade!com.sap.ejb.MuestraFacade");
        } catch (NamingException ne) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EstudianteFacade lookupEstudianteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EstudianteFacade) c.lookup("java:global/sapnaval/EstudianteFacade!com.sap.ejb.EstudianteFacade");
        } catch (NamingException ne) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
