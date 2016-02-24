/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.ParticipanteHasRol;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ususario
 */
@Stateless
public class ParticipanteHasRolFacade extends AbstractFacade<ParticipanteHasRol> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ParticipanteHasRolFacade() {
        super(ParticipanteHasRol.class);
    }
    
}
