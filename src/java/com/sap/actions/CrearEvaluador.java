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
public class CrearEvaluador implements Action {

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
        String cedula = request.getParameter("cedula");

        String fuente = (String) sesion.getAttribute("selectorFuente");
        Proceso proce = (Proceso) sesion.getAttribute("Proceso");

        Muestrapersona mp = null;
        //BUSCAMOS A LA PERSONA A CREAR A VER SI EXISTE
        Persona per = personaFacade.find(cedula);

        //SI EXISTE
        if (per != null) {
            Muestra m = (Muestra) sesion.getAttribute("Muestra");
            List lmp = muestrapersonaFacade.findByList2("cedula", cedula, "muestraId", m);
            Iterator it = lmp.iterator();

            while (it.hasNext()) {
                mp = (Muestrapersona) it.next();
            }
            //VERIFICAMOS SI YA EXISTE EN EL PROCESO ACTUAL
            if (mp != null) {//ESTA EN LA MUESTRA ACTUAL --ERROR DUPLICADO
                return "9";
            }

        } else {// NO EXISTE LA PERSONA Y SE TIENE QUE CREAR
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String pass = request.getParameter("password");
            String mail = request.getParameter("mail");

            Persona p = new Persona();
            p.setId(cedula);
            p.setNombre(nombre);
            p.setApellido(apellido);
            p.setMail(mail);
            p.setPassword(pass);

            personaFacade.create(p);
            per = personaFacade.find(cedula);
        }

        //CREAMOS LA FUENTE ESPECIFICA
        if (fuente.equals("Estudiante")) {
            String semestre = request.getParameter("semestre");
            String anio = request.getParameter("anio");
            String periodo = request.getParameter("periodo");
            Estudiante nuevo = new Estudiante();
            nuevo.setId("" + proce.getId() + "-" + cedula);
            nuevo.setSemestre(semestre);
            nuevo.setPeriodo(periodo);
            nuevo.setAnio(anio);
            nuevo.setPersonaId(per);
            nuevo.setProgramaId(proce.getProgramaId());
            nuevo.setProcesoId(proce);
            nuevo.setFuenteId(fuenteFacade.find(1));
            estudianteFacade.create(nuevo);

        } else if (fuente.equals("Egresado")) {
            Egresado nuevo = new Egresado();
            nuevo.setPersonaId(per);
            nuevo.setProgramaId(proce.getProgramaId());
            nuevo.setProcesoId(proce);
            nuevo.setFuenteId(fuenteFacade.find(4));
            egresadoFacade.create(nuevo);

        } else if (fuente.equals("Administrativo")) {
            String cargo = request.getParameter("cargo");
            Administrativo nuevo = new Administrativo();
            nuevo.setPersonaId(per);
            nuevo.setCargo(cargo);
            nuevo.setFuenteId(fuenteFacade.find(3));
            nuevo.setProgramaId(proce.getProgramaId());
            nuevo.setProcesoId(proce);
            administrativoFacade.create(nuevo);


        } else if (fuente.equals("Directivo")) {
            Directorprograma nuevo = new Directorprograma();
            nuevo.setPersonaId(per);
            nuevo.setFuenteId(fuenteFacade.find(5));
            nuevo.setProgramaId(proce.getProgramaId());
            nuevo.setProcesoId(proce);
            directorprogramaFacade.create(nuevo);

        } else if (fuente.equals("Empleador")) {

            String empresa = request.getParameter("empresa");
            String cargo = request.getParameter("cargo");
            Empleador nuevo = new Empleador();
            nuevo.setCargo(cargo);
            nuevo.setEmpresa(empresa);
            nuevo.setFuenteId(fuenteFacade.find(6));
            nuevo.setPersonaId(per);
            nuevo.setProcesoId(proce);
            nuevo.setProgramaId(proce.getProgramaId());
            empleadorFacade.create(nuevo);


        } else if (fuente.equals("Docente")) {
            String tipo = request.getParameter("tipo");
            Docente nuevo = new Docente();
            nuevo.setPersonaId(per);
            nuevo.setProcesoId(proce);
            nuevo.setProgramaId(proce.getProgramaId());
            nuevo.setTipo(tipo);
            nuevo.setFuenteId(fuenteFacade.find(2));
            docenteFacade.create(nuevo);
        }
        return "NA";
    }

    private MuestrapersonaFacade lookupMuestrapersonaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestrapersonaFacade) c.lookup("java:global/sap/MuestrapersonaFacade!com.sap.ejb.MuestrapersonaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PersonaFacade lookupPersonaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PersonaFacade) c.lookup("java:global/sap/PersonaFacade!com.sap.ejb.PersonaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EgresadoFacade lookupEgresadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EgresadoFacade) c.lookup("java:global/sap/EgresadoFacade!com.sap.ejb.EgresadoFacade");
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

    private DocenteFacade lookupDocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DocenteFacade) c.lookup("java:global/sap/DocenteFacade!com.sap.ejb.DocenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private AdministrativoFacade lookupAdministrativoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AdministrativoFacade) c.lookup("java:global/sap/AdministrativoFacade!com.sap.ejb.AdministrativoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private DirectorprogramaFacade lookupDirectorprogramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DirectorprogramaFacade) c.lookup("java:global/sap/DirectorprogramaFacade!com.sap.ejb.DirectorprogramaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EmpleadorFacade lookupEmpleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EmpleadorFacade) c.lookup("java:global/sap/EmpleadorFacade!com.sap.ejb.EmpleadorFacade");
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
}
