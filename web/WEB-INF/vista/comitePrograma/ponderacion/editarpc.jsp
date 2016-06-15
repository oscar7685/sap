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
    var sum = 0;
    var sapo = 0;
    $(function() {
        $("a[data-dismiss='alert']").click(function(e) {
            $(this).parent("div").hide();
            e.preventDefault();
            e.stopPropagation();
        });
        $("#formEditPonderarCara").validate({
            errorElement: "em"
                    ,
            highlight: function(element, errorClass) {
                $(element).parent("td").find("div").addClass("in");
                $(element).parent("td").find("div").show();
            }, unhighlight: function(element, errorClass, validClass) {
                $(element).parent("td").find("div").removeClass("in");
                $(element).parent("td").find("div").hide();
            }, errorPlacement: function(error, element) {
                error.appendTo($(element).parent("td").find("div"));
            },
            submitHandler: function() {
                sapo = 0;
    <c:forEach items="${listFactores}" var="factAux" varStatus="statusfactAux">
                sum = 0;
                $(".factorX${factAux.id}").each(function(index, element) {
                    sum += Number($(this).val());
                });
                sum = parseFloat(sum).toFixed(2);
                if (sum == 100.00) {
                    $("#factorId${factAux.id}").html(" -> " + sum);
                    $("#factorId${factAux.id}").parents("tr").removeClass();
                    $("#factorId${factAux.id}").parents("tr").addClass("success");
                } else {
                    $("#factorId${factAux.id}").html(" -> " + sum);
                    $("#factorId${factAux.id}").parents("tr").removeClass();
                    $("#factorId${factAux.id}").parents("tr").addClass("error");
                    sapo = 1;
                }
    </c:forEach>
                    if (sapo === 0) {
                        $.ajax({
                            type: 'POST',
                            url: "/sapnaval/controladorCP?action=editPonderarCara",
                            data: $("#formEditPonderarCara").serialize(),
                            success: function() {
                                location = "/sapnaval/#listPonderacionCara2";
                            } //fin success
                        }); //fin $.ajax 
                    } else {
                        $(".alert-error").show();
                        $('div.ui-layout-center').animate({scrollTop: 10}, 500);
                    }
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
                        <legend>Ponderaci�n de Caracter�stica <i id="popover" class="icon-question-sign" rel="popover" data-title="Escala nivel de importancia"></i></legend>
                        <div class="alert alert-block alert-error" style="display:none" id="PonderacionCaracteristicas">
                            <a href="#" data-dismiss="alert" class="close">�</a>
                            <h4 class="alert-heading">Ha ocurrido un error!</h4>
                            <p>La suma de la ponderacion de las caracteristicas de cada factor debe ser 100.</p>
                            <a class="btn btn-danger" data-dismiss="alert" href="#">Cerrar</a>
                        </div>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Caracter�stica</th>
                                    <th>Ponderaci�n</th>
                                    <th>Justificacion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="idfactor" value="0"></c:set>
                                <c:forEach items="${listPonderacionCara}" var="row" varStatus="iter">
                                    <c:choose>
                                        <c:when test="${row.caracteristicaId.factorId.id != idfactor}">
                                            <tr class="info">
                                                <td colspan="4">Factor ${row.caracteristicaId.factorId.codigo}: ${row.caracteristicaId.factorId.nombre}<strong id="factorId${row.caracteristicaId.factorId.id}"></strong></td>   
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
                                                <a data-dismiss='alert' class='close'>�</a>  
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
                            <button class="btn btn-primary" type="submit">Actualizar Ponderaci�n</button>
                            <button class="btn" type="reset">Cancelar</button>
                        </div>
                    </fieldset>
                </form>
            </ul>
        </div><!--/span-->        
    </div><!--/row-->    
</div>