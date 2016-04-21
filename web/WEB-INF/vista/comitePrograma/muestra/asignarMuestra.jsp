<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="css/jquery.fileupload.css">
<style type="text/css">
    #sharefLI_1 {
        box-sizing: border-box;
        color: rgb(95, 118, 118);
        height: 43px;
        width: 506.031px;
        perspective-origin: 253.016px 21.5px;
        transform-origin: 253.016px 21.5px;
        border: 0px none rgb(95, 118, 118);
        font: normal normal normal normal 14px / 20px 'Source Sans Pro', 'Segoe UI', 'Droid Sans', Tahoma, Arial, sans-serif;
        list-style: none outside none;
        outline: rgb(95, 118, 118) none 0px;
    }/*#sharefLI_1*/

    #sharefA_2 {
        box-sizing: border-box;
        color: rgb(52, 152, 219);
        cursor: pointer;
        display: inline-block;
        height: 43px;
        text-align: center;
        text-decoration: none;
        touch-action: manipulation;
        vertical-align: middle;
        white-space: nowrap;
        width: 235.297px;
        perspective-origin: 117.641px 21.5px;
        transform-origin: 117.641px 21.5px;
        background: rgba(255, 255, 255, 0) none repeat scroll 0% 0% / auto padding-box border-box;
        border: 1px solid rgb(52, 152, 219);
        border-radius: 3px 3px 3px 3px;
        font: normal normal normal normal 17px / 22.61px 'Source Sans Pro', 'Segoe UI', 'Droid Sans', Tahoma, Arial, sans-serif;
        list-style: none outside none;
        outline: rgb(52, 152, 219) none 0px;
        padding: 0px 29px 0px 21px;
    }/*#sharefA_2*/

    #sharefI_3 {
        box-shadow: rgba(0, 0, 0, 0.0980392) -1px 0px 0px 0px inset;
        box-sizing: border-box;
        color: rgb(52, 152, 219);
        cursor: pointer;
        display: inline-block;
        height: 41px;
        left: -21px;
        position: relative;
        text-align: center;
        white-space: nowrap;
        width: 48px;
        perspective-origin: 24px 20.5px;
        transform-origin: 24px 20.5px;
        background: rgba(0, 0, 0, 0.0196078) none repeat scroll 0% 0% / auto padding-box border-box;
        border: 0px none rgb(52, 152, 219);
        border-radius: 3px 0 0 3px;
        font: normal normal normal normal 17px / 23px FontAwesome;
        list-style: none outside none;
        outline: rgb(52, 152, 219) none 0px;
        padding: 9px;
    }/*#sharefI_3*/

    #sharefI_3:before {
        box-sizing: border-box;
        color: rgb(52, 152, 219);
        cursor: pointer;
        text-align: center;
        white-space: nowrap;
        border: 0px none rgb(52, 152, 219);
        font: normal normal normal normal 17px / 23px FontAwesome;
        list-style: none outside none;
        outline: rgb(52, 152, 219) none 0px;
    }/*#sharefI_3:before*/
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

        $("#bpreparedEditarMuestraEs").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=preparedEditarMuestra&fuente=estudiantes",
                success: function(datos) {
                    $("#muestra").hide();
                    $("#editM").empty();
                    $("#editM").show();
                    $("#editM").append(datos);
                    $("#contenido").show(200, function() {
                        $("#dancing-dots-text").remove();
                    });
                } //fin success
            }); //fin $.ajax    

        });
        $("#bpreparedEditarMuestraDo").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=preparedEditarMuestra&fuente=docentes",
                success: function(datos) {
                    $("#muestra").hide();
                    $("#editM").empty();
                    $("#editM").show();
                    $("#editM").append(datos);
                    $("#contenido").show(200, function() {
                        $("#dancing-dots-text").remove();
                    });
                } //fin success
            }); //fin $.ajax    

        });
        $("#bpreparedEditarMuestraEg").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=preparedEditarMuestra&fuente=egresados",
                success: function(datos) {
                    $("#muestra").hide();
                    $("#editM").empty();
                    $("#editM").show();
                    $("#editM").append(datos);
                    $("#contenido").show(200, function() {
                        $("#dancing-dots-text").remove();
                    });
                } //fin success
            }); //fin $.ajax    

        });
        $("#bpreparedEditarMuestraAd").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=preparedEditarMuestra&fuente=administrativos",
                success: function(datos) {
                    $("#muestra").hide();
                    $("#editM").empty();
                    $("#editM").show();
                    $("#editM").append(datos);
                    $("#contenido").show(200, function() {
                        $("#dancing-dots-text").remove();
                    });
                } //fin success
            }); //fin $.ajax    

        });
        $("#bpreparedEditarMuestraEm").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=preparedEditarMuestra&fuente=empleadores",
                success: function(datos) {
                    $("#muestra").hide();
                    $("#editM").empty();
                    $("#editM").show();
                    $("#editM").append(datos);
                    $("#contenido").show(200, function() {
                        $("#dancing-dots-text").remove();
                    });
                } //fin success
            }); //fin $.ajax    

        });
        $("#bpreparedEditarMuestraDi").click(function() {
            $.ajax({
                type: 'POST',
                url: "/sapnaval/controladorCP?action=preparedEditarMuestra&fuente=directivos",
                success: function(datos) {
                    $("#muestra").hide();
                    $("#editM").empty();
                    $("#editM").show();
                    $("#editM").append(datos);
                    $("#contenido").show(200, function() {
                        $("#dancing-dots-text").remove();
                    });
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
            <div id="muestra">
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
                                        <li id="sharefLI_1">
                                            <a href="DescargarFormato" id="sharefA_2"><i id="sharefI_3" class="icon-download-alt"></i> Descargar formato</a>
                                        </li>
                                    </div>
                                    <!-- The file input field used as target for the file upload widget -->
                                    <!-- The container for the uploaded files -->
                                    <div id="files" class="files"></div>
                                </div>
                            </div>

                        </form>
                    </c:when>
                </c:choose>        
                <c:if test="${EstadoProceso == 2}">
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-danger">
                            Pendiente
                        </label>
                        <label class="btn btn-success">
                            Terminado
                        </label>
                    </div>
                    <br><br>
                </c:if>
                <div class="accordion" id="accordion2">
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                Estudiantes
                            </a>
                        </div>
                        <div id="collapseOne" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <ul class="nav nav-tabs" id="myTab">
                                    <li class="active"><a href="#poblacion" data-toggle="tab">Población estudiantes</a></li>
                                    <li><a href="#muestra" data-toggle="tab">Muestra estudiantes</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="poblacion">
                                        <table id="tablaestudiante0" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytablaestudiante">
                                                <c:choose>
                                                    <c:when test="${fn:length(poblacionEstudiante)!= 0}">
                                                        <c:forEach items="${poblacionEstudiante}" var="pestudiante" varStatus="iter55">
                                                            <tr>
                                                                <td>${pestudiante.personaId.id}</td>
                                                                <td>${pestudiante.personaId.nombre}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane" id="muestra">
                                        <table id="tablaestudiante" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytablaestudiante">
                                                <c:choose>
                                                    <c:when test="${fn:length(listMuestraEstudiante)!= 0}">
                                                        <c:forEach items="${listMuestraEstudiante}" var="estudiante" varStatus="iter55">
                                                            <tr>
                                                                <td>${estudiante.muestrapersonaId.cedula}</td>
                                                                <td>${estudiante.muestrapersonaId.nombre}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <p class="total" style="font-weight: bold">Total: ${fn:length(listMuestraEstudiante)}</p>
                                        <c:if test="${(EstadoProceso == 2 || EstadoProceso == 1) && tipoLogin=='Comite central'}">
                                            <a id="bpreparedEditarMuestraEs" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                                        </c:if>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                                Docentes
                            </a>
                        </div>
                        <div id="collapseTwo" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <ul class="nav nav-tabs" id="myTabDoc">
                                    <li class="active"><a href="#poblaciondoc" data-toggle="tab">Población docentes</a></li>
                                    <li><a href="#muestradoc" data-toggle="tab">Muestra docentes</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="poblaciondoc">
                                        <table id="tabladocente0" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytabladocente0">
                                                <c:choose>
                                                    <c:when test="${fn:length(poblacionDocente)!= 0}">
                                                        <c:forEach items="${poblacionDocente}" var="pdocente" varStatus="iter55">
                                                            <tr>
                                                                <td>${pdocente.personaId.id}</td>
                                                                <td>${pdocente.personaId.nombre}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane" id="muestradoc">
                                        <table id="tabladocente" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                    <th>Tipo</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytabladocente">
                                                <c:choose>
                                                    <c:when test="${fn:length(listMuestraDocenteCon)!= 0}">
                                                        <c:forEach items="${listMuestraDocenteCon}" var="docente" varStatus="iter55">
                                                            <tr class="terminadoC">
                                                                <td style="background-color: #DFF0D8; color: #468847;">  ${docente.muestrapersonaId.cedula}</td>
                                                                <td style="background-color: #DFF0D8; color: #468847;">  ${docente.muestrapersonaId.nombre}</td>
                                                                <c:choose>
                                                                    <c:when test="${docente.tipo== 2}">
                                                                        <td style="background-color: #DFF0D8; color: #468847;">  PLANTA</td>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td style="background-color: #DFF0D8; color: #468847;">  CÁTEDRA</td>
                                                                    </c:otherwise>    
                                                                </c:choose>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${fn:length(listMuestraDocenteSin)!= 0}">
                                                        <c:forEach items="${listMuestraDocenteSin}" var="docente" varStatus="iter55">
                                                           <tr class="pendienteC">
                                                                <td style="background-color: #F2DEDE; color: #B94A48;">${docente.muestrapersonaId.cedula}</td>
                                                                <td style="background-color: #F2DEDE; color: #B94A48;">${docente.muestrapersonaId.nombre}</td>
                                                                <c:choose>
                                                                    <c:when test="${docente.tipo== 2}">
                                                                        <td style="background-color: #F2DEDE; color: #B94A48;">PLANTA</td>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <td style="background-color: #F2DEDE; color: #B94A48;">CÁTEDRA</td>
                                                                    </c:otherwise>    
                                                                </c:choose>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <p class="total" style="font-weight: bold">Total: ${fn:length(listMuestraDocente)}</p>
                                        <c:if test="${(EstadoProceso == 2 || EstadoProceso == 1) && tipoLogin=='Comite central'}">
                                            <a id="bpreparedEditarMuestraDo" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse3">
                                Administrativos
                            </a>
                        </div>
                        <div id="collapse3" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <ul class="nav nav-tabs" id="myTabDoc">
                                    <li class="active"><a href="#poblacionadm" data-toggle="tab">Población administrativos</a></li>
                                    <li><a href="#muestraadm" data-toggle="tab">Muestra administrativos</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="poblacionadm">
                                        <table id="tablaadministrativo0" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytablaadministrativo0">
                                                <c:choose>
                                                    <c:when test="${fn:length(poblacionAdministrativo)!= 0}">
                                                        <c:forEach items="${poblacionAdministrativo}" var="padministrativo" varStatus="iter55">
                                                            <tr>
                                                                <td>${padministrativo.personaId.id}</td>
                                                                <td>${padministrativo.personaId.nombre}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane" id="muestraadm">
                                        <table id="tablaadministrativo" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytablaadministrativo">
                                                <c:choose>
                                                    <c:when test="${fn:length(listMuestraAdministrativo)!= 0}">
                                                        <c:forEach items="${listMuestraAdministrativo}" var="administrativo" varStatus="iter55">
                                                            <tr>
                                                                <td>${administrativo.muestrapersonaId.cedula}</td>
                                                                <td>${administrativo.muestrapersonaId.nombre}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <p class="total" style="font-weight: bold">Total: ${fn:length(listMuestraAdministrativo)}</p>
                                        <c:if test="${(EstadoProceso == 2 || EstadoProceso == 1) && tipoLogin=='Comite central'}">
                                            <a id="bpreparedEditarMuestraAd" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse4">
                                Egresados
                            </a>
                        </div>
                        <div id="collapse4" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <ul class="nav nav-tabs" id="myTabEgr">
                                    <li class="active"><a href="#poblacionegr" data-toggle="tab">Población egresados</a></li>
                                    <li><a href="#muestraegr" data-toggle="tab">Muestra egresados</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="poblacionegr">
                                        <table id="tablaegresado0" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytablaegresado0">
                                                <c:choose>
                                                    <c:when test="${fn:length(poblacionEgresado)!= 0}">
                                                        <c:forEach items="${poblacionEgresado}" var="pegresado" varStatus="iter55">
                                                            <tr>
                                                                <td>${pegresado.personaId.id}</td>
                                                                <td>${pegresado.personaId.nombre}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane" id="muestraegr">
                                        <table id="tablaegresado" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytablaegresado">
                                                <c:choose>
                                                    <c:when test="${fn:length(listMuestraEgresado)!= 0}">
                                                        <c:forEach items="${listMuestraEgresado}" var="egresado" varStatus="iter55">
                                                            <tr>
                                                                <td>${egresado.muestrapersonaId.cedula}</td>
                                                                <td>${egresado.muestrapersonaId.nombre}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <p class="total" style="font-weight: bold">Total: ${fn:length(listMuestraEgresado)}</p>
                                        <c:if test="${(EstadoProceso == 2 || EstadoProceso == 1) && tipoLogin=='Comite central'}">
                                            <a id="bpreparedEditarMuestraEg" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse5">
                                Directivos
                            </a>
                        </div>
                        <div id="collapse5" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <ul class="nav nav-tabs" id="myTabDir">
                                    <li class="active"><a href="#poblaciondir" data-toggle="tab">Población directivos</a></li>
                                    <li><a href="#muestradir" data-toggle="tab">Muestra directivos</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="poblaciondir">
                                        <table id="tabladirectivo0" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytabladirectivo0">
                                                <c:choose>
                                                    <c:when test="${fn:length(poblacionDirectivo)!= 0}">
                                                        <c:forEach items="${poblacionDirectivo}" var="pdirectivo" varStatus="iter55">
                                                            <tr>
                                                                <td>${pdirectivo.personaId.id}</td>
                                                                <td>${pdirectivo.personaId.nombre}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane" id="muestradir">
                                        <table id="tabladirectivo" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytabladirectivo">
                                                <c:choose>
                                                    <c:when test="${fn:length(listMuestraDirectivo)!= 0}">
                                                        <c:forEach items="${listMuestraDirectivo}" var="directivo" varStatus="iter55">
                                                            <tr>
                                                                <td>${directivo.muestrapersonaId.cedula}</td>
                                                                <td>${directivo.muestrapersonaId.nombre}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <p class="total" style="font-weight: bold">Total: ${fn:length(listMuestraDirectivo)}</p>
                                        <c:if test="${(EstadoProceso == 2 || EstadoProceso == 1) && tipoLogin=='Comite central'}">
                                            <a id="bpreparedEditarMuestraDi" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="accordion-group">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse6">
                                Empleadores
                            </a>
                        </div>
                        <div id="collapse6" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <ul class="nav nav-tabs" id="myTabEmp">
                                    <li class="active"><a href="#poblacionemp" data-toggle="tab">Población empleadores</a></li>
                                    <li><a href="#muestraemp" data-toggle="tab">Muestra empleadores</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="poblacionemp">
                                        <table id="tablaempleadores0" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytablaempleadores0">
                                                <c:choose>
                                                    <c:when test="${fn:length(poblacionEmpleador)!= 0}">
                                                        <c:forEach items="${poblacionEmpleador}" var="pempleador" varStatus="iter55">
                                                            <tr>
                                                                <td>${pempleador.personaId.id}</td>
                                                                <td>${pempleador.personaId.nombre}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane" id="muestraemp">
                                        <table id="tablaempleadores" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Identificación</th>
                                                    <th>Nombre</th>
                                                </tr>
                                            </thead>
                                            <tbody id="bodytablaempleadores">
                                                <c:choose>
                                                    <c:when test="${fn:length(listMuestraEmpleador)!= 0}">
                                                        <c:forEach items="${listMuestraEmpleador}" var="empleador" varStatus="iter55">
                                                            <tr>
                                                                <td>${empleador.muestrapersonaId.cedula}</td>
                                                                <td>${empleador.muestrapersonaId.nombre}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <p class="total" style="font-weight: bold">Total: ${fn:length(listMuestraEmpleador)}</p>
                                        <c:if test="${(EstadoProceso == 2 || EstadoProceso == 1) && tipoLogin=='Comite central'}">
                                            <a id="bpreparedEditarMuestraEm" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div id="editM">

            </div>                            
        </div>
    </div>
</div>    

