<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="hero-unit">
    <div style="margin-left: -30px;">
        <div id="conte" class="span10" style="text-align: justify">
            <div class="row">
                <ul class="nav nav-tabs" role="tablist">
                    <li><a href="#home" role="tab" data-toggle="tab">Plan de mejoramiento</a></li>
                    <li class="active"><a href="#profile" role="tab" data-toggle="tab">Plan de mantenimiento</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane" id="home">
                        <ul class="breadcrumb">
                            <li>Hallazgos</li>
                            <a id="printEnlace" target="_blank" href="/sapenfermeria/controladorCP?action=PM" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mejoramiento</a>
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
                                                    <a href="#verMetas&${item.idhallazgo}" title="Ver Actividades"><i class="icon-signin"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:when>
                            <c:otherwise>
                                Aun no existen Hallazgos para este plan de mantenimiento.<br/>
                            </c:otherwise>
                        </c:choose>
                        <a href="#crearHallazgo" class="btn btn-large btn-primary"><i class="icon-plus"></i> Crear hallazgo</a>    
                    </div>

                    <div class="tab-pane active" id="profile">
                        <ul class="breadcrumb">
                            <li>Fortalezas</li>
                            <a id="printEnlace" target="_blank" href="/sapenfermeria/controladorCP?action=PM2" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mantenimiento</a>
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
                                                    <a href="#verMetas&${item.idhallazgo}" title="Ver Actividades"><i class="icon-signin"></i></a>
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
                    </div>        
                </div>
            </div>
        </div>
    </div>
</div>

