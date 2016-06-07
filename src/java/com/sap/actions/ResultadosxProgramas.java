/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.CaracteristicaFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.ModeloFacade;
import com.sap.ejb.ProgramaFacade;
import com.sap.ejb.RespuestasFacade;
import com.sap.ejb.RolFacade;
import com.sap.entity.Caracteristica;
import com.sap.entity.Fuente;
import com.sap.entity.Modelo;
import com.sap.entity.Pregunta;
import com.sap.entity.Proceso;
import com.sap.entity.Programa;
import com.sap.entity.Respuestas;
import com.sap.entity.Rol;
import com.sap.interfaz.Action;
import java.io.IOException;
import java.util.ArrayList;
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
public class ResultadosxProgramas implements Action {

    FuenteFacade fuenteFacade = lookupFuenteFacadeBean();
    ProgramaFacade programaFacade = lookupProgramaFacadeBean();
    RolFacade rolFacade = lookupRolFacadeBean();
    RespuestasFacade respuestasFacade = lookupRespuestasFacadeBean();
    ModeloFacade modeloFacade = lookupModeloFacadeBean();
    CaracteristicaFacade caracteristicaFacade = lookupCaracteristicaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String url = "/WEB-INF/vista/comitePrograma/proceso/informe/dmaProgramas.jsp";
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        Programa prog = proceso.getProgramaId();
        String tipoF = prog.getTipoformacion();
        Modelo m = proceso.getModeloId();
        List<Caracteristica> caractesticas = caracteristicaFacade.findByModeloOptimizada(m);
        String[][] resultados = new String[258][12];
        String[][] cerillos = new String[258][12];
        List<Fuente> fuentes = fuenteFacade.findAll();
        for (Caracteristica caracteristica : caractesticas) {
            if (caracteristica.getPreguntaList().size() > 0) {
                List<Pregunta> preguntas = caracteristica.getPreguntaList();
                for (Pregunta pregunta : preguntas) {
                    if (pregunta.getPreguntaList().size() > 0) {
                        for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {// Si la pregunta tiene subpreguntas
                            for (Fuente fuente : fuentes) {
                                List<Respuestas> rs = null;
                                rs = respuestasFacade.findByProcesoPreguntaFuente(proceso, pregunta.getPreguntaList().get(i), fuente);
                                int cuatros = 0, cincos = 0, ceros = 0;
                                for (Respuestas respuestas : rs) {
                                    if (respuestas.getRespuesta() == 0) {
                                        ceros++;
                                    } else if (respuestas.getRespuesta() == 4) {
                                        cuatros++;
                                    } else if (respuestas.getRespuesta() == 5) {
                                        cincos++;
                                    }
                                }
                                if (rs.isEmpty()) {
                                    resultados[pregunta.getPreguntaList().get(i).getId()][fuente.getId()] = "-1";
                                } else {
                                    double dma = (double) ((cincos + cuatros) * 100) / rs.size();
                                    double cerosPorcentaje = (double) ((ceros) * 100) / rs.size();
                                    resultados[pregunta.getPreguntaList().get(i).getId()][fuente.getId()] = "" + dma + "";
                                    cerillos[pregunta.getPreguntaList().get(i).getId()][fuente.getId()] = "" + cerosPorcentaje;

                                }
                            }
                        }
                    } else { // Si la pregunta NO tiene subpreguntas
                        for (Fuente fuente : fuentes) {
                            List<Respuestas> rs = null;
                            rs = respuestasFacade.findByProcesoPreguntaFuente(proceso, pregunta, fuente);
                            int cuatros = 0, cincos = 0, ceros = 0;
                            for (Respuestas respuestas : rs) {
                                if (respuestas.getRespuesta() == 0) {
                                    ceros++;
                                } else if (respuestas.getRespuesta() == 4) {
                                    cuatros++;
                                } else if (respuestas.getRespuesta() == 5) {
                                    cincos++;
                                }
                            }
                            if (rs.isEmpty()) {
                                resultados[pregunta.getId()][fuente.getId()] = "-1";
                            } else {
                                double dma = (double) ((cincos + cuatros) * 100) / rs.size();
                                double cerosPorcentaje = (double) ((ceros) * 100) / rs.size();
                                resultados[pregunta.getId()][fuente.getId()] = "" + dma + "";
                                cerillos[pregunta.getId()][fuente.getId()] = "" + cerosPorcentaje;

                            }
                        }
                    }
                }
            }
        }
        sesion.setAttribute("resultados", resultados);
        sesion.setAttribute("cerillos", cerillos);
        sesion.setAttribute("tipoF", tipoF);
        sesion.setAttribute("caractesticas", caractesticas);
        return url;
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

    private ModeloFacade lookupModeloFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ModeloFacade) c.lookup("java:global/sapnaval/ModeloFacade!com.sap.ejb.ModeloFacade");
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

    private RolFacade lookupRolFacadeBean() {
        try {
            Context c = new InitialContext();
            return (RolFacade) c.lookup("java:global/sapnaval/RolFacade!com.sap.ejb.RolFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ProgramaFacade lookupProgramaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProgramaFacade) c.lookup("java:global/sapnaval/ProgramaFacade!com.sap.ejb.ProgramaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private FuenteFacade lookupFuenteFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FuenteFacade) c.lookup("java:global/sapnaval/FuenteFacade!com.sap.ejb.FuenteFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
