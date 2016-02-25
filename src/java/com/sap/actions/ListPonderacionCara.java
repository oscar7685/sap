/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.PonderacioncaracteristicaFacade;
import com.sap.ejb.PonderacionfactorFacade;
import com.sap.entity.Proceso;
import com.sap.interfaz.Action;
import java.io.IOException;
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
public class ListPonderacionCara implements Action {
    PonderacioncaracteristicaFacade ponderacioncaracteristicaFacade = lookupPonderacioncaracteristicaFacadeBean();
    PonderacionfactorFacade ponderacionfactorFacade = lookupPonderacionfactorFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        if (ponderacionfactorFacade.findByList("procesoId", proceso).isEmpty()) {
            return "0";
        } else {
            sesion.setAttribute("listPonderacionCara", ponderacioncaracteristicaFacade.findByList("procesoId", proceso));
            return "1";
        }
    }

    private PonderacionfactorFacade lookupPonderacionfactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacionfactorFacade) c.lookup("java:global/sapnaval/PonderacionfactorFacade!com.sap.ejb.PonderacionfactorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PonderacioncaracteristicaFacade lookupPonderacioncaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacioncaracteristicaFacade) c.lookup("java:global/sapnaval/PonderacioncaracteristicaFacade!com.sap.ejb.PonderacioncaracteristicaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
