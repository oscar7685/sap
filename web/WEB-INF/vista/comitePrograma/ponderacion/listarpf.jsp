<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
    .popover-content{
        font-size: 14px;
        font-weight: normal;
        line-height: 40px;
        font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
        line-height: 1.42857;
    }
</style>
<script type="text/javascript">
    $(function() {
        $("#popoverF").popover({
            trigger: 'hover',
            placement: 'bottom'
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3>Ponderaci�n de  Dimensiones <i id="popoverF" class="icon-question-sign" rel="popover" data-content="La suma de la ponderaci�n de los factores debe ser 100" data-title="Ponderaci�n de factores"></i></h3>
            <c:choose>
                <c:when test="${fn:length(listPonderacionFactor)!= 0}">
                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>C&oacute;digo</th>    
                        <th>Dimensi�n</th>
                        <th>Ponderaci&oacute;n</th>
                        <th>Justificaci&oacute;n</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listPonderacionFactor}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.factorId.codigo}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.factorId.nombre}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.ponderacion}"/>
                                    </td> <td>   
                                        <c:out value="${row.justificacion}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${EstadoProceso == 1}">
                        <a href="#preparedEditPonderarFactor" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Ponderaci�n</a>
                    </c:if>
                    <script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable.js"></script>
                </c:when>
                <c:otherwise>
                    No  se han ponderado los factores en el sistema para este proceso.
                    <br><br>
                    <a href="#preparedPonderarFactor" class="btn btn-large btn-primary llamador"><i class="icon-plus-sign"></i> Asignar Ponderaci�n</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>    
