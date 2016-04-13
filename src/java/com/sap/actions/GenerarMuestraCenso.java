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
import com.sap.ejb.MuestraFacade;
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
public class GenerarMuestraCenso implements Action {

    MuestraagenciaFacade muestraagenciaFacade = lookupMuestraagenciaFacadeBean();
    AgenciagubernamentalFacade agenciagubernamentalFacade = lookupAgenciagubernamentalFacadeBean();
    MuestraempleadorFacade muestraempleadorFacade = lookupMuestraempleadorFacadeBean();
    EmpleadorFacade empleadorFacade = lookupEmpleadorFacadeBean();
    MuestraadministrativoFacade muestraadministrativoFacade = lookupMuestraadministrativoFacadeBean();
    AdministrativoFacade administrativoFacade = lookupAdministrativoFacadeBean();
    MuestradirectorFacade muestradirectorFacade = lookupMuestradirectorFacadeBean();
    DirectorprogramaFacade directorprogramaFacade = lookupDirectorprogramaFacadeBean();
    MuestraegresadoFacade muestraegresadoFacade = lookupMuestraegresadoFacadeBean();
    EgresadoFacade egresadoFacade = lookupEgresadoFacadeBean();
    MuestradocenteFacade muestradocenteFacade = lookupMuestradocenteFacadeBean();
    DocenteFacade docenteFacade = lookupDocenteFacadeBean();
    MuestraestudianteFacade muestraestudianteFacade = lookupMuestraestudianteFacadeBean();
    MuestrapersonaFacade muestrapersonaFacade = lookupMuestrapersonaFacadeBean();
    EstudianteFacade estudianteFacade = lookupEstudianteFacadeBean();
    MuestraFacade muestraFacade = lookupMuestraFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        Programa programa = (Programa) sesion.getAttribute("Programa");
        Muestra m = new Muestra();
        m.setTipo("Censo");
        m.setProcesoId(proceso);
        muestraFacade.create(m);

        sesion.setAttribute("Muestra", m);



        //********************************Estudiante
        // double aux = estudianteFacade.countByProperty("programaId", programa);

        List<Estudiante> le = estudianteFacade.findByList("procesoId", proceso);

        Iterator it = le.iterator();

        if (!le.isEmpty()) {
            while (it.hasNext()) {
                Estudiante est = (Estudiante) it.next();
                Persona per = est.getPersonaId();

                Muestrapersona mp = new Muestrapersona();

                mp.setCedula(per.getId());
                mp.setNombre(per.getNombre());
                mp.setApellido(per.getApellido());
                mp.setPassword(per.getPassword());
                mp.setMail(per.getMail());
                mp.setMuestraId(m);
                System.out.println("mp.toString()_ " + mp.toString());
                muestrapersonaFacade.create(mp);

                Muestraestudiante me = new Muestraestudiante();
                me.setCodigo(est.getId());
                me.setSemestre(est.getSemestre());
                me.setPeriodo(est.getPeriodo());
                me.setAnio(est.getAnio());
                me.setMuestrapersonaId(mp);
                me.setProgramaId(programa);
                me.setTipo("" + est.getFuenteId().getId());

                muestraestudianteFacade.create(me);
            }
        }



        //********************************Docente

        List<Docente> ld = docenteFacade.findByList("procesoId", proceso);

        it = ld.iterator();

        if (!ld.isEmpty()) {
            while (it.hasNext()) {
                Docente doc = (Docente) it.next();
                Persona per = doc.getPersonaId();

                Muestrapersona mp = new Muestrapersona();

                mp.setCedula(per.getId());
                mp.setNombre(per.getNombre());
                mp.setApellido(per.getApellido());
                mp.setPassword(per.getPassword());
                mp.setMail(per.getMail());
                mp.setMuestraId(m);

                muestrapersonaFacade.create(mp);

                Muestradocente md = new Muestradocente();
                md.setTipo("" + doc.getFuenteId().getId());
                md.setMuestrapersonaId(mp);

                muestradocenteFacade.create(md);
            }
        }



        //********************************Egresado
        List<Egresado> leg = egresadoFacade.findByList("procesoId", proceso);

        it = leg.iterator();

        if (!leg.isEmpty()) {
            while (it.hasNext()) {
                Egresado eg = (Egresado) it.next();
                Persona per = eg.getPersonaId();

                Muestrapersona mp = new Muestrapersona();

                mp.setCedula(per.getId());
                mp.setNombre(per.getNombre());
                mp.setApellido(per.getApellido());
                mp.setPassword(per.getPassword());
                mp.setMail(per.getMail());
                mp.setMuestraId(m);

                muestrapersonaFacade.create(mp);

                Muestraegresado meg = new Muestraegresado();
                meg.setMuestrapersonaId(mp);
                meg.setTipo("" + eg.getFuenteId().getId());

                muestraegresadoFacade.create(meg);
            }
        }


