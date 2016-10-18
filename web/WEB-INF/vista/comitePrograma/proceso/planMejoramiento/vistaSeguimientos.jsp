<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br>
<div class="hero-unit">
    <div style="margin-left: -30px;">
        <div id="conte" class="span10" style="text-align: justify">
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
                        <c:choose>
                            <c:when test="${hallazgo.tipo =='hallazgo'}">
                                <td><strong>Hallazgo:</strong></td>        
                            </c:when>
                            <c:otherwise>
                                <td><strong>Fortaleza:</strong></td>
                            </c:otherwise>
                        </c:choose>     
                            <td colspan="2">${hallazgo.hallazgo}</td>   
                        </tr>
                        <tr>
                            <td><strong>Actividad:</strong></td>
                            <td colspan="2">${actividad.actividad}</td>   
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
                            <th>Acci&oacute;n</th>    
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${actividad.seguimientoList}" var="item3" varStatus="status">
                            <tr>
                                <td>
                                    ${status.index+1}
                                </td>
                                <td>
                                    <fmt:formatDate pattern='dd/MM/yyyy' value='${item3.fechaProgramado}' />
                                </td>
                                <td>
                                    <fmt:formatDate pattern='dd/MM/yyyy' value='${item3.fechaRealizado}' />
                                </td>
                                <td>
                                    ${item3.porcentajeAvance}
                                </td>
                                <td>
                                    ${item3.observaciones}
                                </td>
                                <td>
                                    <a href="#editarSeguimiento&${item3.idseguimiento}" title="Editar"><i class="icon-edit"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
           

        <a href="#crearSeguimiento" class="btn btn-large btn-primary"><i class="icon-plus"></i> Crear seguimiento</a>                  

    </div>
</div>
</div>   