/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.MuestraadministrativoFacade;
import com.sap.ejb.MuestraagenciaFacade;
import com.sap.ejb.MuestradirectorFacade;
import com.sap.ejb.MuestraegresadoFacade;
import com.sap.ejb.MuestraempleadorFacade;
import com.sap.ejb.MuestrapersonaFacade;
import com.sap.entity.Muestra;
import com.sap.entity.Muestraadministrativo;
import com.sap.entity.Muestraagencia;
import com.sap.entity.Muestradirector;
import com.sap.entity.Muestraegresado;
import com.sap.entity.Muestraempleador;
import com.sap.entity.Muestrapersona;
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
    MuestraagenciaFacade muestraagenciaFacade = lookupMuestraagenciaFacadeBean();
    MuestraempleadorFacade muestraempleadorFacade = lookupMuestraempleadorFacadeBean();
    MuestradirectorFacade muestradirectorFacade = lookupMuestradirectorFacadeBean();
    MuestraadministrativoFacade muestraadministrativoFacade = lookupMuestraadministrativoFacadeBean();
    MuestraegresadoFacade muestraegresadoFacade = lookupMuestraegresadoFacadeBean();
    MuestrapersonaFacade muestrapersonaFacade = lookupMuestrapersonaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("cedula");
        String pass = request.getParameter("password");
        String mail = request.getParameter("mail");

        Muestra m = (Muestra) sesion.getAttribute("Muestra");

        String fuente = (String) sesion.getAttribute("selectorFuente");

        List lmp = muestrapersonaFacade.findByList2("cedula", cedula, "muestraId", m);

        Iterator it = lmp.iterator();

        Muestrapersona mp = null;

        while (it.hasNext()) {
            mp = (Muestrapersona) it.next();
        }

        if (mp == null) {
            Muestrapersona mp1 = new Muestrapersona();
            mp1.setCedula(cedula);
            mp1.setNombre(nombre);
            mp1.setApellido(apellido);
            mp1.setPassword(pass);
            mp1.setMail(mail);
            mp1.setMuestraId((Muestra) sesion.getAttribute("Muestra"));
            muestrapersonaFacade.create(mp1);
            mp = mp1;

            if (fuente.equals("Egresado")) {

                Muestraegresado me = new Muestraegresado();

                me.setMuestrapersonaId(mp1);

                muestraegresadoFacade.create(me);

            } else if (fuente.equals("Administrativo")) {

                String cargo = request.getParameter("cargo");

                Muestraadministrativo ma = new Muestraadministrativo();

                ma.setCargo(cargo);
                ma.setMuestrapersonaId(mp1);

                muestraadministrativoFacade.create(ma);

            } else if (fuente.equals("Directivo")) {
                Muestradirector md = new Muestradirector();

                md.setMuestrapersonaId(mp1);

                muestradirectorFacade.create(md);

            } else if (fuente.equals("Empleador")) {

                String cargo = request.getParameter("cargo");
                String empresa = request.getParameter("empresa");

                Muestraempleador mem = new Muestraempleador();
                mem.setCargo(cargo);
                mem.setEmpresa(empresa);
                mem.setMuestrapersonaId(mp1);

                muestraempleadorFacade.create(mem);

            } else if (fuente.equals("Agencia")) {

                String descripcion = request.getParameter("descripcion");

                Muestraagencia ma = new Muestraagencia();
                ma.setDescripcion(descripcion);
                ma.setMuestrapersonaId(mp1);

                muestraagenciaFacade.create(ma);

            }
        } else {
            //System.out.println("Cedula Duplicada Para Este Proceso");
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
}
