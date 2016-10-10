<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
    $(function() {
        $("#formX").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sapnaval/controladorCC?action=editarPrograma",
                    data: $("#formX").serialize(),
                    success: function() {
                        location = "/sapnaval/#listarProgramas";
                    } //fin success
                }); //fin $.ajax    
            }
        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <form id="formX" class="form-horizontal" method="post">
                <fieldset>
                    <legend>Editar programa</legend>
                    <div class="control-group">
                        <label for="nombre"  class="control-label">Nombre</label>
                        <div class="controls">
                            <input type="text" name="nombre" id="nombre" value="${programa.nombre}" class="input-xxlarge {required:true}" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="descripcion" class="control-label">Descripci&oacute;n</label>
                        <div class="controls">
                            <textarea rows="3" name="descripcion" id="descripcion" class="input-xxlarge {required:true}">${programa.descripcion}</textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="modalidad" class="control-label">Modalidad</label>
                        <div class="controls">
                            <select id="modalidad" name="modalidad" class="input-xlarge {required:true}">
                                <option></option>
                                <c:choose>
                                    <c:when test="${programa.modalidad == 'Distancia'}">
                                        <option value="Presencial">Presencial</option>
                                        <option value="Distancia" selected="selected">Distancia</option>
                                    </c:when>
                                    <c:when test="${programa.modalidad == 'Presencial'}">
                                        <option value="Presencial" selected="selected">Presencial</option>
                                        <option value="Distancia">Distancia</option>
                                    </c:when>
                                </c:choose>

                            </select>   
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="tipoformacion" class="control-label">Tipo de formacion</label>
                        <div class="controls">
                            <select id="tipoformacion" name="tipoformacion" class="input-xlarge {required:true}">
                                <option></option>
                                <c:choose>
                                    <c:when test="${programa.tipoformacion == 'Pregrado'}">
                                        <option value="Pregrado" selected="selected">Pregrado</option>
                                        <option value="Postgrado">Postgrado</option>
                                    </c:when>
                                    <c:when test="${programa.tipoformacion == 'Postgrado'}">
                                        <option value="Pregrado">Pregrado</option>
                                        <option value="Postgrado" selected="selected">Postgrado</option>
                                    </c:when>
                                </c:choose>
                            </select>   
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="facultad" class="control-label">Facultad</label>
                        <div class="controls">
                            <select id="facultad" name="facultad" class="input-xlarge {required:true}">
                                <option></option>
                                <c:forEach items="${listaFac}" var="row" varStatus="iter">
                                    <c:choose>
                                        <c:when test="${programa.facultadId.id == row.id}">
                                            <option selected="selected" value="${row.id}">${row.nombre}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${row.id}">${row.nombre}</option>
                                        </c:otherwise>   
                                    </c:choose>
                                </c:forEach>


                            </select>       
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-primary" type="submit">Editar</button>
                        <button class="btn" type="reset">Cancelar</button>
                    </div>
                </fieldset>
            </form>
        </div><!--/span-->        
    </div><!--/row-->    
</div>