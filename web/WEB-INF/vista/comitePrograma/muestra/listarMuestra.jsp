<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
    $(function() {
        $("#selectListMuestra").change(function() {
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
                    url: "/sapenfermeria/controladorCP?action=selectorListMuestra",
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
                    url: "/sapenfermeria/controladorCP?action=selectorListSemestre",
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
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <ul class="nav nav-pills" style="margin-bottom: 0px">
                <form id="formListarMuestra" class="" method="post" style="margin-bottom: 0px">
                    <fieldset>
                        <legend>Asignación de  Muestra</legend>
                        <div class="span3" style="margin-left: 0px">
                            <div class="control-group">
                                <label for="selectListMuestra"  class="control-label">Fuente: </label>
                                <div class="controls">
                                    <select name="fuente" id="selectListMuestra">
                                        <option value="--">Seleccionar Fuente</option>
                                        <option value="Estudiante">Estudiantes</option>
                                        <option value="Docente">Docentes</option>
                                        <option value="Egresado">Egresados</option>
                                        <option value="Administrativo">Administrativos</option>
                                        <option value="Directivo">Directores de programa</option>
                                        <option value="Empleador">Empleadores</option>
                                    </select>
                                </div>
                            </div>   
                        </div>
                        <div class="control-group" id="divSemestre" style="display: none" class="span7">
                            <label for="selectSemestre"  class="control-label">Semestre: </label>
                            <div class="controls">
                                <form id="formSelectMuestra"  method="post">
                                    <select name="semestre" id="selectSemestre">
                                        <option value="--">Seleccione Semestre</option>
                                        <option value="03">3</option>
                                        <option value="04">4</option>
                                        <option value="05">5</option>
                                        <option value="06">6</option>
                                        <option value="07">7</option>
                                        <option value="08">8</option>
                                        <option value="09">9</option>
                                        <option value="todos">Todos</option>
                                    </select>
                                </form>
                            </div>
                        </div>  
                    </fieldset>
                </form>
                <p id="help1" class="help-block">Seleccione una fuente para ver la muestra asignada a la misma.</p>
            </ul>
            <div id="listM"></div>
        </div>
    </div>
</div>    

