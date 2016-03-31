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
                    url: "/sapnaval/controladorCP?action=editPonderarCara",
                    data: $("#formEditPonderarCara").serialize(),
                    success: function() {
                        location = "/sapnaval/#listPonderacionCara2";
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
                                    <th>Ponderación</th>
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
                                            <input value="${row.ponderacion}" id="ponderacion${row.caracteristicaId.factorId.codigo}-${row.caracteristicaId.id}" name="ponderacionC${row.id}" class="factorX${row.caracteristicaId.factorId.id} span1 {required:true,number:true}" type="text">
                                            <div class='alert alert-error fade' style="display: none">
                                                <a data-dismiss='alert' class='close'>×</a>  
                                                <strong>Error!</strong>
                                            </div>
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