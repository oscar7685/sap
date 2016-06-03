/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.PersonaFacade;
import com.sap.ejb.RepresentanteFacade;
import com.sap.entity.Persona;
import com.sap.entity.Representante;
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
public class BuscarPersona implements Action {

    PersonaFacade personaFacade = lookupPersonaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();

        String cedula = request.getParameter("cedula");
        Persona p = personaFacade.find(cedula);
        String json = "1";
        if (p != null) {
            json = "{\"nombre\":\"" + p.getNombre()
                    + "\",\"apellido\":\"" + p.getApellido()
                    + "\",\"pass\":\"" + p.getPassword()
                    + "\",\"correo\":\"" + p.getMail()
                    + "\"}";
        }

        return "" + json;
    }

    private PersonaFacade lookupPersonaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PersonaFacade) c.lookup("java:global/sapnaval/PersonaFacade!com.sap.ejb.PersonaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
