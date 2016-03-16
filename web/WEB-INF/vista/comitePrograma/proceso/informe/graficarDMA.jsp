<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


${titulo}

<c:forEach items="${ejeY}" var="y" varStatus ="status">
    <br/>${y} : ${ejeX.get(status.index)} 
</c:forEach>
