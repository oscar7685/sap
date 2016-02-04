/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.ejb.EncabezadoFacade;
import com.sap.ejb.EncuestaFacade;
import com.sap.ejb.GlosarioFacade;
import com.sap.ejb.ProgramaFacade;
import com.sap.ejb.ResultadoevaluacionFacade;
import com.sap.entity.Encabezado;
import com.sap.entity.Encuesta;
import com.sap.entity.Fuente;
import com.sap.entity.Glosario;
import com.sap.entity.Muestrapersona;
import com.sap.entity.Pregunta;
import com.sap.entity.Proceso;
import com.sap.entity.Programa;
import com.sap.entity.Resultadoevaluacion;
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
    private final static Logger LOGGER = Logger.getLogger(controladorF.class);

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

                    List<String> encuestaCombinar = new ArrayList<String>();
                    List<String> programasSeleccionados = new ArrayList<String>();

                    String programasEstudiantes[] = request.getParameterValues("ms1");
                    String docentesPlanta[] = request.getParameterValues("ms2");
                    String docentesCatedra[] = request.getParameterValues("ms3");
                    String egresados[] = request.getParameterValues("ms4");
                    String directivo[] = request.getParameterValues("ms5");
                    String administrativo[] = request.getParameterValues("ms6");
                    String empleador = request.getParameter("empleador");






                    if (empleador != null && empleador.equals("on")) {
                        encuestaCombinar.add("11");
                    }

                    if (programasEstudiantes != null && programasEstudiantes.length > 0) {
                        for (int i = 0; i < programasEstudiantes.length; i++) {
                            String programa = programasEstudiantes[i];
                            if (!programasSeleccionados.contains(programa)) {
                                programasSeleccionados.add(programa);
                            }
                            Programa paux = programaFacade.find(Integer.parseInt(programa));
                            if (paux.getTipoformacion().equals("Universitaria")) {
                                if (!encuestaCombinar.contains("1")) {
                                    encuestaCombinar.add("1");
                                }
                                if (!encuestaCombinar.contains("12")) {
                                    encuestaCombinar.add("12");
                                }
                            } else if (paux.getTipoformacion().equals("Especializacion")) {
                                if (!encuestaCombinar.contains("3")) {
                                    encuestaCombinar.add("3");
                                }
                                if (!encuestaCombinar.contains("24")) {
                                    encuestaCombinar.add("24");
                                }
                            } else if (paux.getTipoformacion().equals("Maestria")) {
                                if (!encuestaCombinar.contains("2")) {
                                    encuestaCombinar.add("2");
                                }
                                if (!encuestaCombinar.contains("18")) {
                                    encuestaCombinar.add("18");
                                }
                            }

                        }
                    }

                    if (docentesPlanta != null && docentesPlanta.length > 0) {
                        for (int i = 0; i < docentesPlanta.length; i++) {
                            String programa = docentesPlanta[i];
                            if (!programasSeleccionados.contains(programa)) {
                                programasSeleccionados.add(programa);
                            }
                            Programa paux = programaFacade.find(Integer.parseInt(programa));
                            if (!encuestaCombinar.contains("4")) {
                                encuestaCombinar.add("4");
                            }
                            if (paux.getTipoformacion().equals("Universitaria")) {
                                if (!encuestaCombinar.contains("13")) {
                                    encuestaCombinar.add("13");
                                }

                            } else if (paux.getTipoformacion().equals("Especializacion")) {
                                if (!encuestaCombinar.contains("26")) {
                                    encuestaCombinar.add("26");
                                }

                            } else if (paux.getTipoformacion().equals("Maestria")) {
                                if (!encuestaCombinar.contains("19")) {
                                    encuestaCombinar.add("19");
                                }
                            }
                        }
                    }

                    if (docentesCatedra != null && docentesCatedra.length > 0) {
                        for (int i = 0; i < docentesCatedra.length; i++) {
                            String programa = docentesCatedra[i];
                            if (!programasSeleccionados.contains(programa)) {
                                programasSeleccionados.add(programa);
                            }
                            Programa paux = programaFacade.find(Integer.parseInt(programa));
                            if (!encuestaCombinar.contains("5")) {
                                encuestaCombinar.add("5");
                            }
                            if (paux.getTipoformacion().equals("Universitaria")) {
                                if (!encuestaCombinar.contains("14")) {
                                    encuestaCombinar.add("14");
                                }

                            } else if (paux.getTipoformacion().equals("Especializacion")) {
                                if (!encuestaCombinar.contains("27")) {
                                    encuestaCombinar.add("27");
                                }

                            } else if (paux.getTipoformacion().equals("Maestria")) {
                                if (!encuestaCombinar.contains("20")) {
                                    encuestaCombinar.add("20");
                                }
                            }
                        }
                    }
                    if (egresados != null && egresados.length > 0) {
                        for (int i = 0; i < egresados.length; i++) {
                            String programa = egresados[i];
                            if (!programasSeleccionados.contains(programa)) {
                                programasSeleccionados.add(programa);
                            }
                            Programa paux = programaFacade.find(Integer.parseInt(programa));
                            if (paux.getTipoformacion().equals("Universitaria")) {
                                if (!encuestaCombinar.contains("8")) {
                                    encuestaCombinar.add("8");
                                }
                                if (!encuestaCombinar.contains("17")) {
                                    encuestaCombinar.add("17");
                                }
                            } else if (paux.getTipoformacion().equals("Especializacion")) {
                                if (!encuestaCombinar.contains("10")) {
                                    encuestaCombinar.add("10");
                                }
                                if (!encuestaCombinar.contains("30")) {
                                    encuestaCombinar.add("30");
                                }
                            } else if (paux.getTipoformacion().equals("Maestria")) {
                                if (!encuestaCombinar.contains("9")) {
                                    encuestaCombinar.add("9");
                                }
                                if (!encuestaCombinar.contains("23")) {
                                    encuestaCombinar.add("23");
                                }
                            }

                        }
                    }

                    if (directivo != null && directivo.length > 0) {
                        for (int i = 0; i < directivo.length; i++) {
                            String programa = directivo[i];
                            Programa paux = programaFacade.find(Integer.parseInt(programa));
                            if (!encuestaCombinar.contains("6")) {
                                encuestaCombinar.add("6");
                            }
                            if (paux.getTipoformacion().equals("Universitaria")) {
                                if (!programasSeleccionados.contains(programa)) {
                                    programasSeleccionados.add(programa);
                                }
                                if (!encuestaCombinar.contains("15")) {
                                    encuestaCombinar.add("15");
                                }

                            } else if (paux.getTipoformacion().equals("Especializacion")) {
                                if (!programasSeleccionados.contains(programa)) {
                                    programasSeleccionados.add(programa);
                                }
                                if (!encuestaCombinar.contains("28")) {
                                    encuestaCombinar.add("28");
                                }

                            } else if (paux.getTipoformacion().equals("Maestria")) {
                                if (!programasSeleccionados.contains(programa)) {
                                    programasSeleccionados.add(programa);
                                }
                                if (!encuestaCombinar.contains("21")) {
                                    encuestaCombinar.add("21");
                                }
                            }
                        }
                    }

                    if (administrativo != null && administrativo.length > 0) {
                        for (int i = 0; i < administrativo.length; i++) {
                            String programa = administrativo[i];
                            Programa paux = programaFacade.find(Integer.parseInt(programa));
                            if (!encuestaCombinar.contains("7")) {
                                encuestaCombinar.add("7");
                            }
                            if (paux.getTipoformacion().equals("Universitaria")) {
                                if (!programasSeleccionados.contains(programa)) {
                                    programasSeleccionados.add(programa);
                                }
                                if (!encuestaCombinar.contains("16")) {
                                    encuestaCombinar.add("16");
                                }

                            } else if (paux.getTipoformacion().equals("Especializacion")) {
                                if (!programasSeleccionados.contains(programa)) {
                                    programasSeleccionados.add(programa);
                                }
                                if (!encuestaCombinar.contains("29")) {
                                    encuestaCombinar.add("29");
                                }

                            } else if (paux.getTipoformacion().equals("Maestria")) {
                                if (!programasSeleccionados.contains(programa)) {
                                    programasSeleccionados.add(programa);
                                }
                                if (!encuestaCombinar.contains("22")) {
                                    encuestaCombinar.add("22");
                                }
                            }
                        }
                    }
                    List<Pregunta> preguntas = new ArrayList<Pregunta>();
                    for (int i = 0; i < encuestaCombinar.size(); i++) {
                        Encuesta aux = encuestaFacade.find(Integer.parseInt(encuestaCombinar.get(i)));
                        List<Pregunta> auxP = aux.getPreguntaList();
                        for (Pregunta x : auxP) {
                            if (!preguntas.contains(x)) {
                                preguntas.add(x);
                            }
                        }
                    }
                    Collections.sort(preguntas);
                    List<Programa> programasS = new ArrayList<Programa>();
                    for (int i = 0; i < programasSeleccionados.size(); i++) {
                        Programa paux = programaFacade.find(Integer.parseInt(programasSeleccionados.get(i)));
                        programasS.add(paux);
                    }

                    String url = "/WEB-INF/vista/fuente/responderEncuesta.jsp";
                    System.out.println("programasS: "+programasS);
                    session.setAttribute("preguntas", preguntas);
                    session.setAttribute("programas", programasS);
                    Proceso p = (Proceso) session.getAttribute("proceso");
                    Muestrapersona persona = (Muestrapersona) session.getAttribute("persona");
                    Fuente fuente = (Fuente) session.getAttribute("fuente");


                    Encuesta encuesta = (Encuesta) session.getAttribute("encuesta");
                    List<Encabezado> encabExistentes = encabezadoFacade.findByVars(p, encuesta, fuente, persona);
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                } else {
                    if (RESPONDER.equals(request.getParameter("action"))) {

                        Proceso p = (Proceso) session.getAttribute("proceso");
                        Muestrapersona persona = (Muestrapersona) session.getAttribute("persona");
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

                        }
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
