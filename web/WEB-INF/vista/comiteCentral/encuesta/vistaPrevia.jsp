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

<a class="span10" style="text-align: right;  margin-left: 60px; cursor: pointer;" id="printEnlace"><i class="icon-print"></i> Imprimir</a>  
<br>
<div class="hero-unit">
    <div style="margin-left: -30px;">
        <div id="conte" class="span10" style="text-align: justify">
            <div class="row">
                <table class="table table-striped table-bordered" style="font-weight: bold;">
                    <tbody>
                        <tr>
                            <td></td>
                            <td colspan="3" style="width: 50%; text-align: center; vertical-align: middle">ARMADA NACIONAL</td>

                        </tr>
                        <tr>
                            <td rowspan="2" style="width: 15%; text-align: center;"><img src="<%=request.getContextPath()%>/img/armada2.jpg"></td>
                            <td colspan="3" style="text-align: center;"><img src="<%=request.getContextPath()%>/img/escuela.png"></td>

                        </tr>   
                        <tr>
                            <td colspan="3" style="text-align: center;">ESCUELA NAVAL DE CADETES "ALMIRANTE PADILLA"
                                <br/><span id="spanprograma">PROGRAMA: _PROGRAMA_</span><br/>${encuesta.getNombre()}</td>

                        </tr>
                        <tr>
                            <td colspan="2" style="width: 25%; text-align: center; vertical-align: middle">Procedimiento: Autoevaluación</td>
                            <td style="text-align: center;">Código: FAYM-FT-453-JINEN-V02</td>
                            <td>Rige a partir de: 04/04/08</td>
                        </tr>
                    </tbody>
                </table>
                <br/>
                <p class="insp">${encuesta.getObjetivo()}</p>
                <p class="insp">${encuesta.getInstrucciones()}</p>
                <br/>
                <strong>DATOS GENERALES</strong>
            </div>

            <c:forEach items="${encuesta.getPreguntaList()}" var="pregunta" varStatus="status">
                <c:choose>
                    <c:when test="${fn:length(pregunta.condicionList) > 0 && !(encuesta.id==4 && pregunta.id ==27)}"><!--pregunta condicionada-->
                        <div class="row hide" id="pregunta${pregunta.id}" > 
                        </c:when>
                        <c:otherwise>
                            <div class="row" id="pregunta${pregunta.id}">
                            </c:otherwise>        
                        </c:choose>
                        <c:choose>
                            <c:when test="${fn:length(pregunta.condicionList1) > 0 }"><!--pregunta condicionadora-->
                                <div class="span10 condicionador">
                                </c:when>
                                <c:otherwise>
                                    <div class="span10">
                                    </c:otherwise>        
                                </c:choose>
                                <c:choose>
                                    <c:when test="${pregunta.getCodigo()!='-'}">
                                        <p style="font-weight: bold;">${pregunta.getCodigo()} ${pregunta.getPregunta()}</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p style="font-weight: bold;">${pregunta.getPregunta()}</p>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${pregunta.getTipo()=='matriz15'}">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="span4"></th>
                                                    <th class="span2" style="font-size: 12px">1</th>
                                                    <th class="span2" style="font-size: 12px">2</th>
                                                    <th class="span2" style="font-size: 12px">3 </th>
                                                    <th class="span2" style="font-size: 12px">4</th>
                                                    <th class="span2" style="font-size: 12px">5</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${pregunta.preguntaList}" var="sub">
                                                    <tr>
                                                        <td>${sub.getPregunta()}</td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="1" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="2" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="3" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="4" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="5" /></label></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:when test="${pregunta.getTipo()=='simatriz'}">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="span4"></th>
                                                    <th class="span2" style="font-size: 12px">SI</th>
                                                    <th class="span2" style="font-size: 12px">NO</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${pregunta.preguntaList}" var="sub">
                                                    <tr>
                                                        <td>${sub.getPregunta()}</td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="SI" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="NO" /></label></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:when test="${pregunta.getTipo()=='1to5'}">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="span4"></th>
                                                    <th class="span2" style="font-size: 12px">1</th>
                                                    <th class="span2" style="font-size: 12px">2</th>
                                                    <th class="span2" style="font-size: 12px">3</th>
                                                    <th class="span2" style="font-size: 12px">4</th>
                                                    <th class="span2" style="font-size: 12px">5</th>
                                                    <th class="span2" ></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Insatisfactoriamente</td>
                                                    <td><label class="radio"><input type="radio" name="Rpregunta${pregunta.id}" value="1" /></label></td>
                                                    <td><label class="radio"><input type="radio" name="Rpregunta${pregunta.id}" value="2" /></label></td>
                                                    <td><label class="radio"><input type="radio" name="Rpregunta${pregunta.id}" value="3" /></label></td>
                                                    <td><label class="radio"><input type="radio" name="Rpregunta${pregunta.id}" value="4" /></label></td>
                                                    <td><label class="radio"><input type="radio" name="Rpregunta${pregunta.id}" value="5" /></label></td>
                                                    <td>Plenamente</td>

                                                </tr>

                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:when test="${pregunta.getTipo()=='abierta'}">
                                        <input type="text" name="Rpregunta${pregunta.id}">
                                    </c:when>

                                    <c:when test="${pregunta.getTipo()=='smur'}">
                                        <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="status">
                                            <c:choose>
                                                <c:when test="${fn:length(respuesta.condicionList)>0}">
                                                    <label class="radio">
                                                        <input type="radio" value="${respuesta.idrespuesta}" id="respuesta${respuesta.idrespuesta}" name="Rpregunta${pregunta.id}" class="datacondicion required"
                                                               datacondicion="pregunta${respuesta.condicionList.get(0).preguntaCondicionada.id}">
                                                        ${respuesta.respuesta}
                                                    </label>
                                                </c:when>
                                                <c:otherwise>
                                                    <label class="radio">
                                                        <input type="radio" value="${respuesta.idrespuesta}" id="respuesta${respuesta.idrespuesta}" name="Rpregunta${pregunta.id}" class="required">
                                                        ${respuesta.respuesta}
                                                    </label>
                                                </c:otherwise>        
                                            </c:choose>
                                        </c:forEach>
                                    </c:when>
                                    <c:when test="${pregunta.getTipo()=='multiple'}">
                                        <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="status">
                                            <label class="checkbox"><input value="${respuesta.respuesta}" name="Rpregunta${pregunta.id}[]" type="checkbox">${respuesta.respuesta}</label>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${pregunta.getTipo()=='6matriz'}">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="span3"></th>
                                                    <th class="span2" style="font-size: 12px">0 </th>
                                                    <th class="span2" style="font-size: 12px">1 </th>
                                                    <th class="span2" style="font-size: 12px">2 </th>
                                                    <th class="span2" style="font-size: 12px">3 </th>
                                                    <th class="span2" style="font-size: 12px">4 </th>
                                                    <th class="span2" style="font-size: 12px">5 </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${pregunta.preguntaList}" var="sub">
                                                    <tr>
                                                        <td>${sub.getPregunta()}</td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="0" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="1" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="2" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="3" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="4" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="5" /></label></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:when test="${pregunta.getTipo()=='vecesmatriz'}">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="span5"></th>
                                                    <th class="span2" style="font-size: 12px">UNA VEZ</th>
                                                    <th class="span2" style="font-size: 12px">DOS VECES</th>
                                                    <th class="span2" style="font-size: 12px">TRES VECES</th>
                                                    <th class="span2" style="font-size: 12px">MÁS DE TRES</th>
                                                    <th class="span2" style="font-size: 12px">NINGUNA</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${pregunta.preguntaList}" var="sub">
                                                    <tr>
                                                        <td>${sub.getPregunta()}</td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="1vez" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="2veces" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="3veces" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="masde3" /></label></td>
                                                        <td><label class="radio"><input type="radio" name="pregunta${sub.id}" value="ninguna" /></label></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:when>

                                </c:choose>
                            </div> 
                        </div>
                    </c:forEach>  

                </div>
            </div>
        </div>

        <script type="text/javascript">
            $(function() {
                $("p").html(function(busca, reemplaza) {
                    return reemplaza.replace('_PROGRAMA_', 'Administración');
                });
                $("#spanprograma").html(function(busca, reemplaza) {
                    return reemplaza.replace('_PROGRAMA_', 'Administración');
                });


                setTimeout(function() {
                    $("#printEnlace").click(function() {
                        $('.hero-unit').printArea();
                        return false;
                    });
                }, 1000);

                //se activa cuando una pregunta que condiciona a otra es contestada
                $(".condicionador input[type=radio]").change(function() {
                    if ($(this).is(":checked")) {
                        if ($(this).hasClass("datacondicion")) {
                            var preguntaCondicionada = $(this).attr("datacondicion").replace(/\s+/g, '');
                            var vectorPregunta = preguntaCondicionada.split(",");
                            for (var i = 0; i < vectorPregunta.length; i++) {
                                $("#" + vectorPregunta[i]).removeClass("hide");
                            }

                        } else {
                            var preguntaCondicionada = $(this).parents(".condicionador").find(".datacondicion").attr("datacondicion").replace(/\s+/g, '');
                            var vectorPregunta = preguntaCondicionada.split(",");
                            for (var i = 0; i < vectorPregunta.length; i++) {
                                $("#" + vectorPregunta[i]).addClass("hide");
                            }

                        }
                    }

                });


            });
        </script>