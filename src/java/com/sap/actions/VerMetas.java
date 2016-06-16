/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.HallazgoFacade;
import com.sap.ejb.MetasFacade;
import com.sap.entity.Hallazgo;
import com.sap.entity.Metas;
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
public class VerMetas implements Action {

    HallazgoFacade hallazgoFacade = lookupHallazgoFacadeBean();
    MetasFacade metasFacade = lookupMetasFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        String id = request.getParameter("id");
        Hallazgo h = hallazgoFacade.find(Integer.parseInt(id));
        List<Metas> metas = metasFacade.findByList("hallazgoIdhallazgo", h);
        List<Hallazgo> forta = hallazgoFacade.findByList2("procesoId", proceso, "tipo", "fortaleza");
        sesion.setAttribute("listMetas", metas);
        sesion.setAttribute("listFortalezas", forta);
        sesion.setAttribute("hallazgo", h);
        return "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/metas/listar.jsp";
    }

    private MetasFacade lookupMetasFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MetasFacade) c.lookup("java:global/sap/MetasFacade!com.sap.ejb.MetasFacade");
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
