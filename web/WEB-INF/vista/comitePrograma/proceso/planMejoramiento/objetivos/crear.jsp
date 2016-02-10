<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" language="JavaScript">
    $(document).ready(function() {
        $('.tool').tooltip().click(function(e) {
            $(this).tooltip('hide');
        });
        $("#formCrearObjetivo").validate({
            submitHandler: function() {
                $.ajax({
                    type: 'POST',
                    url: "/sapnaval/controladorCP?action=crearObjetivo2",
                    data: $("#formCrearObjetivo").serialize(),
                    success: function() {
                        location = "/sapnaval/#listarObjetivos&${hallazgo.idhallazgo}";
                    } //fin success
                }); //fin $.ajax    */
            }
        });
    });
</script>
<div class="hero-unit">
    <div style="margin-left: -30px;">
        <div id="conte" class="span10" style="text-align: justify">
            <div class="row">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#home" role="tab" data-toggle="tab">Plan de mejoramiento</a></li>
                    <li><a href="#profile" role="tab" data-toggle="tab">Plan de mantenimiento</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="home">
                        <ul class="breadcrumb">
                            <li><a href="<%=request.getContextPath()%>/#listarHallazgos" class="tool" data-placement="top" rel="tooltip" data-original-title="Listar hallazgos">Hallazgos</a> <span class="divider">/</span></li>
                            <li><a href="<%=request.getContextPath()%>/#editarHallazgo&${hallazgo.idhallazgo}" class="tool" data-placement="top" rel="tooltip" data-original-title="${hallazgo.hallazgo}">Hallazgo</a> <span class="divider">/</span></li>
                            <li><a href="<%=request.getContextPath()%>/#listarObjetivos&${hallazgo.idhallazgo}" class="tool" data-placement="top" rel="tooltip" data-original-title="Listar objetivos">Objetivos</a> <span class="divider">/</span></li>
                            <li>Crear</li>
                            <a id="printEnlace" target="_blank" href="/sapnaval/controladorCP?action=PM" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mejoramiento</a>
                        </ul>

                        <form id="formCrearObjetivo" class="form-horizontal" method="post">
                            <fieldset>
                                <legend>Crear objetivo</legend>
                                <div class="control-group">
                                    <label for="objetivo" class="control-label">Objetivo</label>
                                    <div class="controls">
                                        <textarea rows="4" name="objetivo" id="objetivo" class="input-xxlarge {required:true}"></textarea>
                                    </div>
                                </div>
                                <div class="form-actions span8">
                                    <button class="btn btn-primary" type="submit">Crear Objetivo</button>
                                    <button class="btn" type="reset">Cancelar</button>
                                </div>
                            </fieldset>
                        </form>

                    </div>

                    <div class="tab-pane" id="profile">
                         <ul class="breadcrumb">
                            <li>Fortalezas</li>
                            <a id="printEnlace" target="_blank" href="/sapnaval/controladorCP?action=PM2" style="float: right; cursor: pointer;"><i class="icon-eye-open"></i> Ver Plan de Mantenimiento</a>
                        </ul>
                        <h3>Listado de  Fortalezas</h3>
                      <c:choose>
                            <c:when test="${fn:length(listFortalezas)!= 0}">
                                <table class="table table-striped table-bordered table-condensed">
                                    <thead>
                                    <th>Fortaleza</th>
                                    <th>Caracteristica</th>    
                                    <th>Acci&oacute;n</th>    
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listFortalezas}" var="item" varStatus="iter">
                                            <tr>
                                                <td>   
                                                    <c:out value="${item.hallazgo}"/>
                                                </td>
                                                <td>   
                                                    <c:out value="${item.caracteristicaId.nombre}"/>
                                                </td>
                                                <td>   
                                                    <a href="#editarFortaleza&${item.idhallazgo}" title="Editar"><i class="icon-edit"></i></a>
                                                    <a href="#listar2Objetivos&${item.idhallazgo}" title="Ver objetivos"><i class="icon-signin"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:when>
                            <c:otherwise>
                                Aun no existen Fortalezas para este plan de mantenimiento.<br/>
                            </c:otherwise>
                        </c:choose>
                        <a href="#crearFortaleza" class="btn btn-large btn-primary"><i class="icon-plus"></i> Crear fortaleza</a>    
                    </div>        
                </div>
            </div>
        </div>
    </div>
</div>
