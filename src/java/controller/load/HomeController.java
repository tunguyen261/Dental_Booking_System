/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.load;

import admins.AdminDTO;
import discounts.DiscountDAO;
import discounts.DiscountDTO;
import doctors.DoctorDAO;
import doctors.DoctorDTO;
import feedbacks.FeedBackDAO;
import feedbacks.FeedbackDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import patients.PatientDAO;
import patients.PatientDTO;
import schedule.scheduleDAO;
import schedule.scheduleDTO;
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
public class HomeController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static String USER = "home.jsp";
    private static String DOCTOR = "home.jsp";
    private static String ADMIN = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String url = USER;
            try {
                ServiceDAO serviceDao = new ServiceDAO();
                FeedBackDAO servicefeedbackDao = new FeedBackDAO();
                ServiceImageDAO serviceImageDao = new ServiceImageDAO();
                ServiceTypeDAO serviceTypeDao = new ServiceTypeDAO();
                PatientDAO patientDao = new PatientDAO();
                scheduleDAO scheduleDao = new scheduleDAO();
                DiscountDAO discountDao = new DiscountDAO();

                List<ServiceDTO> listService = (List<ServiceDTO>) serviceDao.getAllListService();
                List<FeedbackDTO> listServiceFeedback = (List<FeedbackDTO>) servicefeedbackDao.getListFeedBackService();
                List<ServiceImageDTO> listServiceImage = (List<ServiceImageDTO>) serviceImageDao.getAllListServiceImage();
                List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) serviceTypeDao.getListServiceType();
                List<PatientDTO> listPatient = (List<PatientDTO>) patientDao.getAllListPatient();
                List<scheduleDTO> listSchedule = (List<scheduleDTO>) scheduleDao.getAllListSchedule();
                List<DiscountDTO> listDiscount = (List<DiscountDTO>) discountDao.getListDiscountService();

                DoctorDAO doctorDAO = new DoctorDAO();
                List<DoctorDTO> listDoctor = doctorDAO.getAllListDoctor();

                HttpSession session = request.getSession();

                String loginDefault="";
                patients.PatientDTO loginPatient = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
                doctors.DoctorDTO loginDoctor = (DoctorDTO) session.getAttribute("LOGIN DOCTOR");
                admins.AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");
                ArrayList listLogin = new ArrayList();
                listLogin.add(loginPatient);
                listLogin.add(loginDoctor);
                listLogin.add(loginAdmin);
                
                if(loginPatient == null && loginDoctor==null &&loginAdmin== null){
                    loginDefault="LoginDefault";
                }
                int countPatient = 0;
                for (PatientDTO patient : listPatient) {
                    countPatient++;
                }

                int countService = 0;
                for (ServiceDTO service : listService) {
                    countService++;
                }

//                tra ve trang home
                if (listLogin.get(0)!=null) {
                    if (listService != null) {
                        session.setAttribute("LOGIN_USER", listLogin);
                        request.setAttribute("LIST_SERVICE", listService);
                        request.setAttribute("LIST_SERVICE_FEEDBACK", listServiceFeedback);
                        request.setAttribute("LIST_SERVICE_IMAGE", listServiceImage);
                        request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                        request.setAttribute("LIST_DOCTOR", listDoctor);
                        request.setAttribute("LIST_SCHEDULE_DOCTOR", listSchedule);
                        request.setAttribute("LIST_DISCOUNT", listDiscount);

                        request.setAttribute("COUNT_PATIENT", countPatient);
                        request.setAttribute("COUNT_SERVICE", countService);
                        url = USER;
                    }
                } else if (listLogin.get(1)!=null) {
                    if (listService != null) {
                        session.setAttribute("LOGIN_USER", listLogin);
                        request.setAttribute("LIST_SERVICE", listService);
                        request.setAttribute("LIST_SERVICE_FEEDBACK", listServiceFeedback);
                        request.setAttribute("LIST_SERVICE_IMAGE", listServiceImage);
                        request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                        request.setAttribute("LIST_DOCTOR", listDoctor);
                        request.setAttribute("LIST_SCHEDULE_DOCTOR", listSchedule);
                        request.setAttribute("LIST_DISCOUNT", listDiscount);

                        request.setAttribute("COUNT_PATIENT", countPatient);
                        request.setAttribute("COUNT_SERVICE", countService);

                        url = DOCTOR;
                    }
                } else if (listLogin.get(2)!=null) {
                    if (listService != null) {
                        session.setAttribute("LOGIN_USER", listLogin);
                        request.setAttribute("LIST_SERVICE", loginDefault);
                        request.setAttribute("LIST_SERVICE_FEEDBACK", listServiceFeedback);
                        request.setAttribute("LIST_SERVICE_IMAGE", listServiceImage);
                        request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                        request.setAttribute("LIST_DOCTOR", listDoctor);
                        request.setAttribute("LIST_SCHEDULE_DOCTOR", listSchedule);
                        request.setAttribute("LIST_DISCOUNT", listDiscount);

                        request.setAttribute("COUNT_PATIENT", countPatient);
                        request.setAttribute("COUNT_SERVICE", countService);
                        url = ADMIN;
                    }
                }
                else{
                    if (listService != null) {
                        session.setAttribute("LOGIN_DEFAULT", loginDefault);
                        request.setAttribute("LIST_SERVICE", listService);
                        request.setAttribute("LIST_SERVICE_FEEDBACK", listServiceFeedback);
                        request.setAttribute("LIST_SERVICE_IMAGE", listServiceImage);
                        request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                        request.setAttribute("LIST_DOCTOR", listDoctor);
                        request.setAttribute("LIST_SCHEDULE_DOCTOR", listSchedule);
                        request.setAttribute("LIST_DISCOUNT", listDiscount);

                        request.setAttribute("COUNT_PATIENT", countPatient);
                        request.setAttribute("COUNT_SERVICE", countService);
                        url = USER;
                    }
                }
            } catch (Exception e) {
                url = ERROR;
                log("Error at HomeController: " + e.toString());
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
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
