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

        jQuery.validator.addMethod("greaterThan", function(value, element, params) {

            if (!/Invalid|NaN/.test(new Date(value))) {
                return new Date(value) > new Date($(params).val());
            }

            return isNaN(value) && isNaN($(params).val())
                    || (Number(value) > Number($(params).val()));
        }, 'La fecha final debe ser mayor a la fecha inicial.');


        $("#formCrearActividad").validate({
            rules: {
                final: {greaterThan: "#inicio"}
            },
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCP?action=crearActividadH2",
                    data: $("#formCrearActividad").serialize(),
                    success: function() {
                        location = "/sap/#verActividadesH&${hallazgo.idhallazgo}";
                    } //fin success
                }); //fin $.ajax    */
            }
        });
    });
</script>
<ul class="breadcrumb">
    <li><a href="<%=request.getContextPath()%>/#listarHallazgos" class="tool" data-placement="top" rel="tooltip" data-original-title="Listar hallazgos">Hallazgos</a> <span class="divider">/</span></li>
    <li><a href="<%=request.getContextPath()%>/#editarHallazgo&${hallazgo.idhallazgo}" class="tool" data-placement="top" rel="tooltip" data-original-title="${hallazgo.hallazgo}">Hallazgo</a> <span class="divider">/</span></li>
    <li><a href="<%=request.getContextPath()%>/#verActividadesH&${hallazgo.idhallazgo}" class="tool" data-placement="top" rel="tooltip" data-original-title="Listar Actividades">Actividades</a> <span class="divider">/</span></li>
    <li>Crear</li>
    <a id="printEnlace" href="#PM" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mejoramiento</a>
</ul>

<form id="formCrearActividad" class="form-horizontal" method="post">
    <fieldset>
        <legend>Crear Actividad</legend>
        <div class="control-group">
            <label for="actividad" class="control-label">Actividad</label>
            <div class="controls">
                <textarea rows="2" name="actividad" id="actividad" class="input-xxlarge {required:true}"></textarea>
            </div>
        </div>
        <div class="control-group">
            <label for="meta" class="control-label">Meta</label>
            <div class="controls">
                <textarea rows="2" name="meta" id="meta" class="input-xxlarge {required:true}"></textarea>
            </div>
        </div>
        <div class="control-group">
            <label for="indicador" class="control-label">Indicador de cumplimiento</label>
            <div class="controls">
                <textarea rows="2" name="indicador" id="indicador" class="input-xxlarge {required:true}"></textarea>
            </div>
        </div>
        <div class="control-group">
            <label for="inicio" class="control-label">Fecha de Inicio</label>
            <div class="controls">
                <input type="text" name="inicio" id="inicio" class="form-control" value="" >
            </div>
        </div>
        <div class="control-group">
            <label for="final" class="control-label">Fecha Final</label>
            <div class="controls">
                <input type="text" name="final" id="final" class="form-control" value="" >
            </div>
        </div>    
        <div class="control-group">
            <label for="responsables" class="control-label">Responsables</label>
            <div class="controls">
                <textarea rows="2" name="responsables" id="responsables" class="input-xxlarge {required:true}"></textarea>
            </div>
        </div>    
        <div class="control-group">
            <label for="recursos" class="control-label">Recursos o Financiación</label>
            <div class="controls">
                <textarea rows="2" name="recursos" id="recursos" class="input-xxlarge {required:true}"></textarea>
            </div>
        </div>    
        <div class="form-actions span8">
            <button class="btn btn-primary" type="submit">Crear actividad</button>
            <button class="btn" type="reset">Cancelar</button>
        </div>
    </fieldset>
</form>            