/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.CaracteristicaFacade;
import com.sap.ejb.EncuestaFacade;
import com.sap.ejb.FactorFacade;
import com.sap.ejb.ModeloFacade;
import com.sap.ejb.PreguntaFacade;
import com.sap.ejb.ProgramaFacade;
import com.sap.ejb.RespuestasFacade;
import com.sap.ejb.RolFacade;
import com.sap.entity.Caracteristica;
import com.sap.entity.Encuesta;
import com.sap.entity.Factor;
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
public class GraficarDMA implements Action {

    EncuestaFacade encuestaFacade = lookupEncuestaFacadeBean();
    PreguntaFacade preguntaFacade = lookupPreguntaFacadeBean();
    FactorFacade factorFacade = lookupFactorFacadeBean();
    ProgramaFacade programaFacade = lookupProgramaFacadeBean();
    RolFacade rolFacade = lookupRolFacadeBean();
    RespuestasFacade respuestasFacade = lookupRespuestasFacadeBean();
    ModeloFacade modeloFacade = lookupModeloFacadeBean();
    CaracteristicaFacade caracteristicaFacade = lookupCaracteristicaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String url = "/WEB-INF/vista/comitePrograma/proceso/informe/graficarDMA.jsp";
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        Modelo m = modeloFacade.find(Integer.parseInt("1"));

        String factor = request.getParameter("factor");
        String caracteristica = request.getParameter("caracteristica");
        String pregunta = request.getParameter("pregunta");
        String grupo = request.getParameter("grupo");
        String aux = "";
        String titulo = "";
        List<String> ejeY = new ArrayList<String>();
        List<String> ejeX = new ArrayList<String>();

        if (!"-1".equals(grupo)) {
            if ("-2".equals(grupo)) {
                for (int i = 1; i < 12; i++) {
                    Encuesta enc = encuestaFacade.find(i);
                    aux = enc.getNombre().replace("ENCUESTA A ", "");
                    ejeY.add("" + aux);
                }
            } else {
                Encuesta enc = encuestaFacade.find(Integer.parseInt(grupo));
                aux = enc.getNombre().replace("ENCUESTA A ", "");
                ejeY.add("" + aux);

            }
        }

        if (!"-1".equals(pregunta)) {
            if (!"-2".equals(pregunta)) {
                Pregunta preg = preguntaFacade.find(Integer.parseInt(pregunta));
                if (preg.getPreguntaPadre() != null) {
                    titulo = preg.getPreguntaPadre().getPregunta() + " " + preg.getPregunta();
                }
                ejeY.add("TOTAL PREGUNTA");
            }
        }

        if ("".equals(titulo)) {
            if (!"-1".equals(caracteristica)) {
                if (!"-2".equals(caracteristica)) {
                    Caracteristica car = caracteristicaFacade.find(Integer.parseInt(caracteristica));
                    titulo = "CARACTERISTICA " + car.getCodigo() + " " + car.getNombre();
                    ejeY.add("TOTAL CARACTERISTICA");
                } else {
                    titulo = "CARACTERISTICAS ";
                    if (ejeY.isEmpty()) {
                        List<Caracteristica> ca2 = caracteristicaFacade.findByModeloOptimizada(m);
                        for (Caracteristica ca1 : ca2) {
                            ejeY.add("" + ca1.getNombre());
                        }
                    }
                    ejeY.add("TOTAL CARACTERISTICAS");
                }
            }
        }
        if ("".equals(titulo)) {
            if (!"-1".equals(factor)) {
                if (!"-2".equals(factor)) {
                    Factor fac = factorFacade.find(Integer.parseInt(factor));
                    titulo = "FACTOR " + fac.getCodigo() + " " + fac.getNombre();
                    ejeY.add("TOTAL FACTOR");
                } else {
                    titulo = "FACTORES ";
                    if (ejeY.isEmpty()) {
                        int total = 0;
                        int total5y4 = 0;
                        List<Factor> fa2 = factorFacade.findByModelo(m);
                        for (Factor factor1 : fa2) {
                            ejeY.add("" + factor1.getNombre());

                            List<Respuestas> rs = respuestasFacade.findByFactor(factor1);
                            total += rs.size();
                            int cuatros = 0, cincos = 0;
                            for (Respuestas respuestas : rs) {
                                if (respuestas.getRespuesta() == 4) {
                                    cuatros++;
                                } else if (respuestas.getRespuesta() == 5) {
                                    cincos++;
                                }
                            }
                            if (rs.isEmpty()) {
                                ejeX.add("NA");
                            } else {
                                total5y4 += cincos + cuatros;
                                double dma = (double) ((cincos + cuatros) * 100) / rs.size();
                                dma = Math.rint(dma * 100) / 100;
                                ejeX.add("" + dma);
                            }


                        }
                        double dma = (double) ((total5y4) * 100) / total;
                        dma = Math.rint(dma * 100) / 100;
                        ejeX.add("" + dma);
                        ejeY.add("TOTAL FACTORES");
                    }
                }
            }
        }
        if ("".equals(titulo)) {
            if (!"-2".equals(grupo)) {
                Encuesta enc = encuestaFacade.find(Integer.parseInt(grupo));
                titulo = "GRUPO " + enc.getNombre().replace("ENCUESTA A ", "");
            } else {
                titulo = "GRUPOS";
                ejeY.add("TOTAL GRUPOS");

                int total = 0;
                int total5y4 = 0;
                for (int i = 1; i < 12; i++) {
                    Encuesta enc = encuestaFacade.find(i);
                    List<Respuestas> rs = respuestasFacade.findByEncuesta(enc);
                    total += rs.size();
                    int cuatros = 0, cincos = 0;
                    for (Respuestas respuestas : rs) {
                        if (respuestas.getRespuesta() == 4) {
                            cuatros++;
                        } else if (respuestas.getRespuesta() == 5) {
                            cincos++;
                        }
                    }
                    if (rs.isEmpty()) {
                        ejeX.add("NA");
                    } else {
                        total5y4 += cincos + cuatros;
                        double dma = (double) ((cincos + cuatros) * 100) / rs.size();
                        dma = Math.rint(dma * 100) / 100;
                        ejeX.add("" + dma);
                    }
                }
                double dma = (double) ((total5y4) * 100) / total;
                dma = Math.rint(dma * 100) / 100;
                ejeX.add("" + dma);

            }
        }

        sesion.setAttribute("titulo", titulo);
        sesion.setAttribute("ejeY", ejeY);
        sesion.setAttribute("ejeX", ejeX);
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

    private FactorFacade lookupFactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FactorFacade) c.lookup("java:global/sapnaval/FactorFacade!com.sap.ejb.FactorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PreguntaFacade lookupPreguntaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PreguntaFacade) c.lookup("java:global/sapnaval/PreguntaFacade!com.sap.ejb.PreguntaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private EncuestaFacade lookupEncuestaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EncuestaFacade) c.lookup("java:global/sapnaval/EncuestaFacade!com.sap.ejb.EncuestaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
