package doctors;

public class DoctorDTO {
    int doctorID;
    String serviceTypeName;
    String fullName;
    String password;
    String roleID;
    String gender;
    String gmail;
    int phone;
    String image;
    int status;
    String achievement;

    public DoctorDTO() {
        this.doctorID = 0;
        this.serviceTypeName = "";
        this.fullName = "";
        this.password = "";
        this.roleID = "";
        this.gender = "";
        this.gmail = "";
        this.phone = 0;
        this.image = "";
        this.status = 0;
        this.achievement="";
    }
    
    public DoctorDTO(int doctorID, String serviceTypeName, String fullName, String password, String roleID, String gender, String gmail, int phone, String image, int status, String achievement) {
        this.doctorID = doctorID;
        this.serviceTypeName = serviceTypeName;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.gender = gender;
        this.gmail = gmail;
        this.phone = phone;
        this.image = image;
        this.status = status;
        this.achievement = achievement;
    }


    
    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getAchievement() {
        return achievement;
    }

    public void setAchievement(String achievement) {
        this.achievement = achievement;
    }
    
    
}
