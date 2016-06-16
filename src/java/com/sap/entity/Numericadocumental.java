/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.entity;

import java.io.Serializable;
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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "numericadocumental", catalog = "sapbd", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Numericadocumental.findAll", query = "SELECT n FROM Numericadocumental n"),
    @NamedQuery(name = "Numericadocumental.findById", query = "SELECT n FROM Numericadocumental n WHERE n.id = :id"),
    @NamedQuery(name = "Numericadocumental.findByDocumento", query = "SELECT n FROM Numericadocumental n WHERE n.documento = :documento"),
    @NamedQuery(name = "Numericadocumental.findByResponsable", query = "SELECT n FROM Numericadocumental n WHERE n.responsable = :responsable"),
    @NamedQuery(name = "Numericadocumental.findByMedio", query = "SELECT n FROM Numericadocumental n WHERE n.medio = :medio"),
    @NamedQuery(name = "Numericadocumental.findByLugar", query = "SELECT n FROM Numericadocumental n WHERE n.lugar = :lugar"),
    @NamedQuery(name = "Numericadocumental.findByEvaluacion", query = "SELECT n FROM Numericadocumental n WHERE n.evaluacion = :evaluacion"),
    @NamedQuery(name = "Numericadocumental.findByAccion", query = "SELECT n FROM Numericadocumental n WHERE n.accion = :accion")})
    //@NamedQuery(name = "Numericadocumental.findByInstrumentohasindicadorId", query = "SELECT n FROM Numericadocumental n WHERE n.instrumentohasindicadorId = :instrumentohasindicadorId")})
public class Numericadocumental implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 2000)
    @Column(name = "documento")
    private String documento;
    @Size(max = 2000)
    @Column(name = "responsable")
    private String responsable;
    @Size(max = 2000)
    @Column(name = "medio")
    private String medio;
    @Size(max = 2000)
    @Column(name = "lugar")
    private String lugar;
    @Column(name = "evaluacion")
    private float evaluacion;
    @Size(max = 2000)
    @Column(name = "accion")
    private String accion;
    @JoinColumn(name = "proceso_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Proceso procesoId;
    @JoinColumn(name = "instrumento_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Instrumento instrumentoId;
    @JoinColumn(name = "indicador_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Indicador indicadorId;
    @Column(name = "esperado")
    private float esperado;

    public float getEsperado() {
        return esperado;
    }

    public void setEsperado(float esperado) {
        this.esperado = esperado;
    }

    public float getObtenido() {
        return obtenido;
    }

    public void setObtenido(float obtenido) {
        this.obtenido = obtenido;
    }
    @Column(name = "obtenido")
    private float obtenido;
    
    public Numericadocumental() {
    }

    public Numericadocumental(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getResponsable() {
        return responsable;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    public String getMedio() {
        return medio;
    }

    public void setMedio(String medio) {
        this.medio = medio;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public float getEvaluacion() {
        return evaluacion;
    }

    public void setEvaluacion(float evaluacion) {
        this.evaluacion = evaluacion;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    public Proceso getProcesoId() {
        return procesoId;
    }

    public void setProcesoId(Proceso procesoId) {
        this.procesoId = procesoId;
    }

    public Instrumento getInstrumentoId() {
        return instrumentoId;
    }

    public void setInstrumentoId(Instrumento instrumentoId) {
        this.instrumentoId = instrumentoId;
    }

    public Indicador getIndicadorId() {
        return indicadorId;
    }

    public void setIndicadorId(Indicador indicadorId) {
        this.indicadorId = indicadorId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Numericadocumental)) {
            return false;
        }
        Numericadocumental other = (Numericadocumental) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Numericadocumental[ id=" + id + " ]";
    }
    
}
