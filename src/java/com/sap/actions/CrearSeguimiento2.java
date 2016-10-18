/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.ActividadFacade;

import com.sap.ejb.HallazgoFacade;
import com.sap.ejb.SeguimientoFacade;
import com.sap.entity.Actividad;
import com.sap.entity.Hallazgo;
import com.sap.entity.Seguimiento;
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
public class CrearSeguimiento2 implements Action {
    SeguimientoFacade seguimientoFacade = lookupSeguimientoFacadeBean();

    

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();

        Actividad act = (Actividad) sesion.getAttribute("actividad");
        String programada = (String) request.getParameter("inicio");
        String fecharealizada = (String) request.getParameter("final");
        String avance = (String) request.getParameter("avance");
        String observaciones = (String) request.getParameter("observaciones");

        Date f1 = null;
        Date f2 = null;
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        try {
            f1 = formatter.parse(programada);
        } catch (ParseException ex) {
            Logger.getLogger(CrearSeguimiento2.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            f2 = formatter.parse(fecharealizada);
        } catch (ParseException ex) {
            Logger.getLogger(CrearSeguimiento2.class.getName()).log(Level.SEVERE, null, ex);
        }

        Seguimiento s = new Seguimiento();
        s.setActividadIdactividad(act);
        s.setFechaProgramado(f1);
        if (f2 != null) {
            s.setFechaRealizado(f2);
        }
        try {
            int avanceint = Integer.parseInt(avance);
            s.setPorcentajeAvance(avanceint);
        }catch(Exception e){
        
        }
        s.setObservaciones(observaciones);
        seguimientoFacade.create(s);
        return "NA";
    }

    private SeguimientoFacade lookupSeguimientoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (SeguimientoFacade) c.lookup("java:global/sap/SeguimientoFacade!com.sap.ejb.SeguimientoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

   
}
