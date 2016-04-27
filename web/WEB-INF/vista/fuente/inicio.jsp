<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div  class="span10 offset2" style="text-align: justify">
    <div class="span8">
        <br/>
        <h3>${encuesta.nombre}</h3>
        <c:choose>
            <c:when test="${encuesta!=null}">
                <p>Actualmente la Escuela Naval de Cadetes "Almirante Padilla" se encuentra en proceso de 
                    autoevaluación con fines de Acreditación Institucional, identificando y valorando fortalezas
                    y debilidades, mediante un proceso amplio y participativo de la Comunidad Educativa.
                    Las preguntas que se registran a continuación tienen como objetivo primordial,
                    obtener información pertinente y confiable sobre las condiciones de calidad y cumplimiento
                    de cada uno de los factores estipulados por el Consejo Nacional de Acreditación.</p>

                <p>Las preguntas que se registran a continuación tienen como objetivo primordial, obtener información pertinente y confiable sobre las condiciones de calidad 
                    y cumplimiento de cada uno de los indicadores enunciados.</p>

                <div class="row">
                    <div class="span4">    
                        <p>Para contestar tenga en cuenta la siguiente valoración:</p>
                        <p>ESCALA VALORATIVA</p>
                        <p>5 - Muy alto / Totalmente / Excelente<br/>
                            4 - Alto / En alto grado / Buena<br/>
                            3 - Medio / Aceptablemente / Regular<br/>
                            2 - Bajo / En bajo grado / Mala<br/>
                            1 - Muy bajo / En ningún grado / Muy mala<br/>
                            0 - No sabe / No responde</p>

                    </div>
                    <div class="span4">    
                         <div style="text-align: center"><img src="img/logos-02.png"></div>
                    </div>
                </div>

                <br/>
                <a title="Responder Encuesta" class="btn btn-default" href="#responderEncuesta&${encuesta.id}">Continuar >> </a>
            </c:when>
            <c:otherwise>
                No Existen Encuestas Disponibles.
            </c:otherwise>
        </c:choose>
       

    </div>
</div> 
