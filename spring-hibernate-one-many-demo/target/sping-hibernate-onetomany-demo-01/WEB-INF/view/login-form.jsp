<%-- 
    Document   : login-form
    Created on : Apr 28, 2021, 2:06:13 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"  rel="stylesheet" type="text/css">
        <script src="<c:url value='/resources/jquery/jquery-3.5.0.min.js' />" ></script>
        <script src="<c:url value='/resources/bootstrap/bootstrap.min.js' />" ></script>
        <title>JSP Page</title>
        <c:if test="${param.error!=null}">
        <i style="text-align: center" class="failed">Đăng nhập thát bại! Username/password không chính xác</i> 
    </c:if>
</head>
<body>
    <H3 style="    text-align: center;">Login</H3>
    <form:form style="text-align: -webkit-center" action="${pageContext.request.contextPath}/authenticateTheUser" method="POST"  class="form-horizontal ;">
    <div class="form-group form-group-lg" style="text-align: -webkit-center">
         <p>
             User name: <input class="input-group" type="text" name="username"/>
        </p>
        <p>
            Password: <input class="input-group" type="password" name ="password"/>
        </p>
    </div>
    <input type="submit"  class="btn" value="Login"/>
    </form:form>
</body>
</html>
