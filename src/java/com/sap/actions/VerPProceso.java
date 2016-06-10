/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.ProcesoFacade;
import com.sap.entity.Pregunta;
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
public class VerPProceso implements Action {
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        Proceso p = procesoFacade.find(id);
        sesion.setAttribute("Proceso", p);
        sesion.setAttribute("Modelo", p.getModeloId());
        sesion.setAttribute("Programa", p.getProgramaId());
        if (p.getFechainicio().equals("En Configuración")) {
            sesion.setAttribute("EstadoProceso", 1);
            return "1";
        } else if (p.getFechacierre().equals("--")) {
            sesion.setAttribute("EstadoProceso", 2);
            /////Comienza para saber si el modelo en cuestion tiene preguntas abiertas
            boolean tienePreguntasAbiertas = false;
            List<Pregunta> preguntasModelo = p.getModeloId().getPreguntaList();
            for (Pregunta pregunta : preguntasModelo) {
                if (pregunta.getTipo().equals("2")) {
                    tienePreguntasAbiertas = true;
                    break;
                }
            }
            if (tienePreguntasAbiertas) {
                sesion.setAttribute("abiertas", "true");
                 return "4";
            } else {
                sesion.setAttribute("abiertas", "false");
                 return "2";
            }
            /////////Termina 
           
        } else {
            sesion.setAttribute("EstadoProceso", 3);
            return "3";
        }
    }

    private ProcesoFacade lookupProcesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProcesoFacade) c.lookup("java:global/sapenfermeria/ProcesoFacade!com.sap.ejb.ProcesoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
