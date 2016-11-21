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
import com.sap.ejb.EstudianteFacade;
import com.sap.ejb.MuestraadministrativoFacade;
import com.sap.ejb.MuestraagenciaFacade;
import com.sap.ejb.MuestradirectorFacade;
import com.sap.ejb.MuestradocenteFacade;
import com.sap.ejb.MuestraegresadoFacade;
import com.sap.ejb.MuestraempleadorFacade;
import com.sap.ejb.MuestraestudianteFacade;
import com.sap.ejb.MuestrapersonaFacade;
import com.sap.entity.Administrativo;
import com.sap.entity.Agenciagubernamental;
import com.sap.entity.Directorprograma;
import com.sap.entity.Docente;
import com.sap.entity.Egresado;
import com.sap.entity.Empleador;
import com.sap.entity.Estudiante;
import com.sap.entity.Muestra;
import com.sap.entity.Muestraadministrativo;
import com.sap.entity.Muestraagencia;
import com.sap.entity.Muestradirector;
import com.sap.entity.Muestradocente;
import com.sap.entity.Muestraegresado;
import com.sap.entity.Muestraempleador;
import com.sap.entity.Muestraestudiante;
import com.sap.entity.Muestrapersona;
import com.sap.entity.Persona;
import com.sap.entity.Programa;
import com.sap.interfaz.Action;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
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
public class EditarMuestra implements Action {
    MuestraagenciaFacade muestraagenciaFacade = lookupMuestraagenciaFacadeBean();
    AgenciagubernamentalFacade agenciagubernamentalFacade = lookupAgenciagubernamentalFacadeBean();
    MuestraempleadorFacade muestraempleadorFacade = lookupMuestraempleadorFacadeBean();
    EmpleadorFacade empleadorFacade = lookupEmpleadorFacadeBean();
    MuestradirectorFacade muestradirectorFacade = lookupMuestradirectorFacadeBean();
    DirectorprogramaFacade directorprogramaFacade = lookupDirectorprogramaFacadeBean();
    MuestraadministrativoFacade muestraadministrativoFacade = lookupMuestraadministrativoFacadeBean();
    AdministrativoFacade administrativoFacade = lookupAdministrativoFacadeBean();
    MuestraegresadoFacade muestraegresadoFacade = lookupMuestraegresadoFacadeBean();
    EgresadoFacade egresadoFacade = lookupEgresadoFacadeBean();
    MuestradocenteFacade muestradocenteFacade = lookupMuestradocenteFacadeBean();
    DocenteFacade docenteFacade = lookupDocenteFacadeBean();
    MuestraestudianteFacade muestraestudianteFacade = lookupMuestraestudianteFacadeBean();
    MuestrapersonaFacade muestrapersonaFacade = lookupMuestrapersonaFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Programa programa = (Programa) sesion.getAttribute("Programa");
        String fuente = (String) sesion.getAttribute("selectorFuente");
        if (fuente.equals("Estudiante")) {
            List<Muestraestudiante> muestraAux = (List<Muestraestudiante>) sesion.getAttribute("listMuestraSeleccionada");
            Muestra m = (Muestra) sesion.getAttribute("Muestra");
            for (Muestraestudiante muestraaux2 : muestraAux) {
                if (!"1".equals(request.getParameter(String.valueOf(muestraaux2.getMuestrapersonaId().getCedula())))) {
                    Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", muestraaux2.getMuestrapersonaId().getCedula(), "muestraId", m);
                    Muestraestudiante md = muestraestudianteFacade.findBySingle("muestrapersonaId", mp);
                    muestraestudianteFacade.remove(md);
                    muestrapersonaFacade.remove(mp);
                }
            }

            List<Estudiante> aux4 = (List<Estudiante>) sesion.getAttribute("listPoblacion");
            for (Estudiante aux5 : aux4) {
                if ("1".equals(request.getParameter(String.valueOf(aux5.getPersonaId().getId())))) {
                    Persona per = aux5.getPersonaId();
                    Muestrapersona mp = new Muestrapersona();
                    mp.setCedula(per.getId());
                    mp.setNombre(per.getNombre());
                    mp.setApellido(per.getApellido());
                    mp.setPassword(per.getPassword());
                    mp.setMail(per.getMail());
                    mp.setMuestraId(m);
                    muestrapersonaFacade.create(mp);
                    Muestrapersona aux = muestrapersonaFacade.findUltimo("id").get(0);
                    Muestraestudiante me = new Muestraestudiante();
                    me.setCodigo(aux5.getId());
                    me.setSemestre(aux5.getSemestre());
                    me.setPeriodo(aux5.getPeriodo());
                    me.setAnio(aux5.getAnio());
                    me.setMuestrapersonaId(aux);
                    me.setProgramaId(programa);
                    muestraestudianteFacade.create(me);
                }
            }

        } else {
            if (fuente.equals("Docente")) {

                List<Muestradocente> muestraDocentes = (List<Muestradocente>) sesion.getAttribute("listMuestraSeleccionada");
                Muestra m = (Muestra) sesion.getAttribute("Muestra");
                for (Muestradocente muestradocente : muestraDocentes) {
                    if (!"1".equals(request.getParameter(String.valueOf(muestradocente.getMuestrapersonaId().getCedula())))) {
                        Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", muestradocente.getMuestrapersonaId().getCedula(), "muestraId", m);
                        Muestradocente md = muestradocenteFacade.findBySingle("muestrapersonaId", mp);
                        muestradocenteFacade.remove(md);
                        muestrapersonaFacade.remove(mp);
                    }
                }

                List<Docente> docentes = (List<Docente>) sesion.getAttribute("listPoblacion");
                for (Docente docente : docentes) {
                    if ("1".equals(request.getParameter(String.valueOf(docente.getPersonaId().getId())))) {
                        Persona per = docente.getPersonaId();
                        Muestrapersona mp = new Muestrapersona();
                        mp.setCedula(per.getId());
                        mp.setNombre(per.getNombre());
                        mp.setApellido(per.getApellido());
                        mp.setPassword(per.getPassword());
                        mp.setMail(per.getMail());
                        mp.setMuestraId(m);
                        muestrapersonaFacade.create(mp);
                        Muestrapersona aux = muestrapersonaFacade.findUltimo("id").get(0);
                        Muestradocente md = new Muestradocente();
                        md.setTipo("" + docente.getFuenteId().getId());
                        md.setMuestrapersonaId(aux);
                        muestradocenteFacade.create(md);
                    }
                }

            } else {
                if (fuente.equals("Egresado")) {
                    List<Muestraegresado> muestraAux = (List<Muestraegresado>) sesion.getAttribute("listMuestraSeleccionada");
                    Muestra m = (Muestra) sesion.getAttribute("Muestra");
                    for (Muestraegresado muestraaux2 : muestraAux) {
                        if (!"1".equals(request.getParameter(String.valueOf(muestraaux2.getMuestrapersonaId().getCedula())))) {
                            Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", muestraaux2.getMuestrapersonaId().getCedula(), "muestraId", m);
                            Muestraegresado md = muestraegresadoFacade.findBySingle("muestrapersonaId", mp);
                            muestraegresadoFacade.remove(md);
                            muestrapersonaFacade.remove(mp);
                        }
                    }

                    List<Egresado> aux4 = (List<Egresado>) sesion.getAttribute("listPoblacion");
                    for (Egresado aux5 : aux4) {
                        if ("1".equals(request.getParameter(String.valueOf(aux5.getPersonaId().getId())))) {
                            Persona per = aux5.getPersonaId();
                            Muestrapersona mp = new Muestrapersona();
                            mp.setCedula(per.getId());
                            mp.setNombre(per.getNombre());
                            mp.setApellido(per.getApellido());
                            mp.setPassword(per.getPassword());
                            mp.setMail(per.getMail());
                            mp.setMuestraId(m);
                            muestrapersonaFacade.create(mp);
                            Muestrapersona aux = muestrapersonaFacade.findUltimo("id").get(0);
                            Muestraegresado meg = new Muestraegresado();
                            meg.setMuestrapersonaId(aux);
                            muestraegresadoFacade.create(meg);
                        }
                    }
                } else {
                    if (fuente.equals("Administrativo")) {
                        List<Muestraadministrativo> muestraAux = (List<Muestraadministrativo>) sesion.getAttribute("listMuestraSeleccionada");
                        Muestra m = (Muestra) sesion.getAttribute("Muestra");
                        for (Muestraadministrativo muestraaux2 : muestraAux) {
                            if (!"1".equals(request.getParameter(String.valueOf(muestraaux2.getMuestrapersonaId().getCedula())))) {
                                Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", muestraaux2.getMuestrapersonaId().getCedula(), "muestraId", m);
                                Muestraadministrativo md = muestraadministrativoFacade.findBySingle("muestrapersonaId", mp);
                                muestraadministrativoFacade.remove(md);
                                muestrapersonaFacade.remove(mp);
                            }
                        }

                        List<Administrativo> aux4 = (List<Administrativo>) sesion.getAttribute("listPoblacion");
                        for (Administrativo aux5 : aux4) {
                            if ("1".equals(request.getParameter(String.valueOf(aux5.getPersonaId().getId())))) {
                                Persona per = aux5.getPersonaId();
                                Muestrapersona mp = new Muestrapersona();
                                mp.setCedula(per.getId());
                                mp.setNombre(per.getNombre());
                                mp.setApellido(per.getApellido());
                                mp.setPassword(per.getPassword());
                                mp.setMail(per.getMail());
                                mp.setMuestraId(m);
                                muestrapersonaFacade.create(mp);
                                Muestrapersona aux = muestrapersonaFacade.findUltimo("id").get(0);
                                Muestraadministrativo mad = new Muestraadministrativo();
                                mad.setCargo(aux5.getCargo());
                                mad.setMuestrapersonaId(aux);
                                muestraadministrativoFacade.create(mad);
                            }
                        }
                    } else {
                        if (fuente.equals("Directivo")) {
                            List<Muestradirector> muestraAux = (List<Muestradirector>) sesion.getAttribute("listMuestraSeleccionada");
                            Muestra m = (Muestra) sesion.getAttribute("Muestra");
                            for (Muestradirector muestraaux2 : muestraAux) {
                                if (!"1".equals(request.getParameter(String.valueOf(muestraaux2.getMuestrapersonaId().getCedula())))) {
                                    Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", muestraaux2.getMuestrapersonaId().getCedula(), "muestraId", m);
                                    Muestradirector md = muestradirectorFacade.findBySingle("muestrapersonaId", mp);
                                    muestradirectorFacade.remove(md);
                                    muestrapersonaFacade.remove(mp);
                                }
                            }

                            List<Directorprograma> aux4 = (List<Directorprograma>) sesion.getAttribute("listPoblacion");
                            for (Directorprograma aux5 : aux4) {
                                if ("1".equals(request.getParameter(String.valueOf(aux5.getPersonaId().getId())))) {
                                    Persona per = aux5.getPersonaId();
                                    Muestrapersona mp = new Muestrapersona();
                                    mp.setCedula(per.getId());
                                    mp.setNombre(per.getNombre());
                                    mp.setApellido(per.getApellido());
                                    mp.setPassword(per.getPassword());
                                    mp.setMail(per.getMail());
                                    mp.setMuestraId(m);
                                    muestrapersonaFacade.create(mp);
                                    Muestrapersona aux = muestrapersonaFacade.findUltimo("id").get(0);
                                    Muestradirector mdp = new Muestradirector();
                                    mdp.setMuestrapersonaId(aux);
                                    muestradirectorFacade.create(mdp);
                                }
                            }
                        } else {
                            if (fuente.equals("Empleador")) {
                                List<Muestraempleador> muestraAux = (List<Muestraempleador>) sesion.getAttribute("listMuestraSeleccionada");
                                Muestra m = (Muestra) sesion.getAttribute("Muestra");
                                for (Muestraempleador muestraaux2 : muestraAux) {
                                    if (!"1".equals(request.getParameter(String.valueOf(muestraaux2.getMuestrapersonaId().getCedula())))) {
                                        Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", muestraaux2.getMuestrapersonaId().getCedula(), "muestraId", m);
                                        Muestraempleador md = muestraempleadorFacade.findBySingle("muestrapersonaId", mp);
                                        muestraempleadorFacade.remove(md);
                                        muestrapersonaFacade.remove(mp);
                                    }
                                }

                                List<Empleador> aux4 = (List<Empleador>) sesion.getAttribute("listPoblacion");
                                for (Empleador aux5 : aux4) {
                                    if ("1".equals(request.getParameter(String.valueOf(aux5.getPersonaId().getId())))) {
                                        Persona per = aux5.getPersonaId();
                                        Muestrapersona mp = new Muestrapersona();
                                        mp.setCedula(per.getId());
                                        mp.setNombre(per.getNombre());
                                        mp.setApellido(per.getApellido());
                                        mp.setPassword(per.getPassword());
                                        mp.setMail(per.getMail());
                                        mp.setMuestraId(m);
                                        muestrapersonaFacade.create(mp);
                                    
                                        Muestrapersona aux = muestrapersonaFacade.findUltimo("id").get(0);
                                        Muestraempleador mem = new Muestraempleador();
                                        mem.setEmpresa(aux5.getEmpresa()); //Este campo no puede ser null
                                        mem.setCargo(aux5.getCargo());
                                        mem.setMuestrapersonaId(aux);
                                        muestraempleadorFacade.create(mem);
                                    }
                                }

                            }
                        }
                    }
                }
            }
        }

