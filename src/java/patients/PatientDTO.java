package patients;

public class PatientDTO {
    int patientID;
    String fullName;
    String password;
    String roleID;
    String gmail;
    int phone;
    String address;
    String gender;
    int status;

    public PatientDTO () {
        this.patientID = 0;
        this.fullName = "";
        this.password = "";
        this.roleID = "";
        this.gmail = "";
        this.phone = 0;
        this.address = "";
        this.gender = "";
        this.status = 0;
    }
    
    public PatientDTO(int patientID, String fullName, String password, String roleID, String gmail, int phone, String address, String gender, int status) {
        this.patientID = patientID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.gmail = gmail;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.status = status;
    }

    public PatientDTO(int patientID, String fullName, String gmail,String role) {
        this.patientID = patientID;
        this.fullName = fullName;
        this.gmail = gmail;
        this.roleID=role;
    }
    
    
 
    public int getPatientID() {
        return patientID;
    }

    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
