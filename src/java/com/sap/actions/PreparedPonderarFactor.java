/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.FactorFacade;
import com.sap.entity.Modelo;
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
public class PreparedPonderarFactor implements Action {
    FactorFacade factorFacade = lookupFactorFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Modelo modelo = (Modelo) sesion.getAttribute("Modelo");
        sesion.setAttribute("listFactor", factorFacade.findByModelo(modelo));
        return "/WEB-INF/vista/comitePrograma/ponderacion/ponderarFactor.jsp";
    }

    private FactorFacade lookupFactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FactorFacade) c.lookup("java:global/sap/FactorFacade!com.sap.ejb.FactorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
