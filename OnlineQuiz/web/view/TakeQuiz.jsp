<%-- 
    Document   : TakeQuiz
    Created on : Mar 10, 2020, 4:07:16 PM
    Author     : thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
        <link href="css/takequiz.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="block">
            <c:choose>
                <c:when test="${username == null}" >
                    <div class="block">
                        <h4 class="notify"> <c:out value="Access Denied" /> </h4> 
                    </div>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${txtNotify == null}">
                            <c:if test="${sessionScope.quizList == null && markStrSend == null }">
                                <%@include file="TakeQuiz0.jsp" %>
                            </c:if>
                            <c:if test="${sessionScope.quizList.size() != null}">
                                <%@include file="TakeQuiz1.jsp" %>
                            </c:if>
                            <c:if test="${markStrSend != null }">
                                <%@include file="TakeQuiz2.jsp" %>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <h4 class="notify"> <c:out value="${txtNotify}" /> </h4> 
                        </c:otherwise>
                    </c:choose> 
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
