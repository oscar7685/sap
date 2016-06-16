<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">

    .inicial td {
        text-align: right;
    }
</style>
    <div class="hero-unit">
        <div class="row">
            <div id="conte" class="span10">
                <legend>Indicador: ${indicador.nombre}</legend>
            <ul class="breadcrumb">
                <li><a href="<%=request.getContextPath()%>/#informeMatrizFactores">Matriz de Calidad de Dimensiones</a> <span class="divider">/</span></li>
                <li><a href="<%=request.getContextPath()%>/#informeMatrizCaracteristicas">Matriz de Calidad de Componentes</a> <span class="divider">/</span></li>
                <li><a class="tool" data-placement="top" rel="tooltip" data-original-title="${indicador.getCaracteristicaId().getFactorId().nombre}" href="#detalleFactor&${indicador.getCaracteristicaId().getFactorId().id}">Dimensión ${indicador.getCaracteristicaId().getFactorId().codigo}</a> <span class="divider">/</span></li>
                <li><a class="tool" data-placement="top" rel="tooltip" data-original-title="${indicador.getCaracteristicaId().nombre}"  href="#detalleCaracteristica&${indicador.getCaracteristicaId().id}" data="${indicador.getCaracteristicaId().nombre}">Componente ${indicador.getCaracteristicaId().codigo}</a><span class="divider">/</span></li>
                <li class="active tool" data-placement="top" rel="tooltip" data-original-title="${indicador.nombre}">Indicador ${indicador.codigo}</li>
            </ul>
            <br>
            <c:choose>
                <c:when test="${fn:length(indicador.getIndicadorList())!= 0}">
                    <c:forEach items="${indicador.getIndicadorList()}" var="indicadorSAP" varStatus="status" >
                        <h3>Indicador SAP: ${indicadorSAP.nombre}</h3>
                        <c:choose>
                            <c:when test="${documentales[status.index]!= null}">
                                <h4>Instrumento: Informaci&oacute;n Documental</h4>
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
                                                <c:out value="${documentales[status.index].documento}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${documentales[status.index].responsable}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${documentales[status.index].medio}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${documentales[status.index].lugar}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${documentales[status.index].evaluacion}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${documentales[status.index].accion}"/>
                                            </td>
                                        <tr>

                                    </tbody>
                                </table>
                            </c:when>
                        </c:choose>

                        <c:choose>
                            <c:when test="${numericas[status.index]!= null}">
                                <h4>Instrumento: Informaci&oacute;n Num&eacute;rica</h4>
                                <table class="table table-striped table-bordered table-condensed">
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
                                                <c:out value="${numericas[status.index].documento}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${numericas[status.index].responsable}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${numericas[status.index].medio}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${numericas[status.index].lugar}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${numericas[status.index].evaluacion}"/>
                                            </td>
                                            <td style="text-align: left">   
                                                <c:out value="${numericas[status.index].accion}"/>
                                            </td>
                                        <tr>   
                                    </tbody>
                                </table>
                            </c:when>
                        </c:choose> 


                        <c:choose>
                            <c:when test="${indicadorSAP.preguntaList.size()!= 0}">
                                <h4>Instrumento: Encuesta</h4>
                                <table class="table table-striped table-bordered table-condensed">
                                    <thead>
                                    <th>C&oacute;digo</th>
                                    <th>Pregunta</th>
                                    <th>Promedio respuesta</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${indicadorSAP.preguntaList}" var="row" varStatus="itera">
                                            <tr>
                                                <td style="text-align: left">   
                                                    <c:out value="${row.codigo}"/>
                                                </td>
                                                <td style="text-align: left">   
                                                    <a href="#detallePregunta&${row.id}" data="${row.pregunta}">${row.pregunta}</a> 
                                                </td>
                                                <td>
                                                    <div class="btn-group pull-right">
                                                        <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                                            ${promediosres.get(status.index)[itera.index]}
                                                        </a>
                                                        <ul class="dropdown-menu" style="padding-top: 0px;">
                                                            <div id="container${row.id}" style="min-width: 850px; height: 400px; margin: 0 auto"></div>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </c:when>
                        </c:choose>        
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${documentales[0]!= null}">
                            <h4>Instrumento: Informaci&oacute;n Documental</h4>
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
                                            <c:out value="${documentales[0].documento}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${documentales[0].responsable}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${documentales[0].medio}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${documentales[0].lugar}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${documentales[0].evaluacion}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${documentales[0].accion}"/>
                                        </td>
                                    <tr>

                                </tbody>
                            </table>
                        </c:when>
                    </c:choose>

                    <c:choose>
                        <c:when test="${numericas[0]!= null}">
                            <h4>Instrumento: Informaci&oacute;n Num&eacute;rica</h4>
                            <table class="table table-striped table-bordered table-condensed">
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
                                            <c:out value="${numericas[0].documento}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${numericas[0].responsable}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${numericas[0].medio}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${numericas[0].lugar}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${numericas[0].evaluacion}"/>
                                        </td>
                                        <td style="text-align: left">   
                                            <c:out value="${numericas[0].accion}"/>
                                        </td>
                                    <tr>   
                                </tbody>
                            </table>
                        </c:when>
                    </c:choose> 
                </c:otherwise>                
            </c:choose>



        </div>
    </div>
</div>    

