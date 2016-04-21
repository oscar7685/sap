/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.ejb.EncabezadoFacade;
import com.sap.ejb.EncuestaFacade;
import com.sap.ejb.GlosarioFacade;
import com.sap.ejb.ParticipanteFacade;
import com.sap.ejb.ParticipanteHasRolFacade;
import com.sap.ejb.ProgramaFacade;
import com.sap.ejb.RespuestasFacade;
import com.sap.ejb.ResultadoevaluacionFacade;
import com.sap.ejb.RolFacade;
import com.sap.entity.Encabezado;
import com.sap.entity.Encuesta;
import com.sap.entity.Fuente;
import com.sap.entity.Glosario;
import com.sap.entity.Muestrapersona;
import com.sap.entity.Participante;
import com.sap.entity.ParticipanteHasRol;
import com.sap.entity.Pregunta;
import com.sap.entity.Proceso;
import com.sap.entity.Programa;
import com.sap.entity.Respuestas;
import com.sap.entity.Resultadoevaluacion;
import com.sap.entity.Rol;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
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
    private RespuestasFacade respuestasFacade;
    @EJB
    private RolFacade rolFacade;
    @EJB
    private ParticipanteHasRolFacade participanteHasRolFacade;
    @EJB
    private ParticipanteFacade participanteFacade;
    @EJB
    private EncuestaFacade encuestaFacade;
    @EJB
    private ProgramaFacade programaFacade;
    @EJB
    private GlosarioFacade glosarioFacade;
    @EJB
    private ResultadoevaluacionFacade resultadoevaluacionFacade;
    @EJB
    private EncabezadoFacade encabezadoFacade;
    private final static String RESPONDER = "responderE";
    private final static String GUARDAR = "guardarE";
    private final Logger LOGGER = Logger.getLogger(controladorF.class);

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
                    String idEncuesta = request.getParameter("id");
                    Encuesta e = encuestaFacade.find(Integer.parseInt(idEncuesta));

                    List<Pregunta> preguntas = e.getPreguntaList();

                    session.setAttribute("preguntas", preguntas);
                    String url = "/WEB-INF/vista/fuente/responderEncuesta.jsp";
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                } else {
                    if (RESPONDER.equals(request.getParameter("action"))) {

                        Participante part78 = (Participante) session.getAttribute("participante");
                        part78.setFechafinal(new Date());
                        participanteFacade.edit(part78);
                        List<Pregunta> allPreguntas = (List<Pregunta>) session.getAttribute("preguntas");
                        List<Programa> programasP2 = (List<Programa>) session.getAttribute("pregunta2");
                        List<Programa> programasP11 = (List<Programa>) session.getAttribute("pregunta11");
                        List<Programa> programasP16 = (List<Programa>) session.getAttribute("pregunta16");
                        List<Programa> programasP19 = (List<Programa>) session.getAttribute("pregunta19");
                        List<Programa> programasP20 = (List<Programa>) session.getAttribute("pregunta20");
                        List<Programa> programasP21 = (List<Programa>) session.getAttribute("pregunta21");
                        List<Programa> programasP22 = (List<Programa>) session.getAttribute("pregunta22");
                        List<Programa> programasP23 = (List<Programa>) session.getAttribute("pregunta23");
                        List<Programa> programasP24 = (List<Programa>) session.getAttribute("pregunta24");
                        List<Programa> programasP25 = (List<Programa>) session.getAttribute("pregunta25");
                        List<Programa> programasP30 = (List<Programa>) session.getAttribute("pregunta30");
                        List<Programa> programasP32 = (List<Programa>) session.getAttribute("pregunta32");
                        List<Programa> programasP50 = (List<Programa>) session.getAttribute("pregunta50");

                        for (Pregunta pregunta : allPreguntas) {


                            if (!("si").equals(pregunta.getRepetir())) {
                                if (pregunta.getPreguntaList().isEmpty()) {
                                    Respuestas raux = new Respuestas();
                                    raux.setParticipanteIdparticipante(part78);
                                    raux.setPreguntaId(pregunta);
                                    String respuesta = (String) request.getParameter("pregunta" + pregunta.getId());
                                    raux.setRespuesta(Integer.parseInt(respuesta));
                                    respuestasFacade.create(raux);
                                } else {
                                    for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                        Respuestas raux = new Respuestas();
                                        raux.setParticipanteIdparticipante(part78);
                                        raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                        String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                                        raux.setRespuesta(Integer.parseInt(respuesta));
                                        respuestasFacade.create(raux);

                                    }
                                }
                            } else {
                                //21, 24, 25
                                if (pregunta.getCodigo().equals("21")) {
                                    if (programasP21.size() > 0) {
                                        for (Programa programa : programasP21) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta);
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getId() + "programa" + programa.getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            raux.setProgramaId(programa);
                                            respuestasFacade.create(raux);
                                        }
                                    } else {
                                        Respuestas raux = new Respuestas();
                                        raux.setParticipanteIdparticipante(part78);
                                        raux.setPreguntaId(pregunta);
                                        String respuesta = (String) request.getParameter("pregunta" + pregunta.getId());
                                        raux.setRespuesta(Integer.parseInt(respuesta));
                                        respuestasFacade.create(raux);
                                    }
                                }
                                if (pregunta.getCodigo().equals("24")) {
                                    if (programasP24.size() > 0) {
                                        for (Programa programa : programasP24) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta);
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getId() + "programa" + programa.getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            raux.setProgramaId(programa);
                                            respuestasFacade.create(raux);
                                        }
                                    } else {
                                        Respuestas raux = new Respuestas();
                                        raux.setParticipanteIdparticipante(part78);
                                        raux.setPreguntaId(pregunta);
                                        String respuesta = (String) request.getParameter("pregunta" + pregunta.getId());
                                        raux.setRespuesta(Integer.parseInt(respuesta));
                                        respuestasFacade.create(raux);
                                    }
                                }
                                if (pregunta.getCodigo().equals("25")) {
                                    if (programasP25.size() > 0) {
                                        for (Programa programa : programasP25) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta);
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getId() + "programa" + programa.getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            raux.setProgramaId(programa);
                                            respuestasFacade.create(raux);
                                        }
                                    } else {
                                        Respuestas raux = new Respuestas();
                                        raux.setParticipanteIdparticipante(part78);
                                        raux.setPreguntaId(pregunta);
                                        String respuesta = (String) request.getParameter("pregunta" + pregunta.getId());
                                        raux.setRespuesta(Integer.parseInt(respuesta));
                                        respuestasFacade.create(raux);
                                    }
                                }

                                if (pregunta.getCodigo().equals("2")) {
                                    if (programasP2.size() > 0) {
                                        for (Programa programa : programasP2) {
                                            for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                                Respuestas raux = new Respuestas();
                                                raux.setParticipanteIdparticipante(part78);
                                                raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                                String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId() + "programa" + programa.getId());
                                                raux.setRespuesta(Integer.parseInt(respuesta));
                                                raux.setProgramaId(programa);
                                                respuestasFacade.create(raux);
                                            }

                                        }
                                    } else {
                                        for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            respuestasFacade.create(raux);
                                        }
                                    }
                                }
                                if (pregunta.getCodigo().equals("11")) {
                                    if (programasP11.size() > 0) {
                                        for (Programa programa : programasP11) {
                                            for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                                Respuestas raux = new Respuestas();
                                                raux.setParticipanteIdparticipante(part78);
                                                raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                                String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId() + "programa" + programa.getId());
                                                raux.setRespuesta(Integer.parseInt(respuesta));
                                                raux.setProgramaId(programa);
                                                respuestasFacade.create(raux);
                                            }

                                        }
                                    } else {
                                        for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            respuestasFacade.create(raux);
                                        }
                                    }
                                }
                                if (pregunta.getCodigo().equals("16")) {
                                    if (programasP16.size() > 0) {
                                        for (Programa programa : programasP16) {
                                            for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                                Respuestas raux = new Respuestas();
                                                raux.setParticipanteIdparticipante(part78);
                                                raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                                String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId() + "programa" + programa.getId());
                                                raux.setRespuesta(Integer.parseInt(respuesta));
                                                raux.setProgramaId(programa);
                                                respuestasFacade.create(raux);
                                            }

                                        }
                                    } else {
                                        for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            respuestasFacade.create(raux);
                                        }
                                    }
                                }
                                if (pregunta.getCodigo().equals("19")) {
                                    if (programasP19.size() > 0) {
                                        for (Programa programa : programasP19) {
                                            for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                                Respuestas raux = new Respuestas();
                                                raux.setParticipanteIdparticipante(part78);
                                                raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                                String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId() + "programa" + programa.getId());
                                                raux.setRespuesta(Integer.parseInt(respuesta));
                                                raux.setProgramaId(programa);
                                                respuestasFacade.create(raux);
                                            }

                                        }
                                    } else {
                                        for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            respuestasFacade.create(raux);
                                        }
                                    }
                                }
                                if (pregunta.getCodigo().equals("20")) {
                                    if (programasP20.size() > 0) {
                                        for (Programa programa : programasP20) {
                                            for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                                Respuestas raux = new Respuestas();
                                                raux.setParticipanteIdparticipante(part78);
                                                raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                                String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId() + "programa" + programa.getId());
                                                raux.setRespuesta(Integer.parseInt(respuesta));
                                                raux.setProgramaId(programa);
                                                respuestasFacade.create(raux);
                                            }

                                        }
                                    } else {
                                        for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            respuestasFacade.create(raux);
                                        }
                                    }
                                }
                                if (pregunta.getCodigo().equals("22")) {
                                    if (programasP22.size() > 0) {
                                        for (Programa programa : programasP22) {
                                            for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                                Respuestas raux = new Respuestas();
                                                raux.setParticipanteIdparticipante(part78);
                                                raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                                String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId() + "programa" + programa.getId());
                                                raux.setRespuesta(Integer.parseInt(respuesta));
                                                raux.setProgramaId(programa);
                                                respuestasFacade.create(raux);
                                            }

                                        }
                                    } else {
                                        for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            respuestasFacade.create(raux);
                                        }
                                    }
                                }
                                if (pregunta.getCodigo().equals("23")) {
                                    if (programasP23.size() > 0) {
                                        for (Programa programa : programasP23) {
                                            for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                                Respuestas raux = new Respuestas();
                                                raux.setParticipanteIdparticipante(part78);
                                                raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                                String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId() + "programa" + programa.getId());
                                                raux.setRespuesta(Integer.parseInt(respuesta));
                                                raux.setProgramaId(programa);
                                                respuestasFacade.create(raux);
                                            }

                                        }
                                    } else {
                                        for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            respuestasFacade.create(raux);
                                        }
                                    }
                                }
                                if (pregunta.getCodigo().equals("30")) {
                                    if (programasP30.size() > 0) {
                                        for (Programa programa : programasP30) {
                                            for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                                Respuestas raux = new Respuestas();
                                                raux.setParticipanteIdparticipante(part78);
                                                raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                                String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId() + "programa" + programa.getId());
                                                raux.setRespuesta(Integer.parseInt(respuesta));
                                                raux.setProgramaId(programa);
                                                respuestasFacade.create(raux);
                                            }

                                        }
                                    } else {
                                        for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            respuestasFacade.create(raux);
                                        }
                                    }
                                }
                                if (pregunta.getCodigo().equals("32")) {
                                    if (programasP32.size() > 0) {
                                        for (Programa programa : programasP32) {
                                            for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                                Respuestas raux = new Respuestas();
                                                raux.setParticipanteIdparticipante(part78);
                                                raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                                String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId() + "programa" + programa.getId());
                                                raux.setRespuesta(Integer.parseInt(respuesta));
                                                raux.setProgramaId(programa);
                                                respuestasFacade.create(raux);
                                            }

                                        }
                                    } else {
                                        for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            respuestasFacade.create(raux);
                                        }
                                    }
                                }
                                if (pregunta.getCodigo().equals("50")) {
                                    if (programasP50.size() > 0) {
                                        for (Programa programa : programasP50) {
                                            for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                                Respuestas raux = new Respuestas();
                                                raux.setParticipanteIdparticipante(part78);
                                                raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                                String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId() + "programa" + programa.getId());
                                                raux.setRespuesta(Integer.parseInt(respuesta));
                                                raux.setProgramaId(programa);
                                                respuestasFacade.create(raux);
                                            }

                                        }
                                    } else {
                                        for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                                            Respuestas raux = new Respuestas();
                                            raux.setParticipanteIdparticipante(part78);
                                            raux.setPreguntaId(pregunta.getPreguntaList().get(i));
                                            String respuesta = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                                            raux.setRespuesta(Integer.parseInt(respuesta));
                                            respuestasFacade.create(raux);
                                        }
                                    }
                                }

                            }
                        }


                        /*  Muestrapersona persona = (Muestrapersona) session.getAttribute("persona");
                         Fuente fuente = (Fuente) session.getAttribute("fuente");
                         Encuesta encuesta = (Encuesta) session.getAttribute("encuesta");
                         List<Pregunta> preguntas = encuesta.getPreguntaList();
                         String estado = "terminado";

                         if (RESPONDER.equals(request.getParameter("action"))) {
                         estado = "terminado";
                         }
                         List<Encabezado> encabExistentes = encabezadoFacade.findByVars(p, encuesta, fuente, persona);
                         Encabezado enc = null;


                         if (enc == null) {
                         enc = new Encabezado();
                         enc.setProcesoId(p);
                         enc.setEncuestaId(encuesta);
                         enc.setEstado(estado);
                         enc.setFuenteId(fuente);
                         enc.setMuestrapersonaId(persona);
                         enc.setFecha(new Date(new java.util.Date().getTime()));
                         encabezadoFacade.create(enc);

                         Encabezado recienCreado = encabezadoFacade.findByUltimo();
                         try {
                         for (Pregunta pregunta : preguntas) {

                         if (pregunta.getPreguntaList() != null && pregunta.getPreguntaList().size() > 0) {

                         for (int i = 0; i < pregunta.getPreguntaList().size(); i++) {
                         Resultadoevaluacion re = new Resultadoevaluacion();
                         re.setEncabezadoId(recienCreado);
                         re.setPreguntaId(pregunta.getPreguntaList().get(i));
                         String respuesta1 = (String) request.getParameter("pregunta" + pregunta.getPreguntaList().get(i).getId());
                         re.setRespuesta(respuesta1);
                         re.setRespuestaAbierta(null);
                         resultadoevaluacionFacade.create(re);

                         }
                         } else {
                         Resultadoevaluacion re = new Resultadoevaluacion();
                         re.setEncabezadoId(recienCreado);
                         re.setPreguntaId(pregunta);
                         String respuesta1 = (String) request.getParameter("pregunta" + pregunta.getId());
                         re.setRespuesta(respuesta1);
                         re.setRespuestaAbierta(null);
                         resultadoevaluacionFacade.create(re);
                         }
                         }
                         } catch (Exception e) {
                         LOGGER.error("Ha ocurrido un error guardando las repuestas: ", e);
                         }

                         recienCreado.setResultadoevaluacionList(resultadoevaluacionFacade.findByEncabezado(recienCreado));
                         encabezadoFacade.edit(recienCreado);
                         if (RESPONDER.equals(request.getParameter("action"))) {
                         session.setAttribute("encuesta", null);
                         }

                         }*/
                    } else {
                        if (action.equals("inicioCC")) {
                            String url = "/WEB-INF/vista/fuente/inicio.jsp";
                            RequestDispatcher rd = request.getRequestDispatcher(url);
                            rd.forward(request, response);

                        } else if (action.equals("perfilCC")) {
                            session.setAttribute("programas", programaFacade.findAll());
                            String url = "/WEB-INF/vista/fuente/perfil.jsp";
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
            LOGGER.error("Ha ocurrido un error de tipo ServletException: ", e);
        } catch (IOException e) {
            LOGGER.error("Ha ocurrido un error de tipo IOException: ", e);
        } catch (Exception e) {
            LOGGER.error("Ha ocurrido un error: ", e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
