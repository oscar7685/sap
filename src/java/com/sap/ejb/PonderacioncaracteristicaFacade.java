/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Caracteristica;
import com.sap.entity.Ponderacioncaracteristica;
import com.sap.entity.Proceso;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Ususario
 */
@Stateless
public class PonderacioncaracteristicaFacade extends AbstractFacade<Ponderacioncaracteristica> {

    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PonderacioncaracteristicaFacade() {
        super(Ponderacioncaracteristica.class);
    }
    
    public Ponderacioncaracteristica findByCaracteristicaYProceso(Caracteristica c, Proceso p) {
        Query q = em.createNamedQuery("Ponderacioncaracteristica.findByCaracteristicaYProceso");
        q.setParameter("caracteristica", c);
        q.setParameter("proceso", p);
        return (Ponderacioncaracteristica) q.getSingleResult();
}
}
