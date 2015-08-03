<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        marcacion = new Date()
        Hora = marcacion.getHours()
        Minutos = marcacion.getMinutes()
        Segundos = marcacion.getSeconds()
        if (Hora <= 9)
            Hora = "0" + Hora;
        if (Minutos <= 9)
            Minutos = "0" + Minutos;
        if (Segundos <= 9)
            Segundos = "0" + Segundos;
        var Dia = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo");
        var Mes = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
        var Hoy = new Date();
        var Anio = Hoy.getFullYear();
        var Fecha = Dia[Hoy.getDay()] + " " + Hoy.getDate() + " de " + Mes[Hoy.getMonth()] + " de " + Anio + ", a las " + Hora + ":" + Minutos + ":" + Segundos;
        $("#horaEstado").html(" " + Fecha);

        if (${aux_index2 == 2}) {
            /*$.ajax({
             type: 'POST',
             url: "sap/ControllerAI?action=recargarEstado",
             success: function(data){
             $("#estado").empty();
             $("#estado").html(data);
             }
             });*/
        }
        $("#actEnlaceEstado").click(function() {
            /*   $("div.ui-layout-center").empty();
             $.ajax({
             type: 'POST',
             url: "sap/ControllerAI?action=estadoProcesoAI",
             success: function(data) {
             $(".contenido").html(data);
             setTimeout(function() {
             $("#dancing-dots-text").remove();
             }, 200)
             } //fin success
             }); //fin $.ajaxF          
             
             $.ajax({
             type: 'POST',
             url: "sap/ControllerAI?action=recargarEstado",
             success: function(data) {
             $("#estado").empty();
             $("#estado").html(data);
             }
             });
             */
        }); //fin eventoClick #actEnlaceEstado

        $(".printEnlace").click(function() {
            $('#conte').jqprint();
            return false;
        });
    });



    $(function() {
        var chart;
        $(document).ready(function() {
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'container',
                    type: 'column'
                },
                title: {
                    text: 'Muestra seleccionada y evaluada'
                },
                xAxis: {
                    categories: [
                        'Estudiantes',
                        'Docentes',
                        'Administrativos',
                        'Directores de programa',
                        'Egresados',
                        'Empleadores',
                    ]
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Número de personas'
                    }
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0,
                        dataLabels: {
                            enabled: true,
                            color: "#4572A7",
                            style: {
                                fontWeight: 'bold'
                            },
                            formatter: function() {
                                return this.y + '';
                            }
                        }
                    }
                },
                series: [{
                        name: 'Seleccionados',
                        data: [${totalEst}, ${totalDoc}, ${totalAdm}, ${totalDir}, ${totalEgr}, ${totalEmp}]

                    }, {
                        name: 'Evaluados',
                        data: [${terminadosEst}, ${terminadosDoc}, ${terminadosAdm}, ${terminadosDir}, ${terminadosEgr}, ${terminadosEmp}],
                        color: '#89A54E'

                    }],
                tooltip: {
                    formatter: function() {
                        return '<b>' + this.x + '</b>: ' + this.y + ' personas';
                    }
                }

            });
        });
    });
