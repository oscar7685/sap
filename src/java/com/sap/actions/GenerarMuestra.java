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
public class GenerarMuestra implements Action {
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
        m.setProcesoId(proceso);
        muestraFacade.create(m);

        sesion.setAttribute("Muestra", m);

        //Tamaño muestra
        double n = 0;
        //Nivel de confianza
        double z = 1.96;
        //Probabilidad Ocurrencia
        double p = 0.5;
        //Nivel de tolerancia 
        double e = 0.04;
        //Porbabilidad de no ocurrencia
        double q = 0.5;
        //Tamaño de la población
        double N = 0.0;

        //********************************Estudiante
        double aux = estudianteFacade.cantEstudiantesEntre3y9ByProceso(proceso);

        N = aux;

        if (N != 0.0) {
            n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));
        }

        double cociente = n / N;

        for (int i = 3; i < 10; i++) {

            int tamanioMuestra1 = 0;

            int tamaniosem = estudianteFacade.countByProperty2("procesoId", proceso, "semestre", "0" + i);

            tamanioMuestra1 = (int) Math.round(tamaniosem * cociente);

            List<Estudiante> le = estudianteFacade.generarMuestraEst(proceso, tamanioMuestra1, "semestre", "0" + i);

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

                    muestrapersonaFacade.create(mp);

                    Muestraestudiante me = new Muestraestudiante();
                    me.setCodigo(est.getId());
                    me.setSemestre(est.getSemestre());
                    me.setPeriodo(est.getPeriodo());
                    me.setAnio(est.getAnio());
                    me.setMuestrapersonaId(mp);
                    me.setProgramaId(programa);

                    muestraestudianteFacade.create(me);
                }
            }

        }

        //********************************Docente
        int tamanioMuestra = 0;
        Iterator it;
        aux = docenteFacade.countByProperty("procesoId", proceso);

        N = aux;

        if (N != 0.0) {
            n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

            tamanioMuestra = (int) Math.floor(n);

            List<Docente> ld = docenteFacade.generarMuestra(proceso, tamanioMuestra);

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
                    md.setTipo(doc.getTipo());
                    md.setMuestrapersonaId(mp);

                    muestradocenteFacade.create(md);
                }
            }

        }

        //********************************Egresado
        aux = egresadoFacade.countByProperty("procesoId", proceso);

        N = aux;

        if (N != 0.0) {
            n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

            tamanioMuestra = (int) Math.floor(n);

            List<Egresado> leg = egresadoFacade.generarMuestra(proceso, tamanioMuestra);

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

                    muestraegresadoFacade.create(meg);
                }
            }
        }

        //********************************Director
        aux = directorprogramaFacade.countByProperty("procesoId", proceso);

        N = aux;

        if (N != 0.0) {
            n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

            tamanioMuestra = (int) Math.floor(n);

            List<Directorprograma> ldp = directorprogramaFacade.generarMuestra(proceso, tamanioMuestra);

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

        }

        //********************************Administrativo
        aux = administrativoFacade.countByProperty("procesoId", proceso);

        N = aux;

        if (N != 0.0) {
            n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

            tamanioMuestra = (int) Math.floor(n);

            List<Administrativo> lad = administrativoFacade.generarMuestra(proceso, tamanioMuestra);

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

        }

        //********************************EMpleador
        aux = empleadorFacade.countByProperty("procesoId", proceso);

        N = aux;

        if (N != 0.0) {
            n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

            tamanioMuestra = (int) Math.floor(n);

            List<Empleador> lem = empleadorFacade.generarMuestra(proceso, tamanioMuestra);

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
        }

        //********************************Agencia
        aux = agenciagubernamentalFacade.countByProperty("procesoId", proceso);

        N = aux;

        if (N != 0.0) {
            n = (N * p * q * (z * z)) / ((N - 1) * (e * e) + p * q * (z * z));

            tamanioMuestra = (int) Math.floor(n);

            List<Agenciagubernamental> lag = agenciagubernamentalFacade.generarMuestra(proceso, tamanioMuestra);

            it = lag.iterator();

            if (!lag.isEmpty()) {
                while (it.hasNext()) {
                    Agenciagubernamental ag = (Agenciagubernamental) it.next();
                    Persona per = ag.getPersonaId();

                    Muestrapersona mp = new Muestrapersona();

                    mp.setCedula(per.getId());
                    mp.setNombre(per.getNombre());
                    mp.setApellido(per.getApellido());
                    mp.setPassword(per.getPassword());
                    mp.setMail(per.getMail());
                    mp.setMuestraId(m);

                    muestrapersonaFacade.create(mp);

                    Muestraagencia mag = new Muestraagencia();
                    mag.setDescripcion(ag.getDescripcion());
                    mag.setMuestrapersonaId(mp);

                    muestraagenciaFacade.create(mag);
                }
            }
        }
        return "NA";
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
