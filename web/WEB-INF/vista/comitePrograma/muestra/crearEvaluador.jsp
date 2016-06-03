<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
    $(function() {
        $("#formCrearEvaluador").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sapnaval/controladorCP?action=crearEvaluador",
                    data: $("#formCrearEvaluador").serialize(),
                    success: function() {
                        $("#listM").empty();
                        $.ajax({
                            type: 'POST',
                            url: "/sapnaval/controladorCP?action=selectorListMuestra",
                            data: $("#formListarMuestra").serialize(),
                            success: function(datos) {
                                $(".divEvaluador").remove();
                                $("#listM").append(datos);
                                $("#contenido").show(200, function() {
                                    $("#dancing-dots-text").remove();
                                });
                            } //fin success
                        }); //fin $.ajax 
                    } //fin success
                }); //fin $.ajax    
            }
        });
    });
</script>
<div class="hero-unit divEvaluador">
    <div class="row">
        <div id="conte" class="span10">
            <form id="formCrearEvaluador" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Crear Evaluador</legend>
                    <div class="control-group">
                        <label for="cedula" class="control-label">Cédula</label>
                        <div class="controls">
                            <input type="text" name="cedula" id="cedula" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="nombre"  class="control-label">Nombres</label>
                        <div class="controls">
                            <input type="text" name="nombre" id="nombre" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="apellido"  class="control-label">Apellidos</label>
                        <div class="controls">
                            <input type="text" name="apellido" id="apellido" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="password"  class="control-label">Contraseña</label>
                        <div class="controls">
                            <input type="text" name="password" id="password" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="mail"  class="control-label">Correo electrónico</label>
                        <div class="controls">
                            <input type="text" name="mail" id="mail" class="input-xlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${selectorFuente == 'Estudiante'}">
                            <div class="control-group">
                                <label for="codigo"  class="control-label">Código ${selectorFuente}</label>
                                <div class="controls">
                                    <input type="text" name="codigo" id="codigo" class="input-xlarge {required:true}" value=""/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="semestre"  class="control-label">Semestre</label>
                                <div class="controls">
                                    <input type="text" name="semestre" id="semestre" class="input-xlarge {required:true}" value=""/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="periodo"  class="control-label">Periodo</label>
                                <div class="controls">
                                    <input type="text" name="periodo" id="periodo" class="input-xlarge {required:true}" value=""/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label for="anio"  class="control-label">Año</label>
                                <div class="controls">
                                    <input type="text" name="anio" id="anio" class="input-xlarge {required:true}" value=""/>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${selectorFuente == 'Docente'}">
                            <div class="control-group">
                                <label for="tipo"  class="control-label">Tipo</label>
                                <div class="controls">
                                    <input type="text" name="tipo" id="tipo" class="input-xlarge {required:true}" value=""/>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${selectorFuente == 'Administrativo'}">
                            <div class="control-group">
                                <label for="cargo"  class="control-label">Cargo</label>
                                <div class="controls">
                                    <input type="text" name="cargo" id="cargo" class="input-xlarge {required:true}" value=""/>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${selectorFuente == 'Agencia'}">
                            <div class="control-group">
                                <label for="descripcion"  class="control-label">Descripción</label>
                                <div class="controls">
                                    <input type="text" name="descripcion" id="descripcion" class="input-xlarge {required:true}" value=""/>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${selectorFuente == 'Empleador'}">
                            <div class="control-group">
                                <label for="empresa"  class="control-label">Empresa</label>
                                <div class="controls">
                                    <input type="text" name="empresa" id="empresa" class="input-xlarge {required:true}" value=""/>
                                </div>
                            </div>
                             <div class="control-group">
                                <label for="cargo"  class="control-label">Cargo</label>
                                <div class="controls">
                                    <input type="text" name="cargo" id="cargo" class="input-xlarge {required:true}" value=""/>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>

                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Crear Evaluador</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>