</script>
<div class="hero-unit">
    <a  class="span10 printEnlace" style="text-align: right; margin-left: 0px; text-align: right; cursor: pointer"><i class="icon-print"></i> Imprimir</a>  
    <div class="row">
        <div id="conte" class="span10">
            <fieldset>
                <legend>
                    Estado del proceso
                </legend>
                <c:if test="${aux_index2 != 3}">
                    <div class="span10" style="margin-left: 0px;">
                        <div class="span1" style="margin-left: 0px;"><span class="label label-info span1" id="spanActualizadoEstado" style="margin-left: 0px;">Actualizado</span></div>
                        <div class="span7" style="margin-left: 30px;"><p class="help-block" id="horaEstado"></p></div>
                        <div class="span2" style="margin-left: 30px; text-align: right;"><a style="cursor: pointer" id="actEnlaceEstado"><i class="icon-refresh"></i> Actualizar</a></div>
                    </div>
                </c:if>
                <div>
                    <p>
                        Detalle:
                    </p>
                </div>
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                    <th>Descripción</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Cierre</th>
                    <th>Programa</th>
                    </thead>
                    <tbody>
                        <tr> 
                            <td class="span4">${Proceso.descripcion}</td>
                            <td>${Proceso.fechainicio}</td>
                            <td>${Proceso.fechacierre}</td>
                            <td>${Proceso.programaId.nombre}</td>
                        </tr>
                    </tbody>
                </table> 
                <br>
                <p>Informes: </p>
                <div>
                    <a  href="<%=request.getContextPath()%>/#informeMatrizFactores" class="btn btn-warning"><i class="icon-bar-chart">  </i>Matriz de calidad por factores</a>
                    <a  href="<%=request.getContextPath()%>/#informeMatrizCaracteristicas" class="btn btn-warning"><i class="icon-bar-chart">  </i>Matriz de calidad por caracter&iacute;sticas</a>
                    <a  href="<%=request.getContextPath()%>/#resultadosGenerales"><i class="icon-bar-chart"></i> Resultados Generales</a>
                    <c:if test="${EstadoProceso == 3}">
                    <a class="btn btn-warning" href="<%=request.getContextPath()%>/#todosResultados"><i class="icon-bar-chart"></i> Resultados</a>
                    <a class="btn btn-warning" href="<%=request.getContextPath()%>/#comentarios"><i class="icon-comment"></i> Comentarios</a>    
                    </c:if>




                    <div class="btn-group">
                        <a class="btn btn-warning" href="<%=request.getContextPath()%>/#encuestaAleatoria"><i class="icon-random"></i> Ver al azar encuesta respondida</a>
                        <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="#encuestaXaleatoria&1">de un estudiante</a></li>
                            <li><a href="#encuestaXaleatoria&2">de un docente</a></li>
                            <li><a href="#encuestaXaleatoria&4">de un egresado</a></li>
                            <li><a href="#encuestaXaleatoria&3">de un administrativo</a></li>
                            <li><a href="#encuestaXaleatoria&5">de un director de programa</a></li>
                            <li><a href="#encuestaXaleatoria&6">de un empleador</a></li>
                        </ul>
                    </div>
                </div>
                <br>
                <p>Estado general del proceso:</p>
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                    <th>Número total de muestra</th>
                    <th>Número de personas que han evaluado las encuestas</th>
                    <th>Porcentaje de personas que han evaluado las encuestas</th>
                    <th>Número de personas que faltan por evaluar las encuestas</th>
                    <th>Porcentaje de personas que faltan por evaluar las encuestas</th>
                    </thead>
                    <tbody>

                        <tr>  
                            <td>   
                                <c:out value="${totalMuestraX}"/>
                            </td>
                            <td>   
                                <c:out value="${terminadosX}"/>
                            </td>
                            <td>   
                                <fmt:formatNumber type="number" maxFractionDigits="2" value="${terminadosX*100/totalMuestraX}"/>%
                            </td>
                            <td>   
                                <c:out value="${totalMuestraX-terminadosX}"/>
                            </td>
                            <td>   
                                <fmt:formatNumber type="number" maxFractionDigits="2" value="${100-(terminadosX*100/totalMuestraX)}"/>%
                            </td>
                        </tr>


                    </tbody>
                </table><br>

                <p>Estado por fuente del proceso:</p>
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                    <th>Fuente</th>
                    <th>Número total de muestra</th>
                    <th>Número de personas que han evaluado las encuestas</th>
                    <th>Porcentaje de personas que han evaluado las encuestas</th>
                    <th>Número de personas que faltan por evaluar las encuestas</th>
                    <th>Porcentaje de personas que faltan por evaluar las encuestas</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                ESTUDIANTE
                            </td>
                            <td>
                                ${totalEst}
                            </td>
                            <td>
                                ${terminadosEst}
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalEst!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${terminadosEst*100/totalEst}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td>   
                                <c:out value="${totalEst-terminadosEst}"/>
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalEst!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${100-(terminadosEst*100/totalEst)}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                DOCENTE
                            </td>
                            <td>
                                ${totalDoc}
                            </td>
                            <td>
                                ${terminadosDoc}
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalDoc!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${terminadosDoc*100/totalDoc}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td>   
                                <c:out value="${totalDoc-terminadosDoc}"/>
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalDoc!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${100-(terminadosDoc*100/totalDoc)}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>

                        </tr>
                        <tr>
                            <td>
                                ADMINISTRATIVOS
                            </td>
                            <td>
                                ${totalAdm}
                            </td>
                            <td>
                                ${terminadosAdm}
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalAdm!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${terminadosAdm*100/totalAdm}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td>   
                                <c:out value="${totalAdm-terminadosAdm}"/>
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalAdm!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${100-(terminadosAdm*100/totalAdm)}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>

                        </tr>
                        <tr>
                            <td>
                                DIRECTORES DE PROGRAMA
                            </td>
                            <td>
                                ${totalDir}
                            </td>
                            <td>
                                ${terminadosDir}
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalDir!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${terminadosDir*100/totalDir}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td>   
                                <c:out value="${totalDir-terminadosDir}"/>
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalDir!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${100-(terminadosDir*100/totalDir)}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>

                        </tr>
                        <tr>
                            <td>
                                EGRESADOS
                            </td>
                            <td>
                                ${totalEgr}
                            </td>
                            <td>
                                ${terminadosEgr}
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalEgr!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${terminadosEgr*100/totalEgr}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td>   
                                <c:out value="${totalEgr-terminadosEgr}"/>
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalEgr!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${100-(terminadosEgr*100/totalEgr)}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>

                        </tr>

                        <tr>
                            <td>
                                EMPLEADORES
                            </td>
                            <td>
                                ${totalEmp}
                            </td>
                            <td>
                                ${terminadosEmp}
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalEmp!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${terminadosEmp*100/totalEmp}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>
                            <td>   
                                <c:out value="${totalEmp-terminadosEmp}"/>
                            </td>
                            <td>   
                                <c:choose>
                                    <c:when test="${totalEmp!=0}">
                                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${100-(terminadosEmp*100/totalEmp)}"/>%
                                    </c:when>
                                    <c:otherwise>
                                        0%
                                    </c:otherwise>
                                </c:choose>

                            </td>
                        </tr>


                    <div id="container" style="height: 500px; margin: 0 auto" class="span10"></div>             
                    <br>
                    </tbody>
                </table>
            </fieldset>
        </div>
    </div>
</div>                        
