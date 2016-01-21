/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Egresado;
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
public class EgresadoFacade extends AbstractFacade<Egresado> {

    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EgresadoFacade() {
        super(Egresado.class);
    }
    
    public List findByPrograma(Programa p) {
        Query q = em.createNamedQuery("Egresado.findByPrograma");
        q.setParameter("programa", p);
        return q.getResultList();
}
}
