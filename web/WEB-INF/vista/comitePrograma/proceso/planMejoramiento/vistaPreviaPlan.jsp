<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <td style="width: 50%; text-align: center;">PLAN DE MEJORAMIENTO</td>
                                <td>FECHA:07/04/2012</td>
                            </tr>
                        </tbody>
                    </table>


                    <c:forEach items="${Proceso.hallazgoList}" var="item">
                        <c:choose>
                            <c:when test="${item.tipo =='hallazgo'}">
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
                                            <td colspan="2">${item.caracteristicaId.factorId.codigo} - ${item.caracteristicaId.factorId.nombre}</td>   
                                        </tr>
                                        <tr>
                                            <td><strong>Caracteristica:</strong></td>
                                            <td colspan="2">${item.caracteristicaId.codigo} - ${item.caracteristicaId.nombre}</td>   
                                        </tr>
                                        <tr>
                                            <td><strong>Hallazgo:</strong></td>
                                            <td colspan="2">${item.hallazgo}</td>   
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th colspan="8" style="text-align: center;">Formulación</th>   
                                        </tr>
                                        <tr>
                                            <th>Actividad</th>
                                            <th>Meta</th>
                                            <th>Indicador de Cumplimiento</th>   
                                            <th>Inicio</th>   
                                            <th>Final</th>   
                                            <th>Responsables</th>   
                                            <th>Recursos o Financiaci&oacute;n</th>   
                                            <th></th>   
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!--Actividades-->
                                        <c:choose>
                                            <c:when test="${item.actividadList.size()==0}">
                                                <tr>
                                                    <td colspan="8">No Existen registros hasta el momento</td>
                                                </tr>    
                                            </c:when>
                                        </c:choose>
                                        <c:forEach items="${item.actividadList}" var="item3" varStatus="status">
                                            <tr>
                                                <td>
                                                    ${item3.actividad}
                                                </td>
                                                <td>
                                                    ${item3.meta}
                                                </td>
                                                <td>
                                                    ${item3.indicadorCumplimiento}
                                                </td>
                                                <td>
                                                    <fmt:formatDate pattern='dd/MM/yyyy' value='${item3.fechaInicio}' />
                                                </td>
                                                <td>
                                                    <fmt:formatDate pattern='dd/MM/yyyy' value='${item3.fechaFinal}' />
                                                </td>
                                                <td>
                                                    ${item3.responsable}
                                                </td>
                                                <td>
                                                    ${item3.financiacion}
                                                </td>
                                                <td>
                                                    <a href="#verSeguimientos&${item3.idactividad}"><i class="icon-eye-open"></i> Ver Seguimientos</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <hr/>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
        </div>
   