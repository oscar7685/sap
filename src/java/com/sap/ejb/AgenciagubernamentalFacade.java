/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Agenciagubernamental;
import com.sap.entity.Programa;
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
public class AgenciagubernamentalFacade extends AbstractFacade<Agenciagubernamental> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AgenciagubernamentalFacade() {
        super(Agenciagubernamental.class);
    }
    
    public List findByPrograma(Programa p) {
        Query q = em.createNamedQuery("Agenciagubernamental.findByPrograma");
        q.setParameter("programa", p);
        return q.getResultList();
    }
    
}
