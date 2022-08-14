package discounts;

import java.util.Date;



public class DiscountDTO {
    int discountID;
    String title;
    String description;
    int percentDiscount;
    int status;
    String image;
    String createDate;
    String expiredDate;
    int adminID;
    int serviceID;

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public DiscountDTO(int discountID, String title, String description, int percentDiscount, int status, String createDate, String expiredDate, int adminID, int serviceID) {
        this.discountID = discountID;
        this.title = title;
        this.description = description;
        this.percentDiscount = percentDiscount;
        this.status = status;

        this.createDate = createDate;
        this.expiredDate = expiredDate;
        this.adminID = adminID;
        this.serviceID = serviceID;
    }
    
    public DiscountDTO() {
    }
    
    public DiscountDTO(int discountID, String title, String description, int percentDiscount, int status, String createDate, String expiredDate, int adminID) {
        this.discountID = discountID;
        this.title = title;
        this.description = description;
        this.percentDiscount = percentDiscount;
        this.status = status;
        this.createDate = createDate;
        this.expiredDate = expiredDate;
        this.adminID = adminID;
    }

    
    public DiscountDTO(int discountID, String title, String description, int percentDiscount, int status, String image, String createDate, String expiredDate, int adminID) {
        this.discountID = discountID;
        this.title = title;
        this.description = description;
        this.percentDiscount = percentDiscount;
        this.status = status;
        this.image = image;
        this.createDate = createDate;
        this.expiredDate = expiredDate;
        this.adminID = adminID;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPercentDiscount() {
        return percentDiscount;
    }

    public void setPercentDiscount(int percentDiscount) {
        this.percentDiscount = percentDiscount;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getExpiredDate() {
        return expiredDate;
    }

    public void setExpiredDate(String expiredDate) {
        this.expiredDate = expiredDate;
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }
       
}
