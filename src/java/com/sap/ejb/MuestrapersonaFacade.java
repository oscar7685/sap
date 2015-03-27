/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Muestra;
import com.sap.entity.Muestrapersona;
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
public class MuestrapersonaFacade extends AbstractFacade<Muestrapersona> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MuestrapersonaFacade() {
        super(Muestrapersona.class);
    }
     public List findByCedula(String c) {
        Query q = em.createNamedQuery("Muestrapersona.findByCedula");
        q.setParameter("cedula", c);
        return q.getResultList();
    }
     public List findByMuestraId(Muestra m) {
        Query q = em.createNamedQuery("Muestrapersona.findByMuestraId");
        q.setParameter("muestra", m);
        return q.getResultList();
    }
    
}
