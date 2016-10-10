<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
    $(function() {
        $("#botonGenerarMuestra").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sap/controladorCP?action=generarMuestra",
                success: function() {
                    location = "/sap/#listMuestra";
                } //fin success
            }); //fin $.ajax    

        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3>Asignación de  Muestra</h3>
            <c:if test="${Muestra == null}">
                No  se ha registrado la muestra en el sistema para este proceso.
                <br><br>
                <c:if test="${tipoLogin=='Comite central'}">
                    <a id="botonGenerarMuestra" href="#generarMuestra" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Generar Muestra</a>
                    <br/><br/>
                    <ul class="nav nav-pills" style="margin-bottom: 0px">
                        <form id="formListarMuestra" class="" method="post" style="margin-bottom: 0px">
                            <fieldset>
                                <legend>Adjuntar la Población</legend>
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
                                                <option value="Directivo">Directivos</option>
                                                <option value="Empleador">Empleadores</option>
                                            </select>
                                        </div>
                                    </div>   
                                </div>
                            </fieldset>
                        </form>
                        <div id="help1"><div class="alert alert-info" role="alert"><strong>Atenci&oacute;n</strong> Seleccione una fuente para ver la población asignada a la misma.</div></div>
                    </ul>
                    <div id="listM"></div>

                </c:if>
            </c:if>




        </div>
    </div>
</div>    

