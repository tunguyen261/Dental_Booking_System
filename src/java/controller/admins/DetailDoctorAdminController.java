/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admins;

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
import schedule.scheduleDAO;
import schedule.scheduleDTO;
import serviceImage.ServiceImageDAO;
import serviceImage.ServiceImageDTO;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author Doan
 */
public class DetailDoctorAdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "DB_Service.jsp";
    private static final String SUCCESS = "DB_DoctorDetail.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int doctorID = Integer.parseInt(request.getParameter("doctorID"));
            DoctorDAO drDao = new DoctorDAO();
            DoctorDTO doctor = drDao.getDoctorByID(doctorID);

            ServiceTypeDAO svTypeDAO =new ServiceTypeDAO();
            List<ServiceTypeDTO> listServiceType = svTypeDAO.getListServiceType();
            
            scheduleDAO scheDAO = new scheduleDAO();
            List<scheduleDTO> bookedList = new ArrayList<>();
            List<scheduleDTO> listScheduleDTO = scheDAO.getScheduleByDoctorID(doctorID);
            bookedList = scheDAO.getBookedScheduleByDoctorID(doctorID);
            request.setAttribute("DOCTOR_INFOR", doctor);
            request.setAttribute("listBookingDetail", bookedList);
            request.setAttribute("listScheduleDTO", listScheduleDTO);

            request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
            url = SUCCESS;
        } catch (Exception e) {
            url = ERROR;
            log("Error at ServiceController");
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
