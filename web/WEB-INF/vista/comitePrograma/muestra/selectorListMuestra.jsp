<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" media="print">
<script type="text/javascript">
    $(function() {

        $(".btn-group > .btn").click(function() {
            $("tr.terminadoC").hide();
            $("tr.pendienteC").hide();
            $(".btn-group input").each(function(index) {
                if ($(this).prop("checked") && index == 0) {
                    $("tr.pendienteC").show();
                } else if ($(this).prop("checked") && index == 1) {
                    $("tr.terminadoC").show();
                }
            });
            $("#total").text("Total: " + ($("tr.terminadoC:visible").length + $("tr.pendienteC:visible").length));
        });
        marcacion = new Date();
        Hora = marcacion.getHours();
        Minutos = marcacion.getMinutes();
        Segundos = marcacion.getSeconds();
        if (Hora <= 9)
            Hora = "0" + Hora
        if (Minutos <= 9)
            Minutos = "0" + Minutos
        if (Segundos <= 9)
            Segundos = "0" + Segundos
        var Dia = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo");
        var Mes = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
        var Hoy = new Date();
        var Anio = Hoy.getFullYear();
        var Fecha = Dia[Hoy.getDay()] + " " + Hoy.getDate() + " de " + Mes[Hoy.getMonth()] + " de " + Anio + ", a las " + Hora + ":" + Minutos + ":" + Segundos;
        $("#hora").html(" " + Fecha);
        $("#bpreparedEditarMuestra").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=preparedEditarMuestra&fuente=${fuenteX}",
                success: function(datos) {
                    $("#editM").empty();
                    $("#editM").append(datos);
                    $("#contenido").show(200, function() {
                        $("#dancing-dots-text").remove();
                    });
                } //fin success
            }); //fin $.ajax    

        });
        $("#printEnlace").click(function() {
            $('#printMuestra').printArea();
            return false;
        });
        $("#actEnlace").click(function() {
            marcacion = new Date()
            Hora = marcacion.getHours()
            Minutos = marcacion.getMinutes()
            Segundos = marcacion.getSeconds()
            if (Hora <= 9)
                Hora = "0" + Hora
            if (Minutos <= 9)
                Minutos = "0" + Minutos
            if (Segundos <= 9)
                Segundos = "0" + Segundos
            var Dia = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo");
            var Mes = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
            var Hoy = new Date();
            var Anio = Hoy.getFullYear();
            var Fecha = Dia[Hoy.getDay()] + " " + Hoy.getDate() + " de " + Mes[Hoy.getMonth()] + " de " + Anio + ", a las " + Hora + ":" + Minutos + ":" + Segundos;
            $("#hora").html(" " + Fecha);
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=selectorListSemestre",
                data: $("#formListarMuestra").serialize(),
                success: function(datos) {
                    $("#listM").empty();
                    $("#listM").append(datos);
                    $("#contenido").show(200, function() {
                        $("#dancing-dots-text").remove();
                    });
                } //fin success
            }); //fin $.ajax   
        });
    });</script>
    <c:if test="${EstadoProceso == 2}">
    <div class="span10">
        <a style="float:right; cursor: pointer" id="actEnlace"><i class="icon-refresh"></i> Actualizar</a>  
        <a style="float:right; padding-right: 10px; cursor: pointer" id="printEnlace"><i class="icon-print"></i> Imprimir</a>      
    </div>

</c:if>
<c:if test="${EstadoProceso != 2}">
    <div class="span10">
        <a  style="float: right; cursor: pointer" id="printEnlace"><i class="icon-print"></i> Imprimir</a>  
    </div>

