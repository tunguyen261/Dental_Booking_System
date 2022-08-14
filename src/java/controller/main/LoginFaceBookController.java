/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.main;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import static controller.main.LoginGoogleController.getToken;
import static controller.main.LoginGoogleController.getUserInfo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import patients.PatientDAO;
import patients.PatientDTO;
import com.restfb.DefaultFacebookClient;
import com.restfb.DefaultWebRequestor;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.WebRequestor;
import com.restfb.types.User;

/**
 *
 * @author Doan
 */
public class LoginFaceBookController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private static final String ERROR="login.jsp";
    private static final String PA="PA";
    private static final String PATIENT_PAGE = "HomeController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String code=request.getParameter("code");
            String accessTokenn =getToken(code);          
            User user=getUserInfo(accessTokenn);
            PatientDAO dao= new PatientDAO();
            long id =Long.parseLong(user.getId());
            boolean check=dao.checkDuplicateGmail(user.getId());
            if(check==true){
                PatientDTO loginPatient= dao.checkLoginByGmail(user.getId());
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_PATIENT", loginPatient);
                 url=PATIENT_PAGE;
            }else{
                String email =user.getEmail();
                PatientDTO newUser= new PatientDTO(1,user.getName(),user.getId(),"PA");
                boolean create = dao.registerUserbyGmail(newUser);
                if(create){
                    HttpSession session = request.getSession();
                session.setAttribute("LOGIN_PATIENT", newUser);
                 url=PATIENT_PAGE;
                }
            }  
            } catch (Exception e) {
            log("Error at LoginGoogleController: " + e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }     
    }
    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String link = String.format(Constants.FACEBOOK_LINK_GET_TOKEN, Constants.FACEBOOK_APP_ID, Constants.FACEBOOK_APP_SECRET, Constants.FACEBOOK_REDIRECT_URL, code);
        String response = Request.Get(link).execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }
     public static User getUserInfo(String accessToken) {
        FacebookClient facebookClient = new DefaultFacebookClient(accessToken, Constants.FACEBOOK_APP_SECRET, Version.LATEST);
        return facebookClient.fetchObject("me", User.class);
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