        return "/WEB-INF/vista/comitePrograma/muestra/editarMuestra.jsp";
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

    private MuestrapersonaFacade lookupMuestrapersonaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestrapersonaFacade) c.lookup("java:global/sap/MuestrapersonaFacade!com.sap.ejb.MuestrapersonaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
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

    private DocenteFacade lookupDocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DocenteFacade) c.lookup("java:global/sap/DocenteFacade!com.sap.ejb.DocenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestradocenteFacade lookupMuestradocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestradocenteFacade) c.lookup("java:global/sap/MuestradocenteFacade!com.sap.ejb.MuestradocenteFacade");
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

    private MuestraegresadoFacade lookupMuestraegresadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraegresadoFacade) c.lookup("java:global/sap/MuestraegresadoFacade!com.sap.ejb.MuestraegresadoFacade");
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

    private MuestraadministrativoFacade lookupMuestraadministrativoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraadministrativoFacade) c.lookup("java:global/sap/MuestraadministrativoFacade!com.sap.ejb.MuestraadministrativoFacade");
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

    private MuestradirectorFacade lookupMuestradirectorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestradirectorFacade) c.lookup("java:global/sap/MuestradirectorFacade!com.sap.ejb.MuestradirectorFacade");
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

    private MuestraempleadorFacade lookupMuestraempleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraempleadorFacade) c.lookup("java:global/sap/MuestraempleadorFacade!com.sap.ejb.MuestraempleadorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private AgenciagubernamentalFacade lookupAgenciagubernamentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AgenciagubernamentalFacade) c.lookup("java:global/sap/AgenciagubernamentalFacade!com.sap.ejb.AgenciagubernamentalFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private MuestraagenciaFacade lookupMuestraagenciaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraagenciaFacade) c.lookup("java:global/sap/MuestraagenciaFacade!com.sap.ejb.MuestraagenciaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
