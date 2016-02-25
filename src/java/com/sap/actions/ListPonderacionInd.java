/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.PonderacionfactorFacade;
import com.sap.ejb.PonderacionindicadorFacade;
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
public class ListPonderacionInd implements Action {
    PonderacionindicadorFacade ponderacionindicadorFacade = lookupPonderacionindicadorFacadeBean();
    

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        sesion.setAttribute("listPonderacionIndicadores", ponderacionindicadorFacade.findByList("procesoId", proceso));
        return "/WEB-INF/vista/comitePrograma/ponderacion/listarpi.jsp";
    }

    private PonderacionindicadorFacade lookupPonderacionindicadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacionindicadorFacade) c.lookup("java:global/sapnaval/PonderacionindicadorFacade!com.sap.ejb.PonderacionindicadorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    
}
