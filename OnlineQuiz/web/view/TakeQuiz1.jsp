<%-- 
    Document   : MakeQuiz1
    Created on : Mar 10, 2020, 10:53:07 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/form.css" rel="stylesheet" type="text/css"/>
        <link href="css/takequiz.css" rel="stylesheet" type="text/css"/>
        <script src="js/javascript.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <form  id="submitform" action="takequiz" method="post" >
            <table>
                <tr> 
                    <td class="tdFix">
                        <div class="divTable">
                            <p>Wellcome <span class="titleBlue"><c:out value="${username}" /></span></p>
                            <div class="right">
                                <div>Time remaining 
                                    <span class="notify">
                                        <label id="minutes">00</label>:<label id="seconds">00</label>
                                      <input type="hidden" id="secondTimeLose" value="${secondTimeLose == null ? 0: secondTimeLose }">
                                      <input type="hidden" id="timeQuestion" value="${timeQuestion}">
                                    </span>
                                </div>
                            </div>
                            <div class="titleBlue">
                                <label >Question: </label><label id="question_now">1</label>/<label id="number_ques">${quizList.size()}</label>
                            </div>
                        </div>
                        <c:forEach items="${quizList}" var="l" varStatus="loopCounter" >
                            <div class="hideQuestion"  id="test${loopCounter.count}">
                                <p>${l.question}</p>
                                <input name="${l.id}answer1" type="checkbox" value="1"> ${l.option1}
                                <br>
                                <input name="${l.id}answer2" type="checkbox" value="2"> ${l.option2}
                                <br>
                                <input name="${l.id}answer3" type="checkbox" value="3"> ${l.option3}
                                <br>
                                <input name="${l.id}answer4" type="checkbox" value="4"> ${l.option4}
                            </div>
                        </c:forEach> 
                        <br>
                    </td>        
                    <td></td>
                </tr>
                <tr>
                    <td> 
                        <button  name="submitResult" type="submit" >Submit</button>
                    </td>
                    <td>
                        <button onclick="showquestion(${quizList.size()})" type="button" name="next">Next</button>
                    </td>
                </tr>
            </table>
        </form>
        <script>
            startQuiz();
        </script>
    </body>
</html>
