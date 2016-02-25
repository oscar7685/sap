/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.HallazgoFacade;
import com.sap.ejb.ObjetivosFacade;
import com.sap.entity.Hallazgo;
import com.sap.entity.Objetivos;
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
public class Crear2Objetivo2 implements Action {
    HallazgoFacade hallazgoFacade = lookupHallazgoFacadeBean();
    ObjetivosFacade objetivosFacade = lookupObjetivosFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String objetivo = (String) request.getParameter("objetivo");
        Hallazgo h = (Hallazgo) sesion.getAttribute("fortaleza");
        Objetivos o = new Objetivos();
        o.setObjetivo(objetivo);
        o.setHallazgoIdhallazgo(h);
        objetivosFacade.create(o);

        Objetivos recienCreado = objetivosFacade.findUltimo("idobjetivos").get(0);
        List<Objetivos> objetivos = h.getObjetivosList();
        objetivos.add(recienCreado);
        h.setObjetivosList(objetivos);
        hallazgoFacade.edit(h);
        return "NA";
    }

    private ObjetivosFacade lookupObjetivosFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ObjetivosFacade) c.lookup("java:global/sapnaval/ObjetivosFacade!com.sap.ejb.ObjetivosFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private HallazgoFacade lookupHallazgoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (HallazgoFacade) c.lookup("java:global/sapnaval/HallazgoFacade!com.sap.ejb.HallazgoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
