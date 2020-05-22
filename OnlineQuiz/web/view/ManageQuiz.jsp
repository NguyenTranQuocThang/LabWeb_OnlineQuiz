<%-- 
    Document   : ManageQuiz
    Created on : Mar 9, 2020, 11:58:42 PM
    Author     : thang
--%>

<%@page import="Paging.HtmlHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        <%
            Integer pageIndex = (Integer) request.getAttribute("pageIndex");
            Integer pageCount = (Integer) request.getAttribute("pageCount");
        %>
    </head>
    <body>

        <div class="block">
            <c:choose>
                <c:when test="${username == null || userType == 'Normal User'}" >
                    <div class="block">
                        <h4 class="notify"> <c:out value="Access Denied" /> </h4>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${textManage == null}">
                            <div class="block">
                                <p>Number of questions: <span class="titleBlue"><c:out value="${quizList.size()}" /></span></p>
                            </div>
                            <div class="block">
                                <form action="managequiz" method="get">
                                    <%=HtmlHelper.pager(pageIndex, pageCount)%>
                                </form>
                                <table>
                                    <tr>
                                        <td ><p class="titleBlue widthOfQuestion ">Question</p></td>
                                        <td class="titleBlue " ><p class="title">DateCreated</p></td>
                                        <td></td>
                                    </tr>

                                    <c:forEach items="${quizList}" var="qz" >
                                        <tr>

                                            <td class= "widthOfQuestion heighOfQuestion"><c:out value="${qz.question}" /></td>
                                            <td><div ><c:out value="${qz.dateFormat}" /></div></td>
                                            <td><a class="titleBlue paddleft" href="removequiz?questionDelete=${qz.id}&page=${pageIndex}"
                                                   onclick="return confirm('Do you want to delete question')">Delete</a></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <div class="titleBlue">${textRemove}</div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <h4 class="notify"> <c:out value="${textManage}" /> </h4> 
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</body>
</html>
