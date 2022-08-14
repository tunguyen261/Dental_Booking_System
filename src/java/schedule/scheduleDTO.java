/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schedule;

import java.util.Date;

/**
 *
 * @author Doan
 */
public class scheduleDTO {
    int scheduleID;
    String dayOfWeek;
    String day;
    int slot;
    int doctorID;
    int status;

    public scheduleDTO() {
    }

    public scheduleDTO(String dayOfWeek, String day, int slot, int doctorID, int status) {
        this.dayOfWeek = dayOfWeek;
        this.day = day;
        this.slot = slot;
        this.doctorID = doctorID;
        this.status = status;
    }

    public scheduleDTO(int scheduleID, String dayOfWeek, String day, int slot, int doctorID, int status) {
        this.scheduleID = scheduleID;
        this.dayOfWeek = dayOfWeek;
        this.day = day;
        this.slot = slot;
        this.doctorID = doctorID;
        this.status = status;
    }

    public int getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(int scheduleID) {
        this.scheduleID = scheduleID;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
