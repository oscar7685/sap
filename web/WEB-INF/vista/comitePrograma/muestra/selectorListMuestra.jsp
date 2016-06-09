<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/print.css" media="print">
<link rel="stylesheet" href="css/jquery.fileupload.css">
<style type="text/css">
    #sharefLI_1 {
        box-sizing: border-box;
        color: rgb(95, 118, 118);
        height: 43px;
        width: 506.031px;
        perspective-origin: 253.016px 21.5px;
        transform-origin: 253.016px 21.5px;
        border: 0px none rgb(95, 118, 118);
        font: normal normal normal normal 14px / 20px 'Source Sans Pro', 'Segoe UI', 'Droid Sans', Tahoma, Arial, sans-serif;
        list-style: none outside none;
        outline: rgb(95, 118, 118) none 0px;
    }/*#sharefLI_1*/

    #sharefA_2 {
        box-sizing: border-box;
        color: rgb(52, 152, 219);
        cursor: pointer;
        display: inline-block;
        height: 43px;
        text-align: center;
        text-decoration: none;
        touch-action: manipulation;
        vertical-align: middle;
        white-space: nowrap;
        width: 235.297px;
        perspective-origin: 117.641px 21.5px;
        transform-origin: 117.641px 21.5px;
        background: rgba(255, 255, 255, 0) none repeat scroll 0% 0% / auto padding-box border-box;
        border: 1px solid rgb(52, 152, 219);
        border-radius: 3px 3px 3px 3px;
        font: normal normal normal normal 17px / 22.61px 'Source Sans Pro', 'Segoe UI', 'Droid Sans', Tahoma, Arial, sans-serif;
        list-style: none outside none;
        outline: rgb(52, 152, 219) none 0px;
        padding: 0px 29px 0px 21px;
    }/*#sharefA_2*/

    #sharefI_3 {
        box-shadow: rgba(0, 0, 0, 0.0980392) -1px 0px 0px 0px inset;
        box-sizing: border-box;
        color: rgb(52, 152, 219);
        cursor: pointer;
        display: inline-block;
        height: 41px;
        left: -21px;
        position: relative;
        text-align: center;
        white-space: nowrap;
        width: 48px;
        perspective-origin: 24px 20.5px;
        transform-origin: 24px 20.5px;
        background: rgba(0, 0, 0, 0.0196078) none repeat scroll 0% 0% / auto padding-box border-box;
        border: 0px none rgb(52, 152, 219);
        border-radius: 3px 0 0 3px;
        font: normal normal normal normal 17px / 23px FontAwesome;
        list-style: none outside none;
        outline: rgb(52, 152, 219) none 0px;
        padding: 9px;
    }/*#sharefI_3*/

    #sharefI_3:before {
        box-sizing: border-box;
        color: rgb(52, 152, 219);
        cursor: pointer;
        text-align: center;
        white-space: nowrap;
        border: 0px none rgb(52, 152, 219);
        font: normal normal normal normal 17px / 23px FontAwesome;
        list-style: none outside none;
        outline: rgb(52, 152, 219) none 0px;
    }/*#sharefI_3:before*/
