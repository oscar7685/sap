/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Muestradocente;
import com.sap.entity.Muestrapersona;
import com.sap.entity.Proceso;
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
public class MuestradocenteFacade extends AbstractFacade<Muestradocente> {

    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MuestradocenteFacade() {
        super(Muestradocente.class);
    }

    public List findByMuestraConEncabezado(Proceso p) {
        Query q = em.createNamedQuery("Muestradocente.findByMuestraConEncabezado");
        q.setParameter("proceso", p);
        return q.getResultList();
    }

    public List findByMuestraSinEncabezado(Proceso p) {
        Query q = em.createNamedQuery("Muestradocente.findByMuestraSinEncabezado");
        q.setParameter("proceso", p);
        return q.getResultList();
    }

    public List findByMuestraPersona(Muestrapersona p) {
        Query q = em.createNamedQuery("Muestradocente.findByMuestraPersonaId");
        q.setParameter("muestrapersona", p);
        return q.getResultList();
    }
}
