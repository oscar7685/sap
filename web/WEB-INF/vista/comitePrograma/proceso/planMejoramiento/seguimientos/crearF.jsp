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

        $("#formCrearSeguimiento").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=crearSeguimiento2",
                    data: $("#formCrearSeguimiento").serialize(),
                    success: function() {
                        location = "/sap/#verFSeguimientos&${actividad.idactividad}";
                    } //fin success
                }); //fin $.ajax    */
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <form id="formCrearSeguimiento" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Crear seguimiento</legend>
                    <div class="control-group">
                        <label for="inicio" class="control-label">Fecha seguimiento programada*</label>
                        <div class="controls">
                            <input type="text" name="inicio" id="inicio" class="form-control {required:true}" value="" >
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="final" class="control-label">Fecha seguimiento realizada</label>
                        <div class="controls">
                            <input type="text" name="final" id="final" class="form-control" value="" >
                        </div>
                    </div>    
                    <div class="control-group">
                        <label for="avance" class="control-label">% de Avance de la actividad</label>
                        <div class="controls">
                            <input type="text" name="avance" id="avance" class="form-control" value="" > %
                        </div>
                    </div>    
                    <div class="control-group">
                        <label for="observaciones" class="control-label">Observaciones</label>
                        <div class="controls">
                            <textarea rows="2" name="observaciones" id="observaciones" class="input-xxlarge"></textarea>
                        </div>
                    </div>    
                    <div class="form-actions span8">
                        <button class="btn btn-primary" type="submit">Crear seguimiento</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>            
        </div>
    </div>
</div>