/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.ProcesoFacade;
import com.sap.entity.Indicador;
import com.sap.entity.Modelo;
import com.sap.entity.Proceso;
import com.sap.entity.Programa;
import com.sap.interfaz.Action;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author acreditacion
 */
public class IndicadoresSinAsociacion implements Action {

    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    private final static Logger LOGGER = Logger.getLogger(IndicadoresSinAsociacion.class);

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();

        Proceso p = (Proceso) sesion.getAttribute("Proceso");
        Modelo m2 = p.getModeloId();
        List<Indicador> listadeIndicadores = m2.getIndicadorList();
        List<Indicador> sinAsociacion = new ArrayList<Indicador>();
        for (Indicador indicador : listadeIndicadores) {
            if(indicador.getIndicadorList().isEmpty()){
            sinAsociacion.add(indicador);
            }
        }
        sesion.setAttribute("sinAsociacion", sinAsociacion);
        return "/WEB-INF/vista/comiteCentral/indicador/sinAsociacion.jsp";
    }

    private ProcesoFacade lookupProcesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProcesoFacade) c.lookup("java:global/sapenfermeria/ProcesoFacade!com.sap.ejb.ProcesoFacade");
        } catch (NamingException ne) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
