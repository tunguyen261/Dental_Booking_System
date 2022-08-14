/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.users;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import patients.PatientDAO;
import patients.PatientDTO;
import patients.PatientError;

/**
 *
 * @author quang
 */
public class UpdateProfilePatientController extends HttpServlet {

    public static final String ERROR = "ShowProfileAccountController";
    public static final String SUCCESS = "ShowProfileAccountController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        PatientError doctorError = new PatientError();
        try {
            int patientID = Integer.parseInt(request.getParameter("patientID"));
            String fullName = request.getParameter("fullName");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String roleID = "PA";
            String gmail = request.getParameter("gmail");
            int phone = Integer.parseInt(request.getParameter("phone"));
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            int status = 1;

            boolean check = true;
            if (gmail.trim().length() == 0) {
                doctorError.setGmailError("Không thể để trống Email");
                check = false;
            }
//          
            if (!confirmPassword.equals(password)) {
                doctorError.setConfirmPassword("Password không trùng nhau");
                check = false;
            } else {
                check = true;
            }

            PatientDAO dao = new PatientDAO();
            PatientDTO patient = new PatientDTO(patientID, fullName, password, roleID, gmail, phone, address, gender, status);
            if (check) {
                boolean checkUpdate = dao.updatePatientProfile(patient);
                if (checkUpdate) {
                    url = SUCCESS;
                    request.setAttribute("SSMSG", "Chỉnh sữa thành công !");
                }
                else{
                request.setAttribute("SSMSG", "Chỉnh sữa Thất bại !");
                url = ERROR;
            }
            } else {
                request.setAttribute("ERROR_UPDATE", dao);
            }
        } catch (Exception e) {
            log("Error at Update Service Controller");
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
