/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admins;

import admins.AdminDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.ServiceDAO;
import services.ServiceDTO;
import services.ServiceError;

public class UpdateServiceController extends HttpServlet {

    public static final String ERROR = "error.jsp";
    public static final String SUCCESS = "DetailServiceAdminController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ServiceError serviceError = new ServiceError();
        try {
            HttpSession session = request.getSession();
            AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");
            int serviceID = Integer.parseInt(request.getParameter("serviceID"));
            String serviceName =request.getParameter("serviceName");
            int servicePrice =Integer.parseInt(request.getParameter("servicePrice"));
            String description = request.getParameter("description");
            int status= Integer.parseInt(request.getParameter("status"));
            int serviceTypeID = Integer.parseInt(request.getParameter("serviceTypeID"));
            int adminID = loginAdmin.getAdminID();
            
//            check validation here: checkId, name, role , pass,...password
            boolean check = true;
            if (serviceName.equals("")) {
                serviceError.setServiceNameError("Tên Không được để trống");
                check = false;
            }
           
            
            if (servicePrice < 0) {
                serviceError.setServicePriceError("Giá tiền không âm");
                check = false;
            }
            
            ServiceDAO dao = new ServiceDAO();
            ServiceDTO service = new ServiceDTO(serviceID, serviceTypeID, serviceName, servicePrice, description, adminID, status);
                if(check) {
                boolean checkUpdate = dao.updateService(service);
                if(checkUpdate) {
                    url = SUCCESS;
                    request.setAttribute("serviceID", serviceID);
                    request.setAttribute( "SSMSG","Chỉnh sữa thành công !");
                }
            } else {
                request.setAttribute("ERROR_UPDATE", dao);
            }
        } catch (Exception e) {
            url = ERROR;
            log("Error at Update Service Controller");
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
