<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<style type="text/css">
    .popover{
        min-width:550px;
        width: auto;
        text-align: center;
    }
    .popover-title {
        font-weight: bold;
    }
</style>
<script type="text/javascript">
    $(function() {
        $("#formEditPonderarCara").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=editPonderarCara",
                    data: $("#formEditPonderarCara").serialize(),
                    success: function() {
                        location = "/sap/#listPonderacionCara";
                    } //fin success
                }); //fin $.ajax    
            }
        });

        $("#popover").popover({
            trigger: 'hover',
            placement: 'bottom',
            html: true,
            content: function() {
                return '<img src="<%=request.getContextPath()%>/img/escalaCaract.png" />';
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="nav nav-pills">
                <form id="formEditPonderarCara" class="form-horizontal" method="post">
                    <fieldset>
                        <legend>Ponderación de Característica <i id="popover" class="icon-question-sign" rel="popover" data-title="Escala nivel de importancia"></i></legend>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Característica</th>
                                    <th>Nivel de importancia</th>
                                    <th>Justificacion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="idfactor" value="0"></c:set>
                                <c:forEach items="${listPonderacionCara}" var="row" varStatus="iter">
                                    <c:choose>
                                        <c:when test="${row.caracteristicaId.factorId.id != idfactor}">
                                            <tr class="info">
                                                <td colspan="4">Factor ${row.caracteristicaId.factorId.codigo}: ${row.caracteristicaId.factorId.nombre}</td>   
                                                <c:set var="idfactor" value="${row.caracteristicaId.factorId.id}"></c:set>
                                            </tr>   
                                        </c:when>
                                    </c:choose>
                                    <tr id="PonderacionCaracteristica${iter.index+1}">    
                                        <td>   
                                            <c:out value="${row.caracteristicaId.codigo}"/>
                                        </td>
                                        <td>   
                                            <c:out value="${row.caracteristicaId.nombre}"/>
                                        </td>
                                        <td>
                                            <select class="span1 {required:true}" id="ponderacion${row.id}" name="importancia${row.id}">
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 1.0}">
                                                        <option selected="selected" value="1.0">1.0</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="1.0">1.0</option>
                                                    </c:otherwise>
                                                </c:choose>   
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 1.5}">
                                                        <option selected="selected" value="1.5">1.5</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="1.5">1.5</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 2.0}">
                                                        <option selected="selected" value="2.0">2.0</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="2.0">2.0</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 2.5}">
                                                        <option selected="selected" value="2.5">2.5</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="2.5">2.5</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 3.0}">
                                                        <option selected="selected" value="3.0">3.0</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="3.0">3.0</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 3.5}">
                                                        <option selected="selected" value="3.5">3.5</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="3.5">3.5</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 4.0}">
                                                        <option selected="selected" value="4.0">4.0</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="4.0">4.0</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 4.5}">
                                                        <option selected="selected" value="4.5">4.5</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="4.5">4.5</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 5.0}">
                                                        <option selected="selected" value="5.0">5.0</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="5.0">5.0</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 5.5}">
                                                        <option selected="selected" value="5.5">5.5</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="5.5">5.5</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 6.0}">
                                                        <option selected="selected" value="6.0">6.0</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="6.0">6.0</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 6.5}">
                                                        <option selected="selected" value="6.5">6.5</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="6.5">6.5</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 7.0}">
                                                        <option selected="selected" value="7.0">7.0</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="7.0">7.0</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 7.5}">
                                                        <option selected="selected" value="1">7.5</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="7.5">7.5</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 8.0}">
                                                        <option selected="selected" value="8.0">8.0</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="8.0">8.0</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 8.5}">
                                                        <option selected="selected" value="8.5">8.5</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="8.5">8.5</option>
                                                    </c:otherwise>

                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 9.0}">
                                                        <option selected="selected" value="9.0">9.0</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="9.0">9.0</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 9.5}">
                                                        <option selected="selected" value="9.5">9.5</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="9.5">9.5</option>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${row.nivelimportancia == 10.0}">
                                                        <option selected="selected" value="10.0">10.0</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="10.0">10.0</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                            <input type="hidden"  value="${row.id}" name="id${row.id}">
                                        </td>
                                        <td>
                                            <textarea value="" name="justificacion${row.id}" rows="4" class="span5 {required:true}">${row.justificacion}</textarea>
                                        </td>
                                    </tr>
                                    <c:set var="iterador" value="${iter.index + 1}" />
                                </c:forEach>
                            </tbody>
                        </table>
                        <input type="hidden" name="count" id="count" value="${iterador}">
                        <div class="form-actions">
                            <button class="btn btn-primary" type="submit">Actualizar Ponderación</button>
                            <button class="btn" type="reset">Cancelar</button>
                        </div>
                    </fieldset>
                </form>
            </ul>
        </div><!--/span-->        
    </div><!--/row-->    
</div>
