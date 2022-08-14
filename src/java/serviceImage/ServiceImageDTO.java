/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package serviceImage;

/**
 *
 * @author Doan
 */
public class ServiceImageDTO {
    private String image;
    private int serviceID;
    private int imageID;

    public int getImageID() {
        return imageID;
    }

    public void setImageID(int imageID) {
        this.imageID = imageID;
    }

    public ServiceImageDTO(String image, int serviceID, int imageID) {
        this.image = image;
        this.serviceID = serviceID;
        this.imageID = imageID;
    }
    public ServiceImageDTO(String image, int serviceID) {
        this.image = image;
        this.serviceID = serviceID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }
    
    
}
