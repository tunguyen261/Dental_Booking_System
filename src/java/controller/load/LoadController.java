/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.load;

import admins.AdminDTO;
import doctors.DoctorDTO;
import feedbacks.FeedBackDAO;
import feedbacks.FeedbackDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import patients.PatientDTO;
import serviceImage.ServiceImageDAO;
import serviceImage.ServiceImageDTO;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author nguye
 */
@WebServlet(name = "LoadController", urlPatterns = {"/LoadController"})
public class LoadController extends HttpServlet {

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
    private static final String SUCCESS = "service.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            //load vao trang cua service
            ServiceDAO serviceDao = new ServiceDAO();
            List<ServiceDTO> listService = serviceDao.getAllListService();
            FeedBackDAO feedbackDao = new FeedBackDAO();
            List<FeedbackDTO> listFeedback = feedbackDao.getListFeedBackService();
//            List<ServiceDTO> listServiceFeedback = serviceDao.getListFeedBackService();
            ServiceImageDAO serviceImageDao = new ServiceImageDAO();
            List<ServiceImageDTO> listServiceImage = serviceImageDao.getAllListServiceImage();

            HttpSession session = request.getSession();
            String loginDefault = "";
            patients.PatientDTO loginPatient = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
            ArrayList listLogin = new ArrayList();
            listLogin.add(loginPatient);

            if (loginPatient == null) {
                loginDefault = "LoginDefault";
            }

            ServiceTypeDAO serviceTypeDao = new ServiceTypeDAO();
            List<ServiceTypeDTO> listServiceType = serviceTypeDao.getListServiceType();
            if (listLogin.get(0) != null) {
                if (listService.size() > 0) {
                    session.setAttribute("LOGIN_USER", listLogin);
                    request.setAttribute("LIST_SERVICE", listService);
//                    request.setAttribute("LIST_SERVICE_FEEDBACK", listServiceFeedback);
                    request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                    request.setAttribute("LIST_FEEDBACK", listFeedback);
                    request.setAttribute("LIST_SERVICE_IMAGE", listServiceImage);
                    url = SUCCESS;
                }
            } else {
                session.setAttribute("LOGIN_DEFAULT", loginDefault);
                request.setAttribute("LIST_SERVICE", listService);
//                    request.setAttribute("LIST_SERVICE_FEEDBACK", listServiceFeedback);
                request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                request.setAttribute("LIST_FEEDBACK", listFeedback);
                request.setAttribute("LIST_SERVICE_IMAGE", listServiceImage);
                url = SUCCESS;
            }
        } catch (Exception e) {
            url = ERROR;
            log("Error at Load Controller: " + e.toString());
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
