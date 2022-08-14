/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admins;

import discounts.DiscountDAO;
import discounts.DiscountDTO;
import discounts.DiscountError;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
import patients.PatientDAO;
import patients.PatientDTO;
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author quang
 */
public class AddDiscountController extends HttpServlet {

    public static final String ERROR = "home.jsp";
    public static final String SUCCESS = "LoadDiscountController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        DiscountError discountError = new DiscountError();
        try {
            int serviceTypeID = Integer.parseInt(request.getParameter("serviceTypeID"));    
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            int status = 1;
            int percentDiscount = Integer.parseInt(request.getParameter("percentDiscount"));
            int serviceID = Integer.parseInt(request.getParameter("serviceID")); 
            int adminID = Integer.parseInt(request.getParameter("adminID")); 
            String createDate = request.getParameter("createDate");
            String expiredDate = request.getParameter("expiredDate");
//            check validation here: checkId, name, role , pass,...password
            boolean check = true;
            DiscountDAO dao = new DiscountDAO();
            ServiceDAO svDao = new ServiceDAO();
            List<ServiceDTO> listSV = svDao.getAllListService();
            DiscountDTO doctor = new DiscountDTO(1, title, description, percentDiscount, status, createDate, expiredDate, adminID, serviceID);
            
            if (description.trim().length() == 0) {
                discountError.setDescriptionError("Không thể để trống Description");
                check = false;
            }
            
            if (title.trim().length() == 0 && title.trim().length() >= 50) {
                discountError.setDescriptionError("Chủ đề phải có độ dài [1, 50]");
                check = false;
            }
            PatientDAO paDAO =new PatientDAO();
            List<PatientDTO> listPatient = paDAO.getAllListPatient();
            if (check) {
                boolean checkUpdate = dao.createDiscount(doctor);
                if (checkUpdate) {
                    url = SUCCESS;
                    request.setAttribute("serviceTypeID", serviceTypeID);
                    ////Gui mail cho khach hang nhan duoc thong tin discount
                    for(PatientDTO pa: listPatient){
                         final String fromEmail = "dentacare.noti@gmail.com";
        // Mat khai email cua ban
        final String password = "asjvfvbgcycolnct";
        // dia chi email nguoi nhan
        final String toEmail = pa.getGmail();
        final String subject = "Khuyến mãi từ DentaCare";
        final String body = "Kính gửi quý khách hàng\n "
                + "Hiện tại Nha khoa DentaCare đang có trương trình khuyến mãi: "+title+" \n Thông tin chi tiết như sau: "+description+"\n"
                + "Rất mong được sự ủng hộ của khách hàng.\n DentaCare";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
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
                    request.setAttribute("SSMSG", "Chỉnh sữa thành công !");
                }
            } else {
                request.setAttribute("SSMSG", "Chỉnh sữa thất bại !");
            }
        } catch (Exception e) {
            log("Error at Update Discount Controller");
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
