/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.ejb.EncabezadoFacade;
import com.sap.ejb.GlosarioFacade;
import com.sap.ejb.ResultadoevaluacionFacade;
import com.sap.entity.Encabezado;
import com.sap.entity.Encuesta;
import com.sap.entity.Fuente;
import com.sap.entity.Glosario;
import com.sap.entity.Muestrapersona;
import com.sap.entity.Pregunta;
import com.sap.entity.Proceso;
import com.sap.entity.Resultadoevaluacion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author Ususario
 */
public class controladorF extends HttpServlet {

    @EJB
    private GlosarioFacade glosarioFacade;
    @EJB
    private ResultadoevaluacionFacade resultadoevaluacionFacade;
    @EJB
    private EncabezadoFacade encabezadoFacade;
    private final static String RESPONDER = "responderE";
    private final static String GUARDAR = "guardarE";
    private final static Logger LOGGER = Logger.getLogger(controladorF.class);

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String action = (String) request.getParameter("action");
        try {
        if (action.equals("indexF")) {
            String url = "/WEB-INF/vista/fuente/index.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);

        } else {
            if (action.equals("responderEncuestaF")) {
                String url = "/WEB-INF/vista/fuente/responderEncuesta.jsp";
                Proceso p = (Proceso) session.getAttribute("proceso");
                Muestrapersona persona = (Muestrapersona) session.getAttribute("persona");
                Fuente fuente = (Fuente) session.getAttribute("fuente");
                Encuesta encuesta = (Encuesta) session.getAttribute("encuesta");
                List<Encabezado> encabExistentes = encabezadoFacade.findByVars(p, encuesta, fuente, persona);
                List<Glosario> palabras = glosarioFacade.findAll();
                Encabezado enc = null;
                if (encabExistentes != null && encabExistentes.size() > 0) {
                    for (int i = 0; i < encabExistentes.size(); i++) {
                        enc = encabExistentes.get(i);
                    }
                }
                if (enc != null) {
                    session.setAttribute("respuestas", resultadoevaluacionFacade.findByEncabezado(enc));
                    session.setAttribute("encabezado", enc);
                }
                session.setAttribute("palabras", palabras);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                if (RESPONDER.equals(request.getParameter("action")) || GUARDAR.equals(request.getParameter("action"))) {

                    Proceso p = (Proceso) session.getAttribute("proceso");
                    Muestrapersona persona = (Muestrapersona) session.getAttribute("persona");
                    String observaciones = (String) request.getParameter("observaciones");
                    Fuente fuente = (Fuente) session.getAttribute("fuente");
                    Encuesta encuesta = (Encuesta) session.getAttribute("encuesta");
                    List<Pregunta> preguntas = encuesta.getPreguntaList();
                    String estado = "guardada";

                    if (RESPONDER.equals(request.getParameter("action"))) {
                        estado = "terminado";
                    }
                    List<Encabezado> encabExistentes = encabezadoFacade.findByVars(p, encuesta, fuente, persona);
                    Encabezado enc = null;
                    if (encabExistentes != null && encabExistentes.size() > 0) {
                        for (int i = 0; i < encabExistentes.size(); i++) {
                            enc = encabExistentes.get(i);
                        }
                    }

                    if (enc == null) {
                        enc = new Encabezado();
                        enc.setProcesoId(p);
                        enc.setEncuestaId(encuesta);
                        enc.setEstado(estado);
                        enc.setFuenteId(fuente);
                        enc.setMuestrapersonaId(persona);
                        enc.setComentarios(observaciones);
                        enc.setFecha(new Date(new java.util.Date().getTime()));
                        encabezadoFacade.create(enc);

                        Encabezado recienCreado = encabezadoFacade.findByUltimo();
                        try {
                            for (Pregunta pregunta : preguntas) {
                                Resultadoevaluacion re = new Resultadoevaluacion();
                                re.setEncabezadoId(recienCreado);
                                re.setPreguntaId(pregunta);
                                String respuesta1 = (String) request.getParameter("pregunta" + pregunta.getId());
                                if (pregunta.getTipo().equals("1")) {
                                    re.setRespuesta(respuesta1);
                                    re.setRespuestaAbierta(null);
                                } else {
                                    if (pregunta.getTipo().equals("2")) {
                                        re.setRespuesta(null);
                                        re.setRespuestaAbierta(respuesta1);
                                    }
                                }
                                resultadoevaluacionFacade.create(re);
                            }
                        } catch (Exception e) {
                            LOGGER.error("Ha ocurrido un error guardando las repuestas: ", e);
                        }

                        recienCreado.setResultadoevaluacionList(resultadoevaluacionFacade.findByEncabezado(recienCreado));
                        encabezadoFacade.edit(recienCreado);
                        if (RESPONDER.equals(request.getParameter("action"))) {
                            session.setAttribute("encuesta", null);
                        }

                    } else {
                        enc.setEstado(estado);
                        enc.setComentarios(observaciones);
                        enc.setFecha(new Date(new java.util.Date().getTime()));
                        encabezadoFacade.edit(enc);

                        List<Resultadoevaluacion> listaRe = enc.getResultadoevaluacionList();
                        try {
                            for (int i = 0; i < preguntas.size(); i++) {
                                String respuesta = (String) request.getParameter("pregunta" + preguntas.get(i).getId());
                                if (preguntas.get(i).getTipo().equals("1")) {
                                    listaRe.get(i).setRespuesta(respuesta);
                                } else {
                                    if (preguntas.get(i).getTipo().equals("2")) {
                                        listaRe.get(i).setRespuestaAbierta(respuesta);
                                    }
                                }
                                listaRe.get(i).setPreguntaId(preguntas.get(i));

                                resultadoevaluacionFacade.edit(listaRe.get(i));
                            }
                        }catch(Exception e){
                            LOGGER.error("Ha ocurrido un error guardando las repuestas2",e);
                        }

                        if (request.getParameter("action").equals("responderE")) {
                            session.setAttribute("encuesta", null);
                        }
                    }
                } else {
                    if (action.equals("inicioCC")) {
                        String url = "/WEB-INF/vista/fuente/inicio.jsp";
                        RequestDispatcher rd = request.getRequestDispatcher(url);
                        rd.forward(request, response);

                    } else {
                        if (action.equals("contrasena")) {
                            String url = "/WEB-INF/vista/comitePrograma/contrasena.jsp";
                            RequestDispatcher rd = request.getRequestDispatcher(url);
                            rd.forward(request, response);
                        } else {
                            if (action.equals("cambiarClave")) {
                                  
                        }
                    }
                }
            }
        }
    }
        } catch (ServletException e) {
            LOGGER.error("Ha ocurrido un error de tipo ServletException: ",e);
        } catch (IOException e) {
            LOGGER.error("Ha ocurrido un error de tipo IOException: ",e);
        }catch (Exception e){
            LOGGER.error("Ha ocurrido un error: ",e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
