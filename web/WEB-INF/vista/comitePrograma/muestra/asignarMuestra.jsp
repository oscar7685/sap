<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="css/jquery.fileupload.css">
<style type="text/css">
    .btn[class*="alt"] {
        padding: 6px 15px;
    }
    .btn[class*="alt"].btn-label i {
        background-color: #000000 !important;
        background-color: rgba(0, 0, 0, 0.02) !important;
        zoom: 1 !important;
        background-color: transparent\9 !important;
        -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#05000000, endColorstr=#05000000)" !important;
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#05000000, endColorstr=#05000000) !important;
    }
    .btn-lg[class*="alt"] {
        padding: 9px 29px;
        font-size: 17px;
        line-height: 1.33;
        border-radius: 3px;
        padding: 10px 29px;
    }
    .btn-sm[class*="alt"] {
        padding: 4px 12px;
        font-size: 13px;
        line-height: 1.44;
        border-radius: 3px;
    }
    .btn-xs[class*="alt"] {
        padding: 3px 11px;
        font-size: 12px;
        line-height: 1.44;
        border-radius: 3px;
        padding: 3px 4px;
        line-height: 1em;
    }
</style>
<script type="text/javascript">
    $(function() {
        $("#botonValoresFormula").popover({
            trigger: 'hover',
            placement: 'bottom',
            html: true,
            content: function() {
                return '<img src="<%=request.getContextPath()%>/img/formula.png" />';
            }
        });
        $("#botonGenerarMuestra").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=generarMuestra",
                success: function() {
                    location = "/sapnaval/#listMuestra";
                } //fin success
            }); //fin $.ajax    

        });
        $("#botonGenerarMuestraCenso").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=generarMuestraCenso",
                success: function() {
                    location = "/sapnaval/#listMuestra";
                } //fin success
            }); //fin $.ajax    

        });
    });
