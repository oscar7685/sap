/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.EvaluarcaracteristicaFacade;
import com.sap.ejb.NumericadocumentalFacade;
import com.sap.ejb.PonderacioncaracteristicaFacade;
import com.sap.ejb.PonderacionfactorFacade;
import com.sap.ejb.ResultadoevaluacionFacade;
import com.sap.entity.Caracteristica;
import com.sap.entity.Encuesta;
import com.sap.entity.Evaluarcaracteristica;
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
public class InformeMatrizFactores implements Action {

    PonderacionfactorFacade ponderacionfactorFacade = lookupPonderacionfactorFacadeBean();
    PonderacioncaracteristicaFacade ponderacioncaracteristicaFacade = lookupPonderacioncaracteristicaFacadeBean();
    EvaluarcaracteristicaFacade evaluarcaracteristicaFacade = lookupEvaluarcaracteristicaFacadeBean();

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
                Evaluarcaracteristica ev = evaluarcaracteristicaFacade.findBySingle2("caracteristicaId", caracteristicas.get(j), "procesoId", p);
                cumplimientoC2[j] = ev.getEvaluacion();
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

    private EvaluarcaracteristicaFacade lookupEvaluarcaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (EvaluarcaracteristicaFacade) c.lookup("java:global/sapnaval/EvaluarcaracteristicaFacade!com.sap.ejb.EvaluarcaracteristicaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PonderacioncaracteristicaFacade lookupPonderacioncaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacioncaracteristicaFacade) c.lookup("java:global/sapnaval/PonderacioncaracteristicaFacade!com.sap.ejb.PonderacioncaracteristicaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PonderacionfactorFacade lookupPonderacionfactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacionfactorFacade) c.lookup("java:global/sapnaval/PonderacionfactorFacade!com.sap.ejb.PonderacionfactorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
