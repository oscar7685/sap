/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Factor;
import com.sap.entity.Modelo;
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
public class FactorFacade extends AbstractFacade<Factor> {

    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FactorFacade() {
        super(Factor.class);
    }
    
    public List findByModelo(Modelo m) {
        Query q = em.createNamedQuery("Factor.findByModelo");
        q.setParameter("modelo", m);
        return q.getResultList();
}
    
}
