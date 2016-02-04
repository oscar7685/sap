<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/multiple-select.css" />
<style>
    .ms-drop input[type="checkbox"]{
        margin: 3px 3px 3px 4px;
    }
</style>
<div  class="span10 offset2" style="text-align: justify">
    <div class="span8">
        <br/>
        <h2>Selección del perfil</h2>
        <br/>
        <div>
            <div class="form-control">
                <label>
                    <h4>Estudiante</h4>
                </label>
            </div>
            <div>
                <select id="ms1" multiple="multiple" class="form-control">
                    <c:forEach items="${programas}" var="row" varStatus="iter">
                        <option value="${row.id}">${row.nombre}</option>
                    </c:forEach>
                </select>
            </div>    
        </div>
        <div>
            <div class="form-control">
                <label>
                    <h4>Docente de Planta</h4>
                </label>
            </div>
            <div>
                <select id="ms2" multiple="multiple" class="form-control">
                    <c:forEach items="${programas}" var="row" varStatus="iter">
                        <option value="${row.id}">${row.nombre}</option>
                    </c:forEach>
                </select>
            </div>    
        </div>
        <div>
            <div class="form-control">
                <label>
                    <h4>Docente de Catedra</h4>
                </label>
            </div>
            <div>
                <select id="ms3" multiple="multiple" class="form-control">
                    <c:forEach items="${programas}" var="row" varStatus="iter">
                        <option value="${row.id}">${row.nombre}</option>
                    </c:forEach>
                </select>
            </div>    
        </div>
        <div>
            <div class="form-control">
                <label>
                    <h4>Egresado</h4>
                </label>
            </div>
            <div>
                <select id="ms4" multiple="multiple" class="form-control">
                    <c:forEach items="${programas}" var="row" varStatus="iter">
                        <option value="${row.id}">${row.nombre}</option>
                    </c:forEach>
                </select>
            </div>    
        </div>
        <div>
            <div class="form-control">
                <label>
                    <h4>Directivo</h4>
                </label>
            </div>
            <div>
                <select id="ms5" multiple="multiple" class="form-control">
                    <c:forEach items="${programas}" var="row" varStatus="iter">
                        <option value="${row.id}">${row.nombre}</option>
                    </c:forEach>
                </select>
            </div>    
        </div>
        <div>
            <div class="form-control">
                <label>
                    <h4>Administrativo</h4>
                </label>
            </div>
            <div>
                <select id="ms6" multiple="multiple" class="form-control">
                    <c:forEach items="${programas}" var="row" varStatus="iter">
                        <option value="${row.id}">${row.nombre}</option>
                    </c:forEach>
                </select>
            </div>    
        </div>
        <div>
            <div class="checkbox">
                <label>
                    <input type="checkbox"> <h4>Empleador</h4>
                    
                </label>
            </div>
        </div>
    </div>
</div> 
<script src="<%=request.getContextPath()%>/js/multiple-select.js"></script>
<script>
    $(function() {
        $('#ms1').multipleSelect({
            width: '100%',
            selectAll: false
        });
        $('#ms2').multipleSelect({
            width: '100%',
            selectAll: false
        });
        $('#ms3').multipleSelect({
            width: '100%',
            selectAll: false
        });
        $('#ms4').multipleSelect({
            width: '100%',
            selectAll: false
        });
        $('#ms5').multipleSelect({
            width: '100%',
            selectAll: false
        });
        $('#ms6').multipleSelect({
            width: '100%',
            selectAll: false
        });
    });
</script>