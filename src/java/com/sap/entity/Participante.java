/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "participante", catalog = "sapnaval", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Participante.findAll", query = "SELECT p FROM Participante p"),
    @NamedQuery(name = "Participante.findByIdparticipante", query = "SELECT p FROM Participante p WHERE p.idparticipante = :idparticipante"),
    @NamedQuery(name = "Participante.findByFechainicio", query = "SELECT p FROM Participante p WHERE p.fechainicio = :fechainicio"),
    @NamedQuery(name = "Participante.findByFechafinal", query = "SELECT p FROM Participante p WHERE p.fechafinal = :fechafinal")})
public class Participante implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idparticipante")
    private Integer idparticipante;
    @Column(name = "fechainicio")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechainicio;
    @Column(name = "fechafinal")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechafinal;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "participanteIdparticipante")
    private List<Respuestas> respuestasList;
    @JoinColumn(name = "proceso_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Proceso procesoId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "participanteIdparticipante")
    private List<ParticipanteHasRol> participanteHasRolList;

    public Participante() {
    }

    public Participante(Integer idparticipante) {
        this.idparticipante = idparticipante;
    }

    public Integer getIdparticipante() {
        return idparticipante;
    }

    public void setIdparticipante(Integer idparticipante) {
        this.idparticipante = idparticipante;
    }

    public Date getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(Date fechainicio) {
        this.fechainicio = fechainicio;
    }

    public Date getFechafinal() {
        return fechafinal;
    }

    public void setFechafinal(Date fechafinal) {
        this.fechafinal = fechafinal;
    }

    @XmlTransient
    public List<Respuestas> getRespuestasList() {
        return respuestasList;
    }

    public void setRespuestasList(List<Respuestas> respuestasList) {
        this.respuestasList = respuestasList;
    }

    public Proceso getProcesoId() {
        return procesoId;
    }

    public void setProcesoId(Proceso procesoId) {
        this.procesoId = procesoId;
    }

    @XmlTransient
    public List<ParticipanteHasRol> getParticipanteHasRolList() {
        return participanteHasRolList;
    }

    public void setParticipanteHasRolList(List<ParticipanteHasRol> participanteHasRolList) {
        this.participanteHasRolList = participanteHasRolList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idparticipante != null ? idparticipante.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Participante)) {
            return false;
        }
        Participante other = (Participante) object;
        if ((this.idparticipante == null && other.idparticipante != null) || (this.idparticipante != null && !this.idparticipante.equals(other.idparticipante))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Participante[ idparticipante=" + idparticipante + " ]";
    }
    
}
