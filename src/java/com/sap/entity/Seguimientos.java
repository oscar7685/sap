/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sap.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author acreditacion
 */
@Entity
@Table(name = "seguimientos", catalog = "sapenfermeria", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Seguimientos.findAll", query = "SELECT s FROM Seguimientos s"),
    @NamedQuery(name = "Seguimientos.findByIdseguimientos", query = "SELECT s FROM Seguimientos s WHERE s.idseguimientos = :idseguimientos"),
    @NamedQuery(name = "Seguimientos.findByFechaProgramada", query = "SELECT s FROM Seguimientos s WHERE s.fechaProgramada = :fechaProgramada"),
    @NamedQuery(name = "Seguimientos.findByFechaRealizacion", query = "SELECT s FROM Seguimientos s WHERE s.fechaRealizacion = :fechaRealizacion"),
    @NamedQuery(name = "Seguimientos.findByPorcentajeAvance", query = "SELECT s FROM Seguimientos s WHERE s.porcentajeAvance = :porcentajeAvance"),
    @NamedQuery(name = "Seguimientos.findByDescripcion", query = "SELECT s FROM Seguimientos s WHERE s.descripcion = :descripcion")})
public class Seguimientos implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idseguimientos")
    private Integer idseguimientos;
    @Column(name = "fecha_programada")
    @Temporal(TemporalType.DATE)
    private Date fechaProgramada;
    @Column(name = "fecha_realizacion")
    @Temporal(TemporalType.DATE)
    private Date fechaRealizacion;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "porcentaje_avance")
    private Float porcentajeAvance;
    @Size(max = 2000)
    @Column(name = "descripcion")
    private String descripcion;
    @JoinColumn(name = "metas_idmeta", referencedColumnName = "idmeta")
    @ManyToOne(optional = false)
    private Metas metasIdmeta;

    public Seguimientos() {
    }

    public Seguimientos(Integer idseguimientos) {
        this.idseguimientos = idseguimientos;
    }

    public Integer getIdseguimientos() {
        return idseguimientos;
    }

    public void setIdseguimientos(Integer idseguimientos) {
        this.idseguimientos = idseguimientos;
    }

    public Date getFechaProgramada() {
        return fechaProgramada;
    }

    public void setFechaProgramada(Date fechaProgramada) {
        this.fechaProgramada = fechaProgramada;
    }

    public Date getFechaRealizacion() {
        return fechaRealizacion;
    }

    public void setFechaRealizacion(Date fechaRealizacion) {
        this.fechaRealizacion = fechaRealizacion;
    }

    public Float getPorcentajeAvance() {
        return porcentajeAvance;
    }

    public void setPorcentajeAvance(Float porcentajeAvance) {
        this.porcentajeAvance = porcentajeAvance;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Metas getMetasIdmeta() {
        return metasIdmeta;
    }

    public void setMetasIdmeta(Metas metasIdmeta) {
        this.metasIdmeta = metasIdmeta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idseguimientos != null ? idseguimientos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Seguimientos)) {
            return false;
        }
        Seguimientos other = (Seguimientos) object;
        if ((this.idseguimientos == null && other.idseguimientos != null) || (this.idseguimientos != null && !this.idseguimientos.equals(other.idseguimientos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Seguimientos[ idseguimientos=" + idseguimientos + " ]";
    }
    
}
