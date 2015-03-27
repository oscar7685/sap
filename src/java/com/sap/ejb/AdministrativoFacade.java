/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Administrativo;
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
public class AdministrativoFacade extends AbstractFacade<Administrativo> {

    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AdministrativoFacade() {
        super(Administrativo.class);
    }

    public List findByPrograma(Programa p) {
        Query q = em.createNamedQuery("Administrativo.findByPrograma");
        q.setParameter("programa", p);
        return q.getResultList();
    }
}
