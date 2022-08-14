/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.load;

import discounts.DiscountDAO;
import discounts.DiscountDTO;
import feedbacks.FeedBackDAO;
import feedbacks.FeedbackDTO;
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
import serviceImage.ServiceImageDAO;
import serviceImage.ServiceImageDTO;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author quang
 */
public class LoadServiceDetailController extends HttpServlet {

    private static final String ERROR = "LoadController";
    private static final String SUCCESS = "service_detail.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String loginDefault = "";
            patients.PatientDTO loginPatient = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
            ArrayList listLogin = new ArrayList();
            listLogin.add(loginPatient);

            if (loginPatient == null) {
                loginDefault = "LoginDefault";
            }

            ServiceImageDAO serviceImageDao = new ServiceImageDAO();
            ServiceDAO serviceDao = new ServiceDAO();
            ServiceTypeDAO serviceTypeDao = new ServiceTypeDAO();
            FeedBackDAO feedbackDao = new FeedBackDAO();
            DiscountDAO discountDao = new DiscountDAO();

            List<ServiceTypeDTO> listServiceType = serviceTypeDao.getListServiceType();

            int serviceID = Integer.parseInt(request.getParameter("serviceID"));

            ServiceDTO service = serviceDao.getServiceById(serviceID);
            List<FeedbackDTO> feedbackService = feedbackDao.getFeedbackByServiceID(serviceID);
            List<ServiceImageDTO> serviceImage = serviceImageDao.getImageByServiceID(serviceID);
            DiscountDTO discount = discountDao.getDiscountByServiceID(serviceID);

            int discountOfService = service.getServicePrice() * discount.getPercentDiscount() / 100;
            if (listLogin.get(0) != null) {
                if (service != null) {
                    session.setAttribute("LOGIN_USER", listLogin);
                    request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                    request.setAttribute("SERVICE_DETAIL_BY_ID", service);
                    request.setAttribute("SERVICE_FEEDBACK_BY_ID", feedbackService);
                    request.setAttribute("SERVICE_IMAGE_BY_ID", serviceImage);
                    request.setAttribute("DISCOUNT_BY_ID", discount);

                    request.setAttribute("DISCOUNT_OF_SERVICE", discountOfService);
                    url = SUCCESS;
                }
            } else {
                if (service != null) {
                    session.setAttribute("LOGIN_DEFAULT", loginDefault);
                    request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                    request.setAttribute("SERVICE_DETAIL_BY_ID", service);
                    request.setAttribute("SERVICE_FEEDBACK_BY_ID", feedbackService);
                    request.setAttribute("SERVICE_IMAGE_BY_ID", serviceImage);
                    request.setAttribute("DISCOUNT_BY_ID", discount);

                    request.setAttribute("DISCOUNT_OF_SERVICE", discountOfService);
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            url = ERROR;
            log("Error at Load Service Detail Controller");
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
