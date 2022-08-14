/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.main;

import admins.AdminDAO;
import admins.AdminDTO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;
import patients.PatientDAO;
import patients.PatientDTO;


/**
 *
 * @author Doan
 */
public class LoginGoogleController extends HttpServlet {

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
         String url = ERROR;
        try {
            String code=request.getParameter("code");
            String accessTokenn =getToken(code);
            UserGoogleDTO user=getUserInfo(accessTokenn);
            PatientDAO dao= new PatientDAO();
            String email =user.getEmail();
            boolean check=dao.checkDuplicateGmail(email);
            if(check==true){
                //Dang nhap
                PatientDTO loginPatient= dao.checkLoginByGmail(user.getEmail());
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_PATIENT", loginPatient);
                 url=PATIENT_PAGE;
            }else{
                //Dang ki patient moi khi lan dau dang nhap bang gmail
                PatientDTO newUser= new PatientDTO(1,user.getName(),user.getEmail(),"PA");
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
    public static String getToken(String code) throws ClientProtocolException, IOException {
		// call api to get token
                Constants Constants =  new Constants();
		String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
						.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();

		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}

	public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();

		UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);

		return googlePojo;
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
