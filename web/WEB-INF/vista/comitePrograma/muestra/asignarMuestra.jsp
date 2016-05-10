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
    });</script>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
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





                <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a href="#poblacionest" data-toggle="tab">Población estudiantes</a></li>
                    <li><a href="#muestraes" data-toggle="tab">Muestra estudiantes</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="poblacionest">
                        <table id="tablaestudiante0" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Identificación</th>
                                    <th>Nombre</th>
                                </tr>
                            </thead>
                            <tbody id="bodytablaestudiante">
                                <c:choose>
                                    <c:when test="${fn:length(poblacion)!= 0}">
                                        <c:forEach items="${poblacion}" var="paux" varStatus="iter55">
                                            <tr>
                                                <td>${paux.personaId.id}</td>
                                                <td>${paux.personaId.nombre}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane" id="muestraes">
                        <table id="tablaY1" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Identificación</th>
                                    <th>Nombre</th>
                                    <th>Tipo</th>
                                    <th>Curso</th>
                                </tr>
                            </thead>
                            <tbody id="bodytablaestudiante">
                                <c:choose>
                                    <c:when test="${fn:length(listMuestraCon)!= 0}">
                                        <c:forEach items="${listMuestraCon}" var="faux" varStatus="iter55">
                                            <tr class="terminadoC">
                                                <td style="background-color: #DFF0D8; color: #468847;"> ${faux.muestrapersonaId.cedula}</td>
                                                <td style="background-color: #DFF0D8; color: #468847;"> ${faux.muestrapersonaId.nombre}</td>
                                                <td style="background-color: #DFF0D8; color: #468847;"> ${faux.tp}</td>
                                                <td style="background-color: #DFF0D8; color: #468847;"> ${faux.curso}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${fn:length(listMuestraSin)!= 0}">
                                        <c:forEach items="${listMuestraSin}" var="faux" varStatus="iter55">
                                            <tr class="pendienteC">
                                                <td style="background-color: #F2DEDE; color: #B94A48"> ${faux.muestrapersonaId.cedula}</td>
                                                <td style="background-color: #F2DEDE; color: #B94A48;"> ${faux.muestrapersonaId.nombre}</td>
                                                <td style="background-color: #F2DEDE; color: #B94A48;"> ${faux.tp}</td>
                                                <td style="background-color: #F2DEDE; color: #B94A48;"> ${faux.curso}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>

                            </tbody>
                        </table>
                        <p class="total" style="font-weight: bold">Total: ${fn:length(listMuestraCon) + fn:length(listMuestraSin)}</p>
                        <c:if test="${(EstadoProceso == 2 || EstadoProceso == 1) && tipoLogin=='Comite central'}">
                            <a id="bpreparedEditarMuestraEs" class="btn btn-large btn-primary llamador"><i class="icon-edit-sign"></i> Editar Muestra</a>
                        </c:if>
                    </div>
                </div>


            </div>
            <div id="editM">

            </div>                            
        </div>
    </div>
</div>    

<script type="text/javascript">
    $(document).ready(function() {
        $('#tablaY1').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    text: 'Copiar'
                },
                {
                    extend: 'excelHtml5',
                    text: 'Exportar a excel',
                    title: 'Muestra estudiantes'
                }
            ],
            language: {
                buttons: {
                    copyTitle: 'Copiar'
                }
            }
        });
       
    });
</script>
