/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.ejb.AgenciagubernamentalFacade;
import com.sap.ejb.AsignacionencuestaFacade;
import com.sap.ejb.EncabezadoFacade;
import com.sap.ejb.EncuestaFacade;
import com.sap.ejb.FuenteFacade;
import com.sap.ejb.MuestraadministrativoFacade;
import com.sap.ejb.MuestraagenciaFacade;
import com.sap.ejb.MuestradirectorFacade;
import com.sap.ejb.MuestradocenteFacade;
import com.sap.ejb.MuestraegresadoFacade;
import com.sap.ejb.MuestraempleadorFacade;
import com.sap.ejb.MuestraestudianteFacade;
import com.sap.ejb.MuestrapersonaFacade;
import com.sap.ejb.ProcesoFacade;
import com.sap.ejb.RepresentanteFacade;
import com.sap.entity.Asignacionencuesta;
import com.sap.entity.Encabezado;
import com.sap.entity.Encuesta;
import com.sap.entity.Modelo;
import com.sap.entity.Muestraadministrativo;
import com.sap.entity.Muestraagencia;
import com.sap.entity.Muestradirector;
import com.sap.entity.Muestradocente;
import com.sap.entity.Muestraegresado;
import com.sap.entity.Muestraempleador;
import com.sap.entity.Muestraestudiante;
import com.sap.entity.Muestrapersona;
import com.sap.entity.Pregunta;
import com.sap.entity.Proceso;
import com.sap.entity.Representante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
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
public class loginController extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(loginController.class);
    @EJB
    private MuestraagenciaFacade muestraagenciaFacade;
    @EJB
    private EncabezadoFacade encabezadoFacade;
    @EJB
    private MuestraempleadorFacade muestraempleadorFacade;
    @EJB
    private MuestraadministrativoFacade muestraadministrativoFacade;
    @EJB
    private MuestradirectorFacade muestradirectorFacade;
    @EJB
    private MuestradocenteFacade muestradocenteFacade;
    @EJB
    private MuestraegresadoFacade muestraegresadoFacade;
    @EJB
    private FuenteFacade fuenteFacade;
    @EJB
    private AsignacionencuestaFacade asignacionencuestaFacade;
    @EJB
    private MuestraestudianteFacade muestraestudianteFacade;
    @EJB
    private MuestrapersonaFacade muestrapersonaFacade;
    @EJB
    private RepresentanteFacade representanteFacade;
    @EJB
    private EncuestaFacade encuestaFacade;
    @EJB
    private ProcesoFacade procesoFacade;

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String action = (String) request.getParameter("action");
        List<Muestrapersona> usuario = null;
        String respuesta = "1";
        Representante r = null;
        if (action != null) {
            request.getSession().invalidate();
        } else {

            String un = (String) request.getParameter("un");
            String pw = (String) request.getParameter("pw");
            String tp = (String) request.getParameter("tp");

            response.setContentType("text/plain");

            if (tp != null && tp.equals("Estudiantes")) {
                Muestrapersona persona = null;
                Muestraestudiante estudiante = null;
                List<Muestraestudiante> aux2 = null;
                List<Encuesta> aux3 = null;
                Modelo m;
                Proceso proceso;
                usuario = muestrapersonaFacade.findByCedula(un);
                for (int i = 0; i < usuario.size(); i++) {
                    if (usuario.get(i).getMuestraestudianteList().isEmpty()) {
                        usuario.remove(i);
                        i--;
                    }
                }
                if (usuario != null && usuario.size() > 0) {
                    for (int i = 0; i < usuario.size(); i++) {
                        persona = usuario.get(i);
                        if (persona != null && persona.getPassword().equals(pw)) {
                            aux2 = muestraestudianteFacade.findByMuestraPersona(persona);
                        }
                        if (aux2 != null && aux2.size() > 0) {
                            for (int l = 0; l < aux2.size(); l++) {
                                estudiante = aux2.get(l);
                            }
                        }
                        if (estudiante != null) {
                            respuesta = "0";
                            session.setAttribute("tipoLogin", "Fuente");
                            session.setAttribute("programa", estudiante.getProgramaId());
                            session.setAttribute("persona", persona);
                            session.setAttribute("fuente", fuenteFacade.find(1));
                            proceso = persona.getMuestraId().getProcesoId();
                            if (!proceso.getFechainicio().equals("En Configuración") && proceso.getFechacierre().equals("--")) {
                                m = proceso.getModeloId();
                                aux3 = encuestaFacade.findByModelo(m);
                                session.setAttribute("proceso", proceso);

                            }
                            if (aux3 != null) {
                                for (int k = 0; k < aux3.size(); k++) {
                                    Encuesta en = aux3.get(k);
                                    List<Asignacionencuesta> aux4 = asignacionencuestaFacade.findByEncuestayFuenteyModelo(en, fuenteFacade.find(1), proceso.getModeloId());
                                    if (aux4 != null && aux4.size() > 0) {
                                        List<Encabezado> encabExistentes = encabezadoFacade.findByVars(proceso, aux4.get(0).getEncuestaId(), fuenteFacade.find(1), persona);
                                        if (encabExistentes.size() > 0 && encabExistentes.get(0).getEstado().equals("terminado")) {
                                        } else {
                                            session.setAttribute("encuesta", aux4.get(0).getEncuestaId());
                                        }
                                    }

                                }
                            }
                            break;
                        } else {
                            if (i + 1 == usuario.size()) {
                                respuesta = "1";
                            }

                        }
                    }
                }

            } else {
                if (tp != null && tp.equals("Egresados")) {
                    Muestrapersona persona = null;
                    Muestraegresado egresado = null;
                    List<Muestraegresado> auxE2 = null;
                    List<Encuesta> auxE3 = null;
                    Modelo m;
                    Proceso proceso;
                    usuario = muestrapersonaFacade.findByCedula(un);
                    for (int i = 0; i < usuario.size(); i++) {
                        if (usuario.get(i).getMuestraegresadoList().isEmpty()) {
                            usuario.remove(i);
                            i--;
                        }
                    }
                    if (usuario != null && usuario.size() > 0) {
                        for (int l = 0; l < usuario.size(); l++) {
                            persona = usuario.get(l);
                            if (persona != null && persona.getPassword().equals(pw)) {
                                auxE2 = muestraegresadoFacade.findByMuestraPersona(persona);
                            }
                            if (auxE2 != null && auxE2.size() > 0) {
                                for (int i = 0; i < auxE2.size(); i++) {
                                    egresado = auxE2.get(i);
                                }
                            }
                            if (egresado != null) {
                                respuesta = "0";
                                session.setAttribute("tipoLogin", "Fuente");
                                session.setAttribute("programa", egresado.getMuestrapersonaId().getMuestraId().getProcesoId().getProgramaId());
                                session.setAttribute("persona", persona);
                                session.setAttribute("fuente", fuenteFacade.find(4));
                                proceso = persona.getMuestraId().getProcesoId();
                                if (!proceso.getFechainicio().equals("En Configuración") && proceso.getFechacierre().equals("--")) {
                                    m = proceso.getModeloId();
                                    auxE3 = encuestaFacade.findByModelo(m);
                                    session.setAttribute("proceso", proceso);

                                }
                                if (auxE3 != null) {
                                    for (int i = 0; i < auxE3.size(); i++) {
                                        Encuesta en = auxE3.get(i);
                                        List<Asignacionencuesta> aux4 = asignacionencuestaFacade.findByEncuestayFuenteyModelo(en, fuenteFacade.find(4), proceso.getModeloId());
                                        if (aux4 != null && aux4.size() > 0) {
                                            List<Encabezado> encabExistentes = encabezadoFacade.findByVars(proceso, aux4.get(0).getEncuestaId(), fuenteFacade.find(4), persona);
                                            if (encabExistentes.size() > 0 && encabExistentes.get(0).getEstado().equals("terminado")) {
                                            } else {
                                                session.setAttribute("encuesta", aux4.get(0).getEncuestaId());
                                            }
                                        }

                                    }
                                }
                                break;
                            } else {
                                if (l + 1 == usuario.size()) {
                                    respuesta = "1";
                                }
                            }

                        }
                    }

                } else {
                    if (tp != null && tp.equals("Docentes")) {
                        Muestrapersona persona = null;
                        Muestradocente docente = null;
                        List<Muestradocente> auxD2 = null;
                        List<Encuesta> auxD3 = null;
                        Modelo m;
                        Proceso proceso;
                        usuario = muestrapersonaFacade.findByCedula(un);
                        for (int i = 0; i < usuario.size(); i++) {
                            if (usuario.get(i).getMuestradocenteList().isEmpty()) {
                                usuario.remove(i);
                                i--;
                            }
                        }
                        if (usuario != null && usuario.size() > 0) {
                            for (int l = 0; l < usuario.size(); l++) {
                                persona = usuario.get(l);
                                if (persona != null && persona.getPassword().equals(pw)) {
                                    auxD2 = muestradocenteFacade.findByMuestraPersona(persona);
                                }
                                if (auxD2 != null && auxD2.size() > 0) {
                                    for (int i = 0; i < auxD2.size(); i++) {
                                        docente = auxD2.get(i);
                                    }
                                }
                                if (docente != null) {
                                    respuesta = "0";
                                    session.setAttribute("tipoLogin", "Fuente");
                                    session.setAttribute("programa", docente.getMuestrapersonaId().getMuestraId().getProcesoId().getProgramaId());
                                    session.setAttribute("persona", persona);
                                    session.setAttribute("fuente", fuenteFacade.find(2));
                                    proceso = persona.getMuestraId().getProcesoId();
                                    if (!proceso.getFechainicio().equals("En Configuración") && proceso.getFechacierre().equals("--")) {
                                        m = proceso.getModeloId();
                                        session.setAttribute("proceso", proceso);

                                    }

                                    Asignacionencuesta aux4 = asignacionencuestaFacade.findBySingle2("fuenteId", fuenteFacade.find(2), "modeloId", proceso.getModeloId());
                                    if (aux4 != null) {
                                        List<Encabezado> encabExistentes = encabezadoFacade.findByVars(proceso, aux4.getEncuestaId(), fuenteFacade.find(2), persona);
                                        if (encabExistentes.size() > 0 && encabExistentes.get(0).getEstado().equals("terminado")) {
                                            continue;
                                        } else {
                                            session.setAttribute("encuesta", aux4.getEncuestaId());
                                            break;
                                        }
                                    }

                                } else {
                                    if (l + 1 == usuario.size()) {
                                        respuesta = "1";
                                    }
                                }

                            }
                        }

                    } else {
                        if (tp != null && tp.equals("Directivos de programa")) {
                            Muestrapersona persona = null;
                            Muestradirector director = null;
                            List<Muestradirector> auxDi2 = null;
                            List<Encuesta> auxDi3 = null;
                            Modelo m;
                            Proceso proceso;
                            usuario = muestrapersonaFacade.findByCedula(un);
                            for (int i = 0; i < usuario.size(); i++) {
                                if (usuario.get(i).getMuestradirectorList().isEmpty()) {
                                    usuario.remove(i);
                                    i--;
                                }
                            }
                            if (usuario != null && usuario.size() > 0) {
                                for (int l = 0; l < usuario.size(); l++) {
                                    persona = usuario.get(l);
                                    if (persona != null && persona.getPassword().equals(pw)) {
                                        auxDi2 = muestradirectorFacade.findByMuestraPersona(persona);
                                    }
                                    if (auxDi2 != null && auxDi2.size() > 0) {
                                        for (int i = 0; i < auxDi2.size(); i++) {
                                            director = auxDi2.get(i);
                                        }
                                    }
                                    if (director != null) {
                                        respuesta = "0";
                                        session.setAttribute("tipoLogin", "Fuente");
                                        session.setAttribute("programa", director.getMuestrapersonaId().getMuestraId().getProcesoId().getProgramaId());
                                        session.setAttribute("persona", persona);
                                        session.setAttribute("fuente", fuenteFacade.find(5));
                                        proceso = persona.getMuestraId().getProcesoId();
                                        if (!proceso.getFechainicio().equals("En Configuración") && proceso.getFechacierre().equals("--")) {
                                            m = proceso.getModeloId();
                                            session.setAttribute("proceso", proceso);

                                        }
                                        Asignacionencuesta aux4 = asignacionencuestaFacade.findBySingle2("fuenteId", fuenteFacade.find(5), "modeloId", proceso.getModeloId());
                                        if (aux4 != null) {
                                            List<Encabezado> encabExistentes = encabezadoFacade.findByVars(proceso, aux4.getEncuestaId(), fuenteFacade.find(5), persona);
                                            if (encabExistentes.size() > 0 && encabExistentes.get(0).getEstado().equals("terminado")) {
                                                continue;
                                            } else {
                                                session.setAttribute("encuesta", aux4.getEncuestaId());
                                                break;
                                            }

                                        }

                                    } else {
                                        if (l + 1 == usuario.size()) {
                                            respuesta = "1";
                                        }
                                    }

                                }
                            }

                        } else if (tp != null && tp.equals("Administrativos")) {
                            Muestrapersona persona = null;
                            Muestraadministrativo administrativo = null;
                            List<Muestraadministrativo> auxA2 = null;
                            List<Encuesta> auxA3 = null;
                            Modelo m;
                            Proceso proceso;
                            usuario = muestrapersonaFacade.findByCedula(un);
                            for (int i = 0; i < usuario.size(); i++) {
                                if (usuario.get(i).getMuestraadministrativoList().isEmpty()) {
                                    usuario.remove(i);
                                    i--;
                                }
                            }
                            if (usuario != null && usuario.size() > 0) {
                                for (int l = 0; l < usuario.size(); l++) {
                                    persona = usuario.get(l);

                                    if (persona != null && persona.getPassword().equals(pw)) {
                                        auxA2 = muestraadministrativoFacade.findByMuestraPersona(persona);
                                    }
                                    if (auxA2 != null && auxA2.size() > 0) {
                                        for (int i = 0; i < auxA2.size(); i++) {
                                            administrativo = auxA2.get(i);
                                        }
                                    }
                                    if (administrativo != null) {
                                        respuesta = "0";
                                        session.setAttribute("tipoLogin", "Fuente");
                                        session.setAttribute("programa", administrativo.getMuestrapersonaId().getMuestraId().getProcesoId().getProgramaId());
                                        session.setAttribute("persona", persona);
                                        session.setAttribute("fuente", fuenteFacade.find(3));
                                        proceso = persona.getMuestraId().getProcesoId();
                                        if (!proceso.getFechainicio().equals("En Configuración") && proceso.getFechacierre().equals("--")) {
                                            m = proceso.getModeloId();
                                            //auxA3 = encuestaFacade.findByModelo(m);
                                            session.setAttribute("proceso", proceso);

                                        }

                                        Asignacionencuesta aux4 = asignacionencuestaFacade.findBySingle2("fuenteId", fuenteFacade.find(3), "modeloId", proceso.getModeloId());
                                        if (aux4 != null) {
                                            List<Encabezado> encabExistentes = encabezadoFacade.findByVars(proceso, aux4.getEncuestaId(), fuenteFacade.find(3), persona);
                                            if (encabExistentes.size() > 0 && encabExistentes.get(0).getEstado().equals("terminado")) {
                                                continue;
                                            } else {
                                                session.setAttribute("encuesta", aux4.getEncuestaId());
                                                break;
                                            }
                                        }

                                    } else {
                                        if (l + 1 == usuario.size()) {
                                            respuesta = "1";
                                        }
                                    }
                                }
                            }

                        } else if (tp != null && tp.equals("Empleadores")) {
                            Muestrapersona persona = null;
                            Muestraempleador empleador = null;
                            List<Muestraempleador> auxEm2 = null;
                            List<Encuesta> auxEm3 = null;
                            Modelo m;
                            Proceso proceso;
                            usuario = muestrapersonaFacade.findByCedula(un);
                            for (int i = 0; i < usuario.size(); i++) {
                                if (usuario.get(i).getMuestraempleadorList().isEmpty()) {
                                    usuario.remove(i);
                                    i--;
                                }
                            }
                            if (usuario != null && usuario.size() > 0) {
                                for (int l = 0; l < usuario.size(); l++) {
                                    persona = usuario.get(l);

                                    if (persona != null && persona.getPassword().equals(pw)) {
                                        auxEm2 = muestraempleadorFacade.findByMuestraPersona(persona);
                                    }
                                    if (auxEm2 != null && auxEm2.size() > 0) {
                                        for (int i = 0; i < auxEm2.size(); i++) {
                                            empleador = auxEm2.get(i);
                                        }
                                    }
                                    if (empleador != null) {
                                        respuesta = "0";
                                        session.setAttribute("tipoLogin", "Fuente");
                                        session.setAttribute("programa", empleador.getMuestrapersonaId().getMuestraId().getProcesoId().getProgramaId());
                                        session.setAttribute("persona", persona);
                                        session.setAttribute("fuente", fuenteFacade.find(6));
                                        proceso = persona.getMuestraId().getProcesoId();
                                        if (!proceso.getFechainicio().equals("En Configuración") && proceso.getFechacierre().equals("--")) {
                                            m = proceso.getModeloId();
                                            session.setAttribute("proceso", proceso);

                                        }
                                        Asignacionencuesta aux4 = asignacionencuestaFacade.findBySingle2("fuenteId", fuenteFacade.find(6), "modeloId", proceso.getModeloId());
                                        if (aux4 != null) {
                                            List<Encabezado> encabExistentes = encabezadoFacade.findByVars(proceso, aux4.getEncuestaId(), fuenteFacade.find(6), persona);
                                            if (encabExistentes.size() > 0 && encabExistentes.get(0).getEstado().equals("terminado")) {
                                                continue;
                                            } else {
                                                session.setAttribute("encuesta", aux4.getEncuestaId());
                                                break;
                                            }
                                        }
                                    } else {
                                        if (l + 1 == usuario.size()) {
                                            respuesta = "1";
                                        }
                                    }
                                }
                            }

                        } else if (tp != null && tp.equals("Visitantes")) {
                            Muestrapersona persona = null;
                            Muestraagencia visitante = null;
                            List<Muestraagencia> auxVi2 = null;
                            List<Encuesta> auxVi3 = null;
                            Modelo m;
                            Proceso proceso;
                            usuario = muestrapersonaFacade.findByCedula(un);
                            for (int i = 0; i < usuario.size(); i++) {
                                if (usuario.get(i).getMuestraagenciaList().isEmpty()) {
                                    usuario.remove(i);
                                    i--;
                                }
                            }
                            if (usuario != null && usuario.size() > 0) {
                                for (int l = 0; l < usuario.size(); l++) {
                                    persona = usuario.get(l);

                                    if (persona != null && persona.getPassword().equals(pw)) {
                                        auxVi2 = muestraagenciaFacade.findByMuestraPersona(persona);
                                    }
                                    if (auxVi2 != null && auxVi2.size() > 0) {
                                        for (int i = 0; i < auxVi2.size(); i++) {
                                            visitante = auxVi2.get(i);
                                        }
                                    }
                                    if (visitante != null) {
                                        respuesta = "0";
                                        session.setAttribute("tipoLogin", "Fuente");
                                        session.setAttribute("programa", visitante.getMuestrapersonaId().getMuestraId().getProcesoId().getProgramaId());
                                        session.setAttribute("persona", persona);
                                        session.setAttribute("fuente", fuenteFacade.find(7));
                                        proceso = persona.getMuestraId().getProcesoId();
                                        if (!proceso.getFechainicio().equals("En Configuración") && proceso.getFechacierre().equals("--")) {
                                            m = proceso.getModeloId();
                                            auxVi3 = encuestaFacade.findByModelo(m);
                                            session.setAttribute("proceso", proceso);

                                        }
                                        if (auxVi3 != null) {
                                            for (int i = 0; i < auxVi3.size(); i++) {
                                                Encuesta en = auxVi3.get(i);
                                                List<Asignacionencuesta> aux4 = asignacionencuestaFacade.findByEncuestayFuenteyModelo(en, fuenteFacade.find(7), proceso.getModeloId());
                                                if (aux4 != null && aux4.size() > 0) {
                                                    List<Encabezado> encabExistentes = encabezadoFacade.findByVars(proceso, aux4.get(0).getEncuestaId(), fuenteFacade.find(7), persona);
                                                    if (encabExistentes.size() > 0 && encabExistentes.get(0).getEstado().equals("terminado")) {
                                                    } else {
                                                        session.setAttribute("encuesta", aux4.get(0).getEncuestaId());
                                                    }
                                                }

                                            }
                                        }
                                        break;
                                    } else {
                                        if (l + 1 == usuario.size()) {
                                            respuesta = "1";
                                        }
                                    }
                                }
                            }

                        } else {
                            if (tp != null && tp.equals("Comite central")) {

                                try {
                                    r = representanteFacade.find(Integer.parseInt(un));
                                } catch (NumberFormatException e) {
                                    LOGGER.error("codigo de representante es no numerico", e);
                                }
                                if (r != null && r.getPassword().equals(pw) && r.getRol().equals("Comite central")) {
                                    if (LOGGER.isDebugEnabled()) {
                                        LOGGER.debug("Credenciales validas");
                                    }

                                    session.setAttribute("tipoLogin", "Comite central");
                                    session.setAttribute("nombre", "" + r.getNombre() + " " + r.getApellido());
                                    respuesta = "0";
                                } else {
                                    respuesta = "1";
                                }
                            } else if (tp != null && tp.equals("Comite programa")) {
                                try {
                                    r = representanteFacade.find(Integer.parseInt(un));
                                } catch (NumberFormatException e) {
                                    LOGGER.error("Codigo invalido: ", e);
                                }
                                if (r != null && r.getPassword().equals(pw) && r.getRol().equals("Comite programa")) {
                                    if (LOGGER.isDebugEnabled()) {
                                        LOGGER.debug("Credenciales validas");
                                    }
                                    respuesta = "0";
                                    session.setAttribute("tipoLogin", "Comite programa");
                                    session.setAttribute("representante", r);
                                    //SessionCountListener.representantesLogueados.add(r);
                                    if (r.getProgramaList() != null && r.getProgramaList().size() == 1) {
                                        session.setAttribute("Programa", r.getProgramaList().get(0));
                                        List procesos = (List) procesoFacade.findByPrograma(r.getProgramaList().get(0));
                                        if (procesos.size() == 1) {
                                            if (!procesos.isEmpty()) {
                                                Iterator iter = procesos.iterator();
                                                while (iter.hasNext()) {
                                                    Proceso p = (Proceso) iter.next();
                                                    if (p.getFechainicio().equals("En Configuración")) {
                                                        session.setAttribute("EstadoProceso", 1);
                                                        session.setAttribute("Proceso", p);
                                                        session.setAttribute("Modelo", p.getModeloId());
                                                    } else if (p.getFechacierre().equals("--")) {
                                                        session.setAttribute("EstadoProceso", 2);
                                                        session.setAttribute("Proceso", p);
                                                        session.setAttribute("Modelo", p.getModeloId());

                                                        /////Comienza para saber si el modelo en cuestion tiene preguntas abiertas
                                                        boolean tienePreguntasAbiertas = false;
                                                        List<Pregunta> preguntasModelo = p.getModeloId().getPreguntaList();
                                                        for (Pregunta pregunta : preguntasModelo) {
                                                            if (pregunta.getTipo().equals("2")) {
                                                                tienePreguntasAbiertas = true;
                                                                break;
                                                            }
                                                        }
                                                        if (tienePreguntasAbiertas) {
                                                            session.setAttribute("abiertas", "true");
                                                        } else {
                                                            session.setAttribute("abiertas", "false");
                                                        }
                                                        /////////Termina 

                                                    } else {
                                                        session.setAttribute("EstadoProceso", 0);
                                                        //  session.setAttribute("Proceso", p);
                                                        //session.setAttribute("Modelo", p.getModeloId());
                                                    }
                                                }
                                            } else {
                                                session.setAttribute("EstadoProceso", 0);
                                            }
                                        } else {
                                            if (procesos.size() > 1) {
                                                session.setAttribute("Programas", r.getProgramaList());
                                                session.setAttribute("EstadoProceso2", 4);
                                            }
                                        }

                                    } else if (r.getProgramaList() != null && r.getProgramaList().size() > 1) {
                                        session.setAttribute("Programas", r.getProgramaList());
                                        session.setAttribute("EstadoProceso2", 4);
                                    }

                                } else {
                                    respuesta = "1";
                                }

                            } else {
                                respuesta = "1";
                            }
                        }
                    }
                }
            }

        }

        if (respuesta.equals("0")) {
            if (usuario != null) {
                session.setAttribute("personaLogueada", usuario.get(0).getNombre() + " " + usuario.get(0).getApellido());
            } else if (r != null) {
                session.setAttribute("personaLogueada", r.getNombre() + " " + r.getApellido());
            }
            String personaLogueada = (String) session.getAttribute("personaLogueada");
            SessionCountListener.addPersonaLogueada(personaLogueada);
            session.setAttribute("personasLogueadas", SessionCountListener.getPersonasLogueadas());
        }
        out.print(respuesta);
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
