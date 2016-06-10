/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.FactorFacade;
import com.sap.ejb.NumericadocumentalFacade;
import com.sap.ejb.PonderacioncaracteristicaFacade;
import com.sap.ejb.ProcesoFacade;
import com.sap.ejb.ResultadoevaluacionFacade;
import com.sap.entity.Caracteristica;
import com.sap.entity.Encuesta;
import com.sap.entity.Factor;
import com.sap.entity.Indicador;
import com.sap.entity.Instrumento;
import com.sap.entity.Modelo;
import com.sap.entity.Numericadocumental;
import com.sap.entity.Ponderacioncaracteristica;
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
public class DetalleFactor implements Action {

    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    PonderacioncaracteristicaFacade ponderacioncaracteristicaFacade = lookupPonderacioncaracteristicaFacadeBean();
    NumericadocumentalFacade numericadocumentalFacade = lookupNumericadocumentalFacadeBean();
    ResultadoevaluacionFacade resultadoevaluacionFacade = lookupResultadoevaluacionFacadeBean();
    FactorFacade factorFacade = lookupFactorFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso p = (Proceso) sesion.getAttribute("Proceso");
        Proceso p2 = p;
        String idFactor = request.getParameter("id");

        if (p.getModeloId().getId() == 6) {
            p = procesoFacade.find(52);
            Factor f = factorFacade.find(Integer.parseInt(idFactor));
            float sumaPon;
            float suma2;

            float calificacionNum;
            float calificacionDoc;
            float calificacionPer;
            List<Ponderacioncaracteristica> ponderacionesC = new ArrayList<Ponderacioncaracteristica>();
            List<Caracteristica> caracteristicas = f.getCaracteristicaList();
            float cumplimientoC2[] = new float[caracteristicas.size()];
            for (int j = 0; j < caracteristicas.size(); j++) {
                List<Indicador> indicadores = caracteristicas.get(j).getIndicadorList();
                float cumplimiento[] = new float[indicadores.size()];
                for (int k = 0; k < indicadores.size(); k++) {
                    List<Indicador> indicadores2 = indicadores.get(k).getIndicadorList();
                    if (indicadores2.size() > 0) {
                        float cumplimiento2 = 0;
                        for (int aux1 = 0; aux1 < indicadores2.size(); aux1++) {
                            float cumplimiento3 = 0;
                            calificacionNum = 0;
                            calificacionDoc = 0;
                            calificacionPer = 0;
                            List<Instrumento> instr = indicadores2.get(aux1).getInstrumentoList();
                            for (int i = 0; i < instr.size(); i++) {
                                Instrumento instrumento = instr.get(i);
                                if (instrumento.getId() == 1) {

                                    //RECUPERAMOS LAS PREGUNTAS DEL ACTUAL INDICADOR
                                    List<Pregunta> preguntas = indicadores2.get(aux1).getPreguntaList();
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

                                        /* 1. Calculamos el promedio de la pregunta en cada encuesta*/
                                        for (int m = 0; m < cantEn; m++) {
                                            suma = 0;
                                            List<Object[]> respuestas = (List<Object[]>) resultadoevaluacionFacade.findResultadosxPreguntaxEncuestaxProceso2(p, encuestas.get(m), pregunta);
                                            for (Object[] resultadoevaluacion : respuestas) {
                                                suma += Integer.parseInt(resultadoevaluacion[1].toString());

                                            }
                                            if (suma > 0) {
                                                promediorespuestasxencuesta[m] = (float) suma / respuestas.size();
                                                promediorespuestasxencuesta[m] = (float) Math.rint(promediorespuestasxencuesta[m] * 10) / 10;
                                            }

                                        }
                                        /* 2. Calculamos el promedio de la pregunta teniendo en cuenta los promedios por encuesta*/
                                        float promedioPreguntaAux = 0;
                                        int cantidadEncuestas = encuestas.size();
                                        int encuestasContestadas = 0;
                                        for (int m = 0; m < cantidadEncuestas; m++) {
                                            promedioPreguntaAux += promediorespuestasxencuesta[m];
                                            if (promediorespuestasxencuesta[m] > 0) {
                                                encuestasContestadas++;
                                            }
                                        }
                                        promedioPregunta = (float) promedioPreguntaAux / encuestasContestadas;
                                        promediorespuestas[l] = (float) (Math.rint(promedioPregunta * 10) / 10);

                                    }
                                    /* 3. Calculamos el promedio de la percepcion en el indicador*/
                                    int numPreContestadas = 0;
                                    for (int q = 0; q < promediorespuestas.length; q++) {
                                        if (promediorespuestas[q] > 0) {
                                            calificacionPer += promediorespuestas[q];
                                            numPreContestadas++;
                                        }
                                    }
                                    calificacionPer = (float) calificacionPer / numPreContestadas;
                                    calificacionPer = (float) Math.rint(calificacionPer * 10) / 10;
                                } else if (instrumento.getId() == 2) {
                                    Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores2.get(aux1), "procesoId", p, "instrumentoId", instrumento);
                                    if (numDoc != null && numDoc.getEvaluacion() != 0.0) {
                                        calificacionNum = (float) numDoc.getEvaluacion();
                                    }

                                } else if (instrumento.getId() == 3) {
                                    Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores2.get(aux1), "procesoId", p, "instrumentoId", instrumento);
                                    if (numDoc != null && numDoc.getEvaluacion() != 0.0) {
                                        calificacionDoc = (float) numDoc.getEvaluacion();
                                    }
                                }
                            }
                            /* 4. Calcular el cumplimiento del indicador*/
                            if (calificacionNum != 0 && calificacionDoc != 0 && calificacionPer != 0) {
                                cumplimiento3 = (calificacionPer + calificacionNum + calificacionDoc) / 3;
                            } else if (calificacionNum != 0 && calificacionPer != 0) {
                                cumplimiento3 = (calificacionNum + calificacionPer) / 2;
                            } else if (calificacionDoc != 0 && calificacionPer != 0) {
                                cumplimiento3 = (calificacionPer + calificacionDoc) / 2;
                            } else if (calificacionDoc != 0 && calificacionNum != 0) {
                                cumplimiento3 = (calificacionNum + calificacionDoc) / 2;
                            } else if (calificacionDoc != 0) {
                                cumplimiento3 = calificacionDoc;
                            } else if (calificacionNum != 0) {
                                cumplimiento3 = calificacionNum;
                            } else if (calificacionPer != 0) {
                                cumplimiento3 = calificacionPer;
                            }
                            cumplimiento2 += (float) (Math.rint(cumplimiento3 * 10) / 10); //cumplimiento de cada indicador
                        }

                        cumplimiento[k] = cumplimiento2 / indicadores2.size();
                    } else {
                        List<Instrumento> instr = indicadores.get(k).getInstrumentoList();
                        for (int i = 0; i < instr.size(); i++) {
                            Instrumento instrumento = instr.get(i);
                            if (instrumento.getId() == 2) {
                                Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p2, "instrumentoId", instrumento);
                                if (numDoc != null && numDoc.getEvaluacion() != 0.0) {
                                    cumplimiento[k] = (float) numDoc.getEvaluacion();
                                }

                            } else if (instrumento.getId() == 3) {
                                Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p2, "instrumentoId", instrumento);
                                if (numDoc != null && numDoc.getEvaluacion() != 0.0) {
                                    cumplimiento[k] = (float) numDoc.getEvaluacion();
                                }
                            }
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
                /* 5. Calculamos el cumplimiento de la caracteristica*/
                if (sumaCumplimientoIndicadores > 0) {
                    cumplimientoC2[j] = (float) sumaCumplimientoIndicadores / calificados;
                    cumplimientoC2[j] = (float) (Math.rint(cumplimientoC2[j] * 10) / 10);
                }
                ponderacionesC.add(ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(caracteristicas.get(j), p2));
            }
            sesion.setAttribute("factor", f);
            sesion.setAttribute("caracteristicasDF", caracteristicas);
            sesion.setAttribute("ponderacionesCDF", ponderacionesC);
            sesion.setAttribute("cumplimientoDF", cumplimientoC2);


        } else {
            float calificacionNum;
            float calificacionDoc;
            float calificacionPer;
            Factor f = factorFacade.find(Integer.parseInt(idFactor));

            List<Ponderacioncaracteristica> ponderacionesC = new ArrayList<Ponderacioncaracteristica>();
            List<Caracteristica> caracteristicas = f.getCaracteristicaList();
            float cumplimiento2[] = new float[caracteristicas.size()];
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
                            float promedioPregunta, suma;

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

                                /* 1. Calculamos el promedio de la pregunta en cada encuesta*/
                                for (int m = 0; m < cantEn; m++) {
                                    suma = 0;

                                    List<Resultadoevaluacion> respuestas = resultadoevaluacionFacade.findResultadosxPreguntaxEncuestaxProceso(p, encuestas.get(m), pregunta);
                                    for (Resultadoevaluacion resultadoevaluacion : respuestas) {
                                        suma += Integer.parseInt(resultadoevaluacion.getRespuesta());
                                    }
                                    if (suma > 0) {
                                        promediorespuestasxencuesta[m] = (float) suma / respuestas.size();
                                        promediorespuestasxencuesta[m] = (float) Math.rint(promediorespuestasxencuesta[m] * 10) / 10;
                                    }

                                }
                                /* 2. Calculamos el promedio de la pregunta teniendo en cuenta los promedios por encuesta*/
                                float promedioPreguntaAux = 0;
                                int cantidadEncuestas = encuestas.size();
                                int encuestasContestadas = 0;
                                for (int m = 0; m < cantidadEncuestas; m++) {
                                    promedioPreguntaAux += promediorespuestasxencuesta[m];
                                    if (promediorespuestasxencuesta[m] > 0) {
                                        encuestasContestadas++;
                                    }
                                }
                                promedioPregunta = (float) promedioPreguntaAux / encuestasContestadas;
                                promediorespuestas[l] = (float) (Math.rint(promedioPregunta * 10) / 10);

                            }
                            /* 3. Calculamos el promedio de la percepcion en el indicador*/
                            int numPreContestadas = 0;
                            for (int q = 0; q < promediorespuestas.length; q++) {
                                if (promediorespuestas[q] > 0) {
                                    calificacionPer += promediorespuestas[q];
                                    numPreContestadas++;
                                }
                            }
                            calificacionPer = (float) calificacionPer / numPreContestadas;
                            calificacionPer = (float) Math.rint(calificacionPer * 10) / 10;
                        } else if (instrumento.getId() == 2) {
                            Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p, "instrumentoId", instrumento);
                            if (numDoc != null) {
                                calificacionNum = (float) numDoc.getEvaluacion();
                            }

                        } else if (instrumento.getId() == 3) {
                            Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadores.get(k), "procesoId", p, "instrumentoId", instrumento);
                            if (numDoc != null) {
                                calificacionDoc = (float) numDoc.getEvaluacion();
                            }
                        }
                    }
                    /* 4. Calcular el cumplimiento del indicador*/
                    if (calificacionNum != 0 && calificacionDoc != 0 && calificacionPer != 0) {
                        cumplimiento[k] = (calificacionPer + calificacionNum + calificacionDoc) / 3;
                    } else if (calificacionNum != 0 && calificacionPer != 0) {
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
                    cumplimiento[k] = (float) (Math.rint(cumplimiento[k] * 10) / 10); //cumplimiento de cada indicador
                }

                float sumaCumplimientoIndicadores = 0;
                int calificados = 0;
                for (int i = 0; i < cumplimiento.length; i++) {
                    if (cumplimiento[i] > 0.0) {
                        sumaCumplimientoIndicadores += cumplimiento[i];
                        calificados++;
                    }
                }
                /* 5. Calculamos el cumplimiento de la caracteristica*/
                if (sumaCumplimientoIndicadores > 0) {
                    cumplimiento2[j] = (float) sumaCumplimientoIndicadores / calificados;
                    cumplimiento2[j] = (float) (Math.rint(cumplimiento2[j] * 10) / 10);
                }

                ponderacionesC.add(ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(caracteristicas.get(j), p));
            }
            sesion.setAttribute("factor", f);
            sesion.setAttribute("caracteristicasDF", caracteristicas);
            sesion.setAttribute("ponderacionesCDF", ponderacionesC);
            sesion.setAttribute("cumplimientoDF", cumplimiento2);
        }




        return "/WEB-INF/vista/comitePrograma/proceso/informe/detalleFactor.jsp";
    }

    private FactorFacade lookupFactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FactorFacade) c.lookup("java:global/sapenfermeria/FactorFacade!com.sap.ejb.FactorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
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

    private NumericadocumentalFacade lookupNumericadocumentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (NumericadocumentalFacade) c.lookup("java:global/sapenfermeria/NumericadocumentalFacade!com.sap.ejb.NumericadocumentalFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PonderacioncaracteristicaFacade lookupPonderacioncaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacioncaracteristicaFacade) c.lookup("java:global/sapenfermeria/PonderacioncaracteristicaFacade!com.sap.ejb.PonderacioncaracteristicaFacade");
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
