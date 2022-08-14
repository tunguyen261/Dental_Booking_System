/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admins;

import admins.AdminDTO;
import bookingdetail.BookingDetailDAO;
import doctors.DoctorDAO;
import doctors.DoctorDTO;
import feedbacks.FeedBackDAO;
import feedbacks.FeedbackDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
 * @author Doan
 */
public class LoadAdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "index_admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");

            ServiceTypeDAO serviceTypeDao = new ServiceTypeDAO();
            BookingDetailDAO bkDao = new BookingDetailDAO();
            List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) serviceTypeDao.getListServiceType();
            ServiceDAO serviceDao = new ServiceDAO();
            List<ServiceDTO> listService = serviceDao.getAllListService();

//// Lấy tháng bây giờ
            Date date = new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            int month = cal.get(Calendar.MONTH) + 1;
            int money = bkDao.getMoneyMonth(month);
            int numBooking = bkDao.getNumberBooking(month);

//            Lay danh sach so luong serviceType
            ArrayList listNumberServiceType = new ArrayList();
            ArrayList listServiceTypeByNumber = new ArrayList<>();
            for (ServiceTypeDTO serviceType : listServiceType) {
                int numberServiceType = bkDao.getNumberServiceType(serviceType.getServiceTypeID());
                listNumberServiceType.add(numberServiceType);
                listServiceTypeByNumber.add(serviceType.getServiceTypeName());
            }

//            Lay danh sach feedback moi nhat cua benh nhan
            FeedBackDAO feedbackDao = new FeedBackDAO();
            List<FeedbackDTO> listFeedback = feedbackDao.getListLatestFeedBack();

//            Lay danh sach doctor cho 3top book nhieu nhat
            DoctorDAO doctorDao = new DoctorDAO();
            List<DoctorDTO> AlllistDoctor = doctorDao.getAllListDoctor();
            int top1 = 0, top3 = 0, top2 = 0, top4 = 0;
            ArrayList List3TopWithID = doctorDao.getCountBookingOfDoctor();
            ArrayList <DoctorDTO> listDoctor=new ArrayList<>();
            ArrayList listNumberBookingDoctor=new ArrayList();
            for (DoctorDTO doctorDTO : AlllistDoctor) {
                for (int i = 0; i < List3TopWithID.size(); i++) {
                    if (i % 2 == 0) {
                        if (doctorDTO.getDoctorID() == (int)List3TopWithID.get(i)) {
                            listDoctor.add(doctorDTO);
                            listNumberBookingDoctor.add(List3TopWithID.get(i+1));
                        }
                    }
                }
            }
            int numFeedBack = bkDao.getNumberFB(month);

            ArrayList listMoneyInYear = new ArrayList();
            for (int i = 1; i <= 12; i++) {
                listMoneyInYear.add(bkDao.getMoneyMonth(i));
            }
            request.setAttribute("LIST_MONEY_IN_YEAR", listMoneyInYear);
            request.setAttribute("numFeedBack", numFeedBack);
            request.setAttribute("numBooking", numBooking);
            request.setAttribute("IncomeMonthly", money);
            request.setAttribute("LIST_SERVICE", listService);
            request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
            request.setAttribute(url, cal);
            request.setAttribute("LIST_NUMBER_SERVICE_TYPE", listNumberServiceType);
            request.setAttribute("LIST_SERVICE_TYPE_NAME_FOR_NUMBER", listServiceTypeByNumber);
            request.setAttribute("LIST_FEEDBACK", listFeedback);
            request.setAttribute("LIST_DOCTOR", listDoctor);
            request.setAttribute("LIST_NUMBER_BOOKING_DOCTOR", listNumberBookingDoctor);

            url = SUCCESS;

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
