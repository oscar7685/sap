<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <c:choose>
        <c:when test="${EstadoProceso == 0}">
            <div  align="center" class="alert alert-block">
                <i class="icon-info-sign"></i> No existen proceso activos
            </div>
            <div id="menu" style="padding: 8px 0pt;" class="well">
                <ul class="nav nav-list">  
                    <button id="west-closer" class="close">&laquo;</button>
                    <li><a href="#controlPanel"><i class="icon-level-up"></i>Regresar al panel</a></li>
                    <li class="nav-header">Proceso de Autoevaluación</li>
                        <%-- <li><a href="#preparedCrearProceso"><i class="icon-plus"></i> Crear Proceso</a></li>--%>
                    <li><a href="#listarProceso"><i class="icon-reorder"></i> Listar Procesos</a></li>
                </ul>
            </div>
        </c:when>
        <c:when test="${EstadoProceso == 1}">
            <div align="center" class="alert alert-info"><i class="icon-cog"></i> Proceso en configuración</div>
            <div id="menu" style="padding: 8px 0pt;" class="well">
                <ul class="nav nav-list">  
                    <button id="west-closer" class="close">&laquo;</button>
                    <li><a href="#controlPanel"><i class="icon-level-up"></i>Regresar al panel</a></li>
                    <li class="nav-header">Proceso de Autoevaluación</li>
                    <li><a href="#detalleProceso"><i class="icon-cogs"></i> Detalle de Proceso</a></li>
                    <li><a href="#listPonderacionFactor"><i class="icon-list-ol"></i> Ponderar Factores</a></li>
                    <li><a href="#listPonderacionCara"><i class="icon-list-ol"></i> Ponderar Características</a></li>
                    <li><a href="#listPonderacionInd"><i class="icon-signal"></i> Ponderar Indicadores</a></li>
                    <li><a href="#listMuestra"><i class="icon-group"></i> Asignar Muestra</a></li>
                </ul>
            </div>
        </c:when>
        <c:when test="${EstadoProceso == 2}">
            <div align="center" class="alert alert-success"><i class="icon-play-sign"></i> Proceso en ejecución</div>
            <div id="menu" style="padding: 8px 0pt;" class="well">
                <ul class="nav nav-list">  
                    <button id="west-closer" class="close">&laquo;</button>
                    <li><a href="#controlPanel"><i class="icon-level-up"></i>Regresar al panel</a></li>
                    <li class="nav-header">Proceso de Autoevaluación</li>
                    <li><a href="#detalleProceso"><i class="icon-cogs"></i> Detalle de Proceso</a></li>
                    <li><a href="#listPonderacionFactor"><i class="icon-list"></i> Factores</a></li>
                    <li><a href="#listPonderacionCara"><i class="icon-list"></i> Características</a></li>
                    <!--<li><a href="#listEncuestas"><i class="icon-check"></i> Encuestas</a></li>-->
                    <li><a href="#listMuestra"><i class="icon-group"></i> Muestra Asignada</a></li>
                    <li><a href="#preparedInfoNumerica"><i class="icon-list-ol"></i> Información Numérica</a></li>
                    <li><a href="#preparedInfoDocumental"><i class="icon-file-alt"></i> Información Documental</a></li>
                    <li class="nav-header">Informes</li>
                    <li><a  id="informeEncuesta"  href="#estadoProceso"><i class="icon-table"></i> Informe DMA</a></li>
                    <li><a href="#graficasDMA"><i class="icon-bar-chart"></i> Graficas DMA</a></li>
                </ul>
            </div>
        </c:when>
        <c:when test="${EstadoProceso == 3}">
            <div align="center" class="alert alert-error"><i class="icon-play-sign"></i> Proceso finalizado</div>
            <div id="menu" style="padding: 8px 0pt;" class="well">
                <ul class="nav nav-list">  
                    <button id="west-closer" class="close">&laquo;</button>
                    <li><a href="#controlPanel"><i class="icon-level-up"></i>Regresar al panel</a></li>
                    <li class="nav-header">Proceso de Autoevaluación</li>
                    <li><a href="#detalleProceso"><i class="icon-cogs"></i> Detalle de Proceso</a></li>
                    <li><a href="#listPonderacionFactor"><i class="icon-list"></i> Factores</a></li>
                    <li><a href="#listPonderacionCara"><i class="icon-list"></i> Características</a></li>
                    <li><a href="#listMuestra"><i class="icon-group"></i> Muestra Asignada</a></li>
                    <li><a href="#preparedInfoNumerica"><i class="icon-list-ol"></i> Información Numérica</a></li>
                    <li><a href="#preparedInfoDocumental"><i class="icon-file-alt"></i> Información Documental</a></li>
                    <li><a  id="informeEncuesta"  href="<%=request.getContextPath()%>/#estadoProceso"><i class="icon-bar-chart"></i> Estado del proceso</a></li>
                    <li class="divider"></li>
                    <li><a href="#listarProceso"><i class="icon-reorder"></i> Listar Procesos</a></li>
                </ul>
            </div>
        </c:when>
        <c:otherwise>
        </c:otherwise>
    </c:choose>

<c:choose>
    <c:when test="${EstadoProceso == 0}">
        <script type="text/javascript" >
            $(function() {
                location = "#listarProceso";
            });
        </script>
    </c:when>
</c:choose>     