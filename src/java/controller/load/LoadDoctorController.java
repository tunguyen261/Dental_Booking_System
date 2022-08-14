/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.load;

import doctors.DoctorDAO;
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
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author quang
 */
public class LoadDoctorController extends HttpServlet {

    private static final String ERROR = "home.jsp";
    private static final String SUCCESS = "doctors.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            DoctorDAO doctorDao = new DoctorDAO();
            PatientDAO patientDao = new PatientDAO();
            ServiceTypeDAO serviceTypeDao = new ServiceTypeDAO();
            ServiceDAO serviceDao = new ServiceDAO();
            HttpSession session = request.getSession();

            String loginDefault = "";
            patients.PatientDTO loginPatient = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
            ArrayList listLogin = new ArrayList();
            listLogin.add(loginPatient);
            
            if (loginPatient == null) {
                loginDefault = "LoginDefault";
            }

            List<DoctorDTO> listDoctor = doctorDao.getAllListDoctor();
            List<PatientDTO> listPatient = patientDao.getAllListPatient();
            List<ServiceTypeDTO> listServiceType = serviceTypeDao.getListServiceType();
            List<ServiceDTO> listService = serviceDao.getAllListService();

            int countPatient = 0;
            for (PatientDTO patient : listPatient) {
                countPatient++;
            }

            int countService = 0;
            for (ServiceDTO service : listService) {
                countService++;
            }
            if(listLogin.get(0)!=null){
            if (listDoctor.size() > 0) {
                session.setAttribute("LOGIN_USER", listLogin);
                request.setAttribute("LIST_DOCTOR", listDoctor);
                request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                request.setAttribute("COUNT_PATIENT", countPatient);
                request.setAttribute("COUNT_SERVICE", countService);
                url = SUCCESS;
            }}
            else {
                session.setAttribute("LOGIN_DEFAULT", loginDefault);
                request.setAttribute("LIST_DOCTOR", listDoctor);
                request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                request.setAttribute("COUNT_PATIENT", countPatient);
                request.setAttribute("COUNT_SERVICE", countService);
                url = SUCCESS;
            }
        } catch (Exception e) {
            url = ERROR;
            log("Error at Load Doctor Controller: " + e.toString());
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
