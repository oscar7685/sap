<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
    $(function() {
        /*$("#selectListMuestra").change(function() {
         $("#help1").html('Seleccione una fuente para ver la muestra asignada a la misma.');
         $("#listM").empty();
         $("#selectSemestre option:eq(0)").prop("selected", true);
         
         var a = $("#selectListMuestra option:selected").index();
         if (a == 1) {
         $("#divSemestre").show();
         $("#help1").html('Seleccione un semestre para filtrar los resultados.');
         
         } else if (a == 0) {
         $("#listM").empty();
         $("#divSemestre").hide();
         }
         else {//para hacer el editar muestra
         $("#divSemestre").hide();
         $("#listM").empty();
         $.ajax({
         type: 'POST',
         url: "/sapnaval/controladorCP?action=selectorListMuestra",
         data: $("#formListarMuestra").serialize(),
         success: function(datos) {
         $("#listM").append(datos);
         setTimeout(function() {
         $("#dancing-dots-text").remove();
         }, 200);
         } //fin success
         }); //fin $.ajax    
         }
         
         });
         
         $("#selectSemestre").change(function() {
         var a = $("#selectSemestre option:selected").index();
         if (a == 0) {
         $("#listM").empty();
         } else {
         
         $.ajax({
         type: 'POST',
         url: "/sapnaval/controladorCP?action=selectorListSemestre",
         data: $("#formListarMuestra").serialize(),
         success: function(datos) {
         $("#listM").empty();
         $("#listM").append(datos);
         setTimeout(function() {
         $("#dancing-dots-text").remove();
         }, 200);
         
         } //fin success
         }); //fin $.ajax    
         }
         });*/
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                <th>Id</th>    
                <th>Rol</th>
                <th>Programa</th>
                </thead>
                <tbody>
                    <c:forEach items="${contestados}" var="row" varStatus="iter">
                        <tr>
                            <td>${row[0]}</td>
                            <td>${row[1]}</td>
                            <td>${row[2]}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>    

