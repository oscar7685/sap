/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.ActividadFacade;

import com.sap.ejb.HallazgoFacade;
import com.sap.entity.Actividad;
import com.sap.entity.Hallazgo;
import com.sap.interfaz.Action;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class CrearActividadF2 implements Action {
    ActividadFacade actividadFacade = lookupActividadFacadeBean();

    

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();

        Hallazgo f = (Hallazgo) sesion.getAttribute("fortaleza");

        String actividad = (String) request.getParameter("actividad");
        String meta = (String) request.getParameter("meta");
        String indicador = (String) request.getParameter("indicador");
        String fechai = (String) request.getParameter("inicio");
        String fechaf = (String) request.getParameter("final");
        String responsables = (String) request.getParameter("responsables");
        String recursos = (String) request.getParameter("recursos");
        Date f1 = null;
        Date f2 = null;
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        try {
             f1 = formatter.parse(fechai);
        } catch (ParseException ex) {
            Logger.getLogger(CrearActividadF2.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
             f2 = formatter.parse(fechaf);
        } catch (ParseException ex) {
            Logger.getLogger(CrearActividadF2.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Actividad a = new Actividad();
        a.setHallazgoIdhallazgo(f);
        a.setActividad(actividad);
        a.setMeta(meta);
        a.setIndicadorCumplimiento(indicador);
        a.setFechaInicio(f1);
        a.setFechaFinal(f2);
        a.setResponsable(responsables);
        a.setFinanciacion(recursos);
        actividadFacade.create(a);
        return "NA";
    }

    private ActividadFacade lookupActividadFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ActividadFacade) c.lookup("java:global/sap/ActividadFacade!com.sap.ejb.ActividadFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
