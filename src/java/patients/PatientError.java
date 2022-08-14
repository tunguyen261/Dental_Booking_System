package patients;

public class PatientError {
    String patientIDError;
    String fullNameError;
    String passwordError;
    String confirmPassword;
    String roleIDError;
    String gmailError;
    String phoneError;
    String addressError;
    String genderError;
    String statusError;
    String confirmError;

    
    public PatientError() {
        this.patientIDError = "";
        this.fullNameError = "";
        this.passwordError = "";
        this.confirmPassword = "";
        this.roleIDError = "";
        this.gmailError = "";
        this.phoneError = "";
        this.addressError = "";
        this.genderError = "";
        this.statusError = "";
        this.confirmError = "";
    }

    public PatientError(String patientIDError, String fullNameError, String passwordError, String confirmPassword, String roleIDError, String gmailError, String phoneError, String addressError, String genderError, String statusError, String confirmError) {
        this.patientIDError = patientIDError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.confirmPassword = confirmPassword;
        this.roleIDError = roleIDError;
        this.gmailError = gmailError;
        this.phoneError = phoneError;
        this.addressError = addressError;
        this.genderError = genderError;
        this.statusError = statusError;
        this.confirmError = confirmError;
    }

    public String getPatientIDError() {
        return patientIDError;
    }

    public void setPatientIDError(String patientIDError) {
        this.patientIDError = patientIDError;
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

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getGenderError() {
        return genderError;
    }

    public void setGenderError(String genderError) {
        this.genderError = genderError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }
    
   
}
