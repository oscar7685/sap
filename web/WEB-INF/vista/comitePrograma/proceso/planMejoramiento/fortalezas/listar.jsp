<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<ul class="breadcrumb">
    <li>Fortalezas</li>
    <a id="printEnlace" target="_blank" href="/sap/controladorCP?action=PM2" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mantenimiento</a>
</ul>
<h3>Listado de  Fortalezas</h3>
<c:choose>
    <c:when test="${fn:length(listFortalezas)!= 0}">
        <table class="table table-striped table-bordered table-condensed">
            <thead>
            <th>Fortaleza</th>
            <th>Caracteristica</th>    
            <th>Acci&oacute;n</th>    
        </thead>
        <tbody>
            <c:forEach items="${listFortalezas}" var="item" varStatus="iter">
                <tr>
                    <td>   
                        <c:out value="${item.hallazgo}"/>
                    </td>
                    <td>   
                        <c:out value="${item.caracteristicaId.nombre}"/>
                    </td>
                    <td>   
                        <a href="#editarFortaleza&${item.idhallazgo}" title="Editar"><i class="icon-edit"></i></a>
                        <a href="#verActividades&${item.idhallazgo}" title="Ver Actividades"><i class="icon-signin"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:when>
<c:otherwise>
    Aun no existen Fortalezas para este plan de mantenimiento.<br/>
</c:otherwise>
</c:choose>
<a href="#crearFortaleza" class="btn btn-large btn-primary"><i class="icon-plus"></i> Crear fortaleza</a>    