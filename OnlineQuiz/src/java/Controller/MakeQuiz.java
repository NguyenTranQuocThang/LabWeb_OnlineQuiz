/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.SqlStatement;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thang
 */
public class MakeQuiz extends HttpServlet {

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
        request.getRequestDispatcher("view/Body.jsp?form=Make_Quiz").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        try {
            // use set for save data when user type
            String question = request.getParameter("question");
            request.setAttribute("question", question);
            String option1 = request.getParameter("option1");
            request.setAttribute("option1", option1);
            String option2 = request.getParameter("option2");
            request.setAttribute("option2", option2);
            String option3 = request.getParameter("option3");
            request.setAttribute("option3", option3);
            String option4 = request.getParameter("option4");
            request.setAttribute("option4", option4);
            String answer1 = request.getParameter("answer1");
            request.setAttribute("answer1", answer1);
            String answer2 = request.getParameter("answer2");
            request.setAttribute("answer2", answer2);
            String answer3 = request.getParameter("answer3");
            request.setAttribute("answer3", answer3);
            String answer4 = request.getParameter("answer4");
            request.setAttribute("answer4", answer4);
            String textSend = "";
            // check user don't type question
            if (question.equals("")) {
                textSend = "Question can't be null";
            } else if (option1.equals("")) {  // check user don't type option1
                textSend = "Option1 can't be null";
            } else if (option2.equals("")) { // check user don't type option2
                textSend = "Option2 can't be null";
            } else if (option3.equals("")) { //check user don't type option3
                textSend = "Option3 can't be null";
            } else if (option4.equals("")) { // check user don't type option4
                textSend = "Option4 can't be null";
                // check all answers aren't selected
            } else if (answer1 == null && answer2 == null && answer3 == null && answer4 == null) {
                textSend = "There is at least one correct answer";
                //check all answers aren't selected
            } else if (answer1 != null && answer2 != null && answer3 != null && answer4 != null) {
                textSend = "Not selected at all Answer";
            } else {
                SqlStatement ss = new SqlStatement();
//                if (ss.checkQuestion(question.trim()) != 0) {
//                    textSend ="Question have been exits";
//                }else{

                    // check if answer is not check => don't add answer
                    // answer = sum of answer from 1 to 4 if check add or not check => not add
                    String answer = "";
                    if(answer1 != null){
                        answer += answer1;
                    }
                    if(answer2 != null){
                        answer += answer2;
                    }
                    if(answer3 != null){
                        answer += answer3;
                    }
                    if(answer4 != null){
                        answer += answer4;
                    }
                    ss.AddQuestion(question.trim(), option1, option2, option3, option4, answer);
                    textSend = "Add Question Success!";
                //}
            }

            request.setAttribute("textSend", textSend);
            processRequest(request, response);
        } catch (Exception ex) {
            request.getRequestDispatcher("view/Body.jsp?form=Error").forward(request, response);
        }
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
