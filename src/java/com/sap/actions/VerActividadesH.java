package com.sap.actions;

import com.sap.ejb.HallazgoFacade;
import com.sap.ejb.ActividadFacade;
import com.sap.entity.Hallazgo;
import com.sap.entity.Actividad;
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
public class VerActividadesH implements Action {

    ActividadFacade actividadFacade = lookupActividadFacadeBean();
    HallazgoFacade hallazgoFacade = lookupHallazgoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String id = request.getParameter("id");
        Hallazgo h = hallazgoFacade.find(Integer.parseInt(id));
        List<Actividad> actividades = actividadFacade.findByList("hallazgoIdhallazgo", h);
        sesion.setAttribute("hallazgo", h);
        sesion.setAttribute("actividades", actividades);
        return "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/actividadesH/listar.jsp";
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