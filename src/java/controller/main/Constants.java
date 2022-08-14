/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.main;

/**
 *
 * @author Doan
 */
public class Constants {
    
    /// Google login
    public static String GOOGLE_CLIENT_ID = "326210504580-icsqk0q8ujacofhrnf72sjrh5nalabua.apps.googleusercontent.com";

	public static String GOOGLE_CLIENT_SECRET = "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";

	public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/DentistBookingSystem/LoginGoogleController";

	public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

	public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

	public static String GOOGLE_GRANT_TYPE = "authorization_code";
///// Fb login
        
        public static String FACEBOOK_APP_ID = "560930585693096";
    public static String FACEBOOK_APP_SECRET = "6284564f6d1089edf69e9252c441f392";
    public static String FACEBOOK_REDIRECT_URL = "http://localhost:8080/DentistBookingSystem/LoginFaceBookController";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
        
    public Constants() {
    }
        
        
}
