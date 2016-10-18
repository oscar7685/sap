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
public class EditarSeguimiento2 implements Action {
    SeguimientoFacade seguimientoFacade = lookupSeguimientoFacadeBean();

    

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Seguimiento seg = (Seguimiento) sesion.getAttribute("seguimiento");
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
            Logger.getLogger(EditarSeguimiento2.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            f2 = formatter.parse(fecharealizada);
        } catch (ParseException ex) {
            Logger.getLogger(EditarSeguimiento2.class.getName()).log(Level.SEVERE, null, ex);
        }

        seg.setFechaProgramado(f1);
        if (f2 != null) {
            seg.setFechaRealizado(f2);
        }
        try {
            int avanceint = Integer.parseInt(avance);
            seg.setPorcentajeAvance(avanceint);
        }catch(Exception e){
        
        }
        seg.setObservaciones(observaciones);
        seguimientoFacade.edit(seg);
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
