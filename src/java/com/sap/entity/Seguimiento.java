/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author acreditacion
 */
@Entity
@Table(name = "seguimiento", catalog = "sapbd", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Seguimiento.findAll", query = "SELECT s FROM Seguimiento s"),
    @NamedQuery(name = "Seguimiento.findByIdseguimiento", query = "SELECT s FROM Seguimiento s WHERE s.idseguimiento = :idseguimiento"),
    @NamedQuery(name = "Seguimiento.findByFechaProgramado", query = "SELECT s FROM Seguimiento s WHERE s.fechaProgramado = :fechaProgramado"),
    @NamedQuery(name = "Seguimiento.findByFechaRealizado", query = "SELECT s FROM Seguimiento s WHERE s.fechaRealizado = :fechaRealizado"),
    @NamedQuery(name = "Seguimiento.findByPorcentajeAvance", query = "SELECT s FROM Seguimiento s WHERE s.porcentajeAvance = :porcentajeAvance"),
    @NamedQuery(name = "Seguimiento.findByObservaciones", query = "SELECT s FROM Seguimiento s WHERE s.observaciones = :observaciones")})
public class Seguimiento implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idseguimiento")
    private Integer idseguimiento;
    @Column(name = "fecha_programado")
    @Temporal(TemporalType.DATE)
    private Date fechaProgramado;
    @Column(name = "fecha_realizado")
    @Temporal(TemporalType.DATE)
    private Date fechaRealizado;
    @Column(name = "porcentaje_avance")
    private Integer porcentajeAvance;
    @Size(max = 2000)
    @Column(name = "observaciones")
    private String observaciones;
    @JoinColumn(name = "actividad_idactividad", referencedColumnName = "idactividad")
    @ManyToOne(optional = false)
    private Actividad actividadIdactividad;

    public Seguimiento() {
    }

    public Seguimiento(Integer idseguimiento) {
        this.idseguimiento = idseguimiento;
    }

    public Integer getIdseguimiento() {
        return idseguimiento;
    }

    public void setIdseguimiento(Integer idseguimiento) {
        this.idseguimiento = idseguimiento;
    }

    public Date getFechaProgramado() {
        return fechaProgramado;
    }

    public void setFechaProgramado(Date fechaProgramado) {
        this.fechaProgramado = fechaProgramado;
    }

    public Date getFechaRealizado() {
        return fechaRealizado;
    }

    public void setFechaRealizado(Date fechaRealizado) {
        this.fechaRealizado = fechaRealizado;
    }

    public Integer getPorcentajeAvance() {
        return porcentajeAvance;
    }

    public void setPorcentajeAvance(Integer porcentajeAvance) {
        this.porcentajeAvance = porcentajeAvance;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Actividad getActividadIdactividad() {
        return actividadIdactividad;
    }

    public void setActividadIdactividad(Actividad actividadIdactividad) {
        this.actividadIdactividad = actividadIdactividad;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idseguimiento != null ? idseguimiento.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Seguimiento)) {
            return false;
        }
        Seguimiento other = (Seguimiento) object;
        if ((this.idseguimiento == null && other.idseguimiento != null) || (this.idseguimiento != null && !this.idseguimiento.equals(other.idseguimiento))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Seguimiento[ idseguimiento=" + idseguimiento + " ]";
    }
    
}
