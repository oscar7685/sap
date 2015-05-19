<%-- 
    Document   : controlPanel
    Created on : 11-jun-2013, 18:22:09
    Author     : Arturo
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3>Procesos de autoevaluaci�n activos</h3>
            <c:choose>
                <c:when test="${fn:length(listProcesos)!= 0}">
                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>Facultad</th>    
                        <th>Programa</th>
                        <th>Fecha de Inicio</th>
                        <th>Estado</th>
                        <th>Operaciones</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listProcesos}" var="row" varStatus="iter">
                                <c:if test="${row.fechainicio == 'En Configuraci�n'}">
                                    <tr  class="warning">
                                        <td>   
                                            <c:out value="${row.programaId.facultadId.nombre}"/>
                                        </td>
                                        <td>   
                                            <a href="#verProcesos&${row.programaId.id}">${row.programaId.nombre}</a>
                                        </td>
                                        <td>   
                                            <c:out value="${row.fechainicio}"/>
                                        </td>
                                        <td>
                                            <span class="label label-warning"><i class="icon-cog"></i> En Configuraci�n</span>
                                        </td>
                                        <td>
                                            <i class="icon-chevron-sign-right"></i><a href="#ejecutarPro&${row.id}"> Ejecutar Proceso</a>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${row.fechainicio != 'En Configuraci�n' && row.fechacierre=='--'}">
                                    <tr  class="info">
                                        <td>   
                                            <c:out value="${row.programaId.facultadId.nombre}"/>
                                        </td>
                                        <td>   
                                            <a href="#verProcesos&${row.programaId.id}">${row.programaId.nombre}</a>
                                        </td>
                                        <td>   
                                            <c:out value="${row.fechainicio}"/>
                                        </td>
                                        <td>   
                                            <span class="label label-info"><i class="icon-play-sign"></i> En Ejecuci�n</span>
                                        </td>
                                        <td>
                                            <i class="icon-flag-checkered"></i><a href="#finalizarPro&${row.id}"> Finalizar Proceso</a>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:if test="${row.fechainicio != 'En Configuraci�n' && row.fechacierre!='--'}">
                                    <tr  class="success">
                                        <td>   
                                            <c:out value="${row.programaId.facultadId.nombre}"/>
                                        </td>
                                        <td>   
                                            <a href="#verProcesos&${row.programaId.id}">${row.programaId.nombre}</a>
                                        </td>
                                        <td>   
                                            <c:out value="${row.fechainicio}"/>
                                        </td>
                                        <td>   
                                            <span class="label label-success"><i class="icon-flag-checkered"></i> Proceso finalizado</span>
                                        </td>
                                        <td>

                                        </td>
                                    </tr>
                                </c:if>    
                            </c:forEach>
                        </tbody>
                    </table>
                    <script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable.js"></script>
                </c:when>
                <c:otherwise>
                    No  se han encontrado procesos activos.
                </c:otherwise>
            </c:choose>
            <br>
            <a href="#preparedCrearProceso" class="btn btn-large btn-primary llamador"><i class="icon-plus"></i> Crear nuevo proceso</a>
        </div>
    </div>
</div>