        //********************************Director
        List<Directorprograma> ldp = directorprogramaFacade.findByList("procesoId", proceso);

        it = ldp.iterator();

        if (!ldp.isEmpty()) {
            while (it.hasNext()) {
                Directorprograma dp = (Directorprograma) it.next();
                Persona per = dp.getPersonaId();

                Muestrapersona mp = new Muestrapersona();

                mp.setCedula(per.getId());
                mp.setNombre(per.getNombre());
                mp.setApellido(per.getApellido());
                mp.setPassword(per.getPassword());
                mp.setMail(per.getMail());
                mp.setMuestraId(m);

                muestrapersonaFacade.create(mp);

                Muestradirector mdp = new Muestradirector();
                mdp.setMuestrapersonaId(mp);

                muestradirectorFacade.create(mdp);
            }
        }



        //********************************Administrativo

        List<Administrativo> lad = administrativoFacade.findByList("procesoId", proceso);

        it = lad.iterator();

        if (!lad.isEmpty()) {
            while (it.hasNext()) {
                Administrativo ad = (Administrativo) it.next();
                Persona per = ad.getPersonaId();

                Muestrapersona mp = new Muestrapersona();

                mp.setCedula(per.getId());
                mp.setNombre(per.getNombre());
                mp.setApellido(per.getApellido());
                mp.setPassword(per.getPassword());
                mp.setMail(per.getMail());
                mp.setMuestraId(m);

                muestrapersonaFacade.create(mp);

                Muestraadministrativo mad = new Muestraadministrativo();
                mad.setCargo(ad.getCargo());
                mad.setMuestrapersonaId(mp);

                muestraadministrativoFacade.create(mad);
            }
        }



        //********************************EMpleador

        List<Empleador> lem = empleadorFacade.findByList("procesoId", proceso);

        it = lem.iterator();

        if (!lem.isEmpty()) {
            while (it.hasNext()) {
                Empleador em = (Empleador) it.next();
                Persona per = em.getPersonaId();

                Muestrapersona mp = new Muestrapersona();

                mp.setCedula(per.getId());
                mp.setNombre(per.getNombre());
                mp.setApellido(per.getApellido());
                mp.setPassword(per.getPassword());
                mp.setMail(per.getMail());
                mp.setMuestraId(m);

                muestrapersonaFacade.create(mp);

                Muestraempleador mem = new Muestraempleador();
                mem.setEmpresa(em.getEmpresa());
                mem.setCargo(em.getCargo());
                mem.setMuestrapersonaId(mp);

                muestraempleadorFacade.create(mem);
            }
        }


        //********************************Agencia
        return "NA";
    }

    private MuestraFacade lookupMuestraFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraFacade) c.lookup("java:global/sapnaval/MuestraFacade!com.sap.ejb.MuestraFacade");
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

    private MuestrapersonaFacade lookupMuestrapersonaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestrapersonaFacade) c.lookup("java:global/sapnaval/MuestrapersonaFacade!com.sap.ejb.MuestrapersonaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
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

    private DocenteFacade lookupDocenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DocenteFacade) c.lookup("java:global/sapnaval/DocenteFacade!com.sap.ejb.DocenteFacade");
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

    private EgresadoFacade lookupEgresadoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EgresadoFacade) c.lookup("java:global/sapnaval/EgresadoFacade!com.sap.ejb.EgresadoFacade");
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

    private DirectorprogramaFacade lookupDirectorprogramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (DirectorprogramaFacade) c.lookup("java:global/sapnaval/DirectorprogramaFacade!com.sap.ejb.DirectorprogramaFacade");
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

    private AdministrativoFacade lookupAdministrativoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AdministrativoFacade) c.lookup("java:global/sapnaval/AdministrativoFacade!com.sap.ejb.AdministrativoFacade");
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

    private EmpleadorFacade lookupEmpleadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EmpleadorFacade) c.lookup("java:global/sapnaval/EmpleadorFacade!com.sap.ejb.EmpleadorFacade");
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

    private AgenciagubernamentalFacade lookupAgenciagubernamentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (AgenciagubernamentalFacade) c.lookup("java:global/sapnaval/AgenciagubernamentalFacade!com.sap.ejb.AgenciagubernamentalFacade");
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
}
