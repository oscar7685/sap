<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        $('.tool').tooltip().click(function(e) {
            $(this).tooltip('hide');
        });
        $("#formEditarFortaleza").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=editarFortaleza2",
                    data: $("#formEditarFortaleza").serialize(),
                    success: function() {
                        location = "/sap/#listarFortalezas";
                    } //fin success
                }); //fin $.ajax    */
            }
        });
    });
</script>
<ul class="breadcrumb">
    <li><a href="<%=request.getContextPath()%>/#listarFortalezas" class="tool" data-placement="top" rel="tooltip" data-original-title="Listar fortalezas">Fortalezas</a> <span class="divider">/</span></li>
    <li>Editar</li>
    <a id="printEnlace" href="#PM2" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mantenimiento</a>
</ul>
<form id="formEditarFortaleza" class="form" method="post">
    <fieldset>
        <legend>Editar fortaleza</legend>
        <div class="control-group">
            <label for="caracteristica" class="control-label">Asignar Caracteristica</label>
            <div class="controls">
                <select id="caracteristica" name="caracteristica" class=" input-xxlarge {required:true}">
                    <option></option>
                    <c:forEach items="${listaC}" var="row" varStatus="iter">
                        <c:choose>
                            <c:when test="${row != hallazgo.getCaracteristicaId()}">
                                <option value="${row.id}">${row.codigo} ${row.nombre}</option>    
                            </c:when>
                            <c:otherwise>
                                <option selected="selected" value="${row.id}">${row.codigo} ${row.nombre}</option>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="control-group">
            <label for="hallazgo" class="control-label">Fortaleza</label>
            <div class="controls">
                <textarea rows="4" name="hallazgo" id="hallazgo" class="input-xxlarge {required:true}">${hallazgo.hallazgo}</textarea>
            </div>
        </div>


        <div class="form-actions span8">
            <button class="btn btn-primary" type="submit">Editar fortaleza</button>
            <button class="btn" type="reset">Cancelar</button>
        </div>
    </fieldset>
</form>
