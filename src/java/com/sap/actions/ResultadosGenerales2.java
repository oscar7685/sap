/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.CaracteristicaFacade;
import com.sap.ejb.FactorFacade;
import com.sap.ejb.IndicadorFacade;
import com.sap.ejb.NumericadocumentalFacade;
import com.sap.ejb.PonderacioncaracteristicaFacade;
import com.sap.ejb.PonderacionfactorFacade;
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
public class ResultadosGenerales2 implements Action {

    ResultadoevaluacionFacade resultadoevaluacionFacade = lookupResultadoevaluacionFacadeBean();
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    PonderacionfactorFacade ponderacionfactorFacade = lookupPonderacionfactorFacadeBean();
    NumericadocumentalFacade numericadocumentalFacade = lookupNumericadocumentalFacadeBean();
    PonderacioncaracteristicaFacade ponderacioncaracteristicaFacade = lookupPonderacioncaracteristicaFacadeBean();
    CaracteristicaFacade caracteristicaFacade = lookupCaracteristicaFacadeBean();
    FactorFacade factorFacade = lookupFactorFacadeBean();
    IndicadorFacade indicadorFacade = lookupIndicadorFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");


        Proceso p = (Proceso) proceso;
        Proceso p2 = p;

        if (p.getModeloId().getId() == 6) {
            p = procesoFacade.find(52);
            Modelo modelo = p2.getModeloId();
            List<Factor> factores = factorFacade.findByModelo(modelo);
            List<Caracteristica> caracteristicas = caracteristicaFacade.findByModelo(modelo);
            List<Indicador> indicadoresMercosur = indicadorFacade.findByModeloYenOrden(modelo);

            float cumplimientoF[] = new float[factores.size()];
            float cumplimientoC[] = new float[caracteristicas.size()]; //cumplimiento x caracteristica
            float cumplimientoI[] = new float[indicadoresMercosur.size()]; //cumplimiento indicadoresMercosur

            float cumplimientoISap[][] = new float[indicadoresMercosur.size()][11];


            int indicecumplimientoI = 0;



            float calificacionNum;
            float calificacionDoc;
            float calificacionPer;
            float suma2;
            int cantidadIndicadoresXcaracteristica = 0;
            int cantidadCaracteristicasXFactor = 0;

            for (int i = 0; i < factores.size(); i++) {
                suma2 = 0;
                List<Caracteristica> caracteristica = factores.get(i).getCaracteristicaList();
                for (int j = 0; j < caracteristica.size(); j++) {
                    List<Indicador> indicador = caracteristica.get(j).getIndicadorList();
                    for (int k = 0; k < indicador.size(); k++) {
                        List<Indicador> indicadoresSAP = indicador.get(k).getIndicadorList();
                        if (indicadoresSAP.size() > 0) {
                            float cumplimiento2 = 0;
                            for (int aux1 = 0; aux1 < indicadoresSAP.size(); aux1++) {
                                float cumplimiento3 = 0;
                                calificacionNum = 0;
                                calificacionDoc = 0;
                                calificacionPer = 0;
                                List<Instrumento> instr = indicadoresSAP.get(aux1).getInstrumentoList();
                                for (int n = 0; n < instr.size(); n++) {
                                    Instrumento instrumento = instr.get(n);
                                    if (instrumento.getId() == 1) {

                                        //RECUPERAMOS LAS PREGUNTAS DEL ACTUAL INDICADOR
                                        List<Pregunta> preguntas = indicadoresSAP.get(aux1).getPreguntaList();
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
                                        Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadoresSAP.get(aux1), "procesoId", p, "instrumentoId", instrumento);
                                        if (numDoc != null && numDoc.getEvaluacion() != 0.0) {
                                            calificacionNum = (float) numDoc.getEvaluacion();
                                        }

                                    } else if (instrumento.getId() == 3) {
                                        Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicadoresSAP.get(aux1), "procesoId", p, "instrumentoId", instrumento);
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

                                cumplimientoISap[indicecumplimientoI][aux1] = (float) (Math.rint(cumplimiento3 * 10) / 10);

                            }
                            if (indicadoresSAP.size() > 0) {
                                cumplimientoI[indicecumplimientoI] = cumplimiento2 / indicadoresSAP.size();
                            }

                        } else {
                            List<Instrumento> instr = indicador.get(k).getInstrumentoList();
                            for (int q = 0; q < instr.size(); q++) {
                                Instrumento instrumento = instr.get(q);
                                if (instrumento.getId() == 2) {
                                    Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicador.get(k), "procesoId", p2, "instrumentoId", instrumento);
                                    if (numDoc != null && numDoc.getEvaluacion() != 0.0) {
                                        cumplimientoI[indicecumplimientoI] = (float) numDoc.getEvaluacion();
                                    }

                                } else if (instrumento.getId() == 3) {
                                    Numericadocumental numDoc = numericadocumentalFacade.findBySingle3("indicadorId", indicador.get(k), "procesoId", p2, "instrumentoId", instrumento);
                                    if (numDoc != null && numDoc.getEvaluacion() != 0.0) {
                                        cumplimientoI[indicecumplimientoI] = (float) numDoc.getEvaluacion();
                                    }
                                }
                            }
                        }
                        indicecumplimientoI++;
                    }


                    float sumaCumplimientoIndicadores = 0;
                    int calificados = 0;
                    for (int r = cantidadIndicadoresXcaracteristica; r < indicecumplimientoI; r++) {
                        if (cumplimientoI[r] > 0.0) {
                            sumaCumplimientoIndicadores += cumplimientoI[r];
                            calificados++;
                        }
                    }
                    cantidadIndicadoresXcaracteristica += indicador.size();
                    /* 5. Calculamos el cumplimiento de la caracteristica*/
                    if (sumaCumplimientoIndicadores > 0) {
                        cumplimientoC[j + cantidadCaracteristicasXFactor] = (float) sumaCumplimientoIndicadores / calificados;
                        cumplimientoC[j + cantidadCaracteristicasXFactor] = (float) (Math.rint(cumplimientoC[j + cantidadCaracteristicasXFactor] * 10) / 10);
                    }
                }

                /* 6. Cumplimiento de los factores*/
                for (int ic = 0; ic < factores.get(i).getCaracteristicaList().size(); ic++) {
                    if (cumplimientoC[ic + cantidadCaracteristicasXFactor] != 0) {
                        suma2 += cumplimientoC[ic + cantidadCaracteristicasXFactor];
                    }
                }
                cantidadCaracteristicasXFactor += caracteristica.size();
                cumplimientoF[i] = suma2 / caracteristica.size();
                cumplimientoF[i] = (float) (Math.rint(cumplimientoF[i] * 10) / 10);

            }

