/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Pregunta;
import com.sap.entity.Respuestas;
import com.sap.entity.Rol;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Ususario
 */
@Stateless
public class RespuestasFacade extends AbstractFacade<Respuestas> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public List findByPreguntaRol(Pregunta p, Rol r) {
        Query q = em.createNamedQuery("Respuestas.findByPreguntaRol");
        q.setParameter("idPregunta", p);
        q.setParameter("idRol", r);
        return q.getResultList();
    }

    public RespuestasFacade() {
        super(Respuestas.class);
    }
    
}
