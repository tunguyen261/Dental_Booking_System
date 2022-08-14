/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.users;

import admins.AdminDTO;
import doctors.DoctorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import patients.PatientDAO;
import patients.PatientDTO;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;

/**
 *
 * @author quang
 */
public class ShowProfileAccountController extends HttpServlet {

    private static final String ERROR = "HomeController";
    private static final String SUCCESS = "patient_Account.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            PatientDAO patientDao = new PatientDAO();
            HttpSession session = request.getSession();

            String loginDefault = "";
            patients.PatientDTO loginPatient = (PatientDTO) session.getAttribute("LOGIN_PATIENT");

            
            PatientDTO patient = patientDao.getPatientProfileByPatientID(loginPatient.getPatientID());
            ServiceTypeDAO svTypeDAO = new ServiceTypeDAO();
            List<ServiceTypeDTO> listServiceType = svTypeDAO.getListServiceType();
            if (loginPatient != null && "PA".equals(loginPatient.getRoleID())) {
                if (patient != null) {
                    request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                    request.setAttribute("PATIENT_PROFILE", patient);
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at ShowProfileAccountController: " + e.toString());
            url = ERROR;
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