            sesion.setAttribute("cumplimientoF", cumplimientoF);
            sesion.setAttribute("cumplimientoC", cumplimientoC);
            sesion.setAttribute("cumplimientoI", cumplimientoI);
            sesion.setAttribute("cumplimientoISap", cumplimientoISap);
            sesion.setAttribute("factores", factores);

        }
        return "/WEB-INF/vista/comitePrograma/proceso/informe/informeGeneral2.jsp";
    }

    private IndicadorFacade lookupIndicadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (IndicadorFacade) c.lookup("java:global/sapenfermeria/IndicadorFacade!com.sap.ejb.IndicadorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
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

    private CaracteristicaFacade lookupCaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (CaracteristicaFacade) c.lookup("java:global/sapenfermeria/CaracteristicaFacade!com.sap.ejb.CaracteristicaFacade");
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

    private NumericadocumentalFacade lookupNumericadocumentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (NumericadocumentalFacade) c.lookup("java:global/sapenfermeria/NumericadocumentalFacade!com.sap.ejb.NumericadocumentalFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PonderacionfactorFacade lookupPonderacionfactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacionfactorFacade) c.lookup("java:global/sapenfermeria/PonderacionfactorFacade!com.sap.ejb.PonderacionfactorFacade");
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

    private ResultadoevaluacionFacade lookupResultadoevaluacionFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ResultadoevaluacionFacade) c.lookup("java:global/sapenfermeria/ResultadoevaluacionFacade!com.sap.ejb.ResultadoevaluacionFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
