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
import com.sap.ejb.EstudianteFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.MuestraadministrativoFacade;
import com.sap.ejb.MuestraagenciaFacade;
import com.sap.ejb.MuestradirectorFacade;
import com.sap.ejb.MuestraegresadoFacade;
import com.sap.ejb.MuestraempleadorFacade;
import com.sap.ejb.MuestrapersonaFacade;
import com.sap.ejb.PersonaFacade;
import com.sap.entity.Administrativo;
import com.sap.entity.Directorprograma;
import com.sap.entity.Docente;
import com.sap.entity.Egresado;
import com.sap.entity.Empleador;
import com.sap.entity.Estudiante;
import com.sap.entity.Muestra;
import com.sap.entity.Muestraadministrativo;
import com.sap.entity.Muestraagencia;
import com.sap.entity.Muestradirector;
import com.sap.entity.Muestraegresado;
import com.sap.entity.Muestraempleador;
import com.sap.entity.Muestrapersona;
import com.sap.entity.Persona;
import com.sap.entity.Proceso;
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
public class EliminarPersonas implements Action {

    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    EmpleadorFacade empleadorFacade = lookupEmpleadorFacadeBean();
    DirectorprogramaFacade directorprogramaFacade = lookupDirectorprogramaFacadeBean();
    AdministrativoFacade administrativoFacade = lookupAdministrativoFacadeBean();
    DocenteFacade docenteFacade = lookupDocenteFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    EgresadoFacade egresadoFacade = lookupEgresadoFacadeBean();
    PersonaFacade personaFacade = lookupPersonaFacadeBean();
    MuestrapersonaFacade muestrapersonaFacade = lookupMuestrapersonaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String fuente = request.getParameter("fuente");
        Proceso proce = (Proceso) sesion.getAttribute("Proceso");
        if (fuente.equals("Estudiante")) {

            personaFacade.eliminarPersonas("delete from estudiante where estudiante.proceso_id = '" + proce.getId() + "' \n"
                    + "                    and estudiante.persona_id not in(\n"
                    + "                    select muestrapersona.cedula from muestraestudiante\n"
                    + "                    inner join muestrapersona on muestrapersona.id = muestraestudiante.muestrapersona_id\n"
                    + "                    inner join muestra on muestra.id = muestrapersona.muestra_id\n"
                    + "                    where muestra.proceso_id = '" + proce.getId() + "')");

        } else if (fuente.equals("Docente")) {

            personaFacade.eliminarPersonas("delete from docente where docente.proceso_id = '" + proce.getId() + "' "
                    + "and docente.persona_id not in(\n"
                    + "select muestrapersona.cedula from muestradocente\n"
                    + "inner join muestrapersona on muestrapersona.id = muestradocente.muestrapersona_id\n"
                    + "inner join muestra on muestra.id = muestrapersona.muestra_id\n"
                    + "where muestra.proceso_id = '" + proce.getId() + "')");


        } else if (fuente.equals("Egresado")) {
            personaFacade.eliminarPersonas("delete from egresado where egresado.proceso_id = '" + proce.getId() + "' \n"
                    + "                    and egresado.persona_id not in(\n"
                    + "                    select muestrapersona.cedula from muestraegresado\n"
                    + "                    inner join muestrapersona on muestrapersona.id = muestraegresado.muestrapersona_id\n"
                    + "                    inner join muestra on muestra.id = muestrapersona.muestra_id\n"
                    + "                    where muestra.proceso_id = '" + proce.getId() + "')");

        } else if (fuente.equals("Administrativo")) {
            personaFacade.eliminarPersonas("delete from administrativo where administrativo.proceso_id = '" + proce.getId() + "' \n"
                    + "                    and administrativo.persona_id not in(\n"
                    + "                    select muestrapersona.cedula from muestraadministrativo\n"
                    + "                    inner join muestrapersona on muestrapersona.id = muestraadministrativo.muestrapersona_id\n"
                    + "                    inner join muestra on muestra.id = muestrapersona.muestra_id\n"
                    + "                    where muestra.proceso_id = '" + proce.getId() + "')");
        } else if (fuente.equals("Empleador")) {
            sesion.setAttribute("selectorFuente", "Empleador");
        } else if (fuente.equals("Directivo")) {
            personaFacade.eliminarPersonas("delete from directorprograma where directorprograma.proceso_id = '" + proce.getId() + "' \n"
                    + "                    and directorprograma.persona_id not in(\n"
                    + "                    select muestrapersona.cedula from muestradirector\n"
                    + "                    inner join muestrapersona on muestrapersona.id = muestradirector.muestrapersona_id\n"
                    + "                    inner join muestra on muestra.id = muestrapersona.muestra_id\n"
                    + "                    where muestra.proceso_id = '" + proce.getId() + "')");
        }


        return "NA";
    }

    private MuestrapersonaFacade lookupMuestrapersonaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestrapersonaFacade) c.lookup("java:global/sapnaval/MuestrapersonaFacade!com.sap.ejb.MuestrapersonaFacade");
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

    private MuestraempleadorFacade lookupMuestraempleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraempleadorFacade) c.lookup("java:global/sapnaval/MuestraempleadorFacade!com.sap.ejb.MuestraempleadorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraagenciaFacade lookupMuestraagenciaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraagenciaFacade) c.lookup("java:global/sapnaval/MuestraagenciaFacade!com.sap.ejb.MuestraagenciaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PersonaFacade lookupPersonaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PersonaFacade) c.lookup("java:global/sapnaval/PersonaFacade!com.sap.ejb.PersonaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EgresadoFacade lookupEgresadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EgresadoFacade) c.lookup("java:global/sapnaval/EgresadoFacade!com.sap.ejb.EgresadoFacade");
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

    private DocenteFacade lookupDocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DocenteFacade) c.lookup("java:global/sapnaval/DocenteFacade!com.sap.ejb.DocenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private AdministrativoFacade lookupAdministrativoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AdministrativoFacade) c.lookup("java:global/sapnaval/AdministrativoFacade!com.sap.ejb.AdministrativoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private DirectorprogramaFacade lookupDirectorprogramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DirectorprogramaFacade) c.lookup("java:global/sapnaval/DirectorprogramaFacade!com.sap.ejb.DirectorprogramaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EmpleadorFacade lookupEmpleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EmpleadorFacade) c.lookup("java:global/sapnaval/EmpleadorFacade!com.sap.ejb.EmpleadorFacade");
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
}
