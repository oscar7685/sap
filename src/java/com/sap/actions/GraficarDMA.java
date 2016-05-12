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
        Modelo m = proceso.getModeloId();

        String factor = request.getParameter("factor");
        String caracteristica = request.getParameter("caracteristica");
        String pregunta = request.getParameter("pregunta");
        String grupo = request.getParameter("grupo");

        String aux = "";
        String titulo = "";
        List<String> ejeY = new ArrayList<String>();
        List<String> ejeX = new ArrayList<String>();
        int[] relacionEncuestaRol = {0, 1, 8, 7, 2, 11, 5, 3, 4, 9, 10, 6};
        double dmaX = 0.0;
        int total = 0;
        double total5y4 = 0.0;
        double dmaTotal = 0.0;
        double total5y4Caracteristicas = 0.0;
        double dmaTotalCaracteristicas = 0.0;
        double total5y4Factores = 0.0;
        double dmaTotalFactores = 0.0;



        //-1 vacio , -2 todos


        if ("-2".equals(factor)) {//valores vs factores
            titulo = "FACTORES";
            List<Factor> fs = factorFacade.findByModeloOptimizada(m);
            for (Factor factor1 : fs) {
                ejeY.add(" " + factor1.getCodigo() + " " + factor1.getNombre());
                List<Caracteristica> cs = caracteristicaFacade.findByFactor(factor1);
                for (Caracteristica caracteristica1 : cs) {
                    List<Pregunta> ps = caracteristica1.getPreguntaList();
                    for (Pregunta pregunta1 : ps) {
                        if (pregunta1.getPreguntaList().size() > 0) {
                            for (int i = 0; i < pregunta1.getPreguntaList().size(); i++) {
                                Pregunta pregaux = pregunta1.getPreguntaList().get(i);
                                List<Object[]> dmaTotalyCeros = respuestasFacade.findByPregunta(pregaux.getId(), proceso.getId());
                                if (dmaTotalyCeros.size() > 0) {
                                    for (Object[] objects : dmaTotalyCeros) {
                                        total5y4Factores += (double) (Double.parseDouble(objects[0].toString()));
                                        dmaTotalFactores += Long.parseLong(objects[1].toString());
                                        total5y4 += Double.parseDouble(objects[0].toString());
                                        total += Long.parseLong(objects[1].toString());
                                    }
                                }
                            }
                        } else {
                            List<Object[]> dmaTotalyCeros = respuestasFacade.findByPregunta(pregunta1.getId(), proceso.getId());
                            if (dmaTotalyCeros.size() > 0) {
                                for (Object[] objects : dmaTotalyCeros) {
                                    total5y4Factores += (double) (Double.parseDouble(objects[0].toString()));
                                    dmaTotalFactores += Long.parseLong(objects[1].toString());
                                    total5y4 += Double.parseDouble(objects[0].toString());
                                    total += Long.parseLong(objects[1].toString());
                                }
                            }
                        }
                    }
                }
                if (dmaTotalFactores > 0.0) {
                    dmaX = (double) ((total5y4Factores * 100) / dmaTotalFactores);
                    dmaX = Math.rint(dmaX * 100) / 100;
                    ejeX.add("" + dmaX);
                } else {
                    ejeX.add("0.0");
                }
                total5y4Factores = 0.0;
                dmaTotalFactores = 0.0;
            }
            ejeY.add("TOTAL FACTORES");
            dmaTotal = (double) (total5y4 * 100 / total);
            dmaTotal = Math.rint(dmaTotal * 100) / 100;
            ejeX.add("" + dmaTotal);

        } else if ("-1".equals(factor)) {
            if ("-2".equals(caracteristica)) { //valores vs caracteristicas
                titulo = "CARACTERISTICAS";
                List<Caracteristica> cs = caracteristicaFacade.findByModeloOptimizada(m);
                for (Caracteristica caracteristica1 : cs) {
                    ejeY.add(" " + caracteristica1.getCodigo() + " " + caracteristica1.getNombre());
                    List<Pregunta> ps = caracteristica1.getPreguntaList();
                    for (Pregunta pregunta1 : ps) {
                        if (pregunta1.getPreguntaList().size() > 0) {
                            for (int i = 0; i < pregunta1.getPreguntaList().size(); i++) {
                                Pregunta pregaux = pregunta1.getPreguntaList().get(i);
                                List<Object[]> dmaTotalyCeros = respuestasFacade.findByPregunta(pregaux.getId(), proceso.getId());
                                if (dmaTotalyCeros.size() > 0) {
                                    for (Object[] objects : dmaTotalyCeros) {
                                        total5y4Caracteristicas += (double) (Double.parseDouble(objects[0].toString()));
                                        dmaTotalCaracteristicas += Long.parseLong(objects[1].toString());
                                        total5y4 += Double.parseDouble(objects[0].toString());
                                        total += Long.parseLong(objects[1].toString());
                                    }
                                }
                            }
                        } else {
                            List<Object[]> dmaTotalyCeros = respuestasFacade.findByPregunta(pregunta1.getId(), proceso.getId());
                            if (dmaTotalyCeros.size() > 0) {
                                for (Object[] objects : dmaTotalyCeros) {
                                    total5y4Caracteristicas += (double) (Double.parseDouble(objects[0].toString()));
                                    dmaTotalCaracteristicas += Long.parseLong(objects[1].toString());
                                    total5y4 += Double.parseDouble(objects[0].toString());
                                    total += Long.parseLong(objects[1].toString());
                                }
                            }
                        }
                    }
                    if (dmaTotalCaracteristicas > 0.0) {
                        dmaX = (double) ((total5y4Caracteristicas * 100) / dmaTotalCaracteristicas);
                        dmaX = Math.rint(dmaX * 100) / 100;
                        ejeX.add("" + dmaX);
                    } else {
                        ejeX.add("0.0");
                    }
                    total5y4Caracteristicas = 0.0;
                    dmaTotalCaracteristicas = 0.0;
                }

                ejeY.add("TOTAL CARACTERISTICAS");
                dmaTotal = (double) (total5y4 * 100 / total);
                dmaTotal = Math.rint(dmaTotal * 100) / 100;
                ejeX.add("" + dmaTotal);

            } else if ("-1".equals(caracteristica)) {
                if ("-2".equals(pregunta)) { // valores vs preguntas
                    titulo = "PREGUNTAS";
                    List<Factor> fs = factorFacade.findByModeloOptimizada(m);
                    for (Factor factor1 : fs) {
                        List<Caracteristica> cs = caracteristicaFacade.findByFactor(factor1);
                        for (Caracteristica caracteristica1 : cs) {
                            List<Pregunta> ps = caracteristica1.getPreguntaList();
                            for (Pregunta pregunta1 : ps) {
                                if (pregunta1.getPreguntaList().size() > 0) {
                                    for (int i = 0; i < pregunta1.getPreguntaList().size(); i++) {
                                        Pregunta pregaux = pregunta1.getPreguntaList().get(i);
                                        ejeY.add("" + pregunta1.getPregunta() + " " + pregaux.getPregunta());
                                        List<Object[]> dmaTotalyCeros = respuestasFacade.findByPregunta(pregaux.getId(), proceso.getId());
                                        if (dmaTotalyCeros.size() > 0) {
                                            for (Object[] objects : dmaTotalyCeros) {
                                                if (!objects[1].toString().equals("0")) {
                                                    dmaX = (double) ((Double.parseDouble(objects[0].toString()) * 100) / Long.parseLong(objects[1].toString()));
                                                    dmaX = Math.rint(dmaX * 100) / 100;
                                                    total5y4 += Double.parseDouble(objects[0].toString());
                                                    total += Long.parseLong(objects[1].toString());
                                                    ejeX.add("" + dmaX);
                                                } else {
                                                    ejeX.add("0.0");
                                                }

                                            }
                                        } else {
                                            ejeX.add("0.0");
                                        }
                                    }
                                } else {
                                    ejeY.add("" + pregunta1.getPregunta());
                                    List<Object[]> dmaTotalyCeros = respuestasFacade.findByPregunta(pregunta1.getId(), proceso.getId());
                                    if (dmaTotalyCeros.size() > 0) {
                                        for (Object[] objects : dmaTotalyCeros) {
                                            if (!objects[1].toString().equals("0")) {
                                                dmaX = (double) ((Double.parseDouble(objects[0].toString()) * 100) / Long.parseLong(objects[1].toString()));
                                                dmaX = Math.rint(dmaX * 100) / 100;
                                                total5y4 += Double.parseDouble(objects[0].toString());
                                                total += Long.parseLong(objects[1].toString());
                                                ejeX.add("" + dmaX);
                                            } else {
                                                ejeX.add("0.0");
                                            }
                                        }
                                    } else {
                                        ejeX.add("0.0");
                                    }
                                }
                            }
                        }
                    }
                    ejeY.add("TOTAL PREGUNTA");
                    dmaTotal = (double) (total5y4 * 100 / total);
                    dmaTotal = Math.rint(dmaTotal * 100) / 100;
                    ejeX.add("" + dmaTotal);
                } else if ("-1".equals(pregunta)) {
                    if ("-2".equals(grupo)) { // valores vs grupos
                        titulo = "GRUPOS";
                        List<Encuesta> encuestas15 = proceso.getModeloId().getEncuestaList();
                        for (int i = 0; i < encuestas15.size(); i++) {
                            Encuesta enc = encuestas15.get(i);
                            aux = enc.getNombre().replace("ENCUESTA A ", "");
                            ejeY.add("" + aux);
                            List<Object[]> dmaTotalyCeros = respuestasFacade.findByEncuestaYproceso(enc.getId(), proceso.getId());
                            if (dmaTotalyCeros.size() > 0) {
                                for (Object[] objects : dmaTotalyCeros) {
                                    if (!objects[1].toString().equals("0")) {
                                        dmaX = (double) ((Double.parseDouble(objects[0].toString()) * 100) / Long.parseLong(objects[1].toString()));
                                        dmaX = Math.rint(dmaX * 100) / 100;
                                        total5y4 += Double.parseDouble(objects[0].toString());
                                        total += Long.parseLong(objects[1].toString());
                                        ejeX.add("" + dmaX);
                                    } else {
                                        ejeX.add("0.0");
                                    }
                                }
                            } else {
                                ejeX.add("0.0");
                            }
                        }
                        ejeY.add("TOTAL GRUPOS");
                        dmaTotal = (double) (total5y4 * 100 / total);
                        dmaTotal = Math.rint(dmaTotal * 100) / 100;
                        ejeX.add("" + dmaTotal);
                    } else if (!"-1".equals(grupo)) { //  valores vs grupo seleccionado
                        titulo = "GRUPOS";
                        List<Encuesta> encuestas11 = proceso.getModeloId().getEncuestaList();
                        for (int i = 0; i < encuestas11.size(); i++) {
                            Encuesta enc = encuestas11.get(i);
                            aux = enc.getNombre().replace("ENCUESTA A ", "");
                            if (grupo.equals("" + i)) {
                                ejeY.add("" + aux);
                            }
                            List<Object[]> dmaTotalyCeros = respuestasFacade.findByEncuestaYproceso(enc.getId(), proceso.getId());
                            if (dmaTotalyCeros.size() > 0) {
                                for (Object[] objects : dmaTotalyCeros) {
                                    dmaX = (double) ((Double.parseDouble(objects[0].toString()) * 100) / Long.parseLong(objects[1].toString()));
                                    dmaX = Math.rint(dmaX * 100) / 100;
                                    total5y4 += Double.parseDouble(objects[0].toString());
                                    total += Long.parseLong(objects[1].toString());
                                    if (grupo.equals("" + i)) {
                                        ejeX.add("" + dmaX);
                                    }

                                }
                            } else {
                                if (grupo.equals("" + i)) {
                                    ejeX.add("0.0");
                                }
                            }
                        }
                        ejeY.add("TOTAL GRUPOS");
                        dmaTotal = (double) (total5y4 * 100 / total);
                        dmaTotal = Math.rint(dmaTotal * 100) / 100;
                        ejeX.add("" + dmaTotal);

                    }
                }
            }
        } else {//factor seleccionado
            if ("-2".equals(caracteristica)) {      //valores vs caracteristicas de un factor especifico
            } else if ("-1".equals(caracteristica)) {//vacio en caracteristica
                if ("-2".equals(grupo)) { //factor vs grupos
                    Factor fa = factorFacade.find(Integer.parseInt(factor));
                    titulo = fa.getNombre();
                    List<Encuesta> encuestas5 = proceso.getModeloId().getEncuestaList();
                    for (int i = 0; i < encuestas5.size(); i++) {
                        Encuesta enc = encuestas5.get(i);
                        aux = enc.getNombre().replace("ENCUESTA A ", "");
                        ejeY.add("" + aux);
                        List<Object[]> dmaTotalyCeros = respuestasFacade.findByFactoryEncuesta(fa.getId(), enc.getId(), proceso.getId());
                        if (dmaTotalyCeros.size() > 0) {
                            for (Object[] objects : dmaTotalyCeros) {
                                dmaX = (double) ((Double.parseDouble(objects[0].toString()) * 100) / Long.parseLong(objects[1].toString()));
                                dmaX = Math.rint(dmaX * 100) / 100;
                                total5y4 += Double.parseDouble(objects[0].toString());
                                total += Long.parseLong(objects[1].toString());
                                ejeX.add("" + dmaX);
                            }
                        } else {
                            ejeX.add("0.0");
                        }
                    }
                    ejeY.add("TOTAL FACTOR");
                    if (total > 0.0) {
                        dmaTotal = (double) (total5y4 * 100 / total);
                        dmaTotal = Math.rint(dmaTotal * 100) / 100;
                        ejeX.add("" + dmaTotal);
                    } else {
                        ejeX.add("0.0");
                    }
                } else if ("-1".equals(grupo)) { // factor vs valores
                } else { //factor vs grupo
                }
            } else { //caracteristica seleccionada
                if ("-2".equals(pregunta)) { //valores vs preguntas de una caracteristica especifica
                } else if ("-1".equals(pregunta)) {//vacio en pregunta
                    if ("-2".equals(grupo)) { //caracteristica vs grupos

                        Caracteristica ca = caracteristicaFacade.find(Integer.parseInt(caracteristica));
                        titulo = ca.getNombre();
                        List<Encuesta> encuestas10 = proceso.getModeloId().getEncuestaList();
                        for (int i = 0; i < encuestas10.size(); i++) {
                            Encuesta enc = encuestas10.get(i);
                            aux = enc.getNombre().replace("ENCUESTA A ", "");
                            ejeY.add("" + aux);
                            List<Object[]> dmaTotalyCeros = respuestasFacade.findByCaracteristicayEncuesta(ca.getId(), enc.getId(), proceso.getId());
                            if (dmaTotalyCeros.size() > 0) {
                                for (Object[] objects : dmaTotalyCeros) {
                                    if (!objects[1].toString().equals("0")) {
                                        dmaX = (double) ((Double.parseDouble(objects[0].toString()) * 100) / Long.parseLong(objects[1].toString()));
                                        dmaX = Math.rint(dmaX * 100) / 100;
                                        total5y4 += Double.parseDouble(objects[0].toString());
                                        total += Long.parseLong(objects[1].toString());
                                        ejeX.add("" + dmaX);
                                    } else {
                                        ejeX.add("0.0");
                                    }
                                }
                            } else {
                                ejeX.add("0.0");
                            }
                        }
                        ejeY.add("TOTAL CARACTERISTICA");
                        if (total > 0.0) {
                            dmaTotal = (double) (total5y4 * 100 / total);
                            dmaTotal = Math.rint(dmaTotal * 100) / 100;
                            ejeX.add("" + dmaTotal);
                        } else {
                            ejeX.add("0.0");
                        }
                    } else if ("-1".equals(grupo)) { // caracteristica vs valores
                    } else { //caracteristica vs grupo
                    }
                } else { //pregunta seleccionada
                    if ("-2".equals(grupo)) { //pregunta vs grupos
                        Pregunta preg = preguntaFacade.find(Integer.parseInt(pregunta));
                        Pregunta pregaux = preg;
                        if (preg.getPreguntaPadre() != null) {
                            pregaux = preg.getPreguntaPadre();
                        }
                        if (preg.getPreguntaPadre() != null) {
                            titulo = preg.getPreguntaPadre().getPregunta() + " " + preg.getPregunta();
                        } else {
                            titulo = preg.getPregunta();
                        }
                        List<Encuesta> encuestas0 = proceso.getModeloId().getEncuestaList();
                        for (int i = 0; i < encuestas0.size(); i++) {
                            Encuesta enc = encuestas0.get(i);
                            aux = enc.getNombre().replace("ENCUESTA A ", "");
                            ejeY.add("" + aux);
                            if (enc.getPreguntaList().contains(pregaux)) {
                                List<Object[]> dmaTotalyCeros = respuestasFacade.findByPreguntayEncuesta(preg.getId(), enc.getId(), proceso.getId());
                                if (dmaTotalyCeros.size() > 0) {
                                    for (Object[] objects : dmaTotalyCeros) {
                                        dmaX = (double) ((Double.parseDouble(objects[0].toString()) * 100) / Long.parseLong(objects[1].toString()));
                                        dmaX = Math.rint(dmaX * 100) / 100;
                                        total5y4 += Double.parseDouble(objects[0].toString());
                                        total += Long.parseLong(objects[1].toString());
                                        ejeX.add("" + dmaX);
                                    }
                                } else {
                                    ejeX.add("0.0");
                                }
                            } else {
                                ejeX.add("0.0");
                            }
                        }
                        ejeY.add("TOTAL PREGUNTA");
                        dmaTotal = (double) (total5y4 * 100 / total);
                        dmaTotal = Math.rint(dmaTotal * 100) / 100;
                        ejeX.add("" + dmaTotal);

                    } else if ("-1".equals(grupo)) { // pregunta vs valores
                        Pregunta preg = preguntaFacade.find(Integer.parseInt(pregunta));
                        Pregunta pregaux = preg;
                        if (preg.getPreguntaPadre() != null) {
                            pregaux = preg.getPreguntaPadre();
                        }
                        if (preg.getPreguntaPadre() != null) {
                            titulo = preg.getPreguntaPadre().getPregunta() + " " + preg.getPregunta();
                        } else {
                            titulo = preg.getPregunta();
                        }

                        List<Encuesta> encuestas1 = proceso.getModeloId().getEncuestaList();
                        for (int i = 0; i < encuestas1.size(); i++) {
                            Encuesta enc = encuestas1.get(i);
                            aux = enc.getNombre().replace("ENCUESTA A ", "");
                            if (enc.getPreguntaList().contains(pregaux)) {
                                List<Object[]> dmaTotalyCeros = respuestasFacade.findByPreguntayEncuesta(preg.getId(), enc.getId(), proceso.getId());
                                if (dmaTotalyCeros.size() > 0) {
                                    for (Object[] objects : dmaTotalyCeros) {
                                        //dmaX = (double) ((Double.parseDouble(objects[0].toString()) * 100) / Long.parseLong(objects[1].toString()));
                                        // dmaX = Math.rint(dmaX * 100) / 100;
                                        total5y4 += Double.parseDouble(objects[0].toString());
                                        total += Long.parseLong(objects[1].toString());
                                        // ejeX.add("" + dmaX);
                                    }
                                } else {
                                    // ejeX.add("0.0");
                                }
                            } else {
                                //  ejeX.add("0.0");
                            }
                        }
                        ejeY.add("TOTAL PREGUNTA");
                        dmaTotal = (double) (total5y4 * 100 / total);
                        dmaTotal = Math.rint(dmaTotal * 100) / 100;
                        ejeX.add("" + dmaTotal);

                    } else { //pregunta vs grupo
                        Pregunta preg = preguntaFacade.find(Integer.parseInt(pregunta));
                        Pregunta pregaux = preg;
                        if (preg.getPreguntaPadre() != null) {
                            pregaux = preg.getPreguntaPadre();
                        }
                        if (preg.getPreguntaPadre() != null) {
                            titulo = preg.getPreguntaPadre().getPregunta() + " " + preg.getPregunta();
                        } else {
                            titulo = preg.getPregunta();
                        }

                        List<Encuesta> encuestas3 = proceso.getModeloId().getEncuestaList();
                        for (int i = 0; i < encuestas3.size(); i++) {
                            Encuesta enc = encuestas3.get(i);
                            aux = enc.getNombre().replace("ENCUESTA A ", "");
                            if (grupo.equals("" + i)) {
                                ejeY.add("" + aux);
                            }
                            if (enc.getPreguntaList().contains(pregaux)) {
                                List<Object[]> dmaTotalyCeros = respuestasFacade.findByPreguntayEncuesta(preg.getId(), enc.getId(), proceso.getId());
                                if (dmaTotalyCeros.size() > 0) {
                                    for (Object[] objects : dmaTotalyCeros) {
                                        dmaX = (double) ((Double.parseDouble(objects[0].toString()) * 100) / Long.parseLong(objects[1].toString()));
                                        dmaX = Math.rint(dmaX * 100) / 100;
                                        total5y4 += Double.parseDouble(objects[0].toString());
                                        total += Long.parseLong(objects[1].toString());
                                        if (grupo.equals("" + i)) {
                                            ejeX.add("" + dmaX);
                                        }
                                        //
                                    }
                                } else {
                                    if (grupo.equals("" + i)) {
                                        ejeX.add("0.0");
                                    }
                                }
                            } else {
                                if (grupo.equals("" + i)) {
                                    ejeX.add("0.0");
                                }
                            }
                        }
                        ejeY.add("TOTAL PREGUNTA");
                        dmaTotal = (double) (total5y4 * 100 / total);
                        dmaTotal = Math.rint(dmaTotal * 100) / 100;
                        ejeX.add("" + dmaTotal);
                    }
                }
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
