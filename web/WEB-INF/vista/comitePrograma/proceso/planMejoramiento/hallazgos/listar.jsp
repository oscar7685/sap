<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<ul class="breadcrumb">
    <li>Hallazgos</li>
    <a id="printEnlace" href="#PM" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mejoramiento</a>
</ul>
<h3>Listado de  Hallazgos</h3>
<c:choose>
    <c:when test="${fn:length(listHallazgos)!= 0}">
        <table class="table table-striped table-bordered table-condensed">
            <thead>
            <th>Hallazgo</th>
            <th>Caracteristica</th>    
            <th>Acci&oacute;n</th>    
        </thead>
        <tbody>
            <c:forEach items="${listHallazgos}" var="item" varStatus="iter">
                <tr>
                    <td>   
                        <c:out value="${item.hallazgo}"/>
                    </td>
                    <td>   
                        <c:out value="${item.caracteristicaId.nombre}"/>
                    </td>
                    <td>   
                        <a href="#editarHallazgo&${item.idhallazgo}" title="Editar"><i class="icon-edit"></i></a>
                        <a href="#verActividadesH&${item.idhallazgo}" title="Ver Actividades"><i class="icon-signin"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:when>
<c:otherwise>
    Aun no existen Hallazgos para este plan de estrat&eacute;gico.<br/>
</c:otherwise>
</c:choose>
<a href="#crearHallazgo" class="btn btn-large btn-primary"><i class="icon-plus"></i> Crear hallazgo</a>