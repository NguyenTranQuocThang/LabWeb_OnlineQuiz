/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.SqlStatement;
import GetValueFromConfigfile.GetValue;
import Model.Quiz;
import java.io.IOException;
import java.util.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thang
 */
public class TakeQuiz extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            GetValueFromConfigfile.GetValue gv = new GetValue();
            String timeQuestion = gv.getValue("timeQuestion");
            request.setAttribute("timeQuestion", timeQuestion);
            
            SqlStatement ss = new SqlStatement();
            int countQuiz = ss.countQuestion();
            String txtNotify = null;
            // count question in database
            if (countQuiz == 0) {
                txtNotify = "There aren't any questions in the list";
            }
            request.setAttribute("txtNotify", txtNotify);
            request.setAttribute("countQuiz", countQuiz);
            String txtCheckForm = null;
            String numberOfQuestionParameter = request.getParameter("numberOfQuestion");
            try {
                // check button start have been click or not
                if (request.getParameter("start") != null) {
                    // check validate of numberOfQuestionParameter
                    if (numberOfQuestionParameter.equals("") || numberOfQuestionParameter.equals("0")) {
                        txtCheckForm = "No question found";
                    } else if (Integer.parseInt(numberOfQuestionParameter) > countQuiz) { // check numberques > quiz in database
                        txtCheckForm = " Larger quantities allowed";
                    } else { // if check validate success create list
                        ArrayList<Quiz> quizList = ss.getListQuiz(Integer.parseInt(numberOfQuestionParameter));
                        request.getSession().setAttribute("quizList", quizList);
                        // date now to check when user load page or too late for submit
                        Date date = new Date();
                        request.getSession().setAttribute("dateStart", date);
                    }
                }
            } catch (Exception e) {
                txtCheckForm = "Value does not match";
            }
            
            
            ArrayList<Quiz> quizList = (ArrayList<Quiz>) request.getSession().getAttribute("quizList");

            // Check list exits and submit =>   Calculate the result
            if (quizList != null && request.getParameter("submitResult") != null) {
                int numberAnswer = 0;
                // take answer of user and compare with answer of list
                for (int i = 0; i < quizList.size(); i++) {
                    String ans1 = request.getParameter(quizList.get(i).getId() + "answer1");
                    String ans2 = request.getParameter(quizList.get(i).getId() + "answer2");
                    String ans3 = request.getParameter(quizList.get(i).getId() + "answer3");
                    String ans4 = request.getParameter(quizList.get(i).getId() + "answer4");
                    String answer = "";
                    // check if answer is not check => don't add answer
                    // answer = sum of answer from 1 to 4 if check add or not check => not add
                    if (ans1 != null) {
                        answer += ans1;
                    }
                    if (ans2 != null) {
                        answer += ans2;
                    }
                    if (ans3 != null) {
                        answer += ans3;
                    }
                    if (ans4 != null) {
                        answer += ans4;
                    }
                    if (quizList.get(i).getAnswer().equals(answer)) {
                        numberAnswer++;
                    }
                }
                // mark user = ( 10 / number ques ) * number ques user type true answer  
                double mark = ((double) 10 / quizList.size()) * numberAnswer;
                DecimalFormat df = new DecimalFormat("#.#");
                String markDouble = df.format(mark);
                String markPercent = df.format(mark * 100 / 10);

                String markStrSend = markDouble + " (" + markPercent + "%) ";
                //create string to send form mark
                markStrSend += mark * 100 / 10 >= 50 ? "- Passed" : "- Failed";
                request.setAttribute("markStrSend", markStrSend);
                //when have mark remove list to change form mark
                request.getSession().removeAttribute("quizList");
            }
            // check submit or check reload page
            if (request.getParameter("submitResult") != null || quizList != null) {
                Date dateNow = new Date();
                Date dateStart = (Date) request.getSession().getAttribute("dateStart");
                if (dateStart != null) {
                    int second = (int) ((dateNow.getTime() - dateStart.getTime()) * 0.001);
                    //check time tooo late for submit and reject mark
                    // second is time when submit - time when create list question
                    //If the problem is zero, it will be the same as the case submit auto when time = 0;
                    if ((second - quizList.size() * Integer.parseInt(timeQuestion)) > 0) {
                        String reject = null;
                        reject = "Time is too late . You have been Reject";
                        request.setAttribute("markStrSend", reject);
                        request.getSession().removeAttribute("dateStart");
                        request.getSession().removeAttribute("quizList");
                    } else { // check time reload
                        request.setAttribute("secondTimeLose", second);
                    }
                }
            }
            request.setAttribute("txtCheckForm", txtCheckForm);
            request.getRequestDispatcher("view/Body.jsp?form=Take_Quiz").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
            request.getRequestDispatcher("view/Body.jsp?form=Error").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
