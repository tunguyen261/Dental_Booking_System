/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admins;

import admins.AdminDAO;
import admins.AdminDTO;
import admins.AdminError;
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
public class AddAdminController extends HttpServlet {

    public static final String ERROR = "LoadAdminController";
    public static final String SUCCESS = "LoadAdminController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        AdminError adminError = new AdminError();
        try {
            String fullName = request.getParameter("fullName");
            String gmail = request.getParameter("gmail");
            String password=request.getParameter("password");
            String roleID="AD";
//            check validation here: checkId, name, role , pass,...password
            boolean check = true;
            if (gmail.trim().length() == 0) {
                adminError.setGmailError("Không thể để trống Email");
                check = false;
            }
            AdminDAO dao = new AdminDAO();
            AdminDTO admin = new AdminDTO(1, fullName, password, gmail, roleID);
            
            if (check) {
                boolean checkUpdate = dao.createAdmin(admin);
                if (checkUpdate) {
                    url = SUCCESS;
                    request.setAttribute("SSMSG", "Chỉnh sữa thành công !");
                }
            } else {
                request.setAttribute("SSMSG", "Chỉnh sữa thất bại !");
            }
        } catch (Exception e) {
            log("Error at Update Doctor Controller");
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
