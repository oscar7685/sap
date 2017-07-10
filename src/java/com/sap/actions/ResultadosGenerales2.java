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
        Modelo modelo = (Modelo) sesion.getAttribute("Modelo");
        List<Indicador> indicadores = indicadorFacade.findByModeloYenOrden(modelo);

        Numericadocumental[] numericaO = new Numericadocumental[indicadores.size()]; //numerica
        Numericadocumental[] documentalO = new Numericadocumental[indicadores.size()]; //documental

        double[] numerico = new double[indicadores.size()]; //numerica x indicador
        double[] documental = new double[indicadores.size()]; //documental x indicador
        double[] promedioE = new double[indicadores.size()]; //encuesta x indicador

        List<Factor> factores = factorFacade.findByModelo(modelo);
        List<Caracteristica> caracteristicas = caracteristicaFacade.findByModelo(modelo);

        int cantidadIndF[] = new int[factores.size()];
        int cantidadIndC[] = new int[caracteristicas.size()];
        int indicefactor = 0;
        for (int i = 0; i < caracteristicas.size(); i++) {
            if (caracteristicas.get(i).getFactorId().getCodigo().equals(factores.get(indicefactor).getCodigo())) {
                cantidadIndC[i] = indicadorFacade.findByCaracteristica(caracteristicas.get(i)).size();
                cantidadIndF[indicefactor] += cantidadIndC[i];
            } else {
                indicefactor++;
                cantidadIndC[i] = indicadorFacade.findByCaracteristica(caracteristicas.get(i)).size();
                cantidadIndF[indicefactor] += cantidadIndC[i];
            }

        }

        List<Ponderacionfactor> ponderacionesF = ponderacionfactorFacade.findByList("procesoId", proceso); //ponderacion de los factores
        List<Ponderacioncaracteristica> ponderacionesCara = ponderacioncaracteristicaFacade.findByList("procesoId", proceso); //ponderacion de las caracteristicas

        float cumplimientoF[] = new float[factores.size()];

        float cumplimientoC[] = new float[caracteristicas.size()]; //cumplimiento x caracteristica
        double ponderacionC[] = new double[caracteristicas.size()]; //ponderacion x caracteristica
        float cumplimientoI[] = new float[indicadores.size()]; //cumplimiento indicadores

        float promedioPregunta = 0;

        List<List> PromedioPreguntasXindicador = new ArrayList<List>();
        List<List> PromedioPreguntasXindicadorEs = new ArrayList<List>();
        List<List> PromedioPreguntasXindicadorDo = new ArrayList<List>();
        List<List> PromedioPreguntasXindicadorAd = new ArrayList<List>();
        List<List> PromedioPreguntasXindicadorEg = new ArrayList<List>();
        List<List> PromedioPreguntasXindicadorDi = new ArrayList<List>();
        List<List> PromedioPreguntasXindicadorEm = new ArrayList<List>();
        List<List> PromedioPreguntasXindicadorVi = new ArrayList<List>();

        int caracActual = indicadores.get(0).getCaracteristicaId().getId();
        int factorActual = indicadores.get(0).getCaracteristicaId().getFactorId().getId();
        double ponderacionCActual = ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(indicadores.get(0).getCaracteristicaId(), proceso).getPonderacion();
        float sumaPonC = 0;
        float sumaC = 0;
        float sumaI = 0;
        float numI = 0;

        float calificacionNum = 0;
        float calificacionDoc = 0;
        float promedioEstudiantes, promedioDocentes, promedioAdmin, promedioEgre, promedioDire, promedioEmpl, promedioVi;
        int numEst, numDoc, numAdmi, numEgr, numDire, numEmp, numVi;
        int indice = 0;
        int indiceCarac = 0;
        int indiceFactor = 0;
        float sumaPromediosXpregunta;
        for (Indicador in : indicadores) {
            List promedioxPregunta = new ArrayList();
            List promedioxPreguntaEs = new ArrayList();
            List promedioxPreguntaDo = new ArrayList();
            List promedioxPreguntaAd = new ArrayList();
            List promedioxPreguntaEg = new ArrayList();
            List promedioxPreguntaDi = new ArrayList();
            List promedioxPreguntaEm = new ArrayList();
            List promedioxPreguntaVi = new ArrayList();
            sumaPromediosXpregunta = 0;

            calificacionNum = 0;
            calificacionDoc = 0;
            promedioPregunta = 0;
            List<Instrumento> instr = in.getInstrumentoList();
            for (int i = 0; i < instr.size(); i++) {
                Instrumento instrumento = instr.get(i);
                if (instrumento.getId() == 1) {
                    List<Pregunta> preguntas = in.getPreguntaList();
                    int preguntasContestadasEnElActualIndicador = 0;
                    for (int l = 0; l < preguntas.size(); l++) {

                        Pregunta pregunta = preguntas.get(l);
                        promedioPregunta = 0;

                        List<Resultadoevaluacion> respuestas = resultadoevaluacionFacade.findByList2("encabezadoId.procesoId", proceso, "preguntaId", pregunta);
                        if (respuestas.size() > 0) {
                            preguntasContestadasEnElActualIndicador++;
                        }
                        promedioEstudiantes = 0;
                        promedioDocentes = 0;
                        promedioAdmin = 0;
                        promedioEgre = 0;
                        promedioDire = 0;
                        promedioEmpl = 0;
                        promedioVi = 0;
                        numEst = 0;
                        numDoc = 0;
                        numAdmi = 0;
                        numEgr = 0;
                        numDire = 0;
                        numEmp = 0;
                        numVi = 0;
                        for (int n = 0; n < respuestas.size(); n++) {
                            if (respuestas.get(n).getEncabezadoId().getEstado().equals("terminado") && respuestas.get(n).getEncabezadoId().getProcesoId().getId() == proceso.getId()
                                    && respuestas.get(n).getRespuesta() != null && (respuestas.get(n).getRespuesta().equals("1") || respuestas.get(n).getRespuesta().equals("2")
                                    || respuestas.get(n).getRespuesta().equals("3") || respuestas.get(n).getRespuesta().equals("4") || respuestas.get(n).getRespuesta().equals("5"))) {

                                if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 1) {
                                    numEst++;
                                    promedioEstudiantes += Integer.parseInt(respuestas.get(n).getRespuesta());
                                } else if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 2) {
                                    numDoc++;
                                    promedioDocentes += Integer.parseInt(respuestas.get(n).getRespuesta());
                                } else if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 3) {
                                    numAdmi++;
                                    promedioAdmin += Integer.parseInt(respuestas.get(n).getRespuesta());
                                } else if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 4) {
                                    numEgr++;
                                    promedioEgre += Integer.parseInt(respuestas.get(n).getRespuesta());
                                } else if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 5) {
                                    numDire++;
                                    promedioDire += Integer.parseInt(respuestas.get(n).getRespuesta());
                                } else if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 6) {
                                    numEmp++;
                                    promedioEmpl += Integer.parseInt(respuestas.get(n).getRespuesta());
                                } else if (respuestas.get(n).getEncabezadoId().getFuenteId().getId() == 7) {
                                    numVi++;
                                    promedioVi += Integer.parseInt(respuestas.get(n).getRespuesta());
                                }

                            }
                        }

                        float promedioXpregunta = 0;
                        int FuentesPregunta = 0;
                        /* 1. Calculamos el promedio de la pregunta en cada encuesta*/
                        if (numEst != 0) {
                            promedioEstudiantes /= numEst;
                            promedioEstudiantes = (float) Math.rint(promedioEstudiantes * 10) / 10;
                            promedioXpregunta += promedioEstudiantes;
                            FuentesPregunta++;
                        }
                        if (numDoc != 0) {
                            promedioDocentes /= numDoc;
                            promedioDocentes = (float) Math.rint(promedioDocentes * 10) / 10;
                            promedioXpregunta += promedioDocentes;
                            FuentesPregunta++;
                        }
                        if (numAdmi != 0) {
                            promedioAdmin /= numAdmi;
                            promedioAdmin = (float) Math.rint(promedioAdmin * 10) / 10;
                            promedioXpregunta += promedioAdmin;
                            FuentesPregunta++;
                        }
                        if (numEgr != 0) {
                            promedioEgre /= numEgr;
                            promedioEgre = (float) Math.rint(promedioEgre * 10) / 10;
                            promedioXpregunta += promedioEgre;
                            FuentesPregunta++;
                        }
                        if (numDire != 0) {
                            promedioDire /= numDire;
                            promedioDire = (float) Math.rint(promedioDire * 10) / 10;
                            promedioXpregunta += promedioDire;
                            FuentesPregunta++;
                        }
                        if (numEmp != 0) {
                            promedioEmpl /= numEmp;
                            promedioEmpl = (float) Math.rint(promedioEmpl * 10) / 10;
                            promedioXpregunta += promedioEmpl;
                            FuentesPregunta++;
                        }
                        if (numVi != 0) {
                            promedioVi /= numVi;
                            promedioVi = (float) Math.rint(promedioVi * 10) / 10;
                            promedioXpregunta += promedioVi;
                            FuentesPregunta++;
                        }

                        /* 2. Calculamos el promedio de la pregunta teniendo en cuenta los promedios por encuesta*/
                        if (FuentesPregunta != 0) {
                            promedioXpregunta /= FuentesPregunta;
                            promedioXpregunta = (float) Math.rint(promedioXpregunta * 10) / 10;
                        }

                        sumaPromediosXpregunta += promedioXpregunta;
                        promedioxPregunta.add(promedioXpregunta);
                        promedioxPreguntaEs.add(promedioEstudiantes);
                        promedioxPreguntaDo.add(promedioDocentes);
                        promedioxPreguntaAd.add(promedioAdmin);
                        promedioxPreguntaEg.add(promedioEgre);
                        promedioxPreguntaDi.add(promedioDire);
                        promedioxPreguntaEm.add(promedioEmpl);
                        promedioxPreguntaVi.add(promedioVi);

                    }
                    /* 3. Calculamos el promedio de la percepcion en el indicador*/
                    if (sumaPromediosXpregunta > 0) {
                        promedioPregunta = (float) sumaPromediosXpregunta / preguntasContestadasEnElActualIndicador;
                        promedioPregunta = (float) Math.rint(promedioPregunta * 10) / 10;
                        promedioE[indice] = (double) promedioPregunta;
                    }
                } else if (instrumento.getId() == 2) {
                    Numericadocumental numDoc1 = numericadocumentalFacade.findBySingle3("indicadorId", in, "procesoId", proceso, "instrumentoId", instrumento);
                    if (numDoc1 != null) {
                        numericaO[indice] = numDoc1;
                        calificacionNum = numDoc1.getEvaluacion();
                        numerico[indice] = calificacionNum;
                    } else {
                        numerico[indice] = 0;
                    }
                } else if (instrumento.getId() == 3) {
                    Numericadocumental numDoc2 = numericadocumentalFacade.findBySingle3("indicadorId", in, "procesoId", proceso, "instrumentoId", instrumento);
                    if (numDoc2 != null) {
                        documentalO[indice] = numDoc2;
                        calificacionDoc = numDoc2.getEvaluacion();
                        documental[indice] = calificacionDoc;
                    } else {
                        documental[indice] = 0;
                    }

                }

            }
            /* 4. Calcular el cumplimiento del indicador*/
            if (calificacionNum != 0 && calificacionDoc != 0 && promedioPregunta != 0) {
                cumplimientoI[indice] = (promedioPregunta + calificacionNum + calificacionDoc) / 3;
            } else if (calificacionNum != 0 && promedioPregunta != 0) {
                cumplimientoI[indice] = (calificacionNum + promedioPregunta) / 2;
            } else if (calificacionDoc != 0 && promedioPregunta != 0) {
                cumplimientoI[indice] = (promedioPregunta + calificacionDoc) / 2;
            } else if (calificacionDoc != 0 && calificacionNum != 0) {
                cumplimientoI[indice] = (calificacionNum + calificacionDoc) / 2;
            } else if (calificacionDoc != 0) {
                cumplimientoI[indice] = calificacionDoc;
            } else if (calificacionNum != 0) {
                cumplimientoI[indice] = calificacionNum;
            } else if (promedioPregunta != 0) {
                cumplimientoI[indice] = promedioPregunta;
            }

            cumplimientoI[indice] = (float) (Math.rint(cumplimientoI[indice] * 10) / 10); //cumplimiento de cada indicador

            /* 5. Calculamos el cumplimiento de la caracteristica*/
            if (in.getCaracteristicaId().getId() == caracActual) {
                if (cumplimientoI[indice] > 0) {
                    numI++;//contamos los indicadores de una misma caracteristica
                    sumaI += cumplimientoI[indice];//sumamos los cumplimientos de los indicadores de una misma caracteristica
                }

            } else {
                //cumplimiento de caracteristicas tomando en cuenta solo los indicadores antes del cambio
                cumplimientoC[indiceCarac] = sumaI / numI;
                cumplimientoC[indiceCarac] = (float) (Math.rint(cumplimientoC[indiceCarac] * 10) / 10);
                sumaPonC += ponderacionCActual; //vamos sumando las ponderaciones de las caracteristicas hasta antes del cambio
                sumaC += cumplimientoC[indiceCarac] * ponderacionCActual; //vamos sumando los cumplimientos de cada una de las caracteristicas

                //cambiamos la ponderacion a la actual
                ponderacionCActual = ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(indicadores.get(0).getCaracteristicaId(), proceso).getPonderacion();
                ponderacionC[indiceCarac] = ponderacionCActual;
                indiceCarac++; //acabamos de entrar a una nueva caracteristica
                caracActual = in.getCaracteristicaId().getId();//sacamos el id de la caracteristica actual
                sumaI = 0;
                numI = 0;
                if (cumplimientoI[indice] > 0) {
                    sumaI = cumplimientoI[indice];//inicializamos la suma de cumplimientos xq acabamos de cambiar de caracteristica
                    numI++;//inicializamos en 1 el numero de indicadores
                }

            }

            /* 6. Cumplimiento de los factores*/
            if (in.getCaracteristicaId().getFactorId().getId() != factorActual) {
                if (sumaPonC != 0) {
                    cumplimientoF[indiceFactor] = sumaC / sumaPonC;//sacamos el cumplimiento del factor inmediatamente anterior
                    cumplimientoF[indiceFactor] = (float) (Math.rint(cumplimientoF[indiceFactor] * 10) / 10);
                }
                sumaPonC = 0;
                sumaC = 0;
                indiceFactor++;
                factorActual = in.getCaracteristicaId().getFactorId().getId();//actualizamos el factor
            }
            indice++;
            if (indice == indicadores.size()) {
                cumplimientoC[indiceCarac] = sumaI / numI;  //cumplimiento de la ultima caracteristica
                ponderacionCActual = ponderacioncaracteristicaFacade.findByCaracteristicaYProceso(indicadores.get(0).getCaracteristicaId(), proceso).getPonderacion();
                ponderacionC[indiceCarac] = ponderacionCActual;
                sumaPonC += ponderacionCActual;
                sumaC += cumplimientoC[indiceCarac] * ponderacionCActual;
                if (sumaPonC != 0) {
                    cumplimientoF[indiceFactor] = sumaC / sumaPonC;//cumplimiento del ultimo factor
                    cumplimientoF[indiceFactor] = (float) (Math.rint(cumplimientoF[indiceFactor] * 10) / 10);
                }
            }
            PromedioPreguntasXindicador.add(promedioxPregunta);
            PromedioPreguntasXindicadorEs.add(promedioxPreguntaEs);
            PromedioPreguntasXindicadorDo.add(promedioxPreguntaDo);
            PromedioPreguntasXindicadorAd.add(promedioxPreguntaAd);
            PromedioPreguntasXindicadorEg.add(promedioxPreguntaEg);
            PromedioPreguntasXindicadorDi.add(promedioxPreguntaDi);
            PromedioPreguntasXindicadorEm.add(promedioxPreguntaEm);
            PromedioPreguntasXindicadorVi.add(promedioxPreguntaVi);
        }
        sesion.setAttribute("ponderacionesF", ponderacionesF);
        sesion.setAttribute("cumplimientoF", cumplimientoF);
        sesion.setAttribute("ponderacionesC", ponderacionC);
        sesion.setAttribute("ponderacionesCara", ponderacionesCara);
        sesion.setAttribute("cumplimientoC", cumplimientoC);
        sesion.setAttribute("cumplimientoI", cumplimientoI);
        sesion.setAttribute("listIndicadores", indicadores);
        sesion.setAttribute("promedioE", promedioE);
        sesion.setAttribute("PromedioPreguntasXindicadorEs", PromedioPreguntasXindicadorEs);
        sesion.setAttribute("PromedioPreguntasXindicadorDo", PromedioPreguntasXindicadorDo);
        sesion.setAttribute("PromedioPreguntasXindicadorAd", PromedioPreguntasXindicadorAd);
        sesion.setAttribute("PromedioPreguntasXindicadorEg", PromedioPreguntasXindicadorEg);
        sesion.setAttribute("PromedioPreguntasXindicadorDi", PromedioPreguntasXindicadorDi);
        sesion.setAttribute("PromedioPreguntasXindicadorEm", PromedioPreguntasXindicadorEm);
        sesion.setAttribute("PromedioPreguntasXindicadorVi", PromedioPreguntasXindicadorVi);
        sesion.setAttribute("PromedioPreguntasXindicador", PromedioPreguntasXindicador);
        sesion.setAttribute("cantidadIndF", cantidadIndF);
        sesion.setAttribute("cantidadIndC", cantidadIndC);
        sesion.setAttribute("factores", factores);
        sesion.setAttribute("caracteristicas", caracteristicas);

        sesion.setAttribute("numerico", numerico);
        sesion.setAttribute("numericaO", numericaO);
        sesion.setAttribute("documental", documental);
        sesion.setAttribute("documentalO", documentalO);

        return "/WEB-INF/vista/comitePrograma/proceso/informe/informeGeneral2.jsp";
    }

    private IndicadorFacade lookupIndicadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (IndicadorFacade) c.lookup("java:global/sap/IndicadorFacade!com.sap.ejb.IndicadorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private FactorFacade lookupFactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (FactorFacade) c.lookup("java:global/sap/FactorFacade!com.sap.ejb.FactorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private CaracteristicaFacade lookupCaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (CaracteristicaFacade) c.lookup("java:global/sap/CaracteristicaFacade!com.sap.ejb.CaracteristicaFacade");
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

    private NumericadocumentalFacade lookupNumericadocumentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (NumericadocumentalFacade) c.lookup("java:global/sap/NumericadocumentalFacade!com.sap.ejb.NumericadocumentalFacade");
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

    private ResultadoevaluacionFacade lookupResultadoevaluacionFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ResultadoevaluacionFacade) c.lookup("java:global/sap/ResultadoevaluacionFacade!com.sap.ejb.ResultadoevaluacionFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

}
