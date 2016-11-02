<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    $(document).ready(function() {
        $("#printEnlace").click(function() {
            $('#conte').jqprint();
            return false;
        });
    });

</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <legend>Listado de evaluación información documental</legend>
            <table class="table table-bordered table-condensed">
                <thead>
                <th>C&oacute;digo</th>
                <th>Indicador</th>
                <th>Estado</th>
                </thead>
                <tbody>
                <tbody>
                    <c:choose>
                        <c:when test="${fn:length(listaDoc)!= 0}">
                            <c:forEach items="${listaDoc}" var="itemD" varStatus="iterD">
                                <tr>
                                    <td>${itemD.indicadorId.codigo}</td>
                                    <td style="text-align: justify;">${itemD.indicadorId.nombre}</td>
                                    <td>
                                        ${itemD.evaluacion}
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            No hay informaci&oacute;n documental registrada en el sistema. 
                        </c:otherwise>                
                    </c:choose>          
                </tbody>
            </table>  



            <table class="table table-bordered table-condensed">
                <thead>
                <th>Indicador Arcusur</th>
                <th>C&oacute;digo</th>
                <th>Indicador SAP</th>
                <th>Documento asociado</th>
                <th>Responsable</th>
                <th>Medio</th>
                <th>Lugar</th>
                <th>Estado</th>
                <th>Acci&oacute;n a implementar u observaci&oacute;n</th>
                </thead>
                <tbody>
                <tbody>
                    <c:choose>
                        <c:when test="${fn:length(listaDoc2)!= 0}">
                            <c:forEach items="${listaDoc2}" var="itemD" varStatus="iterD">
                                <c:if test="${fn:length(itemD.indicadorId.indicadorList1)>0}">
                                    <tr>
                                        <td>
                                            <c:forEach items="${itemD.indicadorId.indicadorList1}" var="aux0" varStatus="iter0">
                                                ${aux0.nombre}
                                            </c:forEach>

                                        </td>
                                        <td>${itemD.indicadorId.codigo}</td>
                                        <td style="text-align: justify;">${itemD.indicadorId.nombre}</td>
                                        <td>
                                            ${itemD.documento}
                                        </td>
                                        <td>
                                            ${itemD.responsable}
                                        </td>
                                        <td>
                                            ${itemD.medio}
                                        </td>
                                        <td>
                                            ${itemD.lugar}
                                        </td>
                                        <td>
                                            ${itemD.evaluacion}
                                        </td>
                                        <td>
                                            ${itemD.accion}
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            No hay informaci&oacute;n documental registrada en el sistema. 
                        </c:otherwise>                
                    </c:choose>          
                </tbody>
            </table>  
        </div>
    </div>
</div>    