/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.doctor;

import doctors.DoctorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import schedule.scheduleDAO;
import schedule.scheduleDTO;

/**
 *
 * @author Doan
 */
public class RegisterSlot extends HttpServlet {

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
    private static final String TRUE = "ShowDoctorSchedule";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String url = ERROR;
        try {
            HttpSession session = request.getSession();
            DoctorDTO loginDoctor = (DoctorDTO)session.getAttribute("LOGIN_DOCTOR");
            scheduleDAO scheDAO= new scheduleDAO();
            List<scheduleDTO> scheduleList = scheDAO.getScheduleByDoctorID(loginDoctor.getDoctorID());
            int doctorID=Integer.parseInt(request.getParameter("doctorID"));
            String dayOfWeek = request.getParameter("dayOfWeek");
            String day =request.getParameter("day");
            int slotID= Integer.parseInt(request.getParameter("slotID"));
            scheduleDTO newOne= new scheduleDTO(dayOfWeek,day,slotID,doctorID,1);
            if(!scheDAO.setOnSchedule(slotID, day, doctorID)){
                if(scheDAO.createSchedule(newOne)){
                    url=TRUE;
                       request.setAttribute("ADD_SLOT_SUCCES", "Đã đăng ký thành công");
                }
                url=TRUE;
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
