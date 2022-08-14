/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookingdetail;

import booking.BookingDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Doan
 */
public class BookingDetailDAO {
    private static final String GET_BOOKING_DETAIL_BYDOCTORID = "SELECT  b.scheduleID, b.serviceID FROM tblBookingDetails b, tblSchedules s WHERE b.scheduleID=s.scheduleID and s.day>GETDATE() -7 and doctorID =?";
    private static final String INSERT_BOOKINGDETAIL ="INSERT tblBookingDetails ([expectedFee], [serviceID],[scheduleID],[patientID],[status]) VALUES ( ?,?,?,?,?)";
    private static final String CHECK_VALID = "select bk.BookingDetailID from tblBookingDetails bk, tblSchedules s where  bk.status = 1 and bk.scheduleID=s.scheduleID and s.slot =? and s.day like ? and  doctorID = ?";
    private static final String GET_BOOKING_DETAIL_BY_PATIENT_ID = "SELECT  * FROM tblBookingDetails WHERE patientID = ?";
    private static final String CANCEL_BOOKING = "update tblBookingDetails set status= 0 where scheduleID = ?";
    private static final String GET_INCOME="SELECT SUM(bk.expectedFee) as money FROM tblBookingDetails bk, tblSchedules s WHERE bk.status=2 and bk.scheduleID=s.scheduleID AND MONTH(s.day)=?";
    private static final String NUMBER_BOOKING="SELECT COUNT(bk.BookingDetailID) as nb FROM tblBookingDetails bk,tblSchedules s WHERE bk.status=2 and bk.scheduleID=s.scheduleID AND MONTH(s.day)=?";
    private static final String NUMBER_FB="SELECT COUNT(serviceFeedBackID) as nb FROM tblPatientFeedbacks WHERE MONTH(dateFeedback)=?";
    private static final String GET_BOOKING_DURING_DETAIL_BY_PATIENT_ID = "SELECT  * FROM tblBookingDetails WHERE status =1 and patientID = ?";
    private static final String GET_BOOKING_DURING_DETAIL_BY_SCHEDULE_ID = "SELECT  * FROM tblBookingDetails WHERE status =1 and scheduleID = ?";
    private static final String GET_BOOKING_FINISH_DETAIL_BY_PATIENT_ID = "SELECT  * FROM tblBookingDetails WHERE status =2 and patientID = ?";
    private static final String GET_ALL_BOOKING_DETAIL = "SELECT  * FROM tblBookingDetails WHERE status = 1";
    private static final String UPDATE_BOOKING = "update tblBookingDetails set status= 2 , expectedFee = ? where BookingDetailID = ?";
    
