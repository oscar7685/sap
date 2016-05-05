<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
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
    <div class="row">
        <div id="conte" class="span10">
            <fieldset>
                <legend>
                    Estado del proceso
                </legend>
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
