<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
    .table td{
        font-size: 8px;
    }
    .table th {
        font-size: 8px;
    }
    .table .success{
        background-color: #DFF0D8; 
        color: #468847;
    }
    .table .error{
        background-color: #F2DEDE; 
        color: #B94A48;
    }
    .table .warning{
        background-color: #f0ad4e;
        color: #fff;
    }
</style>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table class="table table-bordered" id="tableR">
    <thead style="background-color: #ffffff;">
        <tr>
            <th class="span1">FACTOR</th>
            <th class="span1">CARACTERISTICA</th>
            <th class="span4">PREGUNTA</th>
            <th class="span1">Estudiantes Pregrado</th>
            <th class="span1">Estudiantes Maestría y Doctorado</th>
            <th class="span1">Estudiantes Especialización</th>
            <th class="span1">Profesores Planta</th>
            <th class="span1">Profesores Cátedra</th>
            <th class="span1">Directivos</th>
            <th class="span1">Administrativos</th>
            <th class="span1">Egresados Pregrado</th>
            <th class="span1">Egresados Maestría y Doctorado</th>
            <th class="span1">Egresados Especialización</th>
            <th class="span1">Empleadores</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${caractesticas}" var="caracteristica" varStatus="status">
            <c:forEach items="${caracteristica.preguntaList}" var="pregunta" varStatus="status1">
                <c:choose>
                    <c:when test="${fn:length(pregunta.preguntaList)!= 0}">
                        <tr>
                            <td style="vertical-align: middle;" rowspan="${fn:length(pregunta.preguntaList) + 1}">Factor ${caracteristica.factorId.codigo}. ${caracteristica.factorId.nombre}</td>
                            <td style="vertical-align: middle;" rowspan="${fn:length(pregunta.preguntaList) + 1}">Caracteristica ${caracteristica.codigo}. ${caracteristica.nombre}</td>
                            <td style="font-weight: bold;">${pregunta.pregunta}</td>
                            <td colspan="11"></td>
                        </tr>
                        <c:forEach items="${pregunta.preguntaList}" var="sub" varStatus="status2">
                            <tr>
                                <td>${sub.pregunta}</td>
                                <c:forTokens items="1,8,7,2,11,5,3,4,10,9,6" delims="," var="rol">
                                    <c:choose>
                                        <c:when test="${resultados[sub.id][rol].equals('NA')}">
                                            <td>NA</td>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${cerillos[sub.id][rol] >= 20.0}">
                                                    <td>${resultados[sub.id][rol]}</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${resultados[sub.id][rol] >= 70.0}">
                                                            <td class="success">${resultados[sub.id][1]}</td>
                                                        </c:when>
                                                        <c:when test="${resultados[sub.id][rol] >= 50.0}">
                                                            <td class="warning">${resultados[sub.id][1]}</td>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <td class="error">${resultados[sub.id][rol]}</td>
                                                        </c:otherwise>    
                                                    </c:choose>
                                                </c:otherwise>   
                                            </c:choose>        
                                        </c:otherwise>
                                    </c:choose> 
                                </c:forTokens>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td>Factor ${caracteristica.factorId.codigo}. ${caracteristica.factorId.nombre}</td>
                            <td>Caracteristica ${caracteristica.codigo}. ${caracteristica.nombre}</td>
                            <td style="font-weight: bold;">${pregunta.pregunta}</td>
                            <c:forTokens items="1,8,7,2,11,5,3,4,10,9,6" delims="," var="rol">
                                <c:choose>
                                    <c:when test="${resultados[pregunta.id][rol].equals('NA')}">
                                        <td>NA</td>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${cerillos[pregunta.id][rol] >= 20.0}">
                                                <td>${resultados[pregunta.id][rol]}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${resultados[pregunta.id][rol] >= 70.0}">
                                                        <td class="success">${resultados[pregunta.id][1]}</td>
                                                    </c:when>
                                                    <c:when test="${resultados[pregunta.id][rol] >= 50.0}">
                                                        <td class="warning">${resultados[pregunta.id][1]}</td>
                                                    </c:when>    
                                                    <c:otherwise>
                                                        <td class="error">${resultados[pregunta.id][rol]}</td>
                                                    </c:otherwise>    
                                                </c:choose>
                                            </c:otherwise>   
                                        </c:choose>        
                                    </c:otherwise>
                                </c:choose> 
                            </c:forTokens>
                        </tr>
                    </c:otherwise> 
                </c:choose>   
            </c:forEach>
        </c:forEach>
    </tbody>
</table>   
