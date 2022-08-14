/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package discounts;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class DiscountError {

    int discountIDError;
    String titleError;
    String descriptionError;
    String percentDiscountError;
    int statusError;
    String imageError;
    String createDateError;
    String expiredDateError;
    int adminIDError;
    String serviceNameError;

    public DiscountError() {
    }

    public DiscountError(int discountIDError, String titleError, String descriptionError, String percentDiscountError, int statusError, String imageError, String createDateError, String expiredDateError, int adminIDError, String serviceNameError) {
        this.discountIDError = discountIDError;
        this.titleError = titleError;
        this.descriptionError = descriptionError;
        this.percentDiscountError = percentDiscountError;
        this.statusError = statusError;
        this.imageError = imageError;
        this.createDateError = createDateError;
        this.expiredDateError = expiredDateError;
        this.adminIDError = adminIDError;
        this.serviceNameError = serviceNameError;
    }

    public int getDiscountIDError() {
        return discountIDError;
    }

    public void setDiscountIDError(int discountIDError) {
        this.discountIDError = discountIDError;
    }

    public String getTitleError() {
        return titleError;
    }

    public void setTitleError(String titleError) {
        this.titleError = titleError;
    }

    public String getDescriptionError() {
        return descriptionError;
    }

    public void setDescriptionError(String descriptionError) {
        this.descriptionError = descriptionError;
    }

    public String getPercentDiscountError() {
        return percentDiscountError;
    }

    public void setPercentDiscountError(String percentDiscountError) {
        this.percentDiscountError = percentDiscountError;
    }

    public int getStatusError() {
        return statusError;
    }

    public void setStatusError(int statusError) {
        this.statusError = statusError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getCreateDateError() {
        return createDateError;
    }

    public void setCreateDateError(String createDateError) {
        this.createDateError = createDateError;
    }

    public String getExpiredDateError() {
        return expiredDateError;
    }

    public void setExpiredDateError(String expiredDateError) {
        this.expiredDateError = expiredDateError;
    }

    public int getAdminIDError() {
        return adminIDError;
    }

    public void setAdminIDError(int adminIDError) {
        this.adminIDError = adminIDError;
    }

    public String getServiceNameError() {
        return serviceNameError;
    }

    public void setServiceNameError(String serviceNameError) {
        this.serviceNameError = serviceNameError;
    }
}
