<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link href="css/layout-sitenav.css" type="text/css" rel="stylesheet" media="screen">
        <title>Sap</title>
        <link href="http://fonts.googleapis.com/css?family=Lobster|Oswald|Kaushan+Script" rel="stylesheet" type="text/css">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout2.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/otro.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.1.2/css/buttons.dataTables.min.css">
        <style type="text/css">
            .table-condensed th,
            .table-condensed td {
                padding: 1px 5px;
            }
        </style>
        <script src="<%=request.getContextPath()%>/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    </head>
    <body>


        <div class="ui-layout-north ui-widget-content">
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container-fluid">
                        <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>
                        <a class="brand" style="padding-top: 10px; padding-bottom: 5px;" href="#"><img src="css/images/SAPLETRAS.png"/></a>
                        <div class="nav-collapse collapse">
                            <ul class="nav barra" >
                                <li class="active"><a href="#inicio"><i class="icon-home"></i> Inicio</a></li>
                                <li><a href="#contacto"><i class="icon-phone"></i> Contacto</a></li>
                                <li ><a href="#"><i class="icon-info-sign"></i> Acerca de</a></li>
                                <li class="dropdown loggining"> 
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                        <i class="icon-user"></i> ${nombre}
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a target="_blank" href="DescargarLog">Descargar Log</a></li>
                                        <li><a href="#">Cambiar Contrase&ntilde;a</a></li>
                                        <li class="divider"></li>
                                        <li><a href="<%=request.getContextPath()%>/#CerrarSesion">Cerrar Sesion</a></li>
                                    </ul>

                                </li>
                            </ul>
                        </div>
                        <!--/.nav-collapse -->
                    </div>
                </div>
            </div>        

        </div><!--North-->

        <div class="ui-layout-south ui-widget-content"> 
            <footer id="footer" class="contenedor_footer fondo_footer">
                <div class="links">
                    <a style="font-weight: normal;-moz-text-decoration-line: none;"><span class="muted">&copy; Universidad de Cartagena 2013</span></a>

                    <a class="about" href="#"><span>Acerca de</span></a>

                    <a href="http://autoevaluacioninstitucional.unicartagena.edu.co/index.php/contacto" target="_blank"><span>Contacto</span></a>

                    <a href="http://autoevaluacioninstitucional.unicartagena.edu.co/index.php/contacto" target="_blank"><span>Ayuda</span></a>
                </div>
            </footer>
        </div><!--South-->

        <div class="ui-layout-center">
            <div  class="span10" style="text-align: justify">
                <div class="hero-unit">
                    <h1>Autoevaluaci&oacute;n Institucional!</h1>
                    <p style='font-size: 18px; font-weight: 200; line-height: 27px;'>El Consejo Acad&eacute;mico aprob&oacute; el Modelo de Autoevaluaci&oacute;n con fines de Acreditaci&oacute;n Institucional de la Universidad de Cartagena; instrumento de gesti&oacute;n que permite la revisi&oacute;n sistem&aacute;tica de los procesos acad&eacute;micos y administrativos para  la elaboraci&oacute;n y puesta en marcha de planes de mejoramiento y de mantenimiento que den respuesta a su pol&iacute;tica de calidad.</p>
                    <p><a class="btn btn-primary btn-large" target="_blank" href="http://autoevaluacioninstitucional.unicartagena.edu.co/index.php/autoevaluacion-institucional">Leer M&aacute;s »</a></p>
                </div>
                <div class="row-fluid">
                    <div class="span4">
                        <h2>Definición</h2>
                        <p>Para la Institución, la autoevaluación es un instrumento de gestión, que le permite una revisión sistemática de los procesos académicos y administrativos. De esta manera, se propone optimizar y abrir espacios para la elaboración y puesta en marcha de planes de mejoramiento y de mantenimiento que, por supuesto, den respuesta a su política de calidad.</p>
                        <p><a target="_blank" href="http://autoevaluacioninstitucional.unicartagena.edu.co/index.php/autoevaluacion-institucional/definicion" class="btn">Ver detalles »</a></p>
                    </div>
                    <div class="span4">
                        <h2>Modelo</h2>
                        <p>El Modelo de Autoevaluación de la Universidad de Cartagena se diseñó siguiendo los lineamientos establecidos por el CNA y  fue articulado a la política de mejoramiento de la calidad de la Institución. De acuerdo a ello, lo constituyen un conjunto de factores, características e indicadores que sirven como instrumento analítico en la valoración de los diversos elementos que intervienen en la operación comprensiva de la calidad de la Institución.</p>
                        <p><a href="http://autoevaluacioninstitucional.unicartagena.edu.co/images/pdf/modelo_de_autoevaluacin_institucional.pdf">Descargar Modelo de Autoevaluación Institucional</a></p>
                        <p><a target="_blank" href="http://autoevaluacioninstitucional.unicartagena.edu.co/index.php/autoevaluacion-institucional/modelo-de-autoevaluacion" class="btn">Ver detalles »</a></p>
                    </div><!--/span-->
                    <div class="span4">
                        <h2>Marco Normativo</h2>
                        <p>Los Lineamientos de Autoevaluación para la Acreditación Institucional, el Sistema de Aseguramiento de la Calidad en Colombia, y El Modelo de Autoevaluación Institucional con fines de acreditación de la Universidad de Cartagena, se fundamentan en normas externas y normas internas. </p>
                        <p><a target="_blank" href="http://autoevaluacioninstitucional.unicartagena.edu.co/index.php/autoevaluacion-institucional/marco-normativo" class="btn">Ver detalles »</a></p>
                    </div><!--/span-->
                </div><!--/row-->
            </div> 
        </div><!--/Center-->

        <div id="ui-layout-west" class="ui-layout-west">
            <div id="menu0" class="ui-layout-content">
                <div id="menu" style="padding: 8px 0pt;" class="well">
                    <ul class="nav nav-list">  
                        <button id="west-closer" class="close">&laquo;</button>
                        <li class="nav-header">Modelo</li>
                        <li><a href="#listarModelo"><i class="icon-reorder"></i> Listar Modelos</a></li>
                        <li class="divider"></li>
                        <li class="nav-header">Coordinadores</li>
                        <li><a href="#listarCoordinadores"><i class="icon-reorder"></i> Listar Coordinadores</a></li>
                        <li class="divider"></li>
                        <li class="nav-header">Programas</li>
                        <li><a href="#listarProgramas"><i class="icon-reorder"></i> Listar Programas</a></li>
                        <li class="divider"></li>
                        <li><a href="#controlPanel"><i class="icon-th"></i> Panel de Control</a></li>
                    </ul>
                </div>
                <div>
                    <div style="padding: 8px 0pt;" class="well">
                        <ul class="nav nav-list">  
                            <li class="nav-header">¿Qui&eacute;n est&aacute; en l&iacute;nea&quest;</li>
                            <li><a href="#"><i class="icon-group"></i> Hay ${cantidad} persona(s) en linea</a></li>
                               <%-- <c:forEach items="${representantesLogueados}" var="representante" varStatus="index" end="1">
                                <li><a href="#"><i class="icon-user"></i> ${representante.nombre}</a></li>
                                </c:forEach> --%>
                            </ui>
                    </div>

                </div>
            </div>
        </div><!--/West-->



        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="<%=request.getContextPath()%>/js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="<%=request.getContextPath()%>/js/jquery.layout-latest.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.validate.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.metadata.js"></script>
        <script src="<%=request.getContextPath()%>/js/vendor/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.ba-hashchange.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/highcharts.js"></script>
        <script src="<%=request.getContextPath()%>/js/highcharts-more.js"></script>
        <script src="<%=request.getContextPath()%>/js/exporting.js"></script>
        <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.1.2/js/dataTables.buttons.min.js"></script>
        <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.flash.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
        <script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
        <script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
        <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.html5.min.js"></script>
        <script src="//cdn.datatables.net/buttons/1.1.2/js/buttons.print.min.js "></script>
        <script src="<%=request.getContextPath()%>/js/jquery.PrintArea.js"></script>
        <script src="<%=request.getContextPath()%>/js/main2.js"></script>

    </body>
