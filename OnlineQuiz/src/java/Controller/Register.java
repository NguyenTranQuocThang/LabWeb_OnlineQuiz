/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.SqlStatement;
import Model.User;
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
public class Register extends HttpServlet {

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
        request.getRequestDispatcher("view/Body.jsp?form=Register_Form").forward(request, response);
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
        try {
            String testRegister = "";
            String usernameRegister = request.getParameter("usernameRegister");
            request.setAttribute("usernameRegister", usernameRegister);
            String passwordRegister = request.getParameter("passwordRegister");
            request.setAttribute("passwordRegister", passwordRegister);
            String typeUserRegister = request.getParameter("typeUserRegister");
            request.setAttribute("typeUserRegister", typeUserRegister);
            String emailRegister = request.getParameter("emailRegister");
            request.setAttribute("emailRegister", emailRegister);
            //check user don't type  username Register 
            if (usernameRegister.equals("")) {
                testRegister = "username can't be null";
            } else if (passwordRegister.equals("")) { //check user don't type password
                testRegister = "password can't be null";
            } else if (emailRegister.equals("")) { //check user don't type email
                testRegister = "email can't be null";
                //check format email user type
            } else if (!emailRegister.matches("^[a-z0-9_\\.]+@[a-z0-9]+(\\.[a-z0-9]+)+$")) {
                testRegister = "email must like abc@gmail.com";
            } else {
                SqlStatement ss = new SqlStatement();
                     // check user exits in database
                ArrayList<User> userList = ss.getListUser();
                for (User user : userList) {
                    if (user.getUserName().equals(usernameRegister)) {
                        testRegister = "User have been exit";
                    }
                }
                // check if user not in database => create account
                if (!testRegister.equals("User have been exit")) {
                    ss.Register(usernameRegister, passwordRegister, typeUserRegister, emailRegister);
                    testRegister = "Register successfully";
                }
            }
            request.setAttribute("textRegister", testRegister);
            processRequest(request, response);
        } catch (Exception e) {
            System.out.println(e);
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
