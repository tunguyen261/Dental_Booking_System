/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.booking;

import bookingdetail.BookingDetailDAO;
import bookingdetail.BookingDetailDTO;
import discounts.DiscountDAO;
import discounts.DiscountDTO;
import doctors.DoctorDAO;
import doctors.DoctorDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import schedule.scheduleDAO;
import schedule.scheduleDTO;
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author Doan
 */
public class HandleServiceDoctorController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private static final String ERROR = "newBooking.jsp";
    private static final String TRUE = "newBooking.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String url=ERROR;
        try {

            int doctorID=Integer.parseInt(request.getParameter("doctorID"));
            int svID= Integer.parseInt(request.getParameter("svID"));
            DoctorDAO drDao= new DoctorDAO();
            DoctorDTO doctor=drDao.getDoctorByID(doctorID);
            ServiceDAO svDao= new ServiceDAO();
            ServiceDTO service=svDao.getServiceById(svID);
            BookingDetailDAO bookingDetailDAO =new BookingDetailDAO();
            DiscountDAO dsDao = new DiscountDAO();
            DiscountDTO discount =dsDao.getDiscountByServiceID(svID);
            List<BookingDetailDTO> listBookingDetail=bookingDetailDAO.getBookingDetailByDoctorID(doctorID);
            scheduleDAO scheduleDao= new scheduleDAO();
            List<scheduleDTO> listScheduleDTO=scheduleDao.getScheduleByDoctorID(doctorID);
            List<scheduleDTO> bookedList= new ArrayList<>();
            bookedList =scheduleDao.getBookedScheduleByDoctorID(doctorID);
            HttpSession session = request.getSession();
             request.setAttribute("doctorBk", doctor);
            request.setAttribute("serviceBk", service);
            request.setAttribute("listBookingDetail", bookedList);
            request.setAttribute("discount", discount);
            request.setAttribute("listScheduleDTO",listScheduleDTO);
            url=TRUE;
        } catch (Exception e) {
              log("Error at HandleServiceDoctorController: " + e.toString());
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
