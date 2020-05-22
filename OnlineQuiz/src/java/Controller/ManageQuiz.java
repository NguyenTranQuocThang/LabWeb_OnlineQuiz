/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.SqlStatement;
import Model.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thang
 */
public class ManageQuiz extends HttpServlet {

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
            SqlStatement ss = new SqlStatement();
            String textManage = null;

            // number question in 1 page
            int pagesize = 3;
            String pageNumber = request.getParameter("page");

            int countQuestion = ss.countQuestion();
            //check if database don't have question
            if (countQuestion == 0) {
                textManage = "Don't have any question";
            }
            int pagecount = (countQuestion % pagesize == 0) ? countQuestion / pagesize : (countQuestion / pagesize) + 1;
            request.setAttribute("pageCount", pagecount);
            //check remove or not
            String textRemove = request.getParameter("textRemove");
            request.setAttribute("textRemove", textRemove);
            try {
                if (pageNumber == null) {
                    pageNumber = "1";
                }
                // pageindex is page now
                int pageindex = Integer.parseInt(pageNumber);
                // check when remove and user stay at the end page
                if (textRemove == null) {
                    // check pageindex type > number of page
                    if (pageindex > pagecount) {
                        textManage = "page not found";
                    }
                }
                ArrayList<Quiz> quizList = ss.getQuestionToManage(pageindex, pagesize);
                if(quizList.size() == 0){
                    pageindex = pagecount;
                    quizList = ss.getQuestionToManage(pageindex, pagesize);
                }
                request.setAttribute("quizList", quizList);
                request.setAttribute("pageIndex", pageindex);
            } catch (Exception e) {
                textManage = "page not found";
            }
            request.setAttribute("textManage", textManage);

            request.getRequestDispatcher("view/Body.jsp?form=Manage_Quiz").forward(request, response);
        } catch (Exception e) {
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
