/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admins;

import static controller.admins.UpdateDoctor_Admin.ERROR;
import static controller.admins.UpdateDoctor_Admin.SUCCESS;
import doctors.DoctorDAO;
import doctors.DoctorDTO;
import doctors.DoctorError;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;

/**
 *
 * @author Doan
 */
public class AddDoctorController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    public static final String ERROR = "home.jsp";
    public static final String SUCCESS = "ShowDoctorController";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        DoctorError doctorError = new DoctorError();
        try {
            String serviceTypeName = request.getParameter("serviceTypeName");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("gmail");
            int status = 1;
            String password=request.getParameter("password");
            String gender = request.getParameter("gender");
            int phone =Integer.parseInt(request.getParameter("phone"));
            String achievement=request.getParameter("achievement");
            String image="null";
//            check validation here: checkId, name, role , pass,...password
            boolean check = true;
            if (serviceTypeName.trim().length() == 0 || serviceTypeName.trim().length() > 50) {
                doctorError.setServiceTypeIDError("Tên loai dich vu phải từ [1,50]");
                check = false;
            }
            if (email.trim().length() == 0) {
                doctorError.setGmailError("Không thể để trống Email");
                check = false;
            }
            DoctorDAO dao = new DoctorDAO();
            ServiceTypeDAO svDao = new ServiceTypeDAO();
            List<ServiceTypeDTO> listSV = svDao.getListServiceType();
            int sothutu=0;
            for(ServiceTypeDTO svT:listSV){
                if(svT.getServiceTypeName()==serviceTypeName)
                    sothutu=svT.getServiceTypeID();
            }
            serviceTypeName=String.valueOf(sothutu);
            DoctorDTO doctor = new DoctorDTO(1, serviceTypeName, fullName, password, "DR", gender,email, phone,image, 1, achievement);
            
            if (check) {
                boolean checkUpdate = dao.createDoctor(doctor);
                if (checkUpdate) {
                    url = SUCCESS;
                    request.setAttribute("SSMSG", "Thêm bác sĩ thành công");
                }
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
