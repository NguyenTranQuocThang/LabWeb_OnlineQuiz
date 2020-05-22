<%-- 
    Document   : ManageQuiz
    Created on : Mar 3, 2020, 11:46:49 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="block">
            <c:choose>
                <c:when test="${username == null || userType == 'Normal User'}"> 
                        <div class="block">
                            <h4 class="notify"> <c:out value="Access Denied" /> </h4> 
                        </div>
                </c:when>
                <c:otherwise>
                    <div class="block">
                        <form action="makequiz" method="post">
                        <table >
                            <tr>
                                <td class="fortopBlock">Question: </td>
                                <td>
                                    <textarea class="texareaBig" name="question" ><c:out value="${question}" /></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="fortopBlock">Option1: </td>
                                <td >
                                    <textarea class="texareaSmall" name="option1" ><c:out value="${option1}" /></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="fortopBlock">Option2: </td>
                                <td>
                                    <textarea class="texareaSmall" name="option2" ><c:out value="${option2}" /></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="fortopBlock">Option3: </td>
                                <td>
                                    <textarea class="texareaSmall" name="option3"><c:out value="${option3}" /></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="fortopBlock">Option4: </td>
                                <td>
                                    <textarea class="texareaSmall" name="option4" ><c:out value="${option4}"/></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td >Answer(s): </td>
                                <td>
                                    <div class="checkbox">
                                        <input name="answer1" type="checkbox" value="1" <c:if test="${answer1 == '1'}" >checked</c:if> > Option1
                                        <input name="answer2" type="checkbox" value="2" <c:if test="${answer2 == '2'}" >checked</c:if> > Option2
                                        <input name="answer3" type="checkbox" value="3" <c:if test="${answer3 == '3'}" >checked</c:if> > Option3
                                        <input name="answer4" type="checkbox" value="4" <c:if test="${answer4 == '4'}" >checked</c:if> > Option4
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="Save "><span class="notify"><c:out value=" ${textSend}" /></span></td>
                            </tr>
                        </table>
                    </form>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </body>
</html>
