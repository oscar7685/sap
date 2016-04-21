<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div  class="span10 offset2" style="text-align: justify">
    <div class="span8">
        <br/>
        <h3>Programa ${programa.nombre} - ${encuesta.nombre}</h3>
        <c:choose>
            <c:when test="${encuesta!=null}">
                <p>Actualmente el programa ${programa.nombre} se encuentra en proceso de autoevaluación con fines de mejoramiento continuo, 
                    identificando y valorando fortalezas y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.</p>

                <p>Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad 
                    y cumplimiento de cada uno de los indicadores enunciados.</p>

                <p>Para contestar tenga en cuenta la siguiente valoración:</p>
                <p>ESCALA VALORATIVA</p>
                <p>5 - Totalmente de acuerdo / Excelente<br/>
                    4 - Parcialmente de acuerdo / Bueno<br/>
                    3 - Neutro / Regular<br/>
                    2 - Parcialmente en desacuerdo / Malo<br/>
                    1 - Totalmente en desacuerdo / Deficiente<br/>
                    0 - No sabe</p>

                <br/>
                <a title="Responder Encuesta" class="btn btn-default" href="#responderEncuesta&${encuesta.id}">Continuar >> </a>

            </c:when>
            <c:otherwise>
                No Existen Encuestas Disponibles.
            </c:otherwise>
        </c:choose>
        <div style="text-align: center"><img src="img/naval.png"></div>

    </div>
</div> 
