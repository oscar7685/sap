<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3 style="margin: 0;">Listado de Indicadores Arcusur</h3>
            <c:choose>
                <c:when test="${fn:length(listaI)!= 0}">

                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th class="span2">C&oacute;digo</th>    
                        <th class="span8">Indicador</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listaI}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.codigo}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.nombre}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No existen indicadores registrados en el sistema para este modelo.
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${Proceso.modeloId.id == 6}">
                    <a href="#indicadoresEliminados" class="btn btn-large llamador"><i class="icon-remove"></i> Ver indicadores SAP eliminados</a>
                    <a href="#indicadoresSinAsociacion" class="btn btn-large llamador"><i class="icon-off"></i> Ver indicadores Arcusur sin asociacion</a>
                </c:when>
            </c:choose>


        </div>
    </div>
</div>    
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTableSinPaginacion.js"></script>
