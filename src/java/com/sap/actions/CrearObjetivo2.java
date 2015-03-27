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
public class CrearObjetivo2 implements Action {
    HallazgoFacade hallazgoFacade = lookupHallazgoFacadeBean();
    ObjetivosFacade objetivosFacade = lookupObjetivosFacadeBean();
    

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String objetivo = (String) request.getParameter("objetivo");
        Hallazgo h12 = (Hallazgo) sesion.getAttribute("hallazgo");
        Objetivos o = new Objetivos();
        o.setObjetivo(objetivo);
        o.setHallazgoIdhallazgo(h12);
        objetivosFacade.create(o);

        Objetivos recienCreado12 = objetivosFacade.findUltimo("idobjetivos").get(0);
        List<Objetivos> objetivos = h12.getObjetivosList();
        objetivos.add(recienCreado12);
        h12.setObjetivosList(objetivos);
        hallazgoFacade.edit(h12);
        return "NA";
    }

    private ObjetivosFacade lookupObjetivosFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ObjetivosFacade) c.lookup("java:global/sap/ObjetivosFacade!com.sap.ejb.ObjetivosFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private HallazgoFacade lookupHallazgoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (HallazgoFacade) c.lookup("java:global/sap/HallazgoFacade!com.sap.ejb.HallazgoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
