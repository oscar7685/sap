/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.SeguimientoFacade;
import com.sap.entity.Actividad;
import com.sap.entity.Seguimiento;
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
public class EditarSeguimiento implements Action {
    SeguimientoFacade seguimientoFacade = lookupSeguimientoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String id = request.getParameter("id");
        Seguimiento s = seguimientoFacade.find(Integer.parseInt(id));
        sesion.setAttribute("seguimiento", s);
        return "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/seguimientos/editar.jsp";


    }

    private SeguimientoFacade lookupSeguimientoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (SeguimientoFacade) c.lookup("java:global/sap/SeguimientoFacade!com.sap.ejb.SeguimientoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
