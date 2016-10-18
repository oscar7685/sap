<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/datepicker.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        $('.tool').tooltip().click(function(e) {
            $(this).tooltip('hide');
        });
        $('#inicio').datepicker({
            format: 'dd/mm/yyyy'
        });
        $('#final').datepicker({
            format: 'dd/mm/yyyy'
        });

        $("#formEditarSeguimiento").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=editarSeguimiento2",
                    data: $("#formEditarSeguimiento").serialize(),
                    success: function() {
                        location = "/sap/#verSeguimientos&${actividad.idactividad}";
                    } //fin success
                }); //fin $.ajax    */
            }
        });
    });
</script>
<form id="formEditarSeguimiento" class="form-horizontal" method="post">
    <fieldset>
        <legend>Editar seguimiento</legend>
        <div class="control-group">
            <label for="inicio" class="control-label">Fecha seguimiento programada</label>
            <div class="controls">
                <input type="text" name="inicio" id="inicio" class="form-control {required:true}" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${seguimiento.fechaProgramado}' />" >
            </div>
        </div>
        <div class="control-group">
            <label for="final" class="control-label">Fecha seguimiento realizada</label>
            <div class="controls">
                <input type="text" name="final" id="final" class="form-control" value="<fmt:formatDate pattern='dd/MM/yyyy' value='${seguimiento.fechaRealizado}' />" >
            </div>
        </div>    
        <div class="control-group">
            <label for="avance" class="control-label">% de Avance de la actividad</label>
            <div class="controls">
                <input type="text" name="avance" id="avance" class="form-control" value="${seguimiento.porcentajeAvance}" >%
            </div>
        </div>    
        <div class="control-group">
            <label for="observaciones" class="control-label">Observaciones</label>
            <div class="controls">
                <textarea rows="2" name="observaciones" id="observaciones" class="input-xxlarge">${seguimiento.observaciones}</textarea>
            </div>
        </div>    
        <div class="form-actions span8">
            <button class="btn btn-primary" type="submit">Editar seguimiento</button>
            <button class="btn" type="reset">Cancelar</button>
        </div>
    </fieldset>
</form>            