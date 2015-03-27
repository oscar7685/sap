<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div  class="span10 offset2" style="text-align: justify">
    <div class="span8">
        <br/>
        <h2>Listado de  Encuestas Disponibles</h2>
        <br/>
        <c:choose>
            <c:when test="${encuesta!=null}">
                <table class="table table-striped table-bordered table-condensed">
                    <thead>
                    <th>Encuesta</th>
                    <th>Programa</th>
                    <th></th>
                    </thead>
                    <tbody>
                        <tr>    
                            <td>   
                                <c:out value="${encuesta.nombre}"/>
                            </td>
                            <td>
                                <c:out value="${programa.nombre}"/>
                            </td>
                            <td> 
                                <a title="Responder Encuesta" href="#responderEncuesta&${encuesta.id}">Responder encuesta </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br/>            
                <h5 style="text-align: center;">Del programa ${programa.nombre} usted ha sido seleccionado al azar para diligenciar una sencilla encuesta de caracter an&oacute;nimo y voluntario, Recuerde que su participaci&oacute;n es fundamental en el proceso de autoevaluaci&oacute;n </h5>
                <br/>
                <p class="marketing-byline">&Eacute;dgar Parra Chac&oacute;n. Rector Universidad de Cartagena</p>              
            </c:when>
            <c:otherwise>
                No Existen Encuestas Disponibles.
            </c:otherwise>
        </c:choose>


    </div>
</div> 
