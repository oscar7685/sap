/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.CaracteristicaFacade;
import com.sap.ejb.HallazgoFacade;
import com.sap.ejb.ProcesoFacade;
import com.sap.entity.Caracteristica;
import com.sap.entity.Hallazgo;
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
public class CrearHallazgo2 implements Action {

    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    HallazgoFacade hallazgoFacade = lookupHallazgoFacadeBean();
    CaracteristicaFacade caracteristicaFacade = lookupCaracteristicaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso pr = (Proceso) sesion.getAttribute("Proceso");
        String hallazgo = (String) request.getParameter("hallazgo");
        String caracteristica = (String) request.getParameter("caracteristica");
        Caracteristica c = caracteristicaFacade.find(Integer.parseInt(caracteristica));
        Hallazgo h = new Hallazgo();
        h.setHallazgo(hallazgo);
        h.setCaracteristicaId(c);
        h.setProcesoId(pr);
        h.setTipo("hallazgo");
        hallazgoFacade.create(h);
        Hallazgo recienCreado = hallazgoFacade.findUltimo("idhallazgo").get(0);
        List<Hallazgo> hallagos = pr.getHallazgoList();
        hallagos.add(recienCreado);
        pr.setHallazgoList(hallagos);
        procesoFacade.edit(pr);
        return "NA";
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

    private HallazgoFacade lookupHallazgoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (HallazgoFacade) c.lookup("java:global/sapnaval/HallazgoFacade!com.sap.ejb.HallazgoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ProcesoFacade lookupProcesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProcesoFacade) c.lookup("java:global/sapnaval/ProcesoFacade!com.sap.ejb.ProcesoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
