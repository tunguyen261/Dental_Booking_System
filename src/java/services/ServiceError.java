package services;

public class ServiceError {
    int serviceIDError;
    int serviceTypeIDError;
    String serviceNameError;
    String servicePriceError;
    String imageError;
    String descriptionError;
    int adminIDError;
    int statusError;
    String ServiceTypeNameError;
    public ServiceError() {
        
    }
    public ServiceError(int serviceIDError, int serviceTypeIDError, String serviceNameError, String servicePriceError, String imageError, String descriptionError, int adminIDError, int statusError) {
        this.serviceIDError = serviceIDError;
        this.serviceTypeIDError = serviceTypeIDError;
        this.serviceNameError = serviceNameError;
        this.servicePriceError = servicePriceError;
        this.imageError = imageError;
        this.descriptionError = descriptionError;
        this.adminIDError = adminIDError;
        this.statusError = statusError;
    }

    public String getServiceTypeNameError() {
        return ServiceTypeNameError;
    }

    public void setServiceTypeNameError(String ServiceTypeNameError) {
        this.ServiceTypeNameError = ServiceTypeNameError;
    }

    public int getServiceIDError() {
        return serviceIDError;
    }

    public void setServiceIDError(int serviceIDError) {
        this.serviceIDError = serviceIDError;
    }

    public int getServiceTypeIDError() {
        return serviceTypeIDError;
    }

    public void setServiceTypeIDError(int serviceTypeIDError) {
        this.serviceTypeIDError = serviceTypeIDError;
    }

    public String getServiceNameError() {
        return serviceNameError;
    }

    public void setServiceNameError(String serviceNameError) {
        this.serviceNameError = serviceNameError;
    }

    public String getServicePriceError() {
        return servicePriceError;
    }

    public void setServicePriceError(String servicePriceError) {
        this.servicePriceError = servicePriceError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getDescriptionError() {
        return descriptionError;
    }

    public void setDescriptionError(String descriptionError) {
        this.descriptionError = descriptionError;
    }

    public int getAdminIDError() {
        return adminIDError;
    }

    public void setAdminIDError(int adminIDError) {
        this.adminIDError = adminIDError;
    }

    public int getStatusError() {
        return statusError;
    }

    public void setStatusError(int statusError) {
        this.statusError = statusError;
    }
}
