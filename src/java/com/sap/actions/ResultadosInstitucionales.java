/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.CaracteristicaFacade;
import com.sap.ejb.EncuestaFacade;
import com.sap.ejb.ModeloFacade;
import com.sap.ejb.RespuestasFacade;
import com.sap.ejb.RolFacade;
import com.sap.entity.Caracteristica;
import com.sap.entity.Encuesta;
import com.sap.entity.Modelo;
import com.sap.entity.Pregunta;
import com.sap.entity.Proceso;
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
public class ResultadosInstitucionales implements Action {

    EncuestaFacade encuestaFacade = lookupEncuestaFacadeBean();
    RolFacade rolFacade = lookupRolFacadeBean();
    RespuestasFacade respuestasFacade = lookupRespuestasFacadeBean();
    ModeloFacade modeloFacade = lookupModeloFacadeBean();
    CaracteristicaFacade caracteristicaFacade = lookupCaracteristicaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        String url = "/WEB-INF/vista/comitePrograma/proceso/informe/dmaInstitucional.jsp";
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        Modelo m = modeloFacade.find(Integer.parseInt("1"));
        List<Caracteristica> caractesticas = caracteristicaFacade.findByModeloOptimizada(m);

        String[][] resultados = new String[258][12];
        String[][] cerillos = new String[258][12];
        List<Rol> roles = rolFacade.findAll();
        
        for (int i = 0; i < 258; i++) {
            for (int j = 0; j < 12; j++) {
               resultados[i][j] = "-1";
            }
            
        }
        
        
        for (Caracteristica caracteristica : caractesticas) {
            if (caracteristica.getPreguntaList().size() > 0) {
                List<Pregunta> preguntas = caracteristica.getPreguntaList();
                for (Pregunta pregunta : preguntas) {
                    if (pregunta.getPreguntaList().size() > 0) {

                        List<Encuesta> encuestasDondeAplica = encuestaFacade.findByPreguntaYModelo(m, pregunta);

                        for (Encuesta encuesta : encuestasDondeAplica) {
                            Rol rol = null;
                            if (encuesta.getId() == 1) {
                                rol = rolFacade.find(1);
                            } else if (encuesta.getId() == 2) {
                                rol = rolFacade.find(8);
                            } else if (encuesta.getId() == 3) {
                                rol = rolFacade.find(7);
                            } else if (encuesta.getId() == 4) {
                                rol = rolFacade.find(2);
                            } else if (encuesta.getId() == 5) {
                                rol = rolFacade.find(11);
                            } else if (encuesta.getId() == 6) {
                                rol = rolFacade.find(5);
                            } else if (encuesta.getId() == 7) {
                                rol = rolFacade.find(3);
                            } else if (encuesta.getId() == 8) {
                                rol = rolFacade.find(4);
                            } else if (encuesta.getId() == 9) {
                                rol = rolFacade.find(9);
                            } else if (encuesta.getId() == 10) {
                                rol = rolFacade.find(10);
                            } else if (encuesta.getId() == 11) {
                                rol = rolFacade.find(6);
                            }
                            for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {

                                List<Respuestas> rs = respuestasFacade.findByPreguntaRol(pregunta.getPreguntaList().get(i), rol);
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
                                   // resultados[pregunta.getPreguntaList().get(i).getId()][rol.getId()] = "-1";
                                } else {
                                    double dma = (double) ((cincos + cuatros) * 100) / rs.size();
                                    double cerosPorcentaje = (double) ((ceros) * 100) / rs.size();
                                    resultados[pregunta.getPreguntaList().get(i).getId()][rol.getId()] = "" + dma + "";
                                    cerillos[pregunta.getPreguntaList().get(i).getId()][rol.getId()] = "" + cerosPorcentaje;
                                }
                                //resultados[pregunta.getPreguntaList().get(i).getId()][1] = "" + rs.size() + "," + cincos + "," + cuatros + "," + tres + "," + dos + "," + unos + "," + ceros;
                                //System.out.println(rs.size() + "," + cincos + "," + cuatros + "," + tres + "," + dos + "," + unos + "," + ceros);

                            }
                        }

                    } else {
                        List<Encuesta> encuestasDondeAplica = encuestaFacade.findByPreguntaYModelo(m, pregunta);
                        for (Encuesta encuesta : encuestasDondeAplica) {
                            Rol rol = null;
                            if (encuesta.getId() == 1) {
                                rol = rolFacade.find(1);
                            } else if (encuesta.getId() == 2) {
                                rol = rolFacade.find(4);
                            } else if (encuesta.getId() == 3) {
                                rol = rolFacade.find(7);
                            } else if (encuesta.getId() == 4) {
                                rol = rolFacade.find(8);
                            } else if (encuesta.getId() == 5) {
                                rol = rolFacade.find(6);
                            } else if (encuesta.getId() == 6) {
                                rol = rolFacade.find(11);
                            } else if (encuesta.getId() == 7) {
                                rol = rolFacade.find(3);
                            } else if (encuesta.getId() == 8) {
                                rol = rolFacade.find(2);
                            } else if (encuesta.getId() == 9) {
                                rol = rolFacade.find(9);
                            } else if (encuesta.getId() == 10) {
                                rol = rolFacade.find(10);
                            } else if (encuesta.getId() == 11) {
                                rol = rolFacade.find(5);
                            }

                            List<Respuestas> rs = respuestasFacade.findByPreguntaRol(pregunta, rol);
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
                               // resultados[pregunta.getId()][rol.getId()] = "-1";
                            } else {
                                double dma = (double) ((cincos + cuatros) * 100) / rs.size();
                                double cerosPorcentaje = (double) ((ceros) * 100) / rs.size();
                                resultados[pregunta.getId()][rol.getId()] = "" + dma + "";
                                cerillos[pregunta.getId()][rol.getId()] = "" + cerosPorcentaje;
                            }
                            //resultados[pregunta.getPreguntaList().get(i).getId()][1] = "" + rs.size() + "," + cincos + "," + cuatros + "," + tres + "," + dos + "," + unos + "," + ceros;
                            //System.out.println(rs.size() + "," + cincos + "," + cuatros + "," + tres + "," + dos + "," + unos + "," + ceros);
                        }
                    }
                }
            }
        }
        sesion.setAttribute("resultados", resultados);
        sesion.setAttribute("cerillos", cerillos);
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
