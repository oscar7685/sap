/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.ejb;

import com.sap.entity.Caracteristica;
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

    public List findByFactor2(Factor f) {
        Query q = em.createNativeQuery("select respuestas.respuesta from respuestas\n"
                + "inner join pregunta on pregunta.id = respuestas.pregunta_id\n"
                + "left join pregunta as padre on padre.id = pregunta.pregunta_padre\n"
                + "inner join pregunta_has_caracteristica on (pregunta_has_caracteristica.pregunta_id =  pregunta.id  or pregunta_has_caracteristica.pregunta_id  = padre.id)\n"
                + "inner join caracteristica on caracteristica.id = pregunta_has_caracteristica.caracteristica_id\n"
                + "where caracteristica.factor_id = '" + f.getId() + "'");
        //q.setParameter("idFactor", f);
        return q.getResultList();
    }

    public List findByCaracteristica2(Caracteristica c) {
        Query q = em.createNativeQuery("select respuestas.respuesta from respuestas\n"
                + "inner join pregunta on pregunta.id = respuestas.pregunta_id\n"
                + "left join pregunta as padre on padre.id = pregunta.pregunta_padre\n"
                + "inner join pregunta_has_caracteristica on (pregunta_has_caracteristica.pregunta_id =  pregunta.id  or pregunta_has_caracteristica.pregunta_id  = padre.id)\n"
                + "inner join caracteristica on caracteristica.id = pregunta_has_caracteristica.caracteristica_id\n"
                + "where caracteristica.id = '" + c.getId() + "'");
        //q.setParameter("idFactor", f);
        return q.getResultList();
    }

    public List findByPreguntayRol(int pregunta, int rol) {
        Query q = em.createNativeQuery("select sum(case when respuestas.respuesta = '4' then '1' when respuestas.respuesta = '5' then '1' else '0' end)  as dma, count(*) as total, sum(case when respuestas.respuesta = '0' then '1' else '0' end)  as ceros from respuestas \n"
                + "inner join pregunta on pregunta.id = respuestas.pregunta_id\n"
                + "inner join participante on participante.idparticipante = respuestas.participante_idparticipante\n"
                + "inner join participante_has_rol on participante_has_rol.participante_idparticipante = participante.idparticipante\n"
                + "inner join rol on rol.id = participante_has_rol.rol_id\n"
                + "where respuestas.pregunta_id = '" + pregunta + "' and rol.id = '" + rol + "' \n"
                + "GROUP BY pregunta.id");
        return q.getResultList();
    }

    public List findByRolYEncuesta(int rol, int encuesta) {
        Query q = em.createNativeQuery("select sum(case when respuestas.respuesta = '4' then '1' when respuestas.respuesta = '5' then '1' else '0' end)  as dma, count(*) as total, sum(case when respuestas.respuesta = '0' then '1' else '0' end)  as ceros from respuestas \n"
                + "inner join pregunta on pregunta.id = respuestas.pregunta_id\n"
                + "left join pregunta as padre on padre.id = pregunta.pregunta_padre\n"
                + "inner join encuestahaspregunta on (encuestahaspregunta.pregunta_id = pregunta.id or encuestahaspregunta.pregunta_id = padre.id)\n"
                + "inner join encuesta on encuesta.id = encuestahaspregunta.encuesta_id\n"
                + "inner join participante on participante.idparticipante = respuestas.participante_idparticipante\n"
                + "inner join participante_has_rol on participante_has_rol.participante_idparticipante = participante.idparticipante\n"
                + "inner join rol on rol.id = participante_has_rol.rol_id AND encuesta.id = rol.idencuesta1\n"
                + "where rol.id = '" + rol + "' and encuestahaspregunta.encuesta_id = '" + encuesta + "'\n"
                + "GROUP BY rol.id");
        return q.getResultList();
    }

    public List findByPregunta(int pregunta) {
        Query q = em.createNativeQuery("select sum(case when respuestas.respuesta = '4' then '1' when respuestas.respuesta = '5' then '1' else '0' end)  as dma, count(*) as total, sum(case when respuestas.respuesta = '0' then '1' else '0' end)  as ceros from respuestas\n"
                + "inner join pregunta on pregunta.id = respuestas.pregunta_id\n"
                + "left join pregunta as padre on padre.id = pregunta.pregunta_padre\n"
                + "inner join encuestahaspregunta on (encuestahaspregunta.pregunta_id = pregunta.id or encuestahaspregunta.pregunta_id = padre.id)\n"
                + "INNER JOIN encuesta on encuesta.id = encuestahaspregunta.encuesta_id\n"
                + "inner join participante on participante.idparticipante = respuestas.participante_idparticipante\n"
                + "inner join participante_has_rol on participante_has_rol.participante_idparticipante = participante.idparticipante\n"
                + "inner join rol on rol.id = participante_has_rol.rol_id and encuesta.id = rol.idencuesta1\n"
                + "where pregunta.id = '" + pregunta + "' and encuesta.modelo_id = '1'\n"
                + "GROUP BY pregunta.id");
        return q.getResultList();
    }

    public List findByCaracteristicayRol(int caracteristica, int rol) {
        Query q = em.createNativeQuery("select sum(case when respuestas.respuesta = '4' then '1' when respuestas.respuesta = '5' then '1' else '0' end)  as dma, count(*) as total, sum(case when respuestas.respuesta = '0' then '1' else '0' end)  as ceros from respuestas  \n"
                + " inner join pregunta on pregunta.id = respuestas.pregunta_id  \n"
                + " left join pregunta as padre on padre.id = pregunta.pregunta_padre  \n"
                + " inner join pregunta_has_caracteristica on (pregunta_has_caracteristica.pregunta_id = pregunta.id or pregunta_has_caracteristica.pregunta_id = padre.id)\n"
                + " inner join caracteristica on caracteristica.id = pregunta_has_caracteristica.caracteristica_id \n"
                + " inner join encuestahaspregunta on (encuestahaspregunta.pregunta_id = pregunta.id or encuestahaspregunta.pregunta_id = padre.id)  \n"
                + " INNER JOIN encuesta on encuesta.id = encuestahaspregunta.encuesta_id  \n"
                + " inner join participante on participante.idparticipante = respuestas.participante_idparticipante  \n"
                + " inner join participante_has_rol on participante_has_rol.participante_idparticipante = participante.idparticipante  \n"
                + " inner join rol on rol.id = participante_has_rol.rol_id and encuesta.id = rol.idencuesta1  \n"
                + " where caracteristica.id = '" + caracteristica + "' and rol.id = '" + rol + "'\n"
                + " GROUP BY caracteristica.id");
        return q.getResultList();
    }

    public List findByFactoryRol(int factor, int rol) {
        Query q = em.createNativeQuery("select sum(case when respuestas.respuesta = '4' then '1' when respuestas.respuesta = '5' then '1' else '0' end)  as dma, count(*) as total, sum(case when respuestas.respuesta = '0' then '1' else '0' end)  as ceros from respuestas    \n"
                + " inner join pregunta on pregunta.id = respuestas.pregunta_id    \n"
                + " left join pregunta as padre on padre.id = pregunta.pregunta_padre    \n"
                + " inner join pregunta_has_caracteristica on (pregunta_has_caracteristica.pregunta_id = pregunta.id or pregunta_has_caracteristica.pregunta_id = padre.id)  \n"
                + " inner join caracteristica on caracteristica.id = pregunta_has_caracteristica.caracteristica_id \n"
                + " inner join factor on factor.id = caracteristica.factor_id\n"
                + " inner join encuestahaspregunta on (encuestahaspregunta.pregunta_id = pregunta.id or encuestahaspregunta.pregunta_id = padre.id)    \n"
                + " INNER JOIN encuesta on encuesta.id = encuestahaspregunta.encuesta_id    \n"
                + " inner join participante on participante.idparticipante = respuestas.participante_idparticipante    \n"
                + " inner join participante_has_rol on participante_has_rol.participante_idparticipante = participante.idparticipante    \n"
                + " inner join rol on rol.id = participante_has_rol.rol_id and encuesta.id = rol.idencuesta1    \n"
                + " where factor.id = '" + factor + "' and rol.id = '" + rol + "'  \n"
                + " GROUP BY factor.id");
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
