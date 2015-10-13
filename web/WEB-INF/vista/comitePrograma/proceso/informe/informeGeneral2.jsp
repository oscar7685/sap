<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style type="text/css">
    .popover{
        min-width:500px;
        width: auto;
    }

    .expanded-group {
        background-attachment: scroll;
        background-clip: border-box;
        background-color: rgba(0, 0, 0, 0);
        background-image: url("css/images/minus.jpg");
        background-origin: padding-box;
        background-position: left center;
        background-repeat: no-repeat;
        background-size: auto auto;
        padding-left: 15px !important;
    }
    .collapsed-group {
        background-attachment: scroll;
        background-clip: border-box;
        background-color: rgba(0, 0, 0, 0);
        background-image: url("css/images/plus.jpg");
        background-origin: padding-box;
        background-position: left center;
        background-repeat: no-repeat;
        background-size: auto auto;
        padding-left: 15px !important;
    }
</style>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <c:set var="indiceF" value="-1"></c:set>
            <c:set var="indiceC" value="-1"></c:set>
            <c:set var="indiceFactor" value=""></c:set>
            <c:set var="indiceCaracteristicas" value=""></c:set>
            <c:set var="indiceI" value="0"></c:set>

                <div class="accordion" id="accordion2">
                <c:forEach items="${listIndicadores}" var="indicadorAux" varStatus="iterAux">
                    <c:set var="indiceI" value="${iterAux.index}"></c:set>
                    <c:choose>
                        <c:when test="${indicadorAux.caracteristicaId.factorId.id != indiceFactor}">
                            <c:choose>
                                <c:when test="${indiceF!=-1}"> 
                                </div>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
                <c:set var="indiceF" value="${indiceF+1}"></c:set>
                <c:set var="indiceFactor" value="${indicadorAux.caracteristicaId.factorId.id}"></c:set>
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${indiceF}">
                                <h3>Factor ${indicadorAux.caracteristicaId.factorId.codigo}</h3>
                            </a>
                        </div>
                        <div id="collapse${indiceF}" class="accordion-body collapse in">
                            <div class="accordion-inner">
                                <table class="table table-striped table-bordered table-condensed">
                                    <thead style="background-color: #ffffff;">
                                        <tr>
                                            <th>Código</th>
                                            <th>Factor</th>
                                            <th>Ponderación</th>
                                            <th>Grado de Cumplimiento</th>
                                            <th>Evaluacion teniendo en cuenta ponderacion</th>
                                            <th>Logro ideal</th>
                                            <th>Relacion con el logro ideal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>${factores.get(indiceF).getCodigo()}</td>
                                        <td>${factores.get(indiceF).getNombre()}</td>
                                        <td>${ponderacionesF.get(indiceF).ponderacion}</td>
                                        <td>${cumplimientoF[indiceF]}</td>
                                        <td><fmt:formatNumber type="number" maxFractionDigits="1" value="${ponderacionesF.get(indiceF).ponderacion * cumplimientoF[indiceF]}"/></td>
                                        <td>${ponderacionesF.get(indiceF).ponderacion * 5}</td>
                                        <td><fmt:formatNumber type="number" maxFractionDigits="1" value="${cumplimientoF[indiceF] * 20}"/>%</td>
                                    </tr>

                                </tbody>
                            </table>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${indicadorAux.caracteristicaId.id != indiceCaracteristicas}">
                            <c:set var="indiceC" value="${indiceC+1}"></c:set>
                            <c:set var="indiceCaracteristicas" value="${indicadorAux.caracteristicaId.id}"></c:set>
                                <h3>Caracteristica</h3>
                                <table class="table table-striped table-bordered table-condensed">
                                    <thead style="background-color: #ffffff;">
                                        <tr>
                                            <th>Código</th>
                                            <th>Caracteristica</th>
                                            <th>Nivel de importancia</th>
                                            <th>Ponderación caractetistica</th>
                                            <th>Grado de Cumplimiento</th>
                                            <th>Evaluacion teniendo en cuenta ponderacion</th>
                                            <th>Logro ideal</th>
                                            <th>Relacion con el logro ideal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>${caracteristicas.get(indiceC).getCodigo()}</td>
                                        <td>${caracteristicas.get(indiceC).getNombre()}</td>
                                        <td>${ponderacionesCara.get(indiceC).nivelimportancia}</td>
                                        <td>${ponderacionesCara.get(indiceC).ponderacion}</td>
                                        <td>${cumplimientoC[indiceC]}</td>
                                        <td><fmt:formatNumber type="number" maxFractionDigits="1" value="${ponderacionesCara.get(indiceC).ponderacion * cumplimientoC[indiceC]}"/></td>
                                        <td>${ponderacionesCara.get(indiceC).ponderacion * 5}</td>
                                        <td><fmt:formatNumber type="number" maxFractionDigits="1" value="${cumplimientoC[indiceC] * 20}"/>%</td>
                                    </tr>

                                </tbody>
                            </table>
                        </c:when>
                    </c:choose>
                    <h4>Indicador</h4>
                    <table class="table table-striped table-bordered table-condensed">
                        <thead style="background-color: #ffffff;">
                            <tr>
                                <th>Código</th>
                                <th>Indicador</th>
                                <th>Grado de Cumplimiento</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${listIndicadores.get(indiceI).getCodigo()}</td>
                                <td>${listIndicadores.get(indiceI).getNombre()}</td>
                                <td>${cumplimientoI[indiceI]}</td>
                            </tr>
                        </tbody>
                    </table>
                    <c:choose>
                        <c:when test="${numericaO[indiceI] != null}">
                            <h4>Instrumento: Informaci&oacute;n Num&eacute;rica</h4>
                            <table class="table table-striped table-bordered table-condensed inicial">
                                <thead>
                                <th>Documentos</th>
                                <th>Responsable</th>
                                <th>Medio</th>
                                <th>Lugar</th>
                                <th>Evaluaci&oacute;n</th>
                                <th>Acci&oacute;n</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="text-align: left">   
                                            <c:out value="${numericaO[indiceI].documento}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${numericaO[indiceI].responsable}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${numericaO[indiceI].medio}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${numericaO[indiceI].lugar}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${numericaO[indiceI].evaluacion}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${numericaO[indiceI].accion}"/>
                                        </td>
                                    <tr>
                                </tbody>
                            </table>
                        </c:when>
                    </c:choose>
                    <c:choose>   
                        <c:when test="${documentalO[indiceI] != null}">
                            <h4>Instrumento: Informaci&oacute;n documental</h4>
                            <table class="table table-striped table-bordered table-condensed inicial">
                                <thead>
                                <th>Documentos</th>
                                <th>Responsable</th>
                                <th>Medio</th>
                                <th>Lugar</th>
                                <th>Evaluaci&oacute;n</th>
                                <th>Acci&oacute;n</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="text-align: left">   
                                            <c:out value="${documentalO[indiceI].documento}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${documentalO[indiceI].responsable}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${documentalO[indiceI].medio}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${documentalO[indiceI].lugar}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${documentalO[indiceI].evaluacion}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${documentalO[indiceI].accion}"/>
                                        </td>
                                    <tr>
                                </tbody>
                            </table>    
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${listIndicadores.get(indiceI).preguntaList.size()!= 0}">
                            <h4>Instrumento: Encuesta</h4>
                            <table class="table table-striped table-bordered table-condensed">
                                <thead>
                                <th>C&oacute;digo</th>
                                <th>Pregunta</th>
                                <th>Promedio respuesta</th>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listIndicadores.get(indiceI).preguntaList}" var="row" varStatus="itera">
                                        <tr>
                                            <td style="text-align: left">   
                                                <c:out value="${row.codigo}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                ${row.pregunta}
                                            </td>
                                            <td>
                                                ${PromedioPreguntasXindicador.get(indiceI)[itera.index]}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                    </c:choose>  
                </c:forEach>
            </div>  
        </div>
    </div>
</div>