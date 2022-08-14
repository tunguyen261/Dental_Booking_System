/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.patient;

import bookingdetail.BookingDetailDAO;
import bookingdetail.BookingDetailDTO;
import doctors.DoctorDAO;
import doctors.DoctorDTO;
import feedbacks.FeedBackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import patients.PatientDTO;
import schedule.scheduleDAO;
import schedule.scheduleDTO;
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author Doan
 */
public class CreateFeedBackController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "home.jsp";
    private static final String TRUE = "ShowBookingPatientController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            BookingDetailDAO bkDetailDAO= new BookingDetailDAO();
            patients.PatientDTO loginPatient = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
            String currentDay= request.getParameter("currentDay");
            int rateStart = Integer.parseInt(request.getParameter("rate"));
            int serviceID= Integer.parseInt(request.getParameter("serviceID"));
            String content= request.getParameter("content");
            FeedBackDAO fbDao =new FeedBackDAO();
            boolean check=fbDao.createSchedule(serviceID, loginPatient.getPatientID(), currentDay, rateStart, content, 1);
            if(check){
                url=TRUE;
                request.setAttribute("CREATE_FB_SUCCES", "Đã đánh giá thành công");
            }
            
        } catch (Exception e) {
             log("Error at ShowDoctorSchedule");
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
