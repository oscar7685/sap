/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Encabezado;
import com.sap.entity.Encuesta;
import com.sap.entity.Pregunta;
import com.sap.entity.Proceso;
import com.sap.entity.Resultadoevaluacion;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author Ususario
 */
@Stateless
public class ResultadoevaluacionFacade extends AbstractFacade<Resultadoevaluacion> {

    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ResultadoevaluacionFacade() {
        super(Resultadoevaluacion.class);
    }

    public List findByEncabezado(Encabezado e) {
        Query q = em.createNamedQuery("Resultadoevaluacion.findByEncabezado");
        q.setParameter("encabezado", e);
        return q.getResultList();
    }

    public List findResultadosxPreguntaxEncuestaxProceso(Proceso p, Encuesta e, Pregunta pre) {
        Query q = em.createNamedQuery("Resultadoevaluacion.findResultadosxPreguntaxEncuestaxProceso");
        q.setParameter("pregunta", pre);
        q.setParameter("encuesta", e);
        q.setParameter("proceso", p);
        return q.getResultList();
    }

    public List findResultadosxPreguntaxEncuestaxProceso2(Proceso p, Encuesta e, Pregunta pre) {
        Query q = em.createNativeQuery("SELECT resultadoevaluacion.* FROM resultadoevaluacion \n"
                + "join pregunta on pregunta.id = resultadoevaluacion.pregunta_id\n"
                + "join encabezado on encabezado.id = resultadoevaluacion.encabezado_id\n"
                + "join encuesta on encuesta.id = encabezado.encuesta_id\n"
                + "join proceso on proceso.id = encabezado.proceso_id\n"
                + "WHERE pregunta.id='" + pre.getId() + "' and encuesta.id='"+e.getId()+"' and \n"
                + "proceso.id='"+p.getId()+"' and encabezado.estado='terminado' \n"
                + "and (resultadoevaluacion.respuesta='5' or resultadoevaluacion.respuesta='4' or resultadoevaluacion.respuesta='3' \n"
                + "or resultadoevaluacion.respuesta='2' or resultadoevaluacion.respuesta='1')");
        
        return q.getResultList();
    }

    public List findResultadosxPreguntaxEncuestaxProcesoxValor(Proceso p, Encuesta e, Pregunta pre, String valor) {
        Query q = em.createNamedQuery("Resultadoevaluacion.findResultadosxPreguntaxEncuestaxProcesoxValor");
        q.setParameter("pregunta", pre);
        q.setParameter("encuesta", e);
        q.setParameter("proceso", p);
        q.setParameter("valor", valor);
        return q.getResultList();
    }

    public List findResultadosxPreguntaxEncuestaxProcesoxValor1(Proceso p, Pregunta pre) {
        Query q = em.createNamedQuery("Resultadoevaluacion.findResultadosxPreguntaxEncuestaxProcesoxValor1");
        q.setParameter("pregunta", pre);
        q.setParameter("proceso", p);
        return q.getResultList();
    }

    public List findResultadosxPreguntaxEncuestaxProcesoxValor2(Proceso p, Pregunta pre, Encuesta e) {
        Query q = em.createNamedQuery("Resultadoevaluacion.findResultadosxPreguntaxEncuestaxProcesoxValor2");
        q.setParameter("pregunta", pre);
        q.setParameter("proceso", p);
        q.setParameter("encuesta", e);
        return q.getResultList();
    }
}
