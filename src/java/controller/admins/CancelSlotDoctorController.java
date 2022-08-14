/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admins;

import bookingdetail.BookingDetailDAO;
import bookingdetail.BookingDetailDTO;
import doctors.DoctorDAO;
import doctors.DoctorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import schedule.scheduleDAO;
import schedule.scheduleDTO;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import patients.PatientDAO;
import patients.PatientDTO;

/**
 *
 * @author Doan
 */
public class CancelSlotDoctorController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static final String ERROR = "LoadAdminController";
    public static final String SUCCESS = "DetailDoctorAdminController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String day= request.getParameter("day");
            int slot = Integer.parseInt(request.getParameter("slot"));
            int doctorID= Integer.parseInt(request.getParameter("doctorID"));
            //format date
            

            PatientDAO paDAO =new PatientDAO();
            scheduleDAO scheDAO= new scheduleDAO();
            BookingDetailDAO bkDAO = new BookingDetailDAO();
            scheduleDTO sche= scheDAO.getScheduleToSubmit(slot, doctorID, day);
            boolean check1=scheDAO.setOffSchedule(slot, day, doctorID);  
            int nn=sche.getScheduleID();
            BookingDetailDTO bk= bkDAO.getBookingDetailByScheduleID(nn);
            int mm=bk.getPatientID();
            PatientDTO pa=paDAO.getPatientByPatientID(mm);
            boolean check2=bkDAO.cancelBooking(sche.getScheduleID());
            if(check2){
                request.setAttribute("SUCCESS_CANCEL", "Đã hủy lịch thành công");
                request.setAttribute("doctorID", doctorID);
            url=SUCCESS;
                 final String fromEmail = "dentacare.noti@gmail.com";
        // Mat khai email cua ban
        final String password = "jfhtyhsviyufjhvr";
        // dia chi email nguoi nhan
        //format gio 
         String gio="";
                        switch (slot) {
                            case 1:
                                gio="7:00 - 9:00 am";
                                break;
                                case 2:
                                gio="9:00 - 11:00 am";
                                break;
                                case 3:
                                gio="13:00 - 15:00 pm";
                                break;
                                case 4:
                                gio="15:00 - 17:00 pm";
                                break;
                            default:
                                throw new AssertionError();
                        }
        final String toEmail = pa.getGmail();
        String check=toEmail;
        final String subject = "Hủy lịch đặt DentaCare";
        final String body = "DentaCare thông báo\n"
                + "Vì lý ngoài ý muốn, DentaCare xin thông báo tới quý khách hàng.\n"
                + "Cuộc hẹn của quý khách vào ngày: "+day+" lúc "+gio+"\n"
                + "Tại nha khoa DentaCare đã bị hủy bỏ.\n"
                + "Trân trọng thông báo tới quý khách hàng.\n"
                + "DentaCare";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        Session session = Session.getInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        //set message headers
        msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
        msg.addHeader("format", "flowed");
        msg.addHeader("Content-Transfer-Encoding", "8bit");
        msg.setFrom(new InternetAddress(fromEmail, "DentaCare"));
        msg.setReplyTo(InternetAddress.parse(fromEmail, false));
        msg.setSubject(subject, "UTF-8");
        msg.setText(body, "UTF-8");
        msg.setSentDate(new Date());
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
        Transport.send(msg);
            }
        } catch (Exception e) {
            url = ERROR;
            log("Error at ServiceController");
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
