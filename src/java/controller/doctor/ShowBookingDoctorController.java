/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.doctor;

import bookingdetail.BookingDetailDAO;
import bookingdetail.BookingDetailDTO;
import doctors.DoctorDAO;
import doctors.DoctorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import patients.PatientDAO;
import patients.PatientDTO;
import schedule.scheduleDAO;
import schedule.scheduleDTO;
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author Doan
 */
public class ShowBookingDoctorController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "DoctorControll.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          String url = ERROR;
        try {
            BookingDetailDAO bkDAO =new BookingDetailDAO();
            scheduleDAO scheDAO =new scheduleDAO();
            DoctorDAO drDAO =new DoctorDAO();
            PatientDAO patientDAO=new PatientDAO();
            ServiceDAO svDAO=new ServiceDAO();
            List<BookingDetailDTO>listBooking=bkDAO.getAllBookingDetail1();
            List<scheduleDTO>listSchedule=scheDAO.getAllListScheduleBooked();
            List<DoctorDTO>listDoctor = drDAO.getAllListDoctor();
            List<PatientDTO>listPatient=patientDAO.getAllListPatient();
            List<ServiceDTO>listService=svDAO.getAllListService();
            request.setAttribute("listBooking", listBooking);
            request.setAttribute("listSchedule", listSchedule);
            request.setAttribute("listDoctor", listDoctor);
            request.setAttribute("listPatient", listPatient);
            request.setAttribute("listService", listService);
            url=SUCCESS;
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
