/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admins;

import admins.AdminDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;
import services.ServiceDAO;
import services.ServiceDTO;
import services.ServiceError;

/**
 *
 * @author quang
 */
public class AddServiceController extends HttpServlet {

    public static final String ERROR = "index_admin.jsp";
    public static final String SUCCESS = "LoadServiceController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ServiceError serviceError = new ServiceError();
        try {
            int serviceTypeID = Integer.parseInt(request.getParameter("serviceTypeID"));
            String serviceTypeName= request.getParameter("serviceTypeName");
            String serviceName = request.getParameter("serviceName");
            String description = request.getParameter("description");

            HttpSession session = request.getSession();
            AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");
            int adminID=loginAdmin.getAdminID();
            int status = 1;
            int servicePrice = Integer.parseInt(request.getParameter("servicePrice"));
//            check validation here: checkId, name, role , pass,...password
            boolean check = true;      
            if (servicePrice < 0) {
                serviceError.setServicePriceError("Giá tiền không âm");
                check = false;
            }
            ServiceDAO dao = new ServiceDAO();
            ServiceTypeDAO svDao = new ServiceTypeDAO();
            List<ServiceTypeDTO> listSV = svDao.getListServiceType();
            ServiceDTO service = new ServiceDTO(serviceTypeID,serviceName,servicePrice,description,adminID,1);

            if (check) {
                boolean checkUpdate = dao.createService(service);
                url = SUCCESS;
                request.setAttribute("serviceTypeID", serviceTypeID);
                request.setAttribute("serviceTypeName", serviceTypeName);
                request.setAttribute("SSMSG", "Chỉnh sữa thành công !");
            } else {
                request.setAttribute("SSMSG", "Chỉnh sữa thất bại !");
            }
        } catch (Exception e) {
            log("Error at Update Doctor Controller");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddServiceController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddServiceController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