</c:if>
<div id="printMuestra">
    <p style="font-weight: bold">Muestra generada para la fuente ${fuenteX}.</p>
    <c:if test="${EstadoProceso == 2}">
        <div>
            <div style="margin-left: 0px;" class="span1"><span style="margin-left: 0px;" id="spanActualizado" class="label label-info span1">Actualizado</span></div>
            <div class="span9"><p id="hora" class="help-block"></p></div>
        </div>
    </c:if>
    <div id="listM2" class="span10" style="margin-left: 0px;">
        <div class="span10" style="margin-left: 0px;">
            <div id="editM">
                <c:choose>
                    <c:when test="${Muestra != null}">
                        <c:if test="${EstadoProceso == 2}">

                            <ul class="nav nav-tabs" id="myTab">
                                <li class="active"><a href="#poblacionest" data-toggle="tab">Población</a></li>
                                <li><a href="#muestraes" data-toggle="tab">Muestra</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="poblacionest">
                                    <table id="tablaestudiante0" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Identificación</th>
                                                <th>Nombre</th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodytablaestudiante">
                                            <c:choose>
                                                <c:when test="${fn:length(poblacion)!= 0}">
                                                    <c:forEach items="${poblacion}" var="paux" varStatus="iter55">
                                                        <tr>
                                                            <td>${paux.personaId.id}</td>
                                                            <td>${paux.personaId.nombre}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>
                                        </tbody>
                                    </table>
                                    <p id="total0" style="font-weight: bold">Total: ${fn:length(poblacion)}</p>
                                </div>
                                <div class="tab-pane" id="muestraes">
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-danger">
                                            <input type="checkbox" autocomplete="off" checked>Pendiente
                                        </label>
                                        <label class="btn btn-success">
                                            <input type="checkbox" autocomplete="off" checked>Terminado
                                        </label>
                                    </div>
                                    <br><br>
                                    <table id="tablaY1" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Identificación</th>
                                                <th>Nombre</th>
                                                    <c:if test="${fuenteX == 'Estudiante' || fuenteX == 'Docente' || fuenteX == 'Administrativo' || fuenteX == 'Egresado'}">
                                                    <th>Tipo</th>
                                                    </c:if>
                                                    <c:if test="${fuenteX == 'Estudiante'}">
                                                    <th>Curso</th>
                                                    </c:if>

                                            </tr>
                                        </thead>
                                        <tbody id="bodytablaestudiante">
                                            <c:choose>
                                                <c:when test="${fn:length(listMuestraCon)!= 0}">
                                                    <c:forEach items="${listMuestraCon}" var="faux" varStatus="iter55">
                                                        <tr class="terminadoC">
                                                            <td style="background-color: #DFF0D8; color: #468847;"> ${faux.muestrapersonaId.cedula}</td>
                                                            <td style="background-color: #DFF0D8; color: #468847;"> ${faux.muestrapersonaId.nombre}</td>
                                                            <c:if test="${fuenteX == 'Estudiante' || fuenteX == 'Docente' || fuenteX == 'Administrativo' || fuenteX == 'Egresado'}">
                                                                <td style="background-color: #DFF0D8; color: #468847;"> ${faux.tp}</td>
                                                            </c:if>
                                                            <c:if test="${fuenteX == 'Estudiante'}">
                                                                <td style="background-color: #DFF0D8; color: #468847;"> ${faux.curso}</td>
                                                            </c:if>

                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${fn:length(listMuestraSin)!= 0}">
                                                    <c:forEach items="${listMuestraSin}" var="faux" varStatus="iter55">
                                                        <tr class="pendienteC">
                                                            <td style="background-color: #F2DEDE; color: #B94A48"> ${faux.muestrapersonaId.cedula}</td>
                                                            <td style="background-color: #F2DEDE; color: #B94A48;"> ${faux.muestrapersonaId.nombre}</td>
                                                            <c:if test="${fuenteX == 'Estudiante' || fuenteX == 'Docente' || fuenteX == 'Administrativo' || fuenteX == 'Egresado'}">
                                                                <td style="background-color: #F2DEDE; color: #B94A48;"> ${faux.tp}</td>
                                                            </c:if>
                                                            <c:if test="${fuenteX == 'Estudiante'}">
                                                                <td style="background-color: #F2DEDE; color: #B94A48;"> ${faux.curso}</td>
                                                            </c:if>

                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>

                                        </tbody>
                                    </table>
                                    <c:if test="${(EstadoProceso == 2 || EstadoProceso == 1) && tipoLogin=='Comite central'}">
                                        <a id="bpreparedEditarMuestra" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                                    </c:if>
                                    <p id="total" style="font-weight: bold">Total: ${fn:length(listMuestraCon) + fn:length(listMuestraSin)}</p>
                                </div>
                            </div>


                        </c:if>
                        <c:if test="${EstadoProceso != 2}">

                        </c:if>

                    </c:when>
                    <c:otherwise>
                        No  se ha generado la muestra para la fuente seleccionada.
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('#tablaY1').DataTable({
            bPaginate: false,
            aaSorting: [],
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    text: 'Copiar'
                },
                {
                    extend: 'excelHtml5',
                    exportOptions: {
                        rows: ':visible'
                    },
                    text: 'Exportar a excel',
                    title: 'Muestra ${fuenteX}'
                }
            ],
            language: {
                buttons: {
                    copyTitle: 'Copiar'
                },
                "lengthMenu": "Display _MENU_ records per page",
                "zeroRecords": "Nothing found - sorry",
                "info": "Mostrando page _PAGE_ of _PAGES_",
                "infoEmpty": "No records available",
                "sInfo": "Mostrando registros del _START_ al _END_ de _TOTAL_",
                "infoFiltered": "(filtered from _MAX_ total records)",
                sSearch: "Buscar:"
            }
        });
    });
</script>
