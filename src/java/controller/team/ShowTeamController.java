/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.team;

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
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;

/**
 *
 * @author quang
 */
public class ShowTeamController extends HttpServlet {

    private static final String ERROR = "HomeController";
    private static final String SUCCESS = "team.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            ServiceTypeDAO serviceTypeDao = new ServiceTypeDAO();
            HttpSession session = request.getSession();

            String loginDefault = "";
            patients.PatientDTO loginPatient = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
            ArrayList listLogin = new ArrayList();
            listLogin.add(loginPatient);
            
            if (loginPatient == null) {
                loginDefault = "LoginDefault";
            }
            List<ServiceTypeDTO> listServiceType = serviceTypeDao.getListServiceType();


            if(listLogin.get(0)!=null){
                session.setAttribute("LOGIN_USER", listLogin);
                request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                url = SUCCESS;
            }
            else {
                session.setAttribute("LOGIN_DEFAULT", loginDefault);
                request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                url = SUCCESS;
            }
        } catch (Exception e) {
            url = ERROR;
            log("Error at Load Doctor Controller: " + e.toString());
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
