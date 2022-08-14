/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admins;

import doctors.DoctorDAO;
import doctors.DoctorDTO;
import feedbacks.FeedBackDAO;
import feedbacks.FeedbackDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Doan
 */
public class ShowFeedBackAdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    public static final String ERROR = "LoadAdminController";
    public static final String SUCCESS = "index_feedback.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            FeedBackDAO fbDao =new FeedBackDAO();
  
            ServiceDAO svDao = new ServiceDAO();
            HttpSession session = request.getSession();
            admins.AdminDTO loginAdmin = (admins.AdminDTO) session.getAttribute("LOGIN_ADMIN");
            ServiceTypeDAO svTypeDAO =new ServiceTypeDAO();
            List<ServiceTypeDTO> listServiceType = svTypeDAO.getListServiceType();
            List<FeedbackDTO> listFeedBack = fbDao.getListLatestFeedBack();
         
            List<ServiceDTO> listService= svDao.getAllListService();
            if (loginAdmin != null && "AD".equals(loginAdmin.getRoleID())) {
                if (listFeedBack != null) {
                    request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                    request.setAttribute("listFeedBack", listFeedBack);
       
                    request.setAttribute("listService", listService);
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at ShowServiceController: " + e.toString());
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
