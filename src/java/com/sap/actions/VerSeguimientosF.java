/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.ActividadFacade;
import com.sap.entity.Actividad;
import com.sap.entity.Hallazgo;
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
public class VerSeguimientosF implements Action {
    ActividadFacade actividadFacade = lookupActividadFacadeBean();
    
    
    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String id = request.getParameter("id");
        Actividad a = actividadFacade.find(Integer.parseInt(id));
        Hallazgo f = a.getHallazgoIdhallazgo();
  
        sesion.setAttribute("actividad", a);
        sesion.setAttribute("fortaleza", f);
 
        return "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/vistaSeguimientosF.jsp";
}

    private ActividadFacade lookupActividadFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ActividadFacade) c.lookup("java:global/sap/ActividadFacade!com.sap.ejb.ActividadFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}