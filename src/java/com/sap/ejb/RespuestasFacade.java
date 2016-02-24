/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Respuestas;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ususario
 */
@Stateless
public class RespuestasFacade extends AbstractFacade<Respuestas> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RespuestasFacade() {
        super(Respuestas.class);
    }
    
}
