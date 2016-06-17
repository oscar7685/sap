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
            <c:set var="indiceC" value="0"></c:set>
            <c:set var="indiceI" value="0"></c:set>  
            <c:forEach items="${factores}" var="factor" varStatus="statusF">
                <h3>Dimensión ${factor.codigo}</h3>
                <table class="table table-striped table-bordered table-condensed">
                    <thead style="background-color: #ffffff;">
                        <tr>
                            <th>Código</th>
                            <th>Dimensión</th>
                            <th>Grado de Cumplimiento</th>
                            <th>Relacion con el logro ideal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${factor.getCodigo()}</td>
                            <td>${factor.getNombre()}</td>
                            <td>${cumplimientoF[statusF.index]}</td>
                            <td><fmt:formatNumber type="number" maxFractionDigits="1" value="${cumplimientoF[statusF.index] * 20}"/>%</td>
                        </tr> 
                    </tbody>
                </table>

                <c:forEach items="${factor.caracteristicaList}" var="caracteristica" varStatus="statusC">            
                    <h3>Componente ${caracteristica.codigo}</h3>
                    <table class="table table-striped table-bordered table-condensed">
                        <thead style="background-color: #ffffff;">
                            <tr>
                                <th>Código</th>
                                <th>Componente</th>
                                <th>Grado de Cumplimiento</th>
                                <th>Relacion con el logro ideal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${caracteristica.getCodigo()}</td>
                                <td>${caracteristica.getNombre()}</td>
                                <td>${cumplimientoC[indiceC]}</td>
                                <td><fmt:formatNumber type="number" maxFractionDigits="1" value="${cumplimientoC[indiceC] * 20}"/>%</td>
                            </tr> 
                        </tbody>
                    </table>
                    <c:set var="indiceC" value="${indiceC + 1}"></c:set>  


                    <c:forEach items="${caracteristica.indicadorList}" var="indicador" varStatus="statusI">
                        <h3>Indicador Arcu-Sur ${indicador.codigo}</h3>
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
                                    <td>${indicador.getCodigo()}</td>
                                    <td><a href="#detalleIndicador&${indicador.id}">${indicador.getNombre()}</a></td>
                                    <td><fmt:formatNumber type="number" maxFractionDigits="1" value="${cumplimientoI[indiceI]}"/></td>
                                </tr> 
                            </tbody>
                        </table>
                        <c:forEach items="${indicador.indicadorList}" var="indicadorSAP" varStatus="statusISAP">
                            <table class="table table-striped table-bordered table-condensed">
                                <h4>Indicador SAP ${indicadorSAP.codigo}</h4>
                                <thead style="background-color: #ffffff;">
                                    <tr>
                                        <th>Código</th>
                                        <th>Indicador</th>
                                        <th>Grado de Cumplimiento</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>${indicadorSAP.getCodigo()}</td>
                                        <td>${indicadorSAP.getNombre()}</td>
                                        <td>${cumplimientoISap[indiceI][statusISAP.index]}</td>
                                    </tr> 
                                </tbody>
                            </table>
                        </c:forEach> 
                        <c:set var="indiceI" value="${indiceI + 1}"></c:set>  
                    </c:forEach>
                </c:forEach>  
            </c:forEach> 
        </div>  
    </div>
</div>
