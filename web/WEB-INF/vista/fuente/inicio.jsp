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
                <c:choose>
                    <c:when test="${programa.id >=6841 && programa.id <= 6846}">
                        <div><b>Son objetivos del programa de Doctorado en Ciencias F�sicas:</b><br/>
                            <ul>
                                <li>A. Formar investigadores con capacidad para realizar y orientar de manera aut�noma procesos acad�micos y de investigaci�n en diversas �reas de la F�sica.</li>
                                <li>B. Consolidar los grupos de investigaci�n existentes en la regi�n y fomentar la creaci�n de nuevos grupos para el fortalecimiento y desarrollo de la F�sica en el pa�s.</li>
                                <li>C. Promover la vinculaci�n del programa con el sector productivo mediante el desarrollo de investigaciones tendientes a la soluci�n de problemas del entorno.</li>
                                <li>D. Coadyuvar a la consolidaci�n de una comunidad acad�mica y cient�fica en F�sica y �reas afines que contribuya al fortalecimiento de la ciencia y la tecnolog�a.</li>
                            </ul>
                        </div>   
                    </c:when>
                    <c:otherwise>
                        <h5 style="text-align: center;">Del programa ${programa.nombre} usted ha sido seleccionado al azar para diligenciar una sencilla encuesta de caracter an&oacute;nimo y voluntario, Recuerde que su participaci&oacute;n es fundamental en el proceso de autoevaluaci&oacute;n </h5>
                        <br/>
                        <p class="marketing-byline">&Eacute;dgar Parra Chac&oacute;n. Rector Universidad de Cartagena</p>              
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                No Existen Encuestas Disponibles.
            </c:otherwise>
        </c:choose>


    </div>
</div> 
