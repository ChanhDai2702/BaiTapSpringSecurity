<%-- 
    Document   : person-form
    Created on : Mar 13, 2021, 9:42:35 PM
    Author     : TriPham
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>

<title>Person</title>
</head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<body>

<h1 style="text-align: center;">Create New Record</h1>

<c:url var="saveUrl" value="/person/savePerson" />
<%--<c:if test= "${update}">
    <c:url var="saveUrl" value="/person/updatePerson" />
</c:if> --%>

<form:form modelAttribute="person" method="POST" action="${saveUrl}">
     <form:hidden path="id"  style="margin-left: 30%;"/>
 <%--
This line is very important. Without this line, we'd actually lose context or we actually lose the id of the
original customer. So we need to use this line to actually track the customer just so the back end system 
knows which customer to form the update operation on. 
 --%>
 <br>
 <div class="form-group" align="center">
 <table>
  <tr>
   <td><form:label path="firstName">First Name:</form:label></td>
   <td><form:input class="form-group" path="firstName" required="required"/></td>
  </tr>

  <tr>
   <td><form:label path="lastName">Last Name</form:label></td>
   <td><form:input  class="form-group" required="required" path="lastName"/></td>
  </tr>
  
  <tr>
   <td><form:label path="money">Money</form:label></td>
   <td><form:input  class="form-group" required="required" type="number" step=".0001" path="money"/></td>
  </tr>
 </table>

 
 <input type="submit" class="btn btn-primary" value="Save" />
</div>
</form:form>

</body>
</html>
