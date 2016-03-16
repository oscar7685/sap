/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Encuesta;
import com.sap.entity.Factor;
import com.sap.entity.Pregunta;
import com.sap.entity.Programa;
import com.sap.entity.Respuestas;
import com.sap.entity.Rol;
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
public class RespuestasFacade extends AbstractFacade<Respuestas> {

    @PersistenceContext(unitName = "sapPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public List findByPreguntaRol(Pregunta p, Rol r) {
        Query q = em.createNamedQuery("Respuestas.findByPreguntaRol");
        q.setParameter("idPregunta", p);
        q.setParameter("idRol", r);
        return q.getResultList();
    }
    
    public List findByEncuesta(Encuesta e) {
        Query q = em.createNamedQuery("Respuestas.findByEncuesta");
        q.setParameter("idEncuesta", e);
        return q.getResultList();
    }
    public List findByFactor(Factor f) {
        Query q = em.createNamedQuery("Respuestas.findByFactor");
        q.setParameter("idFactor", f);
        return q.getResultList();
    }

    public List findByPreguntaRol(Pregunta p, Rol r, Programa prog) {
        Query q = em.createNamedQuery("Respuestas.findByPreguntaRolxPrograma");
        q.setParameter("idPregunta", p);
        q.setParameter("idRol", r);
        q.setParameter("idPrograma", prog);
        return q.getResultList();
    }

    public List findByContestados() {
        Query q = em.createNativeQuery("select participante.idparticipante, rol.rol, programa.nombre from respuestas\n"
                + "inner join participante on participante.idparticipante = respuestas.participante_idparticipante\n"
                + "inner join participante_has_rol on participante_has_rol.participante_idparticipante = participante.idparticipante\n"
                + "inner join rol on rol.id = participante_has_rol.rol_id\n"
                + "INNER JOIN programa on programa.id = participante_has_rol.programa_id\n"
                + "where participante.proceso_id = '1'\n"
                + "GROUP BY participante.idparticipante, rol.rol, programa.nombre");
        return q.getResultList();
    }

    public RespuestasFacade() {
        super(Respuestas.class);
    }
}
