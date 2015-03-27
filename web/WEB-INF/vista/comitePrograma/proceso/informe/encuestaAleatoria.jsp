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

            <c:forEach items="${resultados}" var="resultado" varStatus="status">
                <c:choose>
                    <c:when test="${status.count%2==1}">
                        <div class="row printDiv">
                            <div class="span5">
                                <p>${resultado.preguntaId.getCodigo()} ${resultado.preguntaId.getPregunta()}</p>
                                <c:choose>
                                    <c:when test="${resultado.preguntaId.getTipo()=='1'}">
                                        <c:choose>
                                            <c:when test="${resultado.respuesta=='5'}">
                                                <label class="radio"><input type="radio" checked="checked">5 Completamente deacuerdo</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio" >5 Completamente deacuerdo</label>
                                                </c:otherwise>    
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${resultado.respuesta=='4'}">

                                                <label class="radio"><input type="radio" checked="checked">4 De acuerdo</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio">4 De acuerdo</label>
                                                </c:otherwise>    
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${resultado.respuesta=='3'}">
                                                <label class="radio"><input type="radio" checked="checked">3 Parcialmente de acuerdo</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio">3 Parcialmente de acuerdo</label>
                                                </c:otherwise>    
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${resultado.respuesta=='2'}">
                                                <label class="radio"><input type="radio" checked="checked">2 En desacuerdo</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio">2 En desacuerdo</label>
                                                </c:otherwise>    
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${resultado.respuesta=='1'}">
                                                <label class="radio"><input type="radio" checked="checked">1 Completamente en desacuerdo</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio">1 Completamente en desacuerdo</label>
                                                </c:otherwise>    
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${resultado.respuesta=='0'}">
                                                <label class="radio"><input type="radio" checked="checked">0 No sabe</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio">0 No sabe</label>
                                                </c:otherwise>    
                                            </c:choose>    
                                        </c:when>
                                        <c:when test="${resultado.preguntaId.getTipo()=='2'}">
                                        <textarea rows="3" class="span4">${resultado.respuestaAbierta}</textarea>
                                        </c:when>
                                </c:choose>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <div class="span5">
                                <p>${resultado.preguntaId.getCodigo()} ${resultado.preguntaId.getPregunta()}</p>
                                 <c:choose>
                                    <c:when test="${resultado.preguntaId.getTipo()=='1'}">
                                        <c:choose>
                                            <c:when test="${resultado.respuesta=='5'}">
                                                <label class="radio"><input type="radio" checked="checked">5 Completamente deacuerdo</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio" >5 Completamente deacuerdo</label>
                                                </c:otherwise>    
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${resultado.respuesta=='4'}">

                                                <label class="radio"><input type="radio" checked="checked">4 De acuerdo</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio">4 De acuerdo</label>
                                                </c:otherwise>    
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${resultado.respuesta=='3'}">
                                                <label class="radio"><input type="radio" checked="checked">3 Parcialmente de acuerdo</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio">3 Parcialmente de acuerdo</label>
                                                </c:otherwise>    
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${resultado.respuesta=='2'}">
                                                <label class="radio"><input type="radio" checked="checked">2 En desacuerdo</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio">2 En desacuerdo</label>
                                                </c:otherwise>    
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${resultado.respuesta=='1'}">
                                                <label class="radio"><input type="radio" checked="checked">1 Completamente en desacuerdo</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio">1 Completamente en desacuerdo</label>
                                                </c:otherwise>    
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${resultado.respuesta=='0'}">
                                                <label class="radio"><input type="radio" checked="checked">0 No sabe</label>
                                                </c:when>
                                                <c:otherwise>
                                                <label class="radio"><input type="radio">0 No sabe</label>
                                                </c:otherwise>    
                                            </c:choose>    
                                        </c:when>
                                        <c:when test="${resultado.preguntaId.getTipo()=='2'}">
                                        <textarea rows="3" class="span4">${resultado.respuestaAbierta}</textarea>
                                        </c:when>
                                </c:choose>
                            </div>
                        </div><!--jaja-->
                    </c:otherwise>
                </c:choose>
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
