/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.booking;

import doctors.DoctorDAO;
import doctors.DoctorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import patients.PatientDTO;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;

/**
 *
 * @author Doan
 */
public class ShowBookingController extends HttpServlet {

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
    private static final String TRUE = "newBooking.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
             String url = ERROR;
              try {                   
                  String msg = (String) request.getAttribute("SUCCESS_ADD_BOOKING");
            HttpSession session = request.getSession();       
              ServiceTypeDAO ServiceTypeDAO = new ServiceTypeDAO();
               doctors.DoctorDAO doctorDAO =new DoctorDAO();  
                List<ServiceTypeDTO> listServiceType = ServiceTypeDAO.getListServiceType();
                List<DoctorDTO> listDoctor = doctorDAO.getAllListDoctor2();
                patients.PatientDTO login = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
                if (login != null && "PA".equals(login.getRoleID())) {                    
                        session.setAttribute("LIST_SERVICE_TYPE", listServiceType);
                         session.setAttribute("LIST_DOCTOR", listDoctor);
                         if(msg == null){
                             
                         }else{
                             request.setAttribute("SUCCESS_ADD_BOOKING", "Bạn đã đặt lịch thành công");
                         }
                        url = TRUE;             
              
            }
        } catch (Exception e) {
      log("Error at ShowBookingController: " + e.toString());
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
