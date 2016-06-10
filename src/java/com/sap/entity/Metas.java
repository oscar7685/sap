/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author acreditacion
 */
@Entity
@Table(name = "metas", catalog = "sapenfermeria", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Metas.findAll", query = "SELECT m FROM Metas m"),
    @NamedQuery(name = "Metas.findByIdmeta", query = "SELECT m FROM Metas m WHERE m.idmeta = :idmeta"),
    @NamedQuery(name = "Metas.findByActividad", query = "SELECT m FROM Metas m WHERE m.actividad = :actividad"),
    @NamedQuery(name = "Metas.findByFechaInicio", query = "SELECT m FROM Metas m WHERE m.fechaInicio = :fechaInicio"),
    @NamedQuery(name = "Metas.findByFechaFinal", query = "SELECT m FROM Metas m WHERE m.fechaFinal = :fechaFinal"),
    @NamedQuery(name = "Metas.findByRecursos", query = "SELECT m FROM Metas m WHERE m.recursos = :recursos"),
    @NamedQuery(name = "Metas.findByResponsable", query = "SELECT m FROM Metas m WHERE m.responsable = :responsable"),
    @NamedQuery(name = "Metas.findByMeta", query = "SELECT m FROM Metas m WHERE m.meta = :meta"),
    @NamedQuery(name = "Metas.findByIndicadorCumplimiento", query = "SELECT m FROM Metas m WHERE m.indicadorCumplimiento = :indicadorCumplimiento"),
    @NamedQuery(name = "Metas.findByEstado", query = "SELECT m FROM Metas m WHERE m.estado = :estado"),
    @NamedQuery(name = "Metas.findByPorcentajeCumplimiento", query = "SELECT m FROM Metas m WHERE m.porcentajeCumplimiento = :porcentajeCumplimiento"),
    @NamedQuery(name = "Metas.findByObservaciones", query = "SELECT m FROM Metas m WHERE m.observaciones = :observaciones")})
public class Metas implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmeta")
    private Integer idmeta;
    @Size(max = 2000)
    @Column(name = "actividad")
    private String actividad;
    @Column(name = "fecha_inicio")
    @Temporal(TemporalType.DATE)
    private Date fechaInicio;
    @Column(name = "fecha_final")
    @Temporal(TemporalType.DATE)
    private Date fechaFinal;
    @Size(max = 2000)
    @Column(name = "recursos")
    private String recursos;
    @Size(max = 2000)
    @Column(name = "responsable")
    private String responsable;
    @Size(max = 2000)
    @Column(name = "meta")
    private String meta;
    @Size(max = 2000)
    @Column(name = "indicador_cumplimiento")
    private String indicadorCumplimiento;
    @Size(max = 45)
    @Column(name = "estado")
    private String estado;
    @Column(name = "porcentaje_cumplimiento")
    private Integer porcentajeCumplimiento;
    @Size(max = 45)
    @Column(name = "observaciones")
    private String observaciones;
    @JoinColumn(name = "hallazgo_idhallazgo", referencedColumnName = "idhallazgo")
    @ManyToOne(optional = false)
    private Hallazgo hallazgoIdhallazgo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "metasIdmeta")
    private List<Seguimientos> seguimientosList;

    public Metas() {
    }

    public Metas(Integer idmeta) {
        this.idmeta = idmeta;
    }

    public Integer getIdmeta() {
        return idmeta;
    }

    public void setIdmeta(Integer idmeta) {
        this.idmeta = idmeta;
    }

    public String getActividad() {
        return actividad;
    }

    public void setActividad(String actividad) {
        this.actividad = actividad;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFinal() {
        return fechaFinal;
    }

    public void setFechaFinal(Date fechaFinal) {
        this.fechaFinal = fechaFinal;
    }

    public String getRecursos() {
        return recursos;
    }

    public void setRecursos(String recursos) {
        this.recursos = recursos;
    }

    public String getResponsable() {
        return responsable;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    public String getMeta() {
        return meta;
    }

    public void setMeta(String meta) {
        this.meta = meta;
    }

    public String getIndicadorCumplimiento() {
        return indicadorCumplimiento;
    }

    public void setIndicadorCumplimiento(String indicadorCumplimiento) {
        this.indicadorCumplimiento = indicadorCumplimiento;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Integer getPorcentajeCumplimiento() {
        return porcentajeCumplimiento;
    }

    public void setPorcentajeCumplimiento(Integer porcentajeCumplimiento) {
        this.porcentajeCumplimiento = porcentajeCumplimiento;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Hallazgo getHallazgoIdhallazgo() {
        return hallazgoIdhallazgo;
    }

    public void setHallazgoIdhallazgo(Hallazgo hallazgoIdhallazgo) {
        this.hallazgoIdhallazgo = hallazgoIdhallazgo;
    }

    @XmlTransient
    public List<Seguimientos> getSeguimientosList() {
        return seguimientosList;
    }

    public void setSeguimientosList(List<Seguimientos> seguimientosList) {
        this.seguimientosList = seguimientosList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmeta != null ? idmeta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Metas)) {
            return false;
        }
        Metas other = (Metas) object;
        if ((this.idmeta == null && other.idmeta != null) || (this.idmeta != null && !this.idmeta.equals(other.idmeta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Metas[ idmeta=" + idmeta + " ]";
    }
    
}
