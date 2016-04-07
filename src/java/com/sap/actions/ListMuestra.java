/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.MuestraFacade;
import com.sap.ejb.RespuestasFacade;
import com.sap.entity.Muestra;
import com.sap.entity.Proceso;
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
public class ListMuestra implements Action {

    RespuestasFacade respuestasFacade = lookupRespuestasFacadeBean();
    MuestraFacade muestraFacade = lookupMuestraFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        String url;
        List<Muestra> lm = muestraFacade.findByList("procesoId", proceso);
        if (proceso.getModeloId().getId() == 1) {
            List contestados = respuestasFacade.findByContestados();
            url = "/WEB-INF/vista/comitePrograma/muestra/listarMuestra.jsp";
            sesion.setAttribute("contestados", contestados);
        } else {
            Muestra m = null;
            if (!lm.isEmpty()) {
                Iterator i = lm.iterator();
                while (i.hasNext()) {
                    m = (Muestra) i.next();
                    sesion.setAttribute("Muestra", m);
                }
                url = "/WEB-INF/vista/comitePrograma/muestra/listarMuestra.jsp";
            } else {
                sesion.setAttribute("Muestra", m);
                url = "/WEB-INF/vista/comitePrograma/muestra/asignarMuestra.jsp";

            }
        }
        return url;
    }

    private MuestraFacade lookupMuestraFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraFacade) c.lookup("java:global/sapnaval/MuestraFacade!com.sap.ejb.MuestraFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private RespuestasFacade lookupRespuestasFacadeBean() {
        try {
            Context c = new InitialContext();
            return (RespuestasFacade) c.lookup("java:global/sapnaval/RespuestasFacade!com.sap.ejb.RespuestasFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