</html>

<div class="modal hide fade" id="modalCp2">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Atención!</h2>
            </div>
            <div class="modal-body">
                <h4>Ejecutar Proceso de Autoevaluación</h4>
                <br>
                <p>Debe configurar todo el proceso para continuar.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal hide fade" id="modalCc1">
    <div class="modal-header">
        <a data-dismiss="modal" class="close">×</a>
        <h3>Atención!</h3>
    </div>
    <div class="modal-body">
        <h4>Ejecutar Proceso de Autoevaluación.</h4>
        <br>
        <p style="text-align: justify">Esta seguro que desea ejecutar el Proceso?.</p>
    </div>
    <div class="modal-footer">
        <a id="modalCc1b2" class="btn btn-secundary" data-dismiss="modal" href="#">Cancelar</a>
        <a id="modalCc1b1" class="btn btn-primary" data-dismiss="modal" href="#">Ejecutar Proceso</a>
    </div>
</div>
<div class="modal hide fade" id="modalCc2">
    <div class="modal-header">
        <a data-dismiss="modal" class="close">×</a>
        <h3>Atención!</h3>
    </div>
    <div class="modal-body">
        <h4>Finalizar Proceso de Autoevaluación.</h4>
        <br>
        <p style="text-align: justify">Esta seguro que desea finalizar el Proceso?.</p>
    </div>
    <div class="modal-footer">
        <a id="modalCcb2" class="btn btn-secundary" data-dismiss="modal" href="#">Cancelar</a>
        <a id="modalCcb1" class="btn btn-primary" data-dismiss="modal" href="#">Finalizar Proceso</a>
    </div>
</div>
<div class="modal hide fade" id="modalCc3">
    <div class="modal-header">
        <a data-dismiss="modal" class="close">×</a>
        <h3>Atención!</h3>
    </div>
    <div class="modal-body">
        <h4>Crear Proceso de Autoevaluación.</h4>
        <br>
        <p style="text-align: justify">El programa seleccionado ya tiene un proceso activo.</p>
    </div>
    <div class="modal-footer">
        <a id="modalCb2" class="btn btn-secundary" data-dismiss="modal" href="#">Cerrar</a>
    </div>
</div>
<div class="modal hide fade" id="modalCp3">
    <div class="modal-header">
        <a data-dismiss="modal" class="close">×</a>
        <h3>Atención!</h3>
    </div>
    <div class="modal-body">
        <h4>Ponderación de Características.</h4>
        <br>
        <p>Debe ponderar los factores antes de proceder con la ponderación de características.</p>
    </div>
    <div class="modal-footer">
        <a class="btn btn-primary" data-dismiss="modal" href="#">Cerrar</a>
    </div>
</div>