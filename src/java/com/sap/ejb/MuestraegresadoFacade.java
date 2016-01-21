/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Muestraegresado;
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
public class MuestraegresadoFacade extends AbstractFacade<Muestraegresado> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MuestraegresadoFacade() {
        super(Muestraegresado.class);
}
    public List findByMuestraPersona(Muestrapersona p) {
        Query q = em.createNamedQuery("Muestraegresado.findByMuestraPersonaId");
        q.setParameter("muestrapersona", p);
        return q.getResultList();
    }
}
