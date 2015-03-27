<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
    .popover{
        min-width:500px;
        width: auto;
    }
</style>
<script type="text/javascript">
    $(function() {
        $("#tipo").on('mouseleave', function(e) {
            $('#tipo').popover('destroy');
        });
        $("#indicador").on('mouseleave', function(e) {
            $('#indicador').popover('destroy');
        });

        $("#tipo").on('mouseover', function(e) {
            var $e = $(e.target);
            if ($e.is('option')) {
                $('#tipo').popover('destroy');
                $("#tipo").popover({
                    trigger: 'manual',
                    placement: 'right',
                    html: true,
                    title: $e.attr("data-title"),
                    content: function() {
                        return '<img src="' + ($e).data('img') + '" />';
                    }

                }).popover('show');
            }
        });
        $("#indicador").on('mouseover', function(e) {
            var $e = $(e.target);
            if ($e.is('option')) {
                $('#indicador').popover('destroy');
                $("#indicador").popover({
                    trigger: 'manual',
                    placement: 'right',
                    title: $e.attr("data-original-title"),
                    content: $e.attr("data-content")
                }).popover('show');
            }
        });
        $("#formEditarPregunta").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sap/controladorCC?action=editarPregunta",
                    data: $("#formEditarPregunta").serialize(),
                    success: function() {
                        location = "/sap/#listarPreguntas";
                    } //fin success
                }); //fin $.ajax    
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <form id="formEditarPregunta" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Editar Pregunta</legend>
                    <div class="control-group">
                        <label for="codigo" class="control-label">C&oacute;digo</label>
                        <div class="controls">
                            <input type="text" name="codigo" id="codigo" class="input-xlarge {required:true}" value="${pregunta.codigo}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="nombre"  class="control-label">Pregunta</label>
                        <div class="controls">
                            <input type="text" name="nombre" id="nombre" class="input-xlarge {required:true}" value="${pregunta.pregunta}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="tipo" class="control-label">Tipo de la Pregunta</label>
                        <div class="controls">
                            <select name="tipo" id="tipo">
                                <c:choose>
                                    <c:when test="${pregunta.getTipo().equals('1')}">
                                        <option data-img="<%=request.getContextPath()%>/img/1-5.png" rel="popover" data-title="Elegir del 1 al 5"  selected="selected"  value="1">Elegir del 1 al 5</option>
                                        <option value="2" data-img="<%=request.getContextPath()%>/img/Si-No.png" rel="popover" data-title="Pregunta abierta">Pregunta abierta</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option  data-img="<%=request.getContextPath()%>/img/1-5.png" rel="popover" data-title="Elegir del 1 al 5"  value="1">Elegir del 1 al 5</option>
                                        <option selected="selected" value="2" data-img="<%=request.getContextPath()%>/img/Si-No.png" rel="popover" data-title="Pregunta abierta">Pregunta abierta</option>
                                    </c:otherwise>   
                                </c:choose>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="indicador" class="control-label">Asignar Indicador</label>
                        <div class="controls">
                            <select id="indicador" name="indicador">
                                <option></option>
                                <c:forEach items="${listaI}" var="row" varStatus="iter">
                                    <c:choose>
                                        <c:when test="${pregunta.getIndicadorId()!= row}">
                                            <option value="${row.id}" data-content="${row.nombre}" rel="popover2" data-original-title="Indicador">${row.codigo}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option selected="selected" value="${row.id}" data-content="${row.nombre}" rel="popover2" data-original-title="Indicador">${row.codigo}</option>
                                        </c:otherwise>       
                                    </c:choose>    

                                </c:forEach>
                            </select>                

                        </div>
                    </div>

                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Guardar cambios</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>