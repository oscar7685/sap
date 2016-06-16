/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.MetasFacade;
import com.sap.entity.Metas;
import com.sap.interfaz.Action;
import java.io.IOException;
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
public class Crear2Meta2 implements Action {

    MetasFacade metasFacade = lookupMetasFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String meta = (String) request.getParameter("meta");
        String estrategia = (String) request.getParameter("estrategia");
        String indicador = (String) request.getParameter("indicador");
        String finicio = (String) request.getParameter("inicio");
        String ffinal = (String) request.getParameter("final");
        String responsables = (String) request.getParameter("responsables");
        String recursos = (String) request.getParameter("recursos");

        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");
        Date fechaI = null;
        try {

            fechaI = formatoDelTexto.parse(finicio);

        } catch (Exception ex) {

            ex.printStackTrace();

        }
        Date fechaF = null;
        try {

            fechaF = formatoDelTexto.parse(ffinal);

        } catch (Exception ex) {

            ex.printStackTrace();

        }

        Metas m = new Metas();
        m.setMeta(meta);
        m.setActividad(estrategia);
        m.setIndicadorCumplimiento(indicador);
        m.setResponsable(responsables);
        m.setRecursos(recursos);
        m.setFechaInicio(fechaI);
        m.setFechaFinal(fechaF);

        metasFacade.create(m);

        Metas recienCreado = metasFacade.findUltimo("idmeta").get(0);

        return "NA";
    }

    private MetasFacade lookupMetasFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MetasFacade) c.lookup("java:global/sapenfermeria/MetasFacade!com.sap.ejb.MetasFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
