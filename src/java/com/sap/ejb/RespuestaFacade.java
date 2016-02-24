/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Respuesta;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ususario
 */
@Stateless
public class RespuestaFacade extends AbstractFacade<Respuesta> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RespuestaFacade() {
        super(Respuesta.class);
    }
    
}
