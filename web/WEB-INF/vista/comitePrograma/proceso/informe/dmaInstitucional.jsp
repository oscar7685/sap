<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table class="table table-bordered" id="tableR">
    <thead style="background-color: #ffffff;">
        <tr>
            <th>Factor</th>
            <th>Caracteristica</th>
            <th>Pregunta</th>
            <th>ESTUDIANTES PREGRADO</th>
            <th>ESTUDIANTES MAESTRÍA Y DOCTORADO</th>
            <th>ESTUDIANTES ESPECIALIZACIONES</th>
            <th>PROFESORES PLANTA</th>
            <th>PROFESORES CATEDRA</th>
            <th>DIRECTIVOS</th>
            <th>ADMINISTRATIVOS</th>
            <th>EGRESADOS PREGRADO</th>
            <th>EGRESADOS MAESTRIA Y DOCTORADO</th>
            <th>EGRESADOS ESPECIALIZACIONES</th>
            <th>EMPLEADORES</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${caractesticas}" var="caracteristica" varStatus="status">
            <tr>
                <th>${caracteristica.factorId.nombre}</th>
                <th>Caracteristica</th>
                <th>Pregunta</th>
                <th>ESTUDIANTES PREGRADO</th>
                <th>ESTUDIANTES MAESTRÍA Y DOCTORADO</th>
                <th>ESTUDIANTES ESPECIALIZACIONES</th>
                <th>PROFESORES PLANTA</th>
                <th>PROFESORES CATEDRA</th>
                <th>DIRECTIVOS</th>
                <th>ADMINISTRATIVOS</th>
                <th>EGRESADOS PREGRADO</th>
                <th>EGRESADOS MAESTRIA Y DOCTORADO</th>
                <th>EGRESADOS ESPECIALIZACIONES</th>
                <th>EMPLEADORES</th>
            </tr>
        </c:forEach>
    </tbody>
</table>   
