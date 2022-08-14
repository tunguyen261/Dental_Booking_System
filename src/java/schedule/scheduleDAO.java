/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schedule;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import serviceImage.ServiceImageDTO;
import utils.DBUtils;

/**
 *
 * @author Doan
 */
public class scheduleDAO {

    private static final String GET_ALL_LIST_SCHEDULE = "SELECT sch.scheduleID, sch.doctorID, sch.day, sch.dayOfWeek, sch.slot, sch.status FROM tblSchedules sch, tblDoctors dr WHERE sch.doctorID = dr.doctorID";
    private static final String GET_SCHEDULE_BY_DOCTOR_ID = "select * from tblSchedules where day>GETDATE()-7  and  doctorID= ?";
    private static final String SET_OFF_SCHEDULE = "update tblSchedules set status= 0 where slot =? and day = ? and doctorID = ?";
    private static final String SET_ON_SCHEDULE = "update tblSchedules set status= 1 where slot =? and day = ? and doctorID = ?";
    private static final String CREATE_SCHEDULE = "Insert tblSchedules (dayOfWeek,day,slot,status,doctorID) values(?,?,?,?,?)";
    private static final String GET_SCHEDULE_BY_SCHEDULE_ID ="select * from tblSchedules where scheduleID = ?";
    private static final String GET_SCHEDULE_TO_SUBMIT ="select * from tblSchedules where slot = ? and doctorID = ? and day like ?";
    private static final String SET_BOOKED = "update tblSchedules set status= 2 where slot =? and day = ? and doctorID = ?";
    private static final String GET_BOOKED ="select * from tblSchedules where day>GETDATE()-7 and status =2 and  doctorID= ?";
    private static final String GET_SCHEDULE_BEFORE_MONTH = "SELECT * FROM tblSchedules s WHERE MONTH(s.day)< MONTH(GETDATE()) AND s.doctorID=? ORDER BY s.scheduleID";
    private static final String GET_SCHEDULE_CURRENT_MONTH = "SELECT * FROM tblSchedules s WHERE MONTH(s.day)= MONTH(GETDATE()) AND s.doctorID=? ORDER BY s.scheduleID";
    private static final String SET_ON_SCHEDULE_BOOKED = "update tblSchedules set status= 1 where scheduleID = ?";
    private static final String GET_ALL_LIST_SCHEDULE_BOOKED = "SELECT sch.scheduleID, sch.doctorID, sch.day, sch.dayOfWeek, sch.slot, sch.status FROM tblSchedules sch, tblDoctors dr WHERE sch.status=2 and sch.doctorID = dr.doctorID";
    
    
    
    
    public List<scheduleDTO> getAllListScheduleBooked() throws SQLException {
        List<scheduleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LIST_SCHEDULE_BOOKED);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int scheduleID = rs.getInt("scheduleID");
                    int doctorID = rs.getInt("doctorID");
                    String day = rs.getString("day");
                    String dayOfWeek = rs.getString("dayOfWeek");
                    int slot = rs.getInt("slot");
                    int status = rs.getInt("status");
                    list.add(new scheduleDTO(scheduleID, dayOfWeek, day, slot, doctorID, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
    
    public List<scheduleDTO> getListBookedMonthCurrent(int id) throws SQLException {
        List<scheduleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SCHEDULE_CURRENT_MONTH);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String dayOfWeek = rs.getString("dayOfWeek");
                    String day = rs.getString("day");
                    int slot = rs.getInt("slot");
                    int status = rs.getInt("status");
                    int doctorID = rs.getInt("doctorID");
                    list.add(new scheduleDTO(dayOfWeek, day, slot, doctorID, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
    
    public List<scheduleDTO> getListBookedMonthBefore(int id) throws SQLException {
        List<scheduleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SCHEDULE_BEFORE_MONTH);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String dayOfWeek = rs.getString("dayOfWeek");
                    String day = rs.getString("day");
                    int slot = rs.getInt("slot");
                    int status = rs.getInt("status");
                    int doctorID = rs.getInt("doctorID");
                    list.add(new scheduleDTO(dayOfWeek, day, slot, doctorID, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
    
    
    public boolean setOnScheduleBooked(int scheduleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SET_ON_SCHEDULE_BOOKED);
                ptm.setInt(1, scheduleID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    
    public List<scheduleDTO> getBookedScheduleByDoctorID(int id) throws SQLException {
        List<scheduleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_BOOKED);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String dayOfWeek = rs.getString("dayOfWeek");
                    String day = rs.getString("day");
                    int slot = rs.getInt("slot");
                    int status = rs.getInt("status");
                    int doctorID = rs.getInt("doctorID");
                    list.add(new scheduleDTO(dayOfWeek, day, slot, doctorID, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
    
     public boolean setBookedSchedule(int slot, String day, int doctorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SET_BOOKED);
                ptm.setInt(1, slot);
                ptm.setString(2, day);
                ptm.setInt(3, doctorID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
     public scheduleDTO getScheduleToSubmit(int slot, int doctorID, String day) throws SQLException {
        scheduleDTO sche=new scheduleDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SCHEDULE_TO_SUBMIT);
                ptm.setInt(1, slot);
                ptm.setInt(2, doctorID);
                ptm.setString(3, day);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String dayOfWeek = rs.getString("dayOfWeek");
                    String day2 = rs.getString("day");
                    int slot2 = rs.getInt("slot");
                    int status = rs.getInt("status");
                    int doctorID2 = rs.getInt("doctorID");
                    int scheduleID=rs.getInt("scheduleID");
                    sche=new scheduleDTO(scheduleID,dayOfWeek, day2, slot2, doctorID2, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return sche;
    }
    
    public scheduleDTO getScheduleByScheduleID(int id) throws SQLException {
        scheduleDTO sche=new scheduleDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SCHEDULE_BY_SCHEDULE_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String dayOfWeek = rs.getString("dayOfWeek");
                    String day = rs.getString("day");
                    int slot = rs.getInt("slot");
                    int status = rs.getInt("status");
                    int doctorID = rs.getInt("doctorID");
                    sche=new scheduleDTO(id,dayOfWeek, day, slot, doctorID, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return sche;
    }
    
    public boolean createSchedule(scheduleDTO scheduleDTO) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(CREATE_SCHEDULE);
                pstm.setString(1, scheduleDTO.getDayOfWeek());
                pstm.setString(2, scheduleDTO.getDay());
                pstm.setInt(3, scheduleDTO.getSlot());
                pstm.setInt(4, 1);
                pstm.setInt(5, scheduleDTO.getDoctorID());
                check = pstm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean setOnSchedule(int slot, String day, int doctorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SET_ON_SCHEDULE);
                ptm.setInt(1, slot);
                ptm.setString(2, day);
                ptm.setInt(3, doctorID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean setOffSchedule(int slot, String day, int doctorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SET_OFF_SCHEDULE);
                ptm.setInt(1, slot);
                ptm.setString(2, day);
                ptm.setInt(3, doctorID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<scheduleDTO> getAllListSchedule() throws SQLException {
        List<scheduleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LIST_SCHEDULE);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int scheduleID = rs.getInt("scheduleID");
                    int doctorID = rs.getInt("doctorID");
                    String day = rs.getString("day");
                    String dayOfWeek = rs.getString("dayOfWeek");
                    int slot = rs.getInt("slot");
                    int status = rs.getInt("status");
                    list.add(new scheduleDTO(scheduleID, dayOfWeek, day, slot, doctorID, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return list;
    }

    public List<scheduleDTO> getScheduleByDoctorID(int id) throws SQLException {
        List<scheduleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SCHEDULE_BY_DOCTOR_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String dayOfWeek = rs.getString("dayOfWeek");
                    String day = rs.getString("day");
                    int slot = rs.getInt("slot");
                    int status = rs.getInt("status");
                    int doctorID = rs.getInt("doctorID");
                    list.add(new scheduleDTO(dayOfWeek, day, slot, doctorID, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
}
