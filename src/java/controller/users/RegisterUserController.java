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
 * @author ADMIN
 */
public class RegisterUserController extends HttpServlet {

    private static final String ERROR = "register.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
            String url = ERROR;
            PatientError patientError = new PatientError();
            try {
                String fullName = request.getParameter("fullName");               
                String password = request.getParameter("password");               
                String gmail = request.getParameter("gmail");              
                int phone = Integer.parseInt(request.getParameter("phone"));               
                String address = request.getParameter("address");               
                String gender = request.getParameter("gender");              
                int status = 1;
                String roleID = request.getParameter("roleID");
                String confirm = request.getParameter("confirmpassword");
                
                boolean checkValidation = true;

                if (fullName.length() < 5 || fullName.length() > 40) {
                    patientError.setFullNameError("Họ và tên phải trên 5 kí tự");
                    checkValidation = false;
                }
                if (gmail.trim().length() == 0) {
                    patientError.setGmailError("Không thể để trống Email");
                    checkValidation = false;
                }
                if (!password.equals(confirm)) {
                    patientError.setConfirmError("Hai mật khẩu không giống nhau");
                    checkValidation = false;
                }
                
                if (password.length() < 5 || password.length() > 40) {
                    patientError.setPasswordError("Mật khẩu phải từ 5 đến 20 kí tự");
                    checkValidation = false;
                }
                
                
                PatientDAO dao = new PatientDAO();
                PatientDTO patient = new PatientDTO(1, fullName, password, "PA", gmail, phone, address, gender, status);
                if (checkValidation) {
                    boolean check = dao.registerUser(patient);
                    if (check) {
                        request.setAttribute("SUCCESS", "Tạo tài khoản thành công!");
                        url=SUCCESS;
                    }
                } else {
                    request.setAttribute("PATIENT_ERROR", patientError);
                }

            } catch (Exception e) {
                log("Error at RegisterController:" + e.toString());
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
