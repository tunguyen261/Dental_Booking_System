package controller.admins;

import admins.AdminDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;
import services.ServiceDAO;
import services.ServiceDTO;

@WebServlet(name = "ShowServiceController", urlPatterns = {"/ShowService"})
public class ShowServiceController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String ADMIN = "admin_Service.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {

            HttpSession session = request.getSession();
            
                ServiceDAO serviceDao = new ServiceDAO();
                ServiceTypeDAO ServiceTypeDAO = new ServiceTypeDAO();
                List<ServiceDTO> listService = serviceDao.getAllListService();
                List<ServiceTypeDTO> listServiceType = ServiceTypeDAO.getListServiceType();

                AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");

                if (loginAdmin != null && "AD".equals(loginAdmin.getRoleID())) {
                    if (listService != null) {
                        session.setAttribute("LIST_SERVICE", listService);
                        session.setAttribute("LIST_SERVICE_TYPE", listServiceType);
                        url = ADMIN;
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ShowServiceController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ShowServiceController.class.getName()).log(Level.SEVERE, null, ex);
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
