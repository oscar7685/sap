/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.NumericadocumentalFacade;
import com.sap.ejb.PonderacioncaracteristicaFacade;
import com.sap.ejb.PonderacionfactorFacade;
import com.sap.ejb.ResultadoevaluacionFacade;
import com.sap.entity.Caracteristica;
import com.sap.entity.Encuesta;
import com.sap.entity.Factor;
import com.sap.entity.Indicador;
import com.sap.entity.Instrumento;
import com.sap.entity.Modelo;
import com.sap.entity.Numericadocumental;
import com.sap.entity.Ponderacioncaracteristica;
import com.sap.entity.Ponderacionfactor;
import com.sap.entity.Pregunta;
import com.sap.entity.Proceso;
import com.sap.entity.Resultadoevaluacion;
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
public class InformeMatrizFactores implements Action{
    PonderacionfactorFacade ponderacionfactorFacade = lookupPonderacionfactorFacadeBean();
    PonderacioncaracteristicaFacade ponderacioncaracteristicaFacade = lookupPonderacioncaracteristicaFacadeBean();
    NumericadocumentalFacade numericadocumentalFacade = lookupNumericadocumentalFacadeBean();
    ResultadoevaluacionFacade resultadoevaluacionFacade = lookupResultadoevaluacionFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso p = (Proceso) sesion.getAttribute("Proceso");
        Modelo mod = p.getModeloId();

            float sumaPon;
            float suma2;

            float calificacionNum;
            float calificacionDoc;
            float calificacionPer;

            List<Ponderacionfactor> ponderacionesF = new ArrayList<Ponderacionfactor>();
            List<Factor> factores = mod.getFactorList();
            float cumplimientoF[] = new float[factores.size()];
            for (int i2 = 0; i2 < factores.size(); i2++) {
                suma2 = 0;
                sumaPon = 0;

                List<Caracteristica> caracteristicas = factores.get(i2).getCaracteristicaList();
                float cumplimientoC2[] = new float[caracteristicas.size()];
                for (int j = 0; j < caracteristicas.size(); j++) {
                    List<Indicador> indicadores = caracteristicas.get(j).getIndicadorList();
                    float cumplimiento[] = new float[indicadores.size()];
                    for (int k = 0; k < indicadores.size(); k++) {
                        calificacionNum = 0;
                        calificacionDoc = 0;
                        calificacionPer = 0;
                        List<Instrumento> instr = indicadores.get(k).getInstrumentoList();
                        for (int i = 0; i < instr.size(); i++) {
                            Instrumento instrumento = instr.get(i);
                            if (instrumento.getId() == 1) {

                                //RECUPERAMOS LAS PREGUNTAS DEL ACTUAL INDICADOR
                                List<Pregunta> preguntas = indicadores.get(k).getPreguntaList();
                                float promedioPregunta, suma, numP;

                                //declaramos promedio de respuestas para cada preguntas
                                float promediorespuestas[] = new float[preguntas.size()];

                                //recorremos cada pregunta
                                for (int l = 0; l < preguntas.size(); l++) {
                                    Pregunta pregunta = preguntas.get(l);

                                    //sacamos las encuestas asociadas a la pregunta actual
                                    List<Encuesta> encuestas = pregunta.getEncuestaList();
                                    int cantEn = encuestas.size();
                                    //declaramos arreglo para tener los promedios de respuesta de la actual pregunta en cada encuesta
                                    float promediorespuestasxencuesta[] = new float[cantEn];

                                    //calculamos el promedio de respuesta de la pregunta actual en cada encuesta
                                    for (int m = 0; m < cantEn; m++) {
                                        suma = 0;
                                        numP = 0;
                                        List<Resultadoevaluacion> respuestas = resultadoevaluacionFacade.findResultadosxPreguntaxEncuestaxProceso(p, encuestas.get(m), pregunta);
                                        for (Resultadoevaluacion resultadoevaluacion : respuestas) {
                                            suma += Integer.parseInt(resultadoevaluacion.getRespuesta());
                                            numP++;
                                        }
                                        if (suma > 0) {
                                            promediorespuestasxencuesta[m] = (float) suma / numP;
                                        }

                                    }
                                    //calculamos el promedio de respuesta por pregunta usando los promedios por encuesta
                                    float promedioPreguntaAux = 0;
                                    int cantidadEncuestas = encuestas.size();
                                    for (int m = 0; m < cantidadEncuestas; m++) {
                                        promedioPreguntaAux += promediorespuestasxencuesta[m];
                                    }
                                    promedioPregunta = (float) promedioPreguntaAux / encuestas.size();
                                    promediorespuestas[l] = (float) (Math.rint(promedioPregunta * 10) / 10);

                                }
                                int numPre = 0;
                                for (int q = 0; q < promediorespuestas.length; q++) {
                                    if (promediorespuestas[q] > 0) {
                                        calificacionPer += promediorespuestas[q];
                                        numPre++;
                                    }
                                }
                                calificacionPer = (float) calificacionPer / numPre;
                            } else {
                                if (instrumento.getId() == 2) {
                                    Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p, "instrumentoId", instrumento);
                                    if (numDoc != null) {
                                        calificacionNum = (float) numDoc.getEvaluacion();
                                    }

                                } else {
                                    if (instrumento.getId() == 3) {
                                        Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p, "instrumentoId", instrumento);
                                        if (numDoc != null) {
                                            calificacionDoc = (float) numDoc.getEvaluacion();
                                        }
                                    }
                                }
                            }
                        }
                        if (calificacionNum != 0 && calificacionDoc != 0 && calificacionPer != 0) {
                            cumplimiento[k] = (calificacionPer + calificacionNum + calificacionDoc) / 3;
                        } else {
                            if (calificacionNum != 0 && calificacionPer != 0) {
                                cumplimiento[k] = (calificacionNum + calificacionPer) / 2;
                            } else if (calificacionDoc != 0 && calificacionPer != 0) {
                                cumplimiento[k] = (calificacionPer + calificacionDoc) / 2;
                            } else if (calificacionDoc != 0 && calificacionNum != 0) {
                                cumplimiento[k] = (calificacionNum + calificacionDoc) / 2;
                            } else if (calificacionDoc != 0) {
                                cumplimiento[k] = calificacionDoc;
                            } else if (calificacionNum != 0) {
                                cumplimiento[k] = calificacionNum;
                            } else if (calificacionPer != 0) {
                                cumplimiento[k] = calificacionPer;
                            }
                        }

                    }