</style>
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
        var Dia = new Array("Domingo", "Lunes", "Martes", "Mi�rcoles", "Jueves", "Viernes", "S�bado", "Domingo");
        var Mes = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
        var Hoy = new Date();
        var Anio = Hoy.getFullYear();
        var Fecha = Dia[Hoy.getDay()] + " " + Hoy.getDate() + " de " + Mes[Hoy.getMonth()] + " de " + Anio + ", a las " + Hora + ":" + Minutos + ":" + Segundos;
        $("#hora").html(" " + Fecha);

        $("#bpreparedCrearPersona").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=preparedCrearEvaluador&fuente=${fuenteX}",
                success: function(datos) {
                    $("#editM").empty();
                    $("#editM").append(datos);
                    $("#contenido").show(200, function() {
                        $("#dancing-dots-text").remove();
                    });
                } //fin success
            }); //fin $.ajax    

        });

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
            var Dia = new Array("Domingo", "Lunes", "Martes", "Mi�rcoles", "Jueves", "Viernes", "S�bado", "Domingo");
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
                                <li class="active"><a href="#poblacionest" data-toggle="tab">Poblaci�n</a></li>
                                <li><a href="#muestraes" data-toggle="tab">Muestra</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="poblacionest">
                                    <table id="tablaestudiante0" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Identificaci�n</th>
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
                                    <c:if test="${(EstadoProceso == 2 || EstadoProceso == 1) && tipoLogin=='Comite central'}">
                                        <a id="bpreparedCrearPersona" class="btn btn-large btn-primary"><i class="icon-edit-sign"></i> Crear Evaluador</a>
                                    </c:if>
                                    <p id="total0" style="font-weight: bold">Total: ${fn:length(poblacion)}</p>
                                    <c:if test="${(EstadoProceso == 2 || EstadoProceso == 1) && tipoLogin=='Comite central'}">
                                        <h2>Adjuntar Archivo con la poblaci�n</h2> 
                                        <form action="Formulario" class="form row-border" enctype='multipart/form-data'>
                                            <div class="form-group">
                                                <!-- The global progress bar -->
                                                <div class="col-sm-12">
                                                    <div id="progress" class="progress">
                                                        <div class="progress-bar progress-bar-success"></div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-5">

                                                    <span class="btn btn-success fileinput-button">      
                                                        <i class="glyphicon glyphicon-plus"></i>
                                                        <span>Seleccionar archivo...</span>
                                                        <input id="fileupload" type="file" name="files[]" multiple>
                                                    </span>

                                                </div>
                                                <label class="col-sm-10 control-label">Ingrese el archivo excel con la poblaci&oacute;n de ${fuenteX}s asociada del programa ${Proceso.programaId.nombre}.<br>Solamente se aceptan archivos con el formato brindado.</label>

                                                <div class="col-sm-10">
                                                    <div class="col-sm-5">
                                                        <li id="sharefLI_1">
                                                            <a href="DescargarFormato?fuente=${fuenteX}" id="sharefA_2" target="_blank"><i id="sharefI_3" class="icon-download-alt"></i> Descargar formato</a>
                                                        </li>
                                                    </div>
                                                    <!-- The file input field used as target for the file upload widget -->
                                                    <!-- The container for the uploaded files -->
                                                    <div id="files" class="files"></div>
                                                </div>
                                            </div>

                                        </form>
                                    </c:if>
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
                                                <th>Identificaci�n</th>
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
<script src="js/vendor/jquery.ui.widget.js"></script>
<script src="js/jquery.iframe-transport.js"></script>
<script src="js/jquery.fileupload.js"></script>
<script src="js/jquery.fileupload-process.js"></script>
<script src="js/jquery.fileupload-validate.js"></script>
<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        'use strict';

    // Initialize the jQuery File Upload widget:
    $('#fileupload').fileupload({
        // Uncomment the following to send cross-domain cookies:
        //xhrFields: {withCredentials: true},
        url: 'SubirArchivo',
        acceptFileTypes: /(\.|\/)(gif|jpg|png|pdf|xlsx)$/i,
        previewFileTypes: /^.*\/(gif|jpeg|png|pdf|PDF)$/

    });

    // Enable iframe cross-domain access via redirect option:
    $('#fileupload').fileupload(
            'option',
            'redirect',
            window.location.href.replace(
            /\/[^\/]*$/,
            '/cors/result.html?%s'
            )
            ).bind('fileuploaddestroy', function(e, data) {
        if (e.isDefaultPrevented()) {
            return false;
        }
        var that = $(this).data('blueimp-fileupload') ||
                $(this).data('fileupload'),
                removeNode = function() {
            that._transition(data.context).done(
                    function() {
                        $(this).remove();
                        that._trigger('destroyed', e, data);
                    }
            );
        };
        if (data.url) {
            data.dataType = data.dataType || that.options.dataType;
            $.ajax(data).done(removeNode).fail(function() {
                that._trigger('destroyfailed', e, data);
                removeNode();
            });
        } else {
            removeNode();
        }

    }).bind('fileuploaddone', function(e, data) {
        $("#dancing-dots-text").remove();
        $('#selectListMuestra').val('--').trigger('change');
    });


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
