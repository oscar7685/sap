/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.MetasFacade;
import com.sap.entity.Hallazgo;
import com.sap.entity.Metas;
import com.sap.entity.Proceso;
import com.sap.interfaz.Action;
import java.io.IOException;
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
public class VerSeguimientos implements Action {
    MetasFacade metasFacade = lookupMetasFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        String id = request.getParameter("id");
        Metas m = metasFacade.find(Integer.parseInt(id));
        Hallazgo h = m.getHallazgoIdhallazgo();
  
       
        sesion.setAttribute("meta", m);
        sesion.setAttribute("hallazgo", h);
 
        return "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/vistaSeguimientos.jsp";
    }

    private MetasFacade lookupMetasFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MetasFacade) c.lookup("java:global/sapenfermeria/MetasFacade!com.sap.ejb.MetasFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
