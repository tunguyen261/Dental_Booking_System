/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookingdetail;

/**
 *
 * @author Doan
 */
public class BookingDetailDTO {
    String service;;
    int serviceID;
    int expectedFee;
    int scheduleID;
    int status;
    int patientID;
    int BookingDetailID;

    public int getBookingDetailID() {
        return BookingDetailID;
    }

    public void setBookingDetailID(int BookingDetailID) {
        this.BookingDetailID = BookingDetailID;
    }

    public BookingDetailDTO(int serviceID, int expectedFee, int scheduleID, int status, int patientID, int BookingDetailID) {
        this.serviceID = serviceID;
        this.expectedFee = expectedFee;
        this.scheduleID = scheduleID;
        this.status = status;
        this.patientID = patientID;
        this.BookingDetailID = BookingDetailID;
    }
    
    public int getPatientID() {
        return patientID;
    }

    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }
    
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    public BookingDetailDTO() {
    }

    public int getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(int scheduleID) {
        this.scheduleID = scheduleID;
    }

    
    
    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }
    
    
    
    public int getExpectedFee() {
        return expectedFee;
    }

    public void setExpectedFee(int expectedFee) {
        this.expectedFee = expectedFee;
    }


     public BookingDetailDTO( int serviceID, int expectedFee,int patientID) {
        this.serviceID = serviceID;
        this.expectedFee = expectedFee;
        this.patientID =patientID;
    }

    public BookingDetailDTO(int serviceID, int expectedFee, int scheduleID, int status, int patientID) {
        this.serviceID = serviceID;
        this.expectedFee = expectedFee;
        this.scheduleID = scheduleID;
        this.status = status;
        this.patientID = patientID;
    }

    
    public BookingDetailDTO( int serviceID, int scheduleID,int status,int check) {
        this.serviceID = serviceID;
        this.scheduleID = scheduleID;
        this.status=status;
    }

    public BookingDetailDTO(int serviceID, int scheduleID) {
        this.serviceID = serviceID;
        this.scheduleID = scheduleID;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }


}
