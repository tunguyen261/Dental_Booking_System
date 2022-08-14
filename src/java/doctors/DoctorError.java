package doctors;

public class DoctorError {
    String doctorIDError;
    String serviceTypeIDError;
    String fullNameError;
    String passwordError;
    String confirmPassword;
    String roleIDError;
    String genderError;
    String workDayIDError;
    String gmailError;
    String phoneError;
    String imageError;
    String statusError;
    String achivement;

    public DoctorError() {
        this.doctorIDError = "";
        this.serviceTypeIDError = "";
        this.fullNameError = "";
        this.passwordError = "";
        this.confirmPassword = "";
        this.roleIDError = "";
        this.genderError = "";
        this.workDayIDError = "";
        this.gmailError = "";
        this.phoneError = "";
        this.imageError = "";
        this.statusError = "";
        this.achivement = "";
    }
    public DoctorError(String doctorIDError, String serviceTypeIDError, String fullNameError, String passwordError, String confirmPassword, String roleIDError, String genderError, String workDayIDError, String gmailError, String phoneError, String imageError, String statusError) {
        this.doctorIDError = doctorIDError;
        this.serviceTypeIDError = serviceTypeIDError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.confirmPassword = confirmPassword;
        this.roleIDError = roleIDError;
        this.genderError = genderError;
        this.workDayIDError = workDayIDError;
        this.gmailError = gmailError;
        this.phoneError = phoneError;
        this.imageError = imageError;
        this.statusError = statusError;
    }

    public String getAchivement() {
        return achivement;
    }

    public void setAchivement(String achivement) {
        this.achivement = achivement;
    }

        
    public String getDoctorIDError() {
        return doctorIDError;
    }

    public void setDoctorIDError(String doctorIDError) {
        this.doctorIDError = doctorIDError;
    }

    public String getServiceTypeIDError() {
        return serviceTypeIDError;
    }

    public void setServiceTypeIDError(String serviceTypeIDError) {
        this.serviceTypeIDError = serviceTypeIDError;
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

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getGenderError() {
        return genderError;
    }

    public void setGenderError(String genderError) {
        this.genderError = genderError;
    }

    public String getWorkDayIDError() {
        return workDayIDError;
    }

    public void setWorkDayIDError(String workDayIDError) {
        this.workDayIDError = workDayIDError;
    }

    public String getGmailError() {
        return gmailError;
    }

    public void setGmailError(String gmailError) {
        this.gmailError = gmailError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }
    
    
}
