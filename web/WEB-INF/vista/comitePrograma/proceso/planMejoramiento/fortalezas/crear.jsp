<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        $('.tool').tooltip().click(function(e) {
            $(this).tooltip('hide');
        });
        $("#formCrearFortaleza").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=crearFortaleza2",
                    data: $("#formCrearFortaleza").serialize(),
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
    <li>Crear</li>
    <a id="printEnlace" href="#PM2" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mantenimiento</a>
</ul>
<form id="formCrearFortaleza" class="form-horizontal" method="post">
    <fieldset>
        <legend>Crear fortaleza</legend>
        <div class="control-group">
            <label for="caracteristica" class="control-label">Asignar Caracteristica</label>
            <div class="controls">
                <select id="caracteristica" name="caracteristica" class=" input-xxlarge {required:true}">
                    <option></option>
                    <c:forEach items="${listaC}" var="row" varStatus="iter">
                        <option value="${row.id}">${row.codigo} ${row.nombre}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="control-group">
            <label for="hallazgo" class="control-label">Fortaleza</label>
            <div class="controls">
                <textarea rows="4" name="hallazgo" id="hallazgo" class="input-xxlarge {required:true}"></textarea>
            </div>
        </div>

        <div class="form-actions span8">
            <button class="btn btn-primary" type="submit">Crear Fortaleza</button>
            <button class="btn" type="reset">Cancelar</button>
        </div>
    </fieldset>
</form>