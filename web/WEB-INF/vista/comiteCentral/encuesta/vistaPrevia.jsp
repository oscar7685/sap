<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link media="print" href="<%=request.getContextPath()%>/css/print.css" rel="stylesheet"/>
<script type="text/javascript">
    $(function() {
        var inst = $("#ins").val();
        inst = inst.replace(/\n/gi, "<br/>");
        $("#insp").append(inst);
    });


</script>
<style type="text/css">
    @media all {
        div.saltopagina{
            display: none;
        }
        #insp{
            line-height: 22px;
        }
        .span5{
            width: 360px;
            font-size: 14px;
            font-family: "Helvetica Neue",​Helvetica,​Arial,​sans-serif;
        }
    } 


</style>

<a class="span10" style="text-align: right;  margin-left: 60px; cursor: pointer;" id="printEnlace"><i class="icon-print"></i> Imprimir</a>  
<br>
<div class="hero-unit">
    <div style="margin-left: -30px;">
        <div id="conte" class="span10" style="text-align: justify">
            <div class="row">
                <table class="table table-bordered table-striped" style="font-weight: bold;">
                    <tbody>
                        <tr>
                            <td rowspan="3" style="width: 25%; text-align: center;"><img src="<%=request.getContextPath()%>/img/LogoU.png"></td>
                            <td style="width: 50%; text-align: center;">UNIVERSIDAD DE CARTAGENA</td>
                            <td style="width: 25%;">CÓDIGO: ${encuesta.getCodigo()}</td>
                        </tr>
                        <tr>
                            <td style="width: 50%; text-align: center;">AUTOEVALUACIÓN Y ACREDITACIÓN</td>
                            <td>VERSIÓN:${encuesta.getVersion()}</td>
                        </tr>
                        <tr>
                            <td style="width: 50%; text-align: center;">${encuesta.getNombre()}</td>
                            <td>FECHA:${encuesta.getFecha()}</td>
                        </tr>
                    </tbody>
                </table>
                <h3>Objetivo:</h3>
                <p style="text-align: justify;">${encuesta.getObjetivo()}</p>
                <h3>Instrucciones:</h3>
                <textarea id="ins" style="display: none;" rows="9">${encuesta.getInstrucciones()}</textarea>
                <p id="insp" style="text-align: justify;"></p>
                <br/>
            </div>

            <c:forEach items="${encuesta.getPreguntaList()}" var="pregunta" varStatus="status">
                <div class="span10">
                    <p><strong>${pregunta.getPregunta()}</strong></p>
                    <c:choose>
                        <c:when test="${pregunta.getTipo()=='1' && pregunta.getPreguntaPadre()== null}">
                            <label class="radio"><input type="radio">5 Completamente deacuerdo</label>
                            <label class="radio"><input type="radio">4 De acuerdo</label>
                            <label class="radio"><input type="radio">3 Parcialmente de acuerdo</label>
                            <label class="radio"><input type="radio">2 En desacuerdo</label>
                            <label class="radio"><input type="radio">1 Completamente en desacuerdo</label>
                            <label class="radio"><input type="radio">0 No sabe</label>
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
                                            <td>${sub.getPregunta()}</td>
                                            <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="5" /></label></td>
                                            <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="4" /></label></td>
                                            <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="3" /></label></td>
                                            <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="2" /></label></td>
                                            <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="1" /></label></td>
                                            <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="0" /></label></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                    </c:choose>
                </div>
            </c:forEach>  
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function() {
        setTimeout(function() {
            var altura = 0;
            var primer = true;
            $("#conte .row").each(function(ind, el) {
                altura += $(el).height();
                if (primer) {
                    if (altura > 1050) {
                        $("<div class='saltopagina'></div>").insertBefore($(el));
                        altura = $(el).height();
                        primer = false;
                    }

                } else {
                    if (altura > 1200) {
                        $("<div class='saltopagina'></div>").insertBefore($(el));
                        altura = $(el).height();
                    }
                }


            });

        }, 1000);

        setTimeout(function() {
            $("#printEnlace").click(function() {
                $('.hero-unit').printArea();
                return false;
            });
        }, 1000);


    });
</script>