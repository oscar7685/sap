/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.CaracteristicaFacade;
import com.sap.ejb.FactorFacade;
import com.sap.ejb.MuestraFacade;
import com.sap.ejb.PreguntaFacade;
import com.sap.ejb.ProgramaFacade;
import com.sap.entity.Caracteristica;
import com.sap.entity.Factor;
import com.sap.entity.Muestra;
import com.sap.entity.Pregunta;
import com.sap.entity.Proceso;
import com.sap.entity.Programa;
import com.sap.interfaz.Action;
import java.io.IOException;
import java.util.Iterator;
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
public class ListarPreguntasxCaracteristica implements Action {
    PreguntaFacade preguntaFacade = lookupPreguntaFacadeBean();

    FactorFacade factorFacade = lookupFactorFacadeBean();
    CaracteristicaFacade caracteristicaFacade = lookupCaracteristicaFacadeBean();
    ProgramaFacade programaFacade = lookupProgramaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String caracteristica = request.getParameter("caracteristicaId");
        Caracteristica c = caracteristicaFacade.find(Integer.parseInt(caracteristica));
        List<Pregunta> preguntasxCaracteristica = preguntaFacade.findByCaracteristica(c);


        sesion.setAttribute("preguntasxCaracteristica", preguntasxCaracteristica);
        String url = "/WEB-INF/vista/comitePrograma/preguntas/preguntasXcaracteristica.jsp";
        return url;
    }

    private ProgramaFacade lookupProgramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProgramaFacade) c.lookup("java:global/sapnaval/ProgramaFacade!com.sap.ejb.ProgramaFacade");
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

    private FactorFacade lookupFactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FactorFacade) c.lookup("java:global/sapnaval/FactorFacade!com.sap.ejb.FactorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PreguntaFacade lookupPreguntaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PreguntaFacade) c.lookup("java:global/sapnaval/PreguntaFacade!com.sap.ejb.PreguntaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
