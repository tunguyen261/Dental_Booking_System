/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admins;

import static controller.admins.UpdateDoctor_Admin.ERROR;
import static controller.admins.UpdateDoctor_Admin.SUCCESS;
import doctors.DoctorDAO;
import doctors.DoctorDTO;
import doctors.DoctorError;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;

/**
 *
 * @author quang
 */
public class ShowProfileDoctorController extends HttpServlet {

    private static final String ERROR = "ShowDoctorSchedule";
    private static final String SUCCESS = "doctor_Account.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            DoctorDAO doctorDAO = new DoctorDAO();
            HttpSession session = request.getSession();
            DoctorDTO loginDoctor = (DoctorDTO)session.getAttribute("LOGIN_DOCTOR");
            DoctorDTO doctor = doctorDAO.getDoctorByID(loginDoctor.getDoctorID());
            ServiceTypeDAO svTypeDAO =new ServiceTypeDAO();
            List<ServiceTypeDTO> listServiceType = svTypeDAO.getListServiceType();
            if (loginDoctor != null && "DR".equals(loginDoctor.getRoleID())) {
                if (doctor != null) {
                    request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                    request.setAttribute("DOCTOR_PROFILE", doctor);
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at ShowServiceController: " + e.toString());
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
