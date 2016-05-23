<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.pagination.js"></script>
<script type="text/javascript">
    var itemsxpagina = 10;
    function pageselectCallback(page_index, jq) {
        var num_entries = $("#preguntas tr").length;
        for (var i = 0; i < num_entries; i++)
        {
            $('#preguntas tr:eq(' + i + ')').css("display", "none");
        }
        var max_elem = Math.min((page_index + 1) * itemsxpagina, num_entries);
        for (var i = page_index * itemsxpagina; i < max_elem; i++)
        {
            $('#preguntas tr:eq(' + i + ')').css("display", "table-row");

        }
        return false;
    }

    function initPagination() {
        // count entries inside the hidden content
        var num_entries = jQuery('#preguntas tr').length;

        // Create content inside pagination element
        $(".pagination").pagination(num_entries, {
            callback: pageselectCallback,
            items_per_page: itemsxpagina,
            num_display_entries: 4,
            num_edge_entries: 2,
            prev_text: "&larr; Anterior",
            next_text: "Siguiente &rarr;",
            prev_show_always: false,
            next_show_always: false
        });
    }
    $(document).ready(function() {
        initPagination();
    });

</script>

<script type="text/javascript">
    $(function() {
        var inst = $("#ins").val();
        inst = inst.replace(/\n/gi, "<br/>");

        $("#insp").append(inst);



        var validator = $("#formResponderE").bind("invalid-form.validate", function() {
            alert("usted ha dejado de contestar " + validator.numberOfInvalids() + " preguntas, por favor contestelas todas.");
        })
                .validate({
            ignore: "",
            submitHandler: function() {
            $("#enviar").attr("disabled", true);
                $.ajax({
                    type: 'POST',
                    url: "<%=request.getContextPath()%>/controladorF?action=responderE",
                    data: $("#formResponderE").serialize(),
                    beforeSend: function() {
                        $("div.ui-layout-center").append(""
                                + "<div id='dancing-dots-text'>"
                                + "Enviando <span><span>.</span><span>.</span><span>.</span><span>.</span><span>.</span></span> "
                                + "</div>");
                    },
                    success: function() {
                        $("#dancing-dots-text").remove();
                        $("#myModalGracias").modal();
                        $('#myModalGracias').on('hidden', function() {
                            location = "<%=request.getContextPath()%>/#inicio";
                        });

                    } //fin success
                }); //fin $.ajax    
            }
        });
        $("button")
                .popover({trigger: "hover", placement: 'top'});

        $("#guardar").click(function(e) {
            e.preventDefault();
            $(this).button('loading');
            $.ajax({
                type: 'POST',
                url: "<%=request.getContextPath()%>/controladorF?action=guardarE",
                data: $("#formResponderE").serialize(),
                success: function() {
                    $("#guardar").button('reset');
                    marcacion = new Date();
                    Hora = marcacion.getHours();
                    Minutos = marcacion.getMinutes();
                    Segundos = marcacion.getSeconds();
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
                    $("#spanGuardado").show();
                    $("#hora2").html(" " + Fecha);
                } //fin success
            });

        });

    });
</script>
<style type="text/css">
    label.error{
        color:#B94A48;
    }
