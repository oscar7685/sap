<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link media="print" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<style type="text/css">
    @media all {
        div.saltopagina{
            display: none;
        }
        .insp{
            line-height: 22px;
            text-align: justify;
        }

        .span5{
            width: 360px;
            font-size: 14px;
            font-family: "Helvetica Neue",​Helvetica,​Arial,​sans-serif;
        }
    } 


</style>
<script type="text/javascript">
    $(function() {
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
        $("button").popover({trigger: "hover", placement: 'right'});
    });
</script>

<br>
<div class="hero-unit">
    <div style="margin-left: -30px;">
        <div id="conte" class="span12" style="text-align: justify">
            <div class="row">
                <table class="table table-striped table-bordered" style="font-weight: bold;">
                    <tbody>
                        <tr>
                            <td style="text-align: center;">ESCUELA NAVAL DE CADETES "ALMIRANTE PADILLA"
                                <!--<br/><span id="spanprograma">PROGRAMA: _PROGRAMA_</span>-->
                                <br/>${encuesta.getNombre()}</td>
                        </tr>
                    </tbody>
                </table>
                <br/>
                <p class="insp">${encuesta.getObjetivo()}</p>
                <p class="insp">${encuesta.getInstrucciones()}</p>
                <br/>
            </div>
            <form id="formResponderE" method="POST">
                <c:forEach items="${encuesta.getPreguntaList()}" var="pregunta" varStatus="status">

                    <div class="row" id="pregunta${pregunta.id}">
                        <div class="span10">
                            <p style="font-weight: bold;">${status.index+1} ${pregunta.getPregunta()}</p>


                            <table class="table">
                                <c:choose>
                                    <c:when test="${pregunta.getTipo()=='1'}">
                                        <thead>
                                            <tr>
                                                <th class="span3"></th>
                                                <th class="span2" style="font-size: 12px">1:Muy bajo</th>
                                                <th class="span2" style="font-size: 12px">2:Bajo</th>
                                                <th class="span2" style="font-size: 12px">3:Medio</th>
                                                <th class="span2" style="font-size: 12px">4:Alto</th>
                                                <th class="span2" style="font-size: 12px">5:Muy alto</th>
                                                <th class="span2" style="font-size: 12px">NS/NR</th>
                                            </tr>
                                        </thead>
                                    </c:when>
                                    <c:when test="${pregunta.getTipo()=='2'}">
                                        <thead>
                                            <tr>
                                                <th class="span3"></th>
                                                <th class="span2" style="font-size: 12px">1:En ningún grado</th>
                                                <th class="span2" style="font-size: 12px">2:En bajo grado</th>
                                                <th class="span2" style="font-size: 12px">3:Aceptablemente</th>
                                                <th class="span2" style="font-size: 12px">4:En alto grado</th>
                                                <th class="span2" style="font-size: 12px">5:Totalmente</th>
                                                <th class="span2" style="font-size: 12px">NS/NR</th>
                                            </tr>
                                        </thead>
                                    </c:when>
                                    <c:when test="${pregunta.getTipo()=='3'}">
                                        <thead>
                                            <tr>
                                                <th class="span3"></th>
                                                <th class="span2" style="font-size: 12px">1:Muy mala</th>
                                                <th class="span2" style="font-size: 12px">2:Mala</th>
                                                <th class="span2" style="font-size: 12px">3:Regular</th>
                                                <th class="span2" style="font-size: 12px">4:Buena</th>
                                                <th class="span2" style="font-size: 12px">5:Excelente</th>
                                                <th class="span2" style="font-size: 12px">NS/NR</th>
                                            </tr>
                                        </thead>
                                    </c:when>
                                </c:choose>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${fn:length(pregunta.preguntaList)!= 0}">
                                            <c:forEach items="${pregunta.preguntaList}" var="sub">
                                                <tr>
                                                    <td>${sub.getPregunta()}</td>
                                                    <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${sub.id}" value="1" /></label></td>
                                                    <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${sub.id}" value="2" /></label></td>
                                                    <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${sub.id}" value="3" /></label></td>
                                                    <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${sub.id}" value="4" /></label></td>
                                                    <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${sub.id}" value="5" /></label></td>
                                                    <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${sub.id}" value="0" /></label></td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td></td>
                                                <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${pregunta.id}" value="1" /></label></td>
                                                <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${pregunta.id}" value="2" /></label></td>
                                                <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${pregunta.id}" value="3" /></label></td>
                                                <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${pregunta.id}" value="4" /></label></td>
                                                <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${pregunta.id}" value="5" /></label></td>
                                                <td><label class="radio"><input type="radio" class="{required:true}" name="pregunta${pregunta.id}" value="0" /></label></td>
                                            </tr>
                                        </c:otherwise>        
                                    </c:choose>

                                </tbody>
                            </table>
                        </div> 
                    </div>
                </c:forEach>  
                <div class="row"> 
                    <div class="span2">
                        <div style="text-align: left; margin-top: 22px;">
                            <button class="btn btn-primary" data-content="Env&iacute;a la encuesta evaluada. Verifique que todas las preguntas han sido respondidas correctamente. Esta operación no se podrá deshacer."  value="1" data-original-title="Enviar encuesta" type="submit">Enviar</button>
                        </div>    
                    </div>
                </div>
            </form>    
        </div>
    </div>


    <script type="text/javascript">
        $(function() {
            $("p").html(function(busca, reemplaza) {
                return reemplaza.replace('_PROGRAMA_', '${programa.nombre}');
            });
            $("#spanprograma").html(function(busca, reemplaza) {
                return reemplaza.replace('_PROGRAMA_', '${programa.nombre}');
            });


            setTimeout(function() {
                $("#printEnlace").click(function() {
                    $('.hero-unit').printArea();
                    return false;
                });
            }, 1000);

            //se activa cuando una pregunta que condiciona a otra es contestada



        });
    </script>