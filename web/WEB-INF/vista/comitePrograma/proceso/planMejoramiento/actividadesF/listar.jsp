<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    $(function() {
        $('.tool').tooltip().click(function(e) {
            $(this).tooltip('hide');
        });
    });
</script>
<ul class="breadcrumb">
    <li><a href="<%=request.getContextPath()%>/#listarFortalezas" class="tool" data-placement="top" rel="tooltip" data-original-title="Listar fortalezas">Fortalezas</a> <span class="divider">/</span></li>
    <li><a href="<%=request.getContextPath()%>/#editarFortaleza&${fortaleza.idhallazgo}" class="tool" data-placement="top" rel="tooltip" data-original-title="${fortaleza.hallazgo}">Fortaleza</a> <span class="divider">/</span></li>
    <li>Actividades</li>
    <a id="printEnlace" href="#PM2" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mantenimiento</a>
</ul>
<h3>Listado de Actividades</h3>
<c:choose>
    <c:when test="${fn:length(actividades)!= 0}">
        <table class="table table-striped table-bordered table-condensed">
            <thead>
            <th>Actividad</th>
            <th>Meta</th>    
            <th>Indicador de Cumplimiento</th>    
            <th>Fecha Inicio</th>    
            <th>Fecha Final</th>    
            <th>Responsables</th>    
            <th>Recursos o financiaci&oacute;n</th>    
            <th></th>    
        </thead>
        <tbody>
            <c:forEach items="${actividades}" var="item" varStatus="iter">
                <tr>
                    <td>   
                        <c:out value="${item.actividad}"/>
                    </td>
                    <td>   
                        <c:out value="${item.meta}"/>
                    </td>
                    <td>   
                        <c:out value="${item.indicadorCumplimiento}"/>
                    </td>
                    <td>   
                        <fmt:formatDate value="${item.fechaInicio}" pattern="yyyy/MM/dd" />
                    </td>
                    <td>   
                        <fmt:formatDate value="${item.fechaFinal}" pattern="yyyy/MM/dd"  />
                    </td>
                    <td>   
                        <c:out value="${item.responsable}"/>
                    </td>
                    <td>   
                        <c:out value="${item.financiacion}"/>
                    </td>

                    <td>   
                        <a href="#editarActividadF&${item.idactividad}" title="Editar"><i class="icon-edit"></i></a>
                        <a href="#verFSeguimientos&${item.idactividad}" title="Ver Seguimientos"><i class="icon-eye-open"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:when>
<c:otherwise>
    Aun no existen Actividades para esta Fortaleza.<br/>
</c:otherwise>
</c:choose>
<a href="#crearActividadF" class="btn btn-large btn-primary"><i class="icon-plus"></i> Crear Actividad</a>

