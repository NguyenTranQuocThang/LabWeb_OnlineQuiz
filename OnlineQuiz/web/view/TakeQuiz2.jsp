<%-- 
    Document   : MakeQuiz2
    Created on : Mar 10, 2020, 10:53:28 PM
    Author     : thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
        <link href="css/takequiz.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>

    </head>
    <body>
        <p>Your score <span class="titleBlue"><c:out value="${markStrSend}" /></span></p>
        <form action="takequiz" method="post">
            <table>
                <tr>
                    <td>
                        Take anther test
                    </td>
                    <td><button type="submit">Start</button></td>
                </tr>
                <tr>
                    <td colspan="2"><div class="notify"><c:out value="${reject}" /></div></td>
                </tr>
            </table>
            
        </form>
    </body>
</html>
