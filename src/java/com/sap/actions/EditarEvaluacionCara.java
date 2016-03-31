/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.EvaluarcaracteristicaFacade;
import com.sap.ejb.PonderacioncaracteristicaFacade;
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
public class EditarEvaluacionCara implements Action {
    EvaluarcaracteristicaFacade evaluarcaracteristicaFacade = lookupEvaluarcaracteristicaFacadeBean();
    

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        sesion.setAttribute("listEvaluacionCara", evaluarcaracteristicaFacade.findByList("procesoId", proceso));
        return "/WEB-INF/vista/comitePrograma/proceso/editarevaluacioncara.jsp";
    }

    private EvaluarcaracteristicaFacade lookupEvaluarcaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EvaluarcaracteristicaFacade) c.lookup("java:global/sapnaval/EvaluarcaracteristicaFacade!com.sap.ejb.EvaluarcaracteristicaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

   
}
