/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.PreguntaFacade;
import com.sap.ejb.ProcesoFacade;
import com.sap.ejb.ResultadoevaluacionFacade;
import com.sap.entity.Pregunta;
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
public class MostrarTortaPregunta implements Action {

    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    PreguntaFacade preguntaFacade = lookupPreguntaFacadeBean();
    ResultadoevaluacionFacade resultadoevaluacionFacade = lookupResultadoevaluacionFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        String idPregunta = (String) request.getParameter("idPregunta");
        Proceso p = procesoFacade.find(52);
        Pregunta pregunta = preguntaFacade.find(Integer.parseInt(idPregunta));
        //declaramos cantidades x respuesta por opcion de respuesta
        int ceros = 0;
        int unos = 0;
        int dos = 0;
        int tres = 0;
        int cuatros = 0;
        int cincos = 0;

        //contamos cuantos 5,4,3,2,1,0 se respondieron sin importar las encuestas
        List<Object[]> results = resultadoevaluacionFacade.findResultadosxPreguntaxEncuestaxProcesoxValor1(p, pregunta);

        for (Object[] result : results) {
            ceros = ((Number) result[5]).intValue();
            cincos = ((Number) result[4]).intValue();
            cuatros = ((Number) result[3]).intValue();
            tres = ((Number) result[2]).intValue();
            dos = ((Number) result[1]).intValue();
            unos = ((Number) result[0]).intValue();
        }

        sesion.setAttribute("preguntaX", pregunta);
        sesion.setAttribute("ceros", ceros);
        sesion.setAttribute("cincos", cincos);
        sesion.setAttribute("unos", unos);
        sesion.setAttribute("dos", dos);
        sesion.setAttribute("tres", tres);
        sesion.setAttribute("cuatros", cuatros);

        return "/WEB-INF/vista/comitePrograma/proceso/informe/tortaDetalleIndicador.jsp";

    }

    private ResultadoevaluacionFacade lookupResultadoevaluacionFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ResultadoevaluacionFacade) c.lookup("java:global/sapenfermeria/ResultadoevaluacionFacade!com.sap.ejb.ResultadoevaluacionFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PreguntaFacade lookupPreguntaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PreguntaFacade) c.lookup("java:global/sapenfermeria/PreguntaFacade!com.sap.ejb.PreguntaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ProcesoFacade lookupProcesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProcesoFacade) c.lookup("java:global/sapenfermeria/ProcesoFacade!com.sap.ejb.ProcesoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
