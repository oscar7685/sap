/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.ModeloFacade;
import com.sap.ejb.ProcesoFacade;
import com.sap.ejb.ProgramaFacade;
import com.sap.entity.Modelo;
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
public class CrearProceso implements Action {
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    ModeloFacade modeloFacade = lookupModeloFacadeBean();
    ProgramaFacade programaFacade = lookupProgramaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso procnuevo = new Proceso();

        String descripcion = (String) request.getParameter("descripcion");

        Integer id1 = Integer.valueOf(request.getParameter("programa"));
        Programa p0 = programaFacade.find(id1);

        Integer idModel = Integer.valueOf(request.getParameter("modelo"));
        Modelo model = modeloFacade.find(idModel);

        List listaProce = procesoFacade.findByList("programaId", p0);
        Iterator i = listaProce.iterator();

        int aux = 0;

        while (i.hasNext()) {
            Proceso pro = (Proceso) i.next();
            if (pro.getFechacierre().equals("--")) {
                aux = 1;
            }
        }

        if (aux == 0) {

            procnuevo.setProgramaId(p0);
            procnuevo.setDescripcion(descripcion);
            procnuevo.setFechainicio("En Configuración");
            procnuevo.setModeloId(model);
            procnuevo.setFechacierre("--");
            procesoFacade.create(procnuevo);
            sesion.setAttribute("EstadoProceso", 1);
            sesion.setAttribute("Proceso", procnuevo);
            sesion.setAttribute("Modelo", model);
            return "1";
        } else {
            return "0";
        }
    }

    private ProgramaFacade lookupProgramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProgramaFacade) c.lookup("java:global/sap/ProgramaFacade!com.sap.ejb.ProgramaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ModeloFacade lookupModeloFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ModeloFacade) c.lookup("java:global/sap/ModeloFacade!com.sap.ejb.ModeloFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ProcesoFacade lookupProcesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProcesoFacade) c.lookup("java:global/sap/ProcesoFacade!com.sap.ejb.ProcesoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
