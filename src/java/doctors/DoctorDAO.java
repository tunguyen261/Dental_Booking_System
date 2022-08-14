package doctors;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import doctors.DoctorDTO;

import utils.DBUtils;
import doctors.DoctorDTO;

public class DoctorDAO {

    private static final String GET_ALL_LIST_DOCTOR = "SELECT  d.doctorID, s.serviceTypeName, d.fullName,d.gender, d.gmail, d.phone, d.image, d.status, d.achievement from tblDoctors d, tblServiceTypes s WHERE d.serviceTypeID=s.serviceTypeID";
    private static final String LOGIN = "SELECT doctorID, serviceTypeID, fullName, password, roleID, gender, gmail, phone, image, status, achievement FROM tblDoctors WHERE gmail=? AND password=?";
    private static final String CHECK_DUPLICATE = "SELECT fullName FROM tblDoctors WHERE doctorID=?";
    private static final String SEARCH_DOCTOR_BY_NAME ="SELECT  d.doctorID, s.serviceTypeName, d.fullName,d.gender, d.gmail, d.phone, d.image, d.status, d.achievement from tblDoctors d, tblServiceTypes s WHERE d.serviceTypeID=s.serviceTypeID AND d.fullName like ? ";
    private static final String UPDATE_DOCTOR = "UPDATE tblDoctors SET serviceTypeID =?, achievement =?, status=?"
                        + " WHERE doctorID =? ";
    private static final String UPDATE_DOCTOR_PROFILE = "UPDATE tblDoctors SET fullName=?, password=?, gender=?, gmail=?, phone=?, image=?, serviceTypeID =?, achievement =? WHERE doctorID =?";
    private static final String CREATE_DOCTOR ="INSERT tblDoctors( [fullName], [password], [gender], [gmail], [phone], [image], [status], [roleID], [achievement], [serviceTypeID]) VALUES (?,?,?,?,?,?,?,?,?,?)";
    private static final String SEARCH_DOCTOR_BY_ID ="SELECT  d.doctorID, s.serviceTypeName, d.fullName,d.gender, d.gmail, d.phone, d.image, d.status ,d.achievement from tblDoctors d, tblServiceTypes s WHERE d.serviceTypeID=s.serviceTypeID AND d.doctorID=? ";
    private static final String GET_ALL_LIST_DOCTOR2 = "SELECT  * FROM tblDoctors";
    private static final String COUNT_BOOKING_OF_DOCTOR= "SELECT d.doctorID, COUNT(d.doctorID) AS nb FROM tblDoctors d, tblSchedules s, tblBookingDetails b WHERE b.status=2 AND d.doctorID = s.doctorID AND s.scheduleID = b.scheduleID GROUP BY d.doctorID ORDER BY COUNT(d.doctorID) DESC";
    
