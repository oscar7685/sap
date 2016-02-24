/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sap.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "proceso", catalog = "sapnaval", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Proceso.findAll", query = "SELECT p FROM Proceso p"),
    @NamedQuery(name = "Proceso.findById", query = "SELECT p FROM Proceso p WHERE p.id = :id"),
    @NamedQuery(name = "Proceso.findByFechainicio", query = "SELECT p FROM Proceso p WHERE p.fechainicio = :fechainicio"),
    @NamedQuery(name = "Proceso.findByFechacierre", query = "SELECT p FROM Proceso p WHERE p.fechacierre = :fechacierre"),
    @NamedQuery(name = "Proceso.findByDescripcion", query = "SELECT p FROM Proceso p WHERE p.descripcion = :descripcion")})
public class Proceso implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "fechainicio")
    private String fechainicio;
    @Size(max = 30)
    @Column(name = "fechacierre")
    private String fechacierre;
    @Size(max = 500)
    @Column(name = "descripcion")
    private String descripcion;
    @JoinTable(name = "procesohasindicador", joinColumns = {
        @JoinColumn(name = "proceso_id", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "indicador_id", referencedColumnName = "id")})
    @ManyToMany
    private List<Indicador> indicadorList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoId")
    private List<Ponderacioncaracteristica> ponderacioncaracteristicaList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoId")
    private List<Hallazgo> hallazgoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoId")
    private List<Muestra> muestraList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoId")
    private List<Ponderacionfactor> ponderacionfactorList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoId")
    private List<Encabezado> encabezadoList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoId")
    private List<Numericadocumental> numericadocumentalList;
    @JoinColumn(name = "modelo_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Modelo modeloId;
    @JoinColumn(name = "programa_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Programa programaId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoId")
    private List<Participante> participanteList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "procesoId")
    private List<Ponderacionindicador> ponderacionindicadorList;

    public Proceso() {
    }

    public Proceso(Integer id) {
        this.id = id;
    }

    public Proceso(Integer id, String fechainicio) {
        this.id = id;
        this.fechainicio = fechainicio;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFechainicio() {
        return fechainicio;
    }

    public void setFechainicio(String fechainicio) {
        this.fechainicio = fechainicio;
    }

    public String getFechacierre() {
        return fechacierre;
    }

    public void setFechacierre(String fechacierre) {
        this.fechacierre = fechacierre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @XmlTransient
    public List<Indicador> getIndicadorList() {
        return indicadorList;
    }

    public void setIndicadorList(List<Indicador> indicadorList) {
        this.indicadorList = indicadorList;
    }

    @XmlTransient
    public List<Ponderacioncaracteristica> getPonderacioncaracteristicaList() {
        return ponderacioncaracteristicaList;
    }

    public void setPonderacioncaracteristicaList(List<Ponderacioncaracteristica> ponderacioncaracteristicaList) {
        this.ponderacioncaracteristicaList = ponderacioncaracteristicaList;
    }

    @XmlTransient
    public List<Hallazgo> getHallazgoList() {
        return hallazgoList;
    }

    public void setHallazgoList(List<Hallazgo> hallazgoList) {
        this.hallazgoList = hallazgoList;
    }

    @XmlTransient
    public List<Muestra> getMuestraList() {
        return muestraList;
    }

    public void setMuestraList(List<Muestra> muestraList) {
        this.muestraList = muestraList;
    }

    @XmlTransient
    public List<Ponderacionfactor> getPonderacionfactorList() {
        return ponderacionfactorList;
    }

    public void setPonderacionfactorList(List<Ponderacionfactor> ponderacionfactorList) {
        this.ponderacionfactorList = ponderacionfactorList;
    }

    @XmlTransient
    public List<Encabezado> getEncabezadoList() {
        return encabezadoList;
    }

    public void setEncabezadoList(List<Encabezado> encabezadoList) {
        this.encabezadoList = encabezadoList;
    }

    @XmlTransient
    public List<Numericadocumental> getNumericadocumentalList() {
        return numericadocumentalList;
    }

    public void setNumericadocumentalList(List<Numericadocumental> numericadocumentalList) {
        this.numericadocumentalList = numericadocumentalList;
    }

    public Modelo getModeloId() {
        return modeloId;
    }

    public void setModeloId(Modelo modeloId) {
        this.modeloId = modeloId;
    }

    public Programa getProgramaId() {
        return programaId;
    }

    public void setProgramaId(Programa programaId) {
        this.programaId = programaId;
    }

    @XmlTransient
    public List<Participante> getParticipanteList() {
        return participanteList;
    }

    public void setParticipanteList(List<Participante> participanteList) {
        this.participanteList = participanteList;
    }

    @XmlTransient
    public List<Ponderacionindicador> getPonderacionindicadorList() {
        return ponderacionindicadorList;
    }

    public void setPonderacionindicadorList(List<Ponderacionindicador> ponderacionindicadorList) {
        this.ponderacionindicadorList = ponderacionindicadorList;
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
        if (!(object instanceof Proceso)) {
            return false;
        }
        Proceso other = (Proceso) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Proceso[ id=" + id + " ]";
    }
    
}
