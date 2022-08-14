package controller.main;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author quang
 */
public class MainController extends HttpServlet {

    private static final String DEFAULT = "login.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_ADMIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String UPDATE_SERVICE = "UpdateService";
    private static final String UPDATE_SERVICE_CONTROLLER = "UpdateServiceController";
    private static final String LOAD = "Load";
    private static final String LOAD_CONTROLLER = "LoadController";
    // Sua lai cho nay
    private static final String SHOW_SERVICE = "UpdateService";
    private static final String SHOW_SERVICE_CONTROLLER = "UpdateServiceController";
    private static final String REGISTER = "Register";
    private static final String REGISTER_USER_CONTROLLER = "RegisterUserController";
    private static final String UPDATE_DISCOUNT = "Update Discount";
    private static final String UPDATE_DISCOUNT_CONTROLLER = "UpdateDiscountController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = DEFAULT;

        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_ADMIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SHOW_SERVICE.equals(action)) {
                url = SHOW_SERVICE_CONTROLLER;
            } else if (UPDATE_SERVICE.equals(action)) {
                url = UPDATE_SERVICE_CONTROLLER;
            } else if (UPDATE_DISCOUNT.equals(action)) {
                url = UPDATE_DISCOUNT_CONTROLLER;
            } else if (LOAD.equals(action)) {
                url = LOAD_CONTROLLER;
            } else if (REGISTER.equals(action)) {
                url = REGISTER_USER_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
