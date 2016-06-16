/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.ResultadoevaluacionFacade;
import com.sap.entity.Resultadoevaluacion;
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
public class CerrarP implements Action {
    ResultadoevaluacionFacade resultadoevaluacionFacade = lookupResultadoevaluacionFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        List<Resultadoevaluacion> acerrar = (List<Resultadoevaluacion>) sesion.getAttribute("acerrar");
        for (Resultadoevaluacion resultadoevaluacion : acerrar) {
            String cambio = request.getParameter("InfoCambio" + resultadoevaluacion.getId());
            if (cambio.equals("1")) {
                String calificacion = request.getParameter("resultado" + resultadoevaluacion.getId());
                resultadoevaluacion.setRespuesta(calificacion);
                resultadoevaluacionFacade.edit(resultadoevaluacion);
            }
        }
        return "NA";
    }

    private ResultadoevaluacionFacade lookupResultadoevaluacionFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ResultadoevaluacionFacade) c.lookup("java:global/sapenfermeria/ResultadoevaluacionFacade!com.sap.ejb.ResultadoevaluacionFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