                    float sumaCumplimientoIndicadores = 0;
                    int calificados = 0;
                    for (int i = 0; i < cumplimiento.length; i++) {
                        if (cumplimiento[i] > 0.0) {
                            sumaCumplimientoIndicadores += cumplimiento[i];
                            calificados++;
                        }
                    }
                    if (sumaCumplimientoIndicadores > 0) {
                        cumplimientoC2[j] = (float) sumaCumplimientoIndicadores / calificados;
                        cumplimientoC2[j] = (float) (Math.rint(cumplimientoC2[j] * 10) / 10);
                    }

                }
                for (int i = 0; i < factores.get(i2).getCaracteristicaList().size(); i++) {
                    if (cumplimientoC2[i] != 0) {
                        Ponderacioncaracteristica pc = ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(factores.get(i2).getCaracteristicaList().get(i), p);
                        sumaPon += pc.getPonderacion();
                        suma2 += cumplimientoC2[i] * pc.getPonderacion();
                    }
                }
                if (sumaPon != 0) {
                    ponderacionesF.add(ponderacionfactorFacade.findByFactorYProceso(factores.get(i2), p));
                    cumplimientoF[i2] = suma2 / sumaPon;
                    cumplimientoF[i2] = (float) (Math.rint(cumplimientoF[i2] * 10) / 10);
                }

            }
            sesion.setAttribute("factores", factores);
            sesion.setAttribute("ponderacionesF", ponderacionesF);
            sesion.setAttribute("cumplimientoF", cumplimientoF);

            return "/WEB-INF/vista/comitePrograma/proceso/informe/matrizFactores.jsp";
    }

    private ResultadoevaluacionFacade lookupResultadoevaluacionFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ResultadoevaluacionFacade) c.lookup("java:global/sap/ResultadoevaluacionFacade!com.sap.ejb.ResultadoevaluacionFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private NumericadocumentalFacade lookupNumericadocumentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (NumericadocumentalFacade) c.lookup("java:global/sap/NumericadocumentalFacade!com.sap.ejb.NumericadocumentalFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PonderacioncaracteristicaFacade lookupPonderacioncaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacioncaracteristicaFacade) c.lookup("java:global/sap/PonderacioncaracteristicaFacade!com.sap.ejb.PonderacioncaracteristicaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PonderacionfactorFacade lookupPonderacionfactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacionfactorFacade) c.lookup("java:global/sap/PonderacionfactorFacade!com.sap.ejb.PonderacionfactorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
    
}
