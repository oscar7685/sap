/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Caracteristica;
import com.sap.entity.Factor;
import com.sap.entity.Modelo;
import com.sap.entity.Proceso;
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
public class CaracteristicaFacade extends AbstractFacade<Caracteristica> {

    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CaracteristicaFacade() {
        super(Caracteristica.class);
    }

    public List findByModelo(Modelo m) {
        Query q = em.createNamedQuery("Caracteristica.findByModelo");
        q.setParameter("modelo", m);
        return q.getResultList();
    }

    public List findByModeloOptimizada(Modelo m) {
        Query q = em.createNamedQuery("Caracteristica.findByModeloOptimizada");
        q.setParameter("modelo", m);
        return q.getResultList();
    }

    public List findByFactor(Factor f) {
        Query q = em.createNamedQuery("Caracteristica.findByFactor");
        q.setParameter("factor", f);
        return q.getResultList();
    }
}
