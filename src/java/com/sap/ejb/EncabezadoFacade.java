/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Encabezado;
import com.sap.entity.Encuesta;
import com.sap.entity.Fuente;
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
public class EncabezadoFacade extends AbstractFacade<Encabezado> {

    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EncabezadoFacade() {
        super(Encabezado.class);
    }
    
    public List findByVars(Proceso p, Encuesta e, Fuente f, Muestrapersona persona) {
        Query q = em.createNamedQuery("Encabezado.findByVars");
        q.setParameter("proceso", p);
        q.setParameter("persona", persona);
        q.setParameter("fuente", f);
        q.setParameter("encuesta", e);
        return q.getResultList();
}
    public Encabezado findByUltimo() {
        Query q = em.createNamedQuery("Encabezado.findByUltimo");
        q.setMaxResults(1);
        return (Encabezado)q.getSingleResult() ;
    }
    
    public List findByComentarios(Fuente f, Proceso p) {
        Query q = em.createNamedQuery("Encabezado.findByComentarios");
        q.setParameter("fuente", f);
        q.setParameter("proceso", p);
        return q.getResultList();
    }
}
