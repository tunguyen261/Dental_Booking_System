/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.main;

import admins.AdminDAO;
import admins.AdminDTO;
import doctors.DoctorDAO;
import doctors.DoctorDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import patients.PatientDAO;
import patients.PatientDTO;

public class LoginController extends HttpServlet {
    private static final String ERROR="login.jsp";
    private static final String AD="AD";
    private static final String ADMIN_PAGE="LoadAdminController";
    private static final String PA="PA";
    private static final String PATIENT_PAGE = "HomeController";
    private static final String DR="DR";
    private static final String DOCTOR_PAGE = "ShowDoctorSchedule";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String gmail = request.getParameter("gmail");
            String password = request.getParameter("password");
            AdminDAO adminDao = new AdminDAO();
            AdminDTO loginAdmin = adminDao.checkLogin(gmail, password);
            if (loginAdmin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_ADMIN", loginAdmin);
                String roleID = loginAdmin.getRoleID();
                if (AD.equals(roleID)) {
                    url = ADMIN_PAGE;
                }else {
                    request.setAttribute("ERROR", "Your role is not support !");
                }
            } else {
                request.setAttribute("ERROR", "Incorrect gmail or password.");
            }
            
            DoctorDAO doctorDao = new DoctorDAO();
            DoctorDTO loginDoctor = doctorDao.checkLogin(gmail, password);
            if (loginDoctor != null) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_DOCTOR", loginDoctor);
                String roleID = loginDoctor.getRoleID();
                if (DR.equals(roleID)) {
                    url = DOCTOR_PAGE;
                }else {
                    request.setAttribute("ERROR", "Your role is not support !");
                }
            } else {
                request.setAttribute("ERROR", "Incorrect gmail or password.");
            }
            PatientDAO patientDao = new PatientDAO();
            PatientDTO loginPatient = patientDao.checkLogin(gmail, password);
            if (loginPatient != null) {
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_PATIENT", loginPatient);
                String roleID = loginPatient.getRoleID();
                if (PA.equals(roleID)) {
                    url = PATIENT_PAGE;
                }else {
                    request.setAttribute("ERROR", "Your role is not support !");
                }
            } else {
                request.setAttribute("ERROR", "Incorrect gmail or password.");
            }
        } catch (Exception e) {
            log("Error at LoginController: " + e);
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
