/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.auth;

import com.br.connection.ConnectDB2;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Wattana
 */
public class Login extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);
        String strCono = new String("cono");
        String strDivi = new String("divi");
        String strFac = new String("fac");
        String strUser = new String("user");
        String strPass = new String("pass");
        String strComp = new String("comp");

        if ("".equals(request.getParameter("username"))) {
            request.setAttribute("msg", "Username is Require.");
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        } else if ("".equals(request.getParameter("password"))) {
            request.setAttribute("msg", "Password is Require.");
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        } else if ("".equals(request.getParameter("company"))) {
            request.setAttribute("msg", "Company is Require.");
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        } else {

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fac = request.getParameter("vFac");
            String[] getCompany = request.getParameter("company").split(" : ");
            String cono = getCompany[0];
            String divi = getCompany[1];
            String comp = getCompany[2];

//        System.out.println("Company : " + request.getParameter("company"));
            Connection conn = null;
            try {

                conn = ConnectDB2.LoginDB(username, password);
                System.out.println("User : " + username + "\n" + "Pass : " + password);
                if (conn != null) {
                    session.setAttribute(strCono, cono);
                    session.setAttribute(strDivi, divi);
                    session.setAttribute(strFac, fac);

                    session.setAttribute(strUser, username.toUpperCase());
                    session.setAttribute(strPass, password);
                    session.setAttribute(strComp, comp);
//                    Utility.ConnectM3(cono, divi);
                    response.sendRedirect("./");

                }

            } catch (Exception ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("msg", ex);
                getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
            }
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
