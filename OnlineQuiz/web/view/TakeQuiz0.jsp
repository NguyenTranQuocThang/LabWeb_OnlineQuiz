<%-- 
    Document   : MakaQuiz0
    Created on : Mar 10, 2020, 11:01:34 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="takequiz" method="post">
            <table>
                <tr>
                    <td>
                        <p>Wellcome <span class="titleBlue"><c:out value="${username}" /></span></p>
                        <p>Enter number of question: </p>
                        <input class="inputSize" type="number"  name="numberOfQuestion" min="1" max="${countQuiz}" required >
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><button class="locationButtonStart" name="start" type="submit">Start</button></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td><div class="notify">${txtCheckForm}</div></td>
                </tr>
            </table>
        </form>
    </body>
</html>
