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
            Collection nuevos = new ArrayList();
            Collection viejos = new ArrayList();
            List<Muestraestudiante> muestraEstudiantes = (List<Muestraestudiante>) sesion.getAttribute("listMuestraSeleccionada");
            for (Muestraestudiante muestraestudiante : muestraEstudiantes) {
                viejos.add(muestraestudiante.getMuestrapersonaId().getCedula());
            }
            Muestra m = (Muestra) sesion.getAttribute("Muestra");
            List<Estudiante> le = estudianteFacade.findByList2("programaId", programa, "semestre", sesion.getAttribute("Semestre"));
            for (Estudiante estudiante : le) {
                if ("1".equals(request.getParameter(String.valueOf(estudiante.getPersonaId().getId())))) {
                    nuevos.add(estudiante.getPersonaId().getId());
                }
            }
            Collection viejos2 = new ArrayList(viejos);
            viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
            nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

            for (Object object : viejos) {
                Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                Muestraestudiante me = muestraestudianteFacade.findBySingle("muestrapersonaId", mp);
                muestraestudianteFacade.remove(me);
                muestrapersonaFacade.remove(mp);
            }
            for (Object object : nuevos) {
                Estudiante est = estudianteFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                Persona per = est.getPersonaId();

                Muestrapersona mp = new Muestrapersona();
                mp.setCedula(per.getId());
                mp.setNombre(per.getNombre());
                mp.setApellido(per.getApellido());
                mp.setPassword(per.getPassword());
                mp.setMail(per.getMail());
                mp.setMuestraId(m);
                muestrapersonaFacade.create(mp);
                Muestraestudiante mest = new Muestraestudiante();
                mest.setCodigo(est.getId());
                mest.setSemestre(est.getSemestre());
                mest.setPeriodo(est.getPeriodo());
                mest.setAnio(est.getAnio());
                mest.setMuestrapersonaId(mp);
                mest.setProgramaId(est.getProgramaId());
                muestraestudianteFacade.create(mest);
            }

        } else {
            if (fuente.equals("Docente")) {
                Collection nuevos = new ArrayList();
                Collection viejos = new ArrayList();
                List<Muestradocente> muestraDocentes = (List<Muestradocente>) sesion.getAttribute("listMuestraSeleccionada");
                for (Muestradocente muestradocente : muestraDocentes) {
                    viejos.add(muestradocente.getMuestrapersonaId().getCedula());
                }
                Muestra m = (Muestra) sesion.getAttribute("Muestra");
                List<Docente> ld = docenteFacade.findByList("programaId", programa);
                for (Docente docente : ld) {
                    if ("1".equals(request.getParameter(String.valueOf(docente.getPersonaId().getId())))) {
                        nuevos.add(docente.getPersonaId().getId());
                    }
                }
                Collection viejos2 = new ArrayList(viejos);
                viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                for (Object object : viejos) {
                    Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                    Muestradocente md = muestradocenteFacade.findBySingle("muestrapersonaId", mp);
                    muestradocenteFacade.remove(md);
                    muestrapersonaFacade.remove(mp);
                }
                for (Object object : nuevos) {
                    Docente doc = docenteFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                    Persona per = doc.getPersonaId();

                    Muestrapersona mp = new Muestrapersona();
                    mp.setCedula(per.getId());
                    mp.setNombre(per.getNombre());
                    mp.setApellido(per.getApellido());
                    mp.setPassword(per.getPassword());
                    mp.setMail(per.getMail());
                    mp.setMuestraId(m);
                    muestrapersonaFacade.create(mp);
                    Muestradocente mdoce = new Muestradocente();
                    mdoce.setTipo(doc.getTipo());
                    mdoce.setMuestrapersonaId(mp);
                    muestradocenteFacade.create(mdoce);
                }
            } else {
                if (fuente.equals("Egresado")) {
                    Collection nuevos = new ArrayList();
                    Collection viejos = new ArrayList();
                    List<Muestraegresado> muestraAux = (List<Muestraegresado>) sesion.getAttribute("listMuestraSeleccionada");
                    for (Muestraegresado muestraegresado : muestraAux) {
                        viejos.add(muestraegresado.getMuestrapersonaId().getCedula());
                    }
                    Muestra m = (Muestra) sesion.getAttribute("Muestra");
                    List<Egresado> lax = egresadoFacade.findByList("programaId", programa);
                    for (Egresado egresado : lax) {
                        if ("1".equals(request.getParameter(String.valueOf(egresado.getPersonaId().getId())))) {
                            nuevos.add(egresado.getPersonaId().getId());
                        }
                    }
                    Collection viejos2 = new ArrayList(viejos);
                    viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                    nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                    for (Object object : viejos) {
                        Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                        Muestraegresado maux = muestraegresadoFacade.findBySingle("muestrapersonaId", mp);
                        muestraegresadoFacade.remove(maux);
                        muestrapersonaFacade.remove(mp);
                    }
                    for (Object object : nuevos) {
                        Egresado egre = egresadoFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                        Persona per = egre.getPersonaId();

                        Muestrapersona mp = new Muestrapersona();
                        mp.setCedula(per.getId());
                        mp.setNombre(per.getNombre());
                        mp.setApellido(per.getApellido());
                        mp.setPassword(per.getPassword());
                        mp.setMail(per.getMail());
                        mp.setMuestraId(m);
                        muestrapersonaFacade.create(mp);
                        Muestraegresado megre = new Muestraegresado();
                        megre.setMuestrapersonaId(mp);
                        muestraegresadoFacade.create(megre);
                    }
                } else {
                    if (fuente.equals("Administrativo")) {
                        Collection nuevos = new ArrayList();
                        Collection viejos = new ArrayList();
                        List<Muestraadministrativo> muestraAdministrativos = (List<Muestraadministrativo>) sesion.getAttribute("listMuestraSeleccionada");
                        for (Muestraadministrativo muestraadministrativo : muestraAdministrativos) {
                            viejos.add(muestraadministrativo.getMuestrapersonaId().getCedula());
                        }
                        Muestra m = (Muestra) sesion.getAttribute("Muestra");
                        List<Administrativo> lad = administrativoFacade.findByList("programaId", programa);
                        for (Administrativo administrativo : lad) {
                            if ("1".equals(request.getParameter(String.valueOf(administrativo.getPersonaId().getId())))) {
                                nuevos.add(administrativo.getPersonaId().getId());
                            }
                        }
                        Collection viejos2 = new ArrayList(viejos);
                        viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                        nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                        for (Object object : viejos) {
                            Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                            Muestraadministrativo mad = muestraadministrativoFacade.findBySingle("muestrapersonaId", mp);
                            muestraadministrativoFacade.remove(mad);
                            muestrapersonaFacade.remove(mp);
                        }
                        for (Object object : nuevos) {
                            Administrativo admi = administrativoFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                            Persona per = admi.getPersonaId();

                            Muestrapersona mp = new Muestrapersona();
                            mp.setCedula(per.getId());
                            mp.setNombre(per.getNombre());
                            mp.setApellido(per.getApellido());
                            mp.setPassword(per.getPassword());
                            mp.setMail(per.getMail());
                            mp.setMuestraId(m);
                            muestrapersonaFacade.create(mp);
                            Muestraadministrativo madmi = new Muestraadministrativo();
                            madmi.setCargo(admi.getCargo());
                            madmi.setMuestrapersonaId(mp);
                            muestraadministrativoFacade.create(madmi);
                        }
                    } else {
                        if (fuente.equals("Directivo")) {
                            Collection nuevos = new ArrayList();
                            Collection viejos = new ArrayList();
                            List<Muestradirector> muestraDirec = (List<Muestradirector>) sesion.getAttribute("listMuestraSeleccionada");
                            for (Muestradirector muestradirectivo : muestraDirec) {
                                viejos.add(muestradirectivo.getMuestrapersonaId().getCedula());
                            }
                            Muestra m = (Muestra) sesion.getAttribute("Muestra");
                            List<Directorprograma> ldire = directorprogramaFacade.findByList("programaId", programa);
                            for (Directorprograma director : ldire) {
                                if ("1".equals(request.getParameter(String.valueOf(director.getPersonaId().getId())))) {
                                    nuevos.add(director.getPersonaId().getId());
                                }
                            }
                            Collection viejos2 = new ArrayList(viejos);
                            viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                            nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                            for (Object object : viejos) {
                                Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                                Muestradirector mdire = muestradirectorFacade.findBySingle("muestrapersonaId", mp);
                                muestradirectorFacade.remove(mdire);
                                muestrapersonaFacade.remove(mp);
                            }
                            for (Object object : nuevos) {
                                Directorprograma dir = directorprogramaFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                                Persona per = dir.getPersonaId();

                                Muestrapersona mp = new Muestrapersona();
                                mp.setCedula(per.getId());
                                mp.setNombre(per.getNombre());
                                mp.setApellido(per.getApellido());
                                mp.setPassword(per.getPassword());
                                mp.setMail(per.getMail());
                                mp.setMuestraId(m);
                                muestrapersonaFacade.create(mp);
                                Muestradirector mdir = new Muestradirector();
                                mdir.setMuestrapersonaId(mp);
                                muestradirectorFacade.create(mdir);
                            }
                        } else {
                            if (fuente.equals("Empleador")) {
                                Collection nuevos = new ArrayList();
                                Collection viejos = new ArrayList();
                                List<Muestraempleador> muestraAux = (List<Muestraempleador>) sesion.getAttribute("listMuestraSeleccionada");
                                for (Muestraempleador muestraempleador : muestraAux) {
                                    viejos.add(muestraempleador.getMuestrapersonaId().getCedula());
                                }
                                Muestra m = (Muestra) sesion.getAttribute("Muestra");
                                List<Empleador> lax = empleadorFacade.findByList("programaId", programa);
                                for (Empleador empleado : lax) {
                                    if ("1".equals(request.getParameter(String.valueOf(empleado.getPersonaId().getId())))) {
                                        nuevos.add(empleado.getPersonaId().getId());
                                    }
                                }
                                Collection viejos2 = new ArrayList(viejos);
                                viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                                nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                                for (Object object : viejos) {
                                    Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                                    Muestraempleador maux = muestraempleadorFacade.findBySingle("muestrapersonaId", mp);
                                    muestraempleadorFacade.remove(maux);
                                    muestrapersonaFacade.remove(mp);
                                }
                                for (Object object : nuevos) {
                                    Empleador empl = empleadorFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                                    Persona per = empl.getPersonaId();

                                    Muestrapersona mp = new Muestrapersona();
                                    mp.setCedula(per.getId());
                                    mp.setNombre(per.getNombre());
                                    mp.setApellido(per.getApellido());
                                    mp.setPassword(per.getPassword());
                                    mp.setMail(per.getMail());
                                    mp.setMuestraId(m);
                                    muestrapersonaFacade.create(mp);
                                    Muestraempleador mempl = new Muestraempleador();
                                    mempl.setMuestrapersonaId(mp);
                                    mempl.setCargo(empl.getCargo());
                                    mempl.setEmpresa(empl.getEmpresa());
                                    muestraempleadorFacade.create(mempl);
                                }
                            }else if (fuente.equals("Visitante")) {
                                Collection nuevos = new ArrayList();
                                Collection viejos = new ArrayList();
                                List<Muestraagencia> muestraAux = (List<Muestraagencia>) sesion.getAttribute("listMuestraSeleccionada");
                                for (Muestraagencia muestravisitante : muestraAux) {
                                    viejos.add(muestravisitante.getMuestrapersonaId().getCedula());
                                }
                                Muestra m = (Muestra) sesion.getAttribute("Muestra");
                                List<Agenciagubernamental> lax = agenciagubernamentalFacade.findByList("programaId", programa);
                                for (Agenciagubernamental visitante : lax) {
                                    if ("1".equals(request.getParameter(String.valueOf(visitante.getPersonaId().getId())))) {
                                        nuevos.add(visitante.getPersonaId().getId());
                                    }
                                }
                                Collection viejos2 = new ArrayList(viejos);
                                viejos.removeAll(nuevos); // quedan solo las cedulas de las personas que han sido eliminadas
                                nuevos.removeAll(viejos2); //quedan solo las cedulas de las personas que han sido agregadas

                                for (Object object : viejos) {
                                    Muestrapersona mp = muestrapersonaFacade.findBySingle2("cedula", object.toString(), "muestraId", m);
                                    Muestraagencia maux = muestraagenciaFacade.findBySingle("muestrapersonaId", mp);
                                    muestraagenciaFacade.remove(maux);
                                    muestrapersonaFacade.remove(mp);
                                }
                                for (Object object : nuevos) {
                                    Agenciagubernamental visi = agenciagubernamentalFacade.findBySingle2("personaId.id", object.toString(), "programaId", m.getProcesoId().getProgramaId());
                                    Persona per = visi.getPersonaId();

                                    Muestrapersona mp = new Muestrapersona();
                                    mp.setCedula(per.getId());
                                    mp.setNombre(per.getNombre());
                                    mp.setApellido(per.getApellido());
                                    mp.setPassword(per.getPassword());
                                    mp.setMail(per.getMail());
                                    mp.setMuestraId(m);
                                    muestrapersonaFacade.create(mp);
                                    Muestraagencia mvisi = new Muestraagencia();
                                    mvisi.setDescripcion(visi.getDescripcion());
                                    mvisi.setMuestrapersonaId(mp);
                                    muestraagenciaFacade.create(mvisi);
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
