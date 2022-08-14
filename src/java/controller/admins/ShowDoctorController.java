package controller.admins;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import doctors.DoctorDAO;
import doctors.DoctorDTO;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;

@WebServlet(name= "ShowDoctorController", urlPatterns = {"/ShowDoctorController"})
public class ShowDoctorController extends HttpServlet {

    private static final String ERROR ="index_admin.jsp";
    private static final String ADMIN = "index_doctor.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            DoctorDAO doctorDAO = new DoctorDAO();
            List<DoctorDTO> listDoctor = doctorDAO.getAllListDoctor();
            HttpSession session = request.getSession();
            admins.AdminDTO loginAdmin = (admins.AdminDTO) session.getAttribute("LOGIN_ADMIN");
            ServiceTypeDAO svTypeDAO =new ServiceTypeDAO();
            List<ServiceTypeDTO> listServiceType = svTypeDAO.getListServiceType();
            if (loginAdmin != null && "AD".equals(loginAdmin.getRoleID())) {
                if (listDoctor != null) {
                    request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                    request.setAttribute("LIST_DOCTOR", listDoctor);
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
            Logger.getLogger(controller.admins.ShowServiceController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(controller.admins.ShowServiceController.class.getName()).log(Level.SEVERE, null, ex);
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