</style>
<div class="container">  
    <table class="table table-bordered table-striped" style="font-weight: bold;">
        <tbody>
            <tr>
                <td rowspan="3" style="width: 25%; text-align: center;"><img src="<%=request.getContextPath()%>/img/LogoU.png"></td>
                <td style="width: 50%; text-align: center;">UNIVERSIDAD DE CARTAGENA</td>
                <td style="width: 25%;">CÓDIGO: ${encuesta.getCodigo()}</td>
            </tr>
            <tr>
                <td style="width: 50%; text-align: center;">AUTOEVALUACIÓN Y ACREDITACIÓN</td>
                <td>VERSIÓN: ${encuesta.getVersion()}</td>
            </tr>
            <tr>
                <td style="width: 50%; text-align: center;">${encuesta.getNombre()}</td>
                <td>FECHA: ${encuesta.getFecha()}</td>
            </tr>
        </tbody>
    </table>

    <div class="row">
        <div class="span12">
            <h3>Objetivo:</h3>
            <p style="text-align: justify;">${encuesta.getObjetivo()}</p>
        </div>

    </div>
    <div class="row">
        <div class="span12">
            <h3>Instrucciones:</h3>
            <textarea id="ins" style="display: none;" rows="9" class="span8">${encuesta.getInstrucciones()}</textarea>
            <p id="insp" style="text-align: justify;"></p>
        </div>
    </div>
    <form id="formResponderE" method="POST">
        <table id="preguntas" class="table table-striped table-condensed" style="width: 100%;">
            <tbody>
                <c:choose>
                    <c:when test="${respuestas == null}">
                        <c:forEach items="${encuesta.preguntaList}" var="pregunta" varStatus="status">
                            <c:choose>
                                <c:when test="${pregunta.getTipo() == '2'}">
                                    <tr>
                                        <td>${status.count}</td>   
                                        <td><p>${pregunta.pregunta}</p></td>
                                        <td>
                                            <textarea name="pregunta${pregunta.getId()}" id="pregunta${pregunta.getId()}" cols="8" rows="2" class="required" maxlength="1000"></textarea>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:when test="${pregunta.getTipo() == '1'}">
                                    <tr>
                                        <td>${status.count}</td>   
                                        <td><p>${pregunta.getPregunta()}</p></td>
                                        <td>
                                            <select id="pregunta${pregunta.getId()}" name="pregunta${pregunta.getId()}" class="span1 {required:true}">
                                                <option></option>  
                                                <option value="5">5</option>
                                                <option value="4">4</option>  
                                                <option value="3">3</option>  
                                                <option value="2">2</option>  
                                                <option value="1">1</option>  
                                                <option value="0">0</option>  
                                            </select>
                                        </td>
                                    </tr>
                                </c:when>    
                            </c:choose>
                        </c:forEach>                   
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${respuestas}" var="resultado" varStatus="status">
                            <c:choose>
                                <c:when test="${resultado.preguntaId.tipo != '1'}">
                                    <tr>
                                        <td>${status.count}</td>   
                                        <td><p>${resultado.preguntaId.pregunta}</p></td>
                                        <td>
                                            <textarea name="pregunta${resultado.preguntaId.getId()}" id="pregunta${resultado.preguntaId.getId()}" cols="8" rows="2" maxlength="1000">${resultado.getRespuestaAbierta()}</textarea>
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td>${status.count}</td>   
                                        <td><p>${resultado.preguntaId.pregunta}</p></td>
                                        <td>
                                            <select id="pregunta${resultado.preguntaId.id}" name="pregunta${resultado.preguntaId.id}" class="span1 {required:true}">
                                                <option></option>  
                                                <c:choose>
                                                    <c:when test="${resultado.respuesta == '5'}">
                                                        <option selected="selected" value="5">5</option>      
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="5">5</option>      
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${resultado.respuesta == '4'}">
                                                        <option selected="selected" value="4">4</option>      
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="4">4</option>      
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${resultado.respuesta  == '3'}">
                                                        <option selected="selected" value="3">3</option>      
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="3">3</option>      
                                                    </c:otherwise>
                                                </c:choose>        
                                                <c:choose>
                                                    <c:when test="${resultado.respuesta == '2'}">
                                                        <option selected="selected" value="2">2</option>      
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="2">2</option>      
                                                    </c:otherwise>
                                                </c:choose>

                                                <c:choose>
                                                    <c:when test="${resultado.respuesta  == '1'}">
                                                        <option selected="selected" value="1">1</option>      
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="1">1</option>      
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${resultado.respuesta  == '0'}">
                                                        <option selected="selected" value="0">0</option>      
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="0">0</option>      
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </td>
                                    </tr>
                                </c:otherwise>    
                            </c:choose>
                        </c:forEach>
                    </c:otherwise> 
                </c:choose>

            </tbody>
        </table>
        <label>Observaciones y/o comentarios</label>
        <textarea rows="4" class="input-block-level"  placeholder="Observaciones y/o comentarios" name="observaciones" maxlength="1999">${encabezado.comentarios}</textarea>
        <div class="row"> 
            <div class="span5">
                <div class="pagination"></div>
            </div>
            <div class="span5" style="margin-top: 5px;">
                <div style="margin-top: 22px;">
                    <div class="span1" id="spanGuardado" style=" display: none">
                        <span class="label label-info" style="margin-left: 0px">Guardado:</span>
                    </div>
                    <p class="help-block" id="hora2"></p>
                </div>
            </div>
            <div class="span2">
                <div style="text-align: right; margin-top: 22px;">
                    <button class="btn" id="guardar" data-content="Guarda la encuesta sin salir de ella, de esta manera usted podr&aacute; seguir contestando la encuesta cuando desee." value="1" data-original-title="Guardar encuesta" type="button" data-loading-text="Guardando..." autocomplete="off">Guardar</button>
                    <button class="btn btn-primary" id="enviar" data-content="Env&iacute;a la encuesta evaluada. Verifique que todas las preguntas han sido respondidas correctamente. Esta operación no se podrá deshacer."  value="1" data-original-title="Enviar encuesta" type="submit">Enviar</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(function() {
    <c:forEach items="${palabras}" var="pregunta">
        $('#preguntas').html($('#preguntas').html().replace(/(${pregunta.palabra})/g
                , '<a href="#" data-toggle="tooltip" title="${pregunta.significado}">$1</a>'));
    </c:forEach> 
    });
    $('a[data-toggle="tooltip"]').tooltip();
</script>