    public ArrayList getCountBookingOfDoctor() throws SQLException {
        int nb=0;
        int id=0;
        ArrayList listCountAndID= new ArrayList<>();
        
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(COUNT_BOOKING_OF_DOCTOR);
                rs = ptm.executeQuery();
                while (rs.next()) {  
                    id=rs.getInt("doctorID");
                    listCountAndID.add(id);
                    nb=rs.getInt("nb");
                    listCountAndID.add(nb);
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
        return listCountAndID;
    } 
    
    public DoctorDTO getDoctorByID(int id) throws SQLException{
        DoctorDTO dr = new DoctorDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn !=null){
                ptm = conn.prepareStatement(SEARCH_DOCTOR_BY_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while(rs.next()){
                    int doctorID = rs.getInt("doctorID");
                    String serviceTypeName=rs.getString("serviceTypeName");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String gender = rs.getString("gender");
                    String gmail = rs.getString("gmail");
                    int phone = rs.getInt("phone");
                    String image = rs.getString("image");
                    int status =rs.getInt("status");
                    String roleID="DR";
                    String achievement = rs.getString("achievement");
                    dr=new DoctorDTO(doctorID, serviceTypeName, fullName, password, roleID, gender, gmail, phone, image, status, achievement);
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
        return dr;
    }
    
    public List<DoctorDTO> getAllListDoctor2() throws SQLException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LIST_DOCTOR2);
                rs= ptm.executeQuery();
                while (rs.next()) {
                    int doctorID = rs.getInt("doctorID");
                    String serviceTypeName=String.valueOf(rs.getInt("serviceTypeID"));
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String gender = rs.getString("gender");
                    String gmail = rs.getString("gmail");
                    int phone = rs.getInt("phone");
                    String image = rs.getString("image");
                    int status =rs.getInt("status");
                    String roleID="DR";
                    String achievement = rs.getString("achievement");
                    list.add(new DoctorDTO(doctorID, serviceTypeName, fullName, password, roleID, gender, gmail,phone ,image,status, achievement));
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
    
    
    public boolean createDoctor(DoctorDTO doctor) throws SQLException{
         boolean check=false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(CREATE_DOCTOR);
                pstm.setString(1, doctor.getFullName());
                pstm.setString(2, doctor.getPassword());
                pstm.setString(3, doctor.getGender());
                pstm.setString(4, doctor.getGmail());
                pstm.setInt(5, doctor.getPhone());
                pstm.setString(6, doctor.getImage());
                pstm.setInt(7, doctor.getStatus());
                pstm.setString(8, doctor.getRoleID());
                pstm.setString(9, doctor.getAchievement());
                pstm.setString( 10,doctor.getServiceTypeName());
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
    private static final String SET_DOCTOR_OFF= "UPDATE tblDoctors SET status = 0 WHERE doctorID=?";

    public boolean setDoctorOff(int id) throws SQLException{
        boolean check=false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(SET_DOCTOR_OFF);
                pstm.setInt(1, id);
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
    public boolean updateDoctorProfile(DoctorDTO doctor) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(UPDATE_DOCTOR_PROFILE);
                pstm.setString(1, doctor.getFullName());
                pstm.setString(2, doctor.getPassword());  
                pstm.setString(3, doctor.getGender());
                pstm.setString(4, doctor.getGmail());
                pstm.setInt(5, doctor.getPhone());
                pstm.setString(6, doctor.getImage());
                pstm.setString(7, doctor.getServiceTypeName());
                pstm.setString(8, doctor.getAchievement());
                pstm.setInt(9, doctor.getDoctorID());
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
    
     public boolean updateDoctor(DoctorDTO doctor) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(UPDATE_DOCTOR);
                pstm.setString(1, doctor.getServiceTypeName());
                pstm.setString(2, doctor.getAchievement());  
                pstm.setInt(3, doctor.getStatus());
                pstm.setInt(4, doctor.getDoctorID());
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
    
    
    public List<DoctorDTO> searchDoctorByName(String name) throws SQLException{
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn !=null){
                ptm = conn.prepareStatement(SEARCH_DOCTOR_BY_NAME);
                ptm.setString(1, "%"+name+"%");
                rs = ptm.executeQuery();
                while(rs.next()){
                    int doctorID = rs.getInt("doctorID");
                    String serviceTypeName=rs.getString("serviceTypeName");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String gender = rs.getString("gender");
                    String gmail = rs.getString("gmail");
                    int phone = rs.getInt("phone");
                    String image = rs.getString("image");
                    int status =rs.getInt("status");
                    String roleID="DR";
                    String achievement = rs.getString("achievement");
                    list.add(new DoctorDTO(doctorID, serviceTypeName, fullName, password, roleID, gender, gmail, phone, image, status,achievement));
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
    
    public List<DoctorDTO> getAllListDoctor() throws SQLException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LIST_DOCTOR);
                rs= ptm.executeQuery();
                while (rs.next()) {
                    int doctorID = rs.getInt("doctorID");
                    String serviceTypeName=rs.getString("serviceTypeName");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String gender = rs.getString("gender");
                    String gmail = rs.getString("gmail");
                    int phone = rs.getInt("phone");
                    String image = rs.getString("image");
                    int status =rs.getInt("status");
                    String roleID="DR";
                    String achievement = rs.getString("achievement");
                    list.add(new DoctorDTO(doctorID, serviceTypeName, fullName, password, roleID, gender, gmail, phone, image, status, achievement));
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
    
    public DoctorDTO checkLogin(String gmail, String password) throws SQLException {
        DoctorDTO doctor = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, gmail);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int doctorID = rs.getInt("doctorID");
                    String serviceTypeName = rs.getString("serviceTypeID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String gender = rs.getString("gender");
                    int phone = rs.getInt("phone");
                    String image = rs.getString("image");
                    int status = rs.getInt("status");
                    String achievement = rs.getString("achievement");
                    doctor = new DoctorDTO(doctorID, serviceTypeName, fullName, password, roleID, gender, gmail, phone, image, status, achievement);
                }
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
        return doctor;
    }
    
    public boolean checkDuplicate(String doctorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, doctorID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(ptm != null) {
                ptm.close();
            }
            if(conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean checkDuplicate (DoctorDTO doctor) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                String sql = "SELECT doctorID FROM tblDoctors WHERE doctorID=?";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, doctor.getDoctorID());
                rs = ptm.executeQuery();
                if(rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(ptm != null) {
                ptm.close();
            }
            if(conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
}
