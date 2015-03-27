/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.HallazgoFacade;
import com.sap.ejb.ObjetivosFacade;
import com.sap.entity.Hallazgo;
import com.sap.entity.Objetivos;
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
public class Listar2Objetivos implements Action {
    ObjetivosFacade objetivosFacade = lookupObjetivosFacadeBean();
    HallazgoFacade hallazgoFacade = lookupHallazgoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        String id = request.getParameter("id");
        Hallazgo fortaleza = hallazgoFacade.find(Integer.parseInt(id));
        List<Objetivos> objetivos = objetivosFacade.findByList("hallazgoIdhallazgo", fortaleza);
        List<Hallazgo> halla = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "hallazgo");
        sesion.setAttribute("listObjetivos", objetivos);
        sesion.setAttribute("fortaleza", fortaleza);
        sesion.setAttribute("listHallazgos", halla);
        return "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/objetivos2/listar.jsp";

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

    private ObjetivosFacade lookupObjetivosFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ObjetivosFacade) c.lookup("java:global/sap/ObjetivosFacade!com.sap.ejb.ObjetivosFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
