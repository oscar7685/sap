<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.pagination.js"></script>

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

        <c:forEach items="${encuesta.getPreguntaList()}" var="pregunta" varStatus="status">
            <div class="span10">
                <p><strong>${pregunta.getCodigo()} ${pregunta.getPregunta()}</strong></p>
                <c:choose>
                    <c:when test="${pregunta.getTipo()=='1' && pregunta.getPreguntaPadre()== null}">
                        <label class="radio"><input type="radio" name="pregunta${pregunta.getId()}" value="5" class="{required:true}">5 Completamente deacuerdo</label>
                        <label class="radio"><input type="radio" name="pregunta${pregunta.getId()}" value="4" class="{required:true}">4 De acuerdo</label>
                        <label class="radio"><input type="radio" name="pregunta${pregunta.getId()}" value="3" class="{required:true}">3 Parcialmente de acuerdo</label>
                        <label class="radio"><input type="radio" name="pregunta${pregunta.getId()}" value="2" class="{required:true}">2 En desacuerdo</label>
                        <label class="radio"><input type="radio" name="pregunta${pregunta.getId()}" value="1" class="{required:true}">1 Completamente en desacuerdo</label>
                        <label class="radio"><input type="radio" name="pregunta${pregunta.getId()}" value="0" class="{required:true}">0 No sabe</label>
                        </c:when>
                        <c:when test="${pregunta.getTipo()=='2'}">
                        <textarea rows="3" class="span8"></textarea>
                    </c:when>
                    <c:when test="${pregunta.getTipo()=='3'}">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="span4"></th>
                                    <th class="span2" style="font-size: 12px">5</th>
                                    <th class="span2" style="font-size: 12px">4</th>
                                    <th class="span2" style="font-size: 12px">3</th>
                                    <th class="span2" style="font-size: 12px">2 </th>
                                    <th class="span2" style="font-size: 12px">1</th>
                                    <th class="span2" style="font-size: 12px">0</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${pregunta.getPreguntaList()}" var="sub" varStatus="subStatus">
                                    <tr>
                                        <td>${sub.getCodigo()} ${sub.getPregunta()}</td>
                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="5" class="{required:true}"/></label></td>
                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="4" class="{required:true}"/></label></td>
                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="3" class="{required:true}"/></label></td>
                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="2" class="{required:true}"/></label></td>
                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="1" class="{required:true}"/></label></td>
                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="0" class="{required:true}"/></label></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                </c:choose>
            </div>
        </c:forEach>  
        <div class="row"> 
            <div class="span10">
                <textarea rows="4" class="input-block-level"  placeholder="Observaciones y/o comentarios" name="observaciones" maxlength="1999">${encabezado.comentarios}</textarea>
            </div>  
        </div>  

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
                    <button class="btn btn-primary" data-content="Env&iacute;a la encuesta evaluada. Verifique que todas las preguntas han sido respondidas correctamente. Esta operación no se podrá deshacer."  value="1" data-original-title="Enviar encuesta" type="submit">Enviar</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(function() {
        $('a[data-toggle="tooltip"]').tooltip();
    });

</script>