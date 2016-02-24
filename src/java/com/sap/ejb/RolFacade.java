/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Rol;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ususario
 */
@Stateless
public class RolFacade extends AbstractFacade<Rol> {
    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public RolFacade() {
        super(Rol.class);
    }
    
}
