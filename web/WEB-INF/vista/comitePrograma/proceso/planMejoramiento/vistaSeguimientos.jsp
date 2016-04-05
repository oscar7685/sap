<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title></title>
        <link href="http://fonts.googleapis.com/css?family=Lobster|Oswald|Kaushan+Script" rel="stylesheet" type="text/css">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
        <link href="css/slider.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
        <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <style>
            .table th, .table td {
                padding: 4px;
            }
        </style>
    </head>
    <body style="padding-top: 0px;">
        <br>
        <div class="hero-unit">
            <div style="margin-left: -30px;">
                <div id="conte" class="span12" style="text-align: justify">
                    <table class="table table-bordered table-striped" style="font-weight: bold;">
                        <tbody>
                            <tr>
                                <td rowspan="3" style="width: 25%; text-align: center;"><img src="<%=request.getContextPath()%>/img/LogoU.png"></td>
                                <td style="width: 50%; text-align: center;">UNIVERSIDAD DE CARTAGENA</td>
                                <td style="width: 25%;">CÓDIGO: FO-DO/004</td>
                            </tr>
                            <tr>
                                <td style="width: 50%; text-align: center;">AUTOEVALUACIÓN Y ACREDITACIÓN</td>
                                <td>VERSIÓN:00</td>
                            </tr>
                            <tr>
                                <td style="width: 50%; text-align: center;">SEGUIMIENTO Y MONITOREO AL PLAN DE MEJORAMIENTO POR HALLAZGO</td>
                                <td>FECHA:07/04/2012</td>
                            </tr>
                        </tbody>
                    </table>


                    <c:choose>
                        <c:when test="${hallazgo.tipo =='hallazgo'}">
                            <table class="table table-bordered table-striped">
                                <tbody>
                                    <tr>
                                        <td colspan="3"></td>   
                                    </tr>
                                    <tr>
                                        <td><strong>Programa:</strong></td>
                                        <td colspan="2">${Proceso.programaId.nombre}</td>   
                                    </tr>
                                    <tr>
                                        <td><strong>Factor:</strong></td>
                                        <td colspan="2">${hallazgo.caracteristicaId.factorId.codigo} - ${hallazgo.caracteristicaId.factorId.nombre}</td>   
                                    </tr>
                                    <tr>
                                        <td><strong>Caracteristica:</strong></td>
                                        <td colspan="2">${hallazgo.caracteristicaId.codigo} - ${hallazgo.caracteristicaId.nombre}</td>   
                                    </tr>
                                    <tr>
                                        <td><strong>Hallazgo:</strong></td>
                                        <td colspan="2">${hallazgo.hallazgo}</td>   
                                    </tr>
                                    <tr>
                                        <td><strong>Meta:</strong></td>
                                        <td colspan="2">${meta.meta}</td>   
                                    </tr>
                                </tbody>
                            </table>
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th># Seguimiento</th>   
                                        <th>Fecha Programado</th>   
                                        <th>Fecha Realizado</th>   
                                        <th>% Avance</th>   
                                        <th>Observaciones</th>   
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach items="${meta.seguimientosList}" var="item3" varStatus="status">
                                        <tr>
                                            <td>
                                                ${item3.idseguimientos}
                                            </td>
                                            <td>
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${item3.fechaProgramada}' />
                                            </td>
                                            <td>
                                                <fmt:formatDate pattern='dd/MM/yyyy' value='${item3.fechaRealizacion}' />
                                            </td>
                                            <td>
                                                ${item3.porcentajeAvance}
                                            </td>
                                            <td>
                                                ${item3.descripcion}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                    </c:choose>


                </div>
            </div>
        </div>
    </body>
</html>