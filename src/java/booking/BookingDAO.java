/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package booking;

import bookingdetail.BookingDetailDTO;
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
public class BookingDAO {
    
    private static final String INSERT_BOOKING ="INSERT tblBookings ( [status], [patientID]) VALUES (?,?)";
    private static final String GET_NEW_ID="select TOP(1) * from tblBookings ORDER BY   bookingID DESC";
    
    
    public int getNewBkID() throws SQLException{
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int id=0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                ptm = conn.prepareStatement(GET_NEW_ID);
                  rs = ptm.executeQuery();
                while(rs.next()){
                    id=rs.getInt("bookingID");
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
        return id;
    
}
    
     public boolean createBooking(BookingDTO booking) throws SQLException {
        boolean check=false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(INSERT_BOOKING);
                pstm.setInt(1, booking.getStatus());
                pstm.setInt(2, booking.getPatientID());               
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
    
    
}
