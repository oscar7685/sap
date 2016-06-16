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
 * @author acreditacion
 */
@Entity
@Table(name = "indicador", catalog = "sapenfermeria", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Indicador.findAll", query = "SELECT i FROM Indicador i"),
    @NamedQuery(name = "Indicador.findById", query = "SELECT i FROM Indicador i WHERE i.id = :id"),
    @NamedQuery(name = "Indicador.findByCodigo", query = "SELECT i FROM Indicador i WHERE i.codigo = :codigo"),
    @NamedQuery(name = "Indicador.findByNombre", query = "SELECT i FROM Indicador i WHERE i.nombre = :nombre"),
    @NamedQuery(name = "Indicador.findByCaracteristica", query = "SELECT i FROM Indicador i WHERE i.caracteristicaId = :caracteristica"),
    @NamedQuery(name = "Indicador.findByUltimo", query = "SELECT i FROM Indicador i order by i.id desc"),
    @NamedQuery(name = "Indicador.findByModelo", query = "SELECT i FROM Indicador i WHERE i.modeloId = :modelo"),
    @NamedQuery(name = "Indicador.findByModeloYenOrden", query = "SELECT i FROM Indicador i WHERE i.modeloId = :modelo order by i.caracteristicaId.id asc, i.id asc")})
public class Indicador implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "codigo", nullable = false, length = 100)
    private String codigo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2000)
    @Column(name = "nombre", nullable = false, length = 2000)
    private String nombre;
    @JoinTable(name = "instrumentohasindicador", joinColumns = {
        @JoinColumn(name = "indicador_id", referencedColumnName = "id", nullable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "instrumento_id", referencedColumnName = "id", nullable = false)})
    @ManyToMany
    private List<Instrumento> instrumentoList;
    @JoinTable(name = "procesohasindicador", joinColumns = {
        @JoinColumn(name = "indicador_id", referencedColumnName = "id", nullable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "proceso_id", referencedColumnName = "id", nullable = false)})
    @ManyToMany
    private List<Proceso> procesoList;
    @JoinTable(name = "indicador_has_indicador", joinColumns = {
        @JoinColumn(name = "indicador_id", referencedColumnName = "id")}, inverseJoinColumns = {
        @JoinColumn(name = "indicador_id1", referencedColumnName = "id")})
    @ManyToMany
    private List<Indicador> indicadorList;
    @ManyToMany(mappedBy = "indicadorList")
    private List<Indicador> indicadorList1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "indicadorId")
    private List<Numericadocumental> numericadocumentalList;
    @OneToMany(mappedBy = "indicadorId")
    private List<Pregunta> preguntaList;
    @JoinColumn(name = "modelo_id", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private Modelo modeloId;
    @JoinColumn(name = "caracteristica_id", referencedColumnName = "id")
    @ManyToOne
    private Caracteristica caracteristicaId;

    public Indicador() {
    }

    public Indicador(Integer id) {
        this.id = id;
    }

    public Indicador(Integer id, String codigo, String nombre) {
        this.id = id;
        this.codigo = codigo;
        this.nombre = nombre;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @XmlTransient
    public List<Instrumento> getInstrumentoList() {
        return instrumentoList;
    }

    public void setInstrumentoList(List<Instrumento> instrumentoList) {
        this.instrumentoList = instrumentoList;
    }

    @XmlTransient
    public List<Proceso> getProcesoList() {
        return procesoList;
    }

    public void setProcesoList(List<Proceso> procesoList) {
        this.procesoList = procesoList;
    }

    @XmlTransient
    public List<Indicador> getIndicadorList() {
        return indicadorList;
    }

    public void setIndicadorList(List<Indicador> indicadorList) {
        this.indicadorList = indicadorList;
    }

    @XmlTransient
    public List<Indicador> getIndicadorList1() {
        return indicadorList1;
    }

    public void setIndicadorList1(List<Indicador> indicadorList1) {
        this.indicadorList1 = indicadorList1;
    }

    @XmlTransient
    public List<Numericadocumental> getNumericadocumentalList() {
        return numericadocumentalList;
    }

    public void setNumericadocumentalList(List<Numericadocumental> numericadocumentalList) {
        this.numericadocumentalList = numericadocumentalList;
    }

    @XmlTransient
    public List<Pregunta> getPreguntaList() {
        return preguntaList;
    }

    public void setPreguntaList(List<Pregunta> preguntaList) {
        this.preguntaList = preguntaList;
    }

    public Modelo getModeloId() {
        return modeloId;
    }

    public void setModeloId(Modelo modeloId) {
        this.modeloId = modeloId;
    }

    public Caracteristica getCaracteristicaId() {
        return caracteristicaId;
    }

    public void setCaracteristicaId(Caracteristica caracteristicaId) {
        this.caracteristicaId = caracteristicaId;
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
        if (!(object instanceof Indicador)) {
            return false;
        }
        Indicador other = (Indicador) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.sap.entity.Indicador[ id=" + id + " ]";
    }
    
}