</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <h3>Asignación de  Muestra</h3>
            <c:choose>
                <c:when test="${Muestra != null}">
                    <a href="#generarMuestra" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                </c:when>
                <c:otherwise>
                    No  se ha registrado la muestra en el sistema para este proceso.
                    <br><br>
                    <a id="botonValoresFormula" href="#modificarValoresFormula" class="btn btn-large btn-primary llamador"><i class="icon-random"></i> Editar Valores Formula Muestreo</a><br/><br/>
                    <a id="botonGenerarMuestra" href="#generarMuestra" class="btn btn-large btn-primary llamador"><i class="icon-sort"></i> Generar Muestra</a>
                    <a id="botonGenerarMuestraCenso" href="#generarMuestraCenso" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Aplicar Censo</a>
                </c:otherwise>
            </c:choose>
            <hr/>      
            <br/>      
            <h2>Adjuntar Archivo con la población</h2> 
            <c:choose>
                <c:when test="${EstadoProceso != '3'}">
                    <form action="Formulario" class="form row-border" enctype='multipart/form-data'>
                        <div class="form-group">
                            <!-- The global progress bar -->
                            <div class="col-sm-12">
                                <div id="progress" class="progress">
                                    <div class="progress-bar progress-bar-success"></div>
                                </div>
                            </div>
                            <div class="col-sm-5">

                                <span class="btn btn-success fileinput-button">      
                                    <i class="glyphicon glyphicon-plus"></i>
                                    <span>Seleccionar archivo...</span>
                                    <input id="fileupload" type="file" name="files[]" multiple>
                                </span>

                            </div>
                            <label class="col-sm-10 control-label">Ingrese el archivo excel con la poblaci&oacute;n asociada del programa ${Proceso.programaId.nombre}.<br>Solamente se aceptan archivos con el formato brindado.</label>

                            <div class="col-sm-10">
                                <div class="col-sm-5">
                                    <li style="list-style: none;"><a target="_blank" class="btn btn-lg btn-primary-alt btn-label" href="DescargarFormato"><i class="fa fa-download"></i> Descargar formato</a></li>
                                </div>
                                <!-- The file input field used as target for the file upload widget -->
                                <!-- The container for the uploaded files -->
                                <div id="files" class="files"></div>
                            </div>
                        </div>

                    </form>
                </c:when>
            </c:choose>        

            <div class="panel-body">
                <!-- Accordion -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel-group panel-default" id="accordionA">
                            <div class="panel panel-default">
                                <!--<a data-toggle="collapse" data-parent="#accordionA" href="#collapseOne">--><div class="panel-heading"><h3>Poblacion Estudiantes</h3></div>
                                <div id="collapseOne" class="collapse in">
                                    <div class="panel-body">
                                        <table id="tablaestudiante" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                    <th>Apellidos</th>
                                                    <th>Semestre</th>
                                                    <th>Acci&oacute;n</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytablaestudiante">
                                                <c:choose>
                                                    <c:when test="${fn:length(estudiantesMuestra)!= 0}">
                                                        <c:forEach items="${estudiantesMuestra}" var="estudiante" varStatus="iter55">
                                                            <c:set var="varaux" value="0"/>
                                                            <c:forEach items="${encabezadosEstudiantes}" var="item3" >
                                                                <c:if test="${estudiante.fuenteidUsuario.idUsuario == item3.fuenteidUsuario.idUsuario}">
                                                                    <c:set var="varaux" value="1"/>
                                                                    <tr class="terminadoC">
                                                                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.fuenteidUsuario.idUsuario}</td>
                                                                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.idEstudiante}</td>
                                                                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.fuenteidUsuario.nombre}</td>
                                                                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.fuenteidUsuario.apellido}</td>
                                                                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.programaIdprograma.nombrepro}</td>
                                                                        <td style="background-color: #DFF0D8; color: #468847;">${estudiante.semestre}</td>
                                                                        <td style="background-color: #DFF0D8; color: #468847;"></td>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:if test="${varaux == 0}">
                                                                <tr>
                                                                    <td>${estudiante.fuenteidUsuario.idUsuario}</td>
                                                                    <td>${estudiante.idEstudiante}</td>
                                                                    <td>${estudiante.fuenteidUsuario.nombre}</td>
                                                                    <td>${estudiante.fuenteidUsuario.apellido}</td>
                                                                    <td>${estudiante.programaIdprograma.nombrepro}</td>
                                                                    <td>${estudiante.semestre}</td>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${EstadoProceso != 3}">
                                                                                <button class="btn btn-xs btn-default todo-options eliminarEstudiante" title="Eliminar" data-value="${estudiante.id}"><i class="fa fa-times"></i></button>
                                                                                </c:when>
                                                                            </c:choose>

                                                                    </td>
                                                                </tr>  

                                                            </c:if>
                                                            <c:set var="contador" value="${iter55.index}"></c:set>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <c:choose>
                                            <c:when test="${EstadoProceso != 3}">
                                                <button class="btn btn-primary" id="agregarEstudiante">Agregar estudiante</button>                
                                            </c:when>
                                        </c:choose>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <!--<a data-toggle="collapse" data-parent="#accordionA" href="#collapseTwo">--><div class="panel-heading"><h3>Poblacion Docentes Planta</h3></div>
                            <div id="collapseTwo" class="collapse in">
                                <div class="panel-body" id="panel-body-docente">
                                    <table id="tabladocente" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Identificación</th>
                                                <th>Nombre</th>
                                                <th>Apellidos</th>
                                                <th>acci&oacute;n</th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodytabladocente">
                                            <c:choose>
                                                <c:when test="${fn:length(docentesMuestra)!= 0}">
                                                    <c:forEach items="${docentesMuestra}" var="docente" varStatus="iter56">
                                                        <c:set var="varaux" value="0"/>
                                                        <c:forEach items="${encabezadosDocentes}" var="item3" >
                                                            <c:if test="${docente.fuenteidUsuario.idUsuario == item3.fuenteidUsuario.idUsuario}">
                                                                <c:set var="varaux" value="1"/>
                                                                <tr class="terminadoC">
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${docente.fuenteidUsuario.idUsuario}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${docente.fuenteidUsuario.nombre}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${docente.fuenteidUsuario.apellido}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${docente.programaIdprograma.nombrepro}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${docente.tipoContrato}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;"></td>
                                                                </tr>  
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:if test="${varaux == 0}">
                                                            <tr>
                                                                <td>${docente.fuenteidUsuario.idUsuario}</td>
                                                                <td>${docente.fuenteidUsuario.nombre}</td>
                                                                <td>${docente.fuenteidUsuario.apellido}</td>
                                                                <td>${docente.programaIdprograma.nombrepro}</td>
                                                                <td>${docente.tipoContrato}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${EstadoProceso != 3}">
                                                                            <button class="btn btn-xs btn-default todo-options eliminarDocente" title="Eliminar" data-value="${docente.docenteid}"><i class="fa fa-times"></i></button>
                                                                            </c:when>
                                                                        </c:choose>

                                                                </td>
                                                            </tr>  

                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>

                                        </tbody>
                                    </table>
                                    <c:choose>
                                        <c:when test="${EstadoProceso != 3}">
                                            <button class="btn btn-primary" id="agregarDocente">Agregar docente de planta</button>
                                        </c:when>
                                    </c:choose>

                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <!--<a data-toggle="collapse" data-parent="#accordionA" href="#collapseTwo">--><div class="panel-heading"><h3>Poblacion Docentes Catedra</h3></div>
                            <div id="collapseTwo" class="collapse in">
                                <div class="panel-body" id="panel-body-docente">
                                    <table id="tabladocente" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Identificación</th>
                                                <th>Nombre</th>
                                                <th>Apellidos</th>
                                                <th>acci&oacute;n</th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodytabladocente">
                                            <c:choose>
                                                <c:when test="${fn:length(docentesMuestra)!= 0}">
                                                    <c:forEach items="${docentesMuestra}" var="docente" varStatus="iter56">
                                                        <c:set var="varaux" value="0"/>
                                                        <c:forEach items="${encabezadosDocentes}" var="item3" >
                                                            <c:if test="${docente.fuenteidUsuario.idUsuario == item3.fuenteidUsuario.idUsuario}">
                                                                <c:set var="varaux" value="1"/>
                                                                <tr class="terminadoC">
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${docente.fuenteidUsuario.idUsuario}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${docente.fuenteidUsuario.nombre}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${docente.fuenteidUsuario.apellido}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${docente.programaIdprograma.nombrepro}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${docente.tipoContrato}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;"></td>
                                                                </tr>  
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:if test="${varaux == 0}">
                                                            <tr>
                                                                <td>${docente.fuenteidUsuario.idUsuario}</td>
                                                                <td>${docente.fuenteidUsuario.nombre}</td>
                                                                <td>${docente.fuenteidUsuario.apellido}</td>
                                                                <td>${docente.programaIdprograma.nombrepro}</td>
                                                                <td>${docente.tipoContrato}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${EstadoProceso != 3}">
                                                                            <button class="btn btn-xs btn-default todo-options eliminarDocente" title="Eliminar" data-value="${docente.docenteid}"><i class="fa fa-times"></i></button>
                                                                            </c:when>
                                                                        </c:choose>

                                                                </td>
                                                            </tr>  

                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>

                                        </tbody>
                                    </table>
                                    <c:choose>
                                        <c:when test="${EstadoProceso != 3}">
                                            <button class="btn btn-primary" id="agregarDocente">Agregar docente de catedra</button>
                                        </c:when>
                                    </c:choose>

                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <!--<a data-toggle="collapse" data-parent="#accordionA" href="#collapseThree">--><div class="panel-heading"><h3>Poblacion Personal Directivo</h3></div>
                            <div id="collapseThree" class="collapse in">
                                <div class="panel-body" id="panel-body-representante">
                                    <table id="tablarepresentante" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Identificación</th>
                                                <th>Nombre</th>
                                                <th>Apellidos</th>
                                                <th>acci&oacute;n</th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodytablarepresentante">
                                            <c:choose>
                                                <c:when test="${fn:length(representanteMuestra)!= 0}">
                                                    <c:forEach items="${representanteMuestra}" var="representante" varStatus="iter56">
                                                        <c:set var="varaux" value="0"/>
                                                        <c:forEach items="${encabezadosRepresentantes}" var="item3" >
                                                            <c:if test="${representante.fuenteidUsuario.idUsuario == item3.fuenteidUsuario.idUsuario}">
                                                                <c:set var="varaux" value="1"/>
                                                                <tr class="terminadoC">
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.idUsuario}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.nombre}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.apellido}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.cargo}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;"></td>
                                                                </tr>  
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:if test="${varaux == 0}">
                                                            <tr>
                                                                <td>${representante.fuenteidUsuario.idUsuario}</td>
                                                                <td>${representante.fuenteidUsuario.nombre}</td>
                                                                <td>${representante.fuenteidUsuario.apellido}</td>
                                                                <td>${representante.cargo}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${EstadoProceso != 3}">
                                                                            <button class="btn btn-xs btn-default todo-options eliminarRepresentante" title="Eliminar" data-value="${representante.idRepresentanteEscenario}"><i class="fa fa-times"></i></button>
                                                                            </c:when>
                                                                        </c:choose>

                                                                </td>
                                                            </tr>  
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>
                                        </tbody>
                                    </table>
                                    <c:choose>
                                        <c:when test="${EstadoProceso != 3}">
                                            <button class="btn btn-primary" id="agregarRepresentante">Agregar personal directivo</button>
                                        </c:when>
                                    </c:choose>

                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <!--<a data-toggle="collapse" data-parent="#accordionA" href="#collapseThree">--><div class="panel-heading"><h3>Poblacion Personal Administrativo</h3></div>
                            <div id="collapseThree" class="collapse in">
                                <div class="panel-body" id="panel-body-representante">
                                    <table id="tablarepresentante" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Identificación</th>
                                                <th>Nombre</th>
                                                <th>Apellidos</th>
                                                <th>acci&oacute;n</th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodytablarepresentante">
                                            <c:choose>
                                                <c:when test="${fn:length(representanteMuestra)!= 0}">
                                                    <c:forEach items="${representanteMuestra}" var="representante" varStatus="iter56">
                                                        <c:set var="varaux" value="0"/>
                                                        <c:forEach items="${encabezadosRepresentantes}" var="item3" >
                                                            <c:if test="${representante.fuenteidUsuario.idUsuario == item3.fuenteidUsuario.idUsuario}">
                                                                <c:set var="varaux" value="1"/>
                                                                <tr class="terminadoC">
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.idUsuario}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.nombre}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.apellido}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.cargo}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;"></td>
                                                                </tr>  
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:if test="${varaux == 0}">
                                                            <tr>
                                                                <td>${representante.fuenteidUsuario.idUsuario}</td>
                                                                <td>${representante.fuenteidUsuario.nombre}</td>
                                                                <td>${representante.fuenteidUsuario.apellido}</td>
                                                                <td>${representante.cargo}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${EstadoProceso != 3}">
                                                                            <button class="btn btn-xs btn-default todo-options eliminarRepresentante" title="Eliminar" data-value="${representante.idRepresentanteEscenario}"><i class="fa fa-times"></i></button>
                                                                            </c:when>
                                                                        </c:choose>

                                                                </td>
                                                            </tr>  
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>
                                        </tbody>
                                    </table>
                                    <c:choose>
                                        <c:when test="${EstadoProceso != 3}">
                                            <button class="btn btn-primary" id="agregarRepresentante">Agregar personal administrativo</button>
                                        </c:when>
                                    </c:choose>

                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <!--<a data-toggle="collapse" data-parent="#accordionA" href="#collapseThree">--><div class="panel-heading"><h3>Poblacion Egresados</h3></div>
                            <div id="collapseThree" class="collapse in">
                                <div class="panel-body" id="panel-body-representante">
                                    <table id="tablarepresentante" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>Identificación</th>
                                                <th>Nombre</th>
                                                <th>Apellidos</th>
                                                <th>acci&oacute;n</th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodytablarepresentante">
                                            <c:choose>
                                                <c:when test="${fn:length(representanteMuestra)!= 0}">
                                                    <c:forEach items="${representanteMuestra}" var="representante" varStatus="iter56">
                                                        <c:set var="varaux" value="0"/>
                                                        <c:forEach items="${encabezadosRepresentantes}" var="item3" >
                                                            <c:if test="${representante.fuenteidUsuario.idUsuario == item3.fuenteidUsuario.idUsuario}">
                                                                <c:set var="varaux" value="1"/>
                                                                <tr class="terminadoC">
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.idUsuario}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.nombre}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.fuenteidUsuario.apellido}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;">${representante.cargo}</td>
                                                                    <td style="background-color: #DFF0D8; color: #468847;"></td>
                                                                </tr>  
                                                            </c:if>
                                                        </c:forEach>
                                                        <c:if test="${varaux == 0}">
                                                            <tr>
                                                                <td>${representante.fuenteidUsuario.idUsuario}</td>
                                                                <td>${representante.fuenteidUsuario.nombre}</td>
                                                                <td>${representante.fuenteidUsuario.apellido}</td>
                                                                <td>${representante.cargo}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${EstadoProceso != 3}">
                                                                            <button class="btn btn-xs btn-default todo-options eliminarRepresentante" title="Eliminar" data-value="${representante.idRepresentanteEscenario}"><i class="fa fa-times"></i></button>
                                                                            </c:when>
                                                                        </c:choose>

                                                                </td>
                                                            </tr>  
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>
                                        </tbody>
                                    </table>
                                    <c:choose>
                                        <c:when test="${EstadoProceso != 3}">
                                            <button class="btn btn-primary" id="agregarRepresentante">Agregar egresados</button>
                                        </c:when>
                                    </c:choose>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>        



        </div>
    </div>
</div>    

