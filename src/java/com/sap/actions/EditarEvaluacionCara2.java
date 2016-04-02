/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.CaracteristicaFacade;
import com.sap.ejb.EvaluarcaracteristicaFacade;
import com.sap.entity.Caracteristica;
import com.sap.entity.Evaluarcaracteristica;
import com.sap.entity.Modelo;
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
public class EditarEvaluacionCara2 implements Action {

    CaracteristicaFacade caracteristicaFacade = lookupCaracteristicaFacadeBean();
    EvaluarcaracteristicaFacade evaluarcaracteristicaFacade = lookupEvaluarcaracteristicaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        Modelo m = proceso.getModeloId();
        List<Caracteristica> caracteristicas = caracteristicaFacade.findByModelo(m);
        
        for (Caracteristica caracteristica : caracteristicas) {
            String evaluacionC = request.getParameter("evaluacionC" + caracteristica.getId());
            Evaluarcaracteristica e = evaluarcaracteristicaFacade.findBySingle2("caracteristicaId", caracteristica, "procesoId", proceso);
            e.setEvaluacion(Float.parseFloat(evaluacionC));
            evaluarcaracteristicaFacade.edit(e);
        }
        return "NA";
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

    private CaracteristicaFacade lookupCaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (CaracteristicaFacade) c.lookup("java:global/sapnaval/CaracteristicaFacade!com.sap.ejb.CaracteristicaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