    private static final String NUMBER_SERVICE_TYPE = "SELECT COUNT(st.serviceTypeID) as nb FROM tblBookingDetails bk,tblSchedules s, tblDoctors d, tblServiceTypes st WHERE bk.status=2 and bk.scheduleID=s.scheduleID AND s.doctorID = d.doctorID AND st.serviceTypeID=?";
    private static final String GET_BOOKING_BY_SCHEDULE_ID = "SELECT  * FROM tblBookingDetails WHERE status =1 and scheduleID = ?";
    
  
     public BookingDetailDTO getBookingDetailByScheduleID(int id) throws SQLException {
        BookingDetailDTO bk = new BookingDetailDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_BOOKING_DURING_DETAIL_BY_SCHEDULE_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    int serviceID=rs.getInt("serviceID");
                    int scheduleID=rs.getInt("scheduleID");
                    int expectedFee=rs.getInt("expectedFee");
                    int patientID=rs.getInt("patientID");
                    bk=new BookingDetailDTO( serviceID,expectedFee,patientID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return bk;
    }
    
     public boolean updateBooking(int BookingDetailID,int fee) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_BOOKING);
                ptm.setInt(1, fee);
                ptm.setInt(2, BookingDetailID);        
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
    
    
     public List<BookingDetailDTO> getAllBookingDetail1() throws SQLException {
        List<BookingDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_ALL_BOOKING_DETAIL);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    int serviceID=rs.getInt("serviceID");
                    int scheduleID=rs.getInt("scheduleID");
                    int status=rs.getInt("status");
                    int expectedFee=rs.getInt("expectedFee");
                    int patientID=rs.getInt("patientID");
                    int BookingDetailID=rs.getInt("BookingDetailID");
                    list.add(new BookingDetailDTO( serviceID,expectedFee,scheduleID,status,patientID,BookingDetailID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
    
    public List<BookingDetailDTO> getAllBookingDetail() throws SQLException {
        List<BookingDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_ALL_BOOKING_DETAIL);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    int serviceID=rs.getInt("serviceID");
                    int scheduleID=rs.getInt("scheduleID");
                    int status=rs.getInt("status");
                    list.add(new BookingDetailDTO( serviceID,scheduleID,status,2));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
    
    
    public List<BookingDetailDTO> getBookingFinishDetailByDoctorID(int id) throws SQLException {
        List<BookingDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_BOOKING_FINISH_DETAIL_BY_PATIENT_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    int serviceID=rs.getInt("serviceID");
                    int scheduleID=rs.getInt("scheduleID");
                    list.add(new BookingDetailDTO( serviceID,scheduleID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
    
    public List<BookingDetailDTO> getBookingDuringDetailByDoctorID(int id) throws SQLException {
        List<BookingDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_BOOKING_DURING_DETAIL_BY_PATIENT_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    int serviceID=rs.getInt("serviceID");
                    int scheduleID=rs.getInt("scheduleID");
                    list.add(new BookingDetailDTO( serviceID,scheduleID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
    
     public int getNumberFB(int month) throws SQLException {
        int nb=0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(NUMBER_FB);
                ptm.setInt(1, month);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    nb=rs.getInt("nb");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return nb;
    }
     public int getNumberBooking(int month) throws SQLException {
        int nb=0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(NUMBER_BOOKING);
                ptm.setInt(1, month);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    nb=rs.getInt("nb");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return nb;
    }
    
    public int getNumberServiceType(int serviceTypeId) throws SQLException {
        int nb=0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(NUMBER_BOOKING);
                ptm.setInt(1, serviceTypeId);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    nb=rs.getInt("nb");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return nb;
    }
    
     public int getMoneyMonth(int month) throws SQLException {
        int money=0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_INCOME);
                ptm.setInt(1, month);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    money=rs.getInt("money");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return money;
    }
    
    
    
     public boolean cancelBooking(int scheduleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CANCEL_BOOKING);
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
    
    public List<BookingDetailDTO> getBookingDetailByPatientID(int id) throws SQLException {
        List<BookingDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_BOOKING_DETAIL_BY_PATIENT_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    int serviceID=rs.getInt("serviceID");
                    int scheduleID=rs.getInt("scheduleID");
                    int status=rs.getInt("status");
                    list.add(new BookingDetailDTO( serviceID,scheduleID,status,2));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
    
    public boolean checkExistBookingDetai(String date, int slotID, int drID) throws SQLException {
        List<BookingDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean check=false;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(CHECK_VALID);
                ptm.setInt(1, slotID);
                ptm.setString(2, date);
                ptm.setInt(3,drID);
                rs = ptm.executeQuery();
                if (rs.next()) {                    
                    check=true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return check;
    }
     public boolean createBookingDetail(BookingDetailDTO bkDetail) throws SQLException {
        boolean check=false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(INSERT_BOOKINGDETAIL);
                pstm.setInt(1, bkDetail.getExpectedFee());
                pstm.setInt(2, bkDetail.getServiceID());
                pstm.setInt(3, bkDetail.getScheduleID());
                pstm.setInt(4, bkDetail.getPatientID());
                pstm.setInt(5, 1);
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
    
    public List<BookingDetailDTO> getBookingDetailByDoctorID(int id) throws SQLException {
        List<BookingDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_BOOKING_DETAIL_BYDOCTORID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    int serviceID=rs.getInt("serviceID");
                    int scheduleID=rs.getInt("scheduleID");
                    list.add(new BookingDetailDTO( serviceID,scheduleID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
}
