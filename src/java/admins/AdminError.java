/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admins;

public class AdminError {
    int adminIDError;
    String fullNameError;
    String passwordError;
    String confirmPassword;
    String gmailError;
    String roleIDError;

    public AdminError() {
        this.adminIDError = 0;
        this.fullNameError = "";
        this.passwordError = "";
        this.confirmPassword = "";
        this.gmailError = "";
        this.roleIDError = "";
    }
    public AdminError(int adminIDError, String fullNameError, String passwordError, String confirmPassword, String gmailError, String roleIDError) {
        this.adminIDError = adminIDError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.confirmPassword = confirmPassword;
        this.gmailError = gmailError;
        this.roleIDError = roleIDError;
    }

    public int getAdminIDError() {
        return adminIDError;
    }

    public void setAdminIDError(int adminIDError) {
        this.adminIDError = adminIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getGmailError() {
        return gmailError;
    }

    public void setGmailError(String gmailError) {
        this.gmailError = gmailError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }
    
    
}
