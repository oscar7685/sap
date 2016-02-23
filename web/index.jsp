<%
    HttpSession session1 = request.getSession();
    String aux = (String) session1.getAttribute("tipoLogin");
    if (aux == null || aux.isEmpty()) {
        session1.invalidate();
    } else {
        if (aux.equals("Comite programa")) {
            RequestDispatcher rd = request.getRequestDispatcher("/controladorCP?action=indexCP");
            rd.forward(request, response);
        } else {
            if (aux.equals("Comite central")) {
                RequestDispatcher rd = request.getRequestDispatcher("/controladorCC?action=indexCC");
                rd.forward(request, response);
            } else {
                if (aux.equals("Fuente")) {
                    RequestDispatcher rd = request.getRequestDispatcher("/controladorF?action=indexF");
                    rd.forward(request, response);
                }
            }
        }
    }

%>


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link href="css/layout-sitenav.css" type="text/css" rel="stylesheet" media="screen">
        <title></title>
        <link href="http://fonts.googleapis.com/css?family=Lobster|Oswald|Kaushan+Script" rel="stylesheet" type="text/css">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link href="css/slider.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/otro.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
        <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>

    </head>
    <body style="padding-top: 0px; background-image: url(img/enap.jpg); background-repeat: no-repeat;background-size: 100%;">
        <img src="img/naval.png" style="position: fixed;top: 70px;left: 30px;"></img>
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

                            <li><a  href="#"><i class="icon-phone"></i> Contacto</a></li>
                            <li ><a href="#" id="enlaceAcercaDe"><i class="icon-info-sign"></i> Acerca de</a></li>
                            <li><a href="#ingresar"><i class="icon-user"></i>Ingresar</a></li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <header class="inicio" style="padding-top: 60px;">

        </header>
        <div class="container">
            <div class="row" id="login" style="display: none">
                <form name="formularioLogin" class="form-signin" id="formulario_login">
                    <div class="alert alert-error fade in" id="login-error" style="display:none;">
                        <button type="button" class="close" id="close1">×</button>
                    </div>
                    <h2 class="form-signin-heading">Ingresar</h2>
                    <input type="text" placeholder="Usuario" name="codigo" id="codigo" class="input-block-level {required:true}">
                    <input type="password" placeholder="Contraseña" name="clave" id="pass" class="input-block-level {required:true}" >
                    <label class="checkbox">
                        <input type="checkbox" name="recordar" value="remember-me"> Recordar
                    </label>
                    <button id="btnIniciar" type="submit" class="btn btn-large btn-primary">Iniciar sesi&oacute;n</button>
                </form>
            </div>

        </div> <!-- /container -->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="<%=request.getContextPath()%>/js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/jquery.metadata.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/jquery.ba-hashchange.min.js"></script>
        <script type='text/javascript' src='js/slider.js'></script>
        <script src="js/main.js"></script>

        <div class="modal fade" id="ModalAcercaDe" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content" style="background-color: #282728;">
                    <div class="modal-header" style="padding-bottom: 19px; border-bottom:0;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body" align="center">
                        <img src="<%=request.getContextPath()%>/css/images/SAPLETRAS.png"/>
                        <br>
                        <p style="color: #FFFFFF; text-align: right">SAP-UdeC v1.0</p>
                        <p style="color: #FFFFFF; text-align: justify">El sistema de autoevaluación de programas es un apoyo fundamental para los procesos de autoevaluación que debe realizar los programas, ya sea con fines de Acreditación o con fines de renovación de registro calificado.</p>
                        <br/>
                        <p style="color: #FFFFFF;  text-align: right">Desarrollado por el Centro de Autoevaluaci&oacute;n</p>
                        <p style="color: #FFFFFF; text-align: right">Martín Emilio Monroy Ríos, Edna Margarita Gómez Bustamante, Oscar Javier Ballesteros Pacheco, Arturo Gonzales Villamizar.</p>
                        <%--  </div>--%>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </body>
</html>
