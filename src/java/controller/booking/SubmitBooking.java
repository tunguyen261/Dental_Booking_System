/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.booking;

import booking.BookingDAO;
import booking.BookingDTO;
import bookingdetail.BookingDetailDAO;
import bookingdetail.BookingDetailDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import patients.PatientDTO;
import schedule.scheduleDAO;
import schedule.scheduleDTO;


/**
 *
 * @author Doan
 */
public class SubmitBooking extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private static final String ERROR = "newBooking.jsp";
    private static final String TRUE = "ShowBookingController";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try {
            HttpSession ss = request.getSession();     
            patients.PatientDTO login = (PatientDTO) ss.getAttribute("LOGIN_PATIENT");
            int doctorID=Integer.parseInt(request.getParameter("doctorID"));
            int serviceID= Integer.parseInt(request.getParameter("serviceID"));
            String serviceName= request.getParameter("serviceName");
            String doctorName= request.getParameter("doctorName");
            int discount = Integer.parseInt(request.getParameter("discount"));
            int expectedFee= Integer.parseInt(request.getParameter("expectedFee"));
            int patientID = Integer.parseInt(request.getParameter("patientID"));
            String dateBooking= request.getParameter("dateBooking");
            int slotID = Integer.parseInt(request.getParameter("slotID"));      
            BookingDetailDTO bkDetail= new BookingDetailDTO(serviceID,expectedFee,patientID);
            BookingDetailDAO bkDetailDAO =new BookingDetailDAO();
            boolean check_valid = bkDetailDAO.checkExistBookingDetai(dateBooking, slotID,doctorID);
            scheduleDAO scheDAO =new scheduleDAO();
            scheduleDTO schee= scheDAO.getScheduleToSubmit(slotID, doctorID, dateBooking);
            int scheID =schee.getScheduleID();
            bkDetail.setScheduleID(scheID);
            if(!check_valid){
                     boolean check2=bkDetailDAO.createBookingDetail(bkDetail);
                    boolean check1 =scheDAO.setBookedSchedule(slotID, dateBooking, doctorID);
                    if(check2 && check1){
                                             url=TRUE; 
                                             request.setAttribute("SUCCESS_ADD_BOOKING", "Bạn đã đặt lịch thành công");
                    request.setAttribute("add_green", schee);

                        String gio="";
                        switch (slotID) {
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
                        ///Gui mail 
                         final String fromEmail = "dentacare.noti@gmail.com";
        // Mat khai email cua ban
        final String password = "kfvcboefxllyijef";
        // dia chi email nguoi nhan
        final String toEmail = login.getGmail();
        String check=toEmail;
        final String subject = "Denta Care Thông báo";
        final String body = "Bạn đã đặt lịch thành công tại Nha khoa Denta Care vào ngày: "+dateBooking+" vào lúc "+ gio+"\n"+
                "Dịch vụ: "+serviceName+" ,thực hiện bởi bác sĩ: "+doctorName+"\n"+" Cảm ơn bạn đã ủng hộ dịch vụ của Denta Care.\n Admin.";
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
      
            }else{
                request.setAttribute("FAIL_ADD_BOOKING", "Đặt lịch thất bại");
            }
        } catch (Exception e) {
              log("Error at SubmitBooking: " + e.toString());
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
