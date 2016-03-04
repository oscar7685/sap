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
        $(".printEnlace").click(function() {
            $('#conte').jqprint();
            return false;
        });
        $("#lineamientos").change(function() {
            var tipoLineamiento = $("#lineamientos").val();
            if (tipoLineamiento > 2) {
                $.ajax({
                    type: 'POST',
                    url: "/sapnaval/controladorCP?action=listarProgramasPorLineamiento&tipoLineamiento=" + tipoLineamiento,
                    success: function(data) {
                        $("#programa").empty();
                        $("#programa").html(data);
                        setTimeout(function() {
                            $("#dancing-dots-text").remove();
                            $("#divPrograma").show();
                        }, 200);
                    }
                });
            } else {
                $("#divPrograma").hide();
                if (tipoLineamiento === '2') {
                    $.ajax({
                        type: 'POST',
                        url: "/sapnaval/controladorCP?action=resultadosInstitucionales",
                        success: function(data) {
                            $("#resultados").empty();
                            $("#resultados").html(data);
                            setTimeout(function() {
                                $("#dancing-dots-text").remove();
                            }, 200);
                        }
                    });
                }
            }
        });
        $("#programa").change(function() {
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=resultadosxProgramas&programaId=" + $("#programa").val(),
                success: function(data) {
                    $("#resultados").empty();
                     $("#resultados").html(data);
                     setTimeout(function() {
                     $("#dancing-dots-text").remove();
                     }, 200);
                     
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
                <br/>
                <div>
                    <div class="control-group span4">
                        <label for="lineamientos"  class="control-label">Autoevaluación: </label>
                        <div class="controls">
                            <select id="lineamientos" name="lineamientos" class="span4">
                                <option value="">Selecione un proceso..</option>
                                <option value="2">Autoevaluación Institucional</option>
                                <option value="3">Autoevaluación de programas de pregrado</option>
                                <option value="4">Autoevaluación de programas de maestría y doctorado</option>
                                <option value="5">Autoevaluación de programas de especialización</option>
                            </select>
                        </div>
                    </div>   
                    <div class="control-group span4" id="divPrograma" style="display: none;">
                        <label for="programa"  class="control-label">Programa: </label>
                        <div class="controls">
                            <select id="programa" name="programa" class="span4">
                            </select>
                        </div>
                    </div>  
                </div>
                <br>
            </fieldset>
            <div id="resultados">
            </div>
        </div>
    </div>
</div>                        
