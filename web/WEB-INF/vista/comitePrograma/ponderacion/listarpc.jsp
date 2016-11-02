<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
    .popover{
        min-width:550px;
        width: auto;
        text-align: center;
    }
    .popover-title {
        font-weight: bold;
    }
</style>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3>Componentes <i id="popover" class="icon-question-sign" rel="popover" data-title="Escala nivel de importancia"></i></h3>
                <c:choose>
                    <c:when test="${fn:length(listPonderacionCara)!= 0}">
                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th>C&oacute;digo</th>    
                        <th>Componente</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listPonderacionCara}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.caracteristicaId.codigo}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.caracteristicaId.nombre}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${EstadoProceso == 1}">
                        <a href="#preparedEditPonderarCara" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Ponderaci�n</a>
                    </c:if>
                    <script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTable.js"></script>
                </c:when>
                <c:otherwise>
                    No  se han ponderado las caracter�sticas en el sistema para este proceso.
                    <br><br>
                    <a href="#preparedPonderarCara" class="btn btn-large btn-primary llamador"><i class="icon-plus-sign"></i> Asignar Ponderaci�n</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>    

