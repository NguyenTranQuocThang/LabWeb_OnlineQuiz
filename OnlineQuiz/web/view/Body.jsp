<%-- 
    Document   : Login
    Created on : Feb 28, 2020, 8:37:31 PM
    Author     : thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="top">
        </div>
        <div class="container">
            <div class="include">
                <%@include file="Menu.jsp" %>
                <div class="content">
                    <c:if test="${param.form =='Login_Form'}">
                        <%@include file="Login.jsp" %>
                    </c:if>
                    <c:if test="${param.form =='Register_Form'}">
                        <%@include file="Register.jsp" %>
                    </c:if>
                    <c:if test="${param.form =='Make_Quiz'}">
                        <%@include file="MakeQuiz.jsp" %>
                    </c:if>
                    <c:if test="${param.form =='Manage_Quiz'}">
                        <%@include file="ManageQuiz.jsp" %>
                    </c:if>
                    <c:if test="${param.form =='Take_Quiz'}">
                        <%@include file="TakeQuiz.jsp" %>
                    </c:if>
                    <c:if test="${param.form =='Error'}">
                        <%@include file="Error.jsp" %>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>
