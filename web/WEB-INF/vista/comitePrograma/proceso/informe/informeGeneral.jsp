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
            <table id="tablaX" class="table table-striped table-bordered table-condensed">
                <thead style="background-color: #ffffff;">
                    <tr>
                        <th>Factor</th>
                        <th>CF</th>
                        <th>Caracteristica</th>
                        <th>CC</th>
                        <th>Indicador</th>
                        <th>CI</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="indiceF" value="-1"></c:set>
                    <c:set var="indiceC" value="-1"></c:set>
                    <c:set var="indiceFactor" value=""></c:set>
                    <c:set var="indiceCaracteristicas" value=""></c:set>
                    <c:forEach items="${listIndicadores}" var="indicador" varStatus="status">
                        <tr>
                            <c:choose>
                                <c:when test="${indicador.caracteristicaId.factorId.id != indiceFactor}">
                                    <c:set var="indiceF" value="${indiceF+1}"></c:set>
                                    <c:set var="indiceFactor" value="${indicador.caracteristicaId.factorId.id}"></c:set>
                                    <td rowspan="${cantidadIndF[indiceF]}">${indicador.caracteristicaId.factorId.codigo} ${indicador.caracteristicaId.factorId.nombre}</td>
                                    <td rowspan="${cantidadIndF[indiceF]}">${cumplimientoF[indiceF]}</td>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${indicador.caracteristicaId.id != indiceCaracteristicas}">
                                    <c:set var="indiceC" value="${indiceC+1}"></c:set>
                                    <c:set var="indiceCaracteristicas" value="${indicador.caracteristicaId.id}"></c:set>
                                    <td rowspan="${cantidadIndC[indiceC]}">${indicador.caracteristicaId.codigo} ${indicador.caracteristicaId.nombre}</td>
                                    <td rowspan="${cantidadIndC[indiceC]}">${cumplimientoC[indiceC]}</td>
                                </c:when>
                            </c:choose>
                            <td>${indicador.codigo} ${indicador.nombre}</td>
                            <c:choose>
                                <c:when test="${cumplimientoI[status.index] == 0}">
                                    <td>N/A
                                    </c:when>
                                    <c:otherwise>
                                    <td>${cumplimientoI[status.index]}
                                    </c:otherwise>    
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>  
        </div>
    </div>
</div>