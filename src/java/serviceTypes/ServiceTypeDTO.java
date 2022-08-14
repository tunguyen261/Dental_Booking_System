package serviceTypes;

public class ServiceTypeDTO {
    int serviceTypeID;
    String serviceTypeName;
    String description;
    int adminID;

    public ServiceTypeDTO() {
        this.serviceTypeID = 0;
        this.serviceTypeName = "";
        this.description = "";
        this.adminID = 0;
    }
    
    public ServiceTypeDTO(int serviceTypeID, String serviceTypeName, String description, int adminID) {
        this.serviceTypeID = serviceTypeID;
        this.serviceTypeName = serviceTypeName;
        this.description = description;
        this.adminID = adminID;
    }

    public ServiceTypeDTO(int serviceTypeID, String serviceTypeName) {
        this.serviceTypeID = serviceTypeID;
        this.serviceTypeName = serviceTypeName;
    }

    public int getServiceTypeID() {
        return serviceTypeID;
    }

    public void setServiceTypeID(int serviceTypeID) {
        this.serviceTypeID = serviceTypeID;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }
    
    
}