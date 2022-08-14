package patients;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;
import patients.PatientDTO;

public class PatientDAO {

    private static final String GET_ALL_LIST_PATIENT = "SELECT  * FROM tblPatients";
    private static final String LOGIN = "SELECT patientID, fullName, password, roleID, gmail, phone, address, gender, status FROM tblPatients WHERE gmail=? AND password=?";
    private static final String LOGIN_BY_GMAIL = "SELECT patientID, fullName, password, roleID, gmail, phone, address, gender, status FROM tblPatients WHERE gmail=?";
    private static final String SEARCH_PATIENT = "SELECT Patient,fullName,roleID FROM tblUsers WHERE fullName like ?";
    private static final String UPDATE_PATIENT = "UPDATE tblPatients SET status=?"
            + " WHERE patientID =? ";
    private static final String SEARCH_PATIENT_BY_NAME = "SELECT patientID, fullName, password, roleID, gmail, phone, address, gender, status FROM tblPatients WHERE fullName like ?";
    private static final String CHECK_DUPLICATE = "SELECT fullName FROM tblPatients WHERE patientID=?";
    private static final String CHECK_DUPLICATE_GMAIL = "SELECT * FROM tblPatients WHERE gmail= ?";
    private static final String REGISTER_USER = "INSERT tblPatients ([fullName], [password], [gmail], [phone], [address], [gender], [status], [roleID]) VALUES (?,?,?,?,?,?,?,?)";
    private static final String REGISTER_USER_BY_GMAIL = "INSERT tblPatients ([fullName], [gmail], [status],[roleID] ) VALUES (?,?,?,'PA')";
    private static final String CHECKDUPLICATE_ID = "select * from tblPatients where patientID = ?";
    private static final String LOGIN_BY_ID = "SELECT patientID, fullName, password, roleID, gmail, phone, address, gender, status FROM tblPatients WHERE patientID=?";
    private static final String UPDATE_PATIENT_PROFILE="UPDATE tblPatients SET fullName=?, password=? , gmail=?, phone=?, address=?, gender=? WHERE patientID =? ";
    private static final String GET_PATIENT_BY_PATIENT_ID = "SELECT patientID, fullName, password, roleID, gmail, phone, address, gender, status FROM tblPatients WHERE patientID=?";
    private static final String GET_PATIENT_PROFILE_BY_PATIENT_ID = "SELECT patientID, fullName, password, roleID, gmail, phone, address, gender, status FROM tblPatients WHERE patientID=?";
    
    public boolean updatePatientProfile(PatientDTO patient) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(UPDATE_PATIENT_PROFILE);
                pstm.setString(1, patient.getFullName());
                pstm.setString(2, patient.getPassword());
                pstm.setString(3, patient.getGmail());
                pstm.setInt(4, patient.getPhone());
                pstm.setString(5, patient.getAddress());
                pstm.setString(6, patient.getGender());
                pstm.setInt(7, patient.getPatientID());
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
    
     public PatientDTO getPatientProfileByPatientID(int id) throws SQLException {
        PatientDTO patient = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PATIENT_PROFILE_BY_PATIENT_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int patientID = rs.getInt("patientID");
                    String fullName = rs.getString("fullName");   
                    String password = rs.getString("password");  
                    String roleID = "PA";
                    String gmail = rs.getString("gmail");
                    String address = rs.getString("address");
                    String gender = rs.getString("gender");
                    int phone = rs.getInt("phone");
                    patient = new PatientDTO(patientID, fullName, password, roleID, gmail, phone, address, gender, 1);
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
        return patient;
    }
     
     public PatientDTO getPatientByPatientID(int id) throws SQLException {
        PatientDTO patient = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PATIENT_BY_PATIENT_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int patientID = rs.getInt("patientID");
                    String fullName = rs.getString("fullName");   
                    String gmail = rs.getString("gmail");  
                    patient = new PatientDTO(patientID, fullName, gmail,"PA");
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
        return patient;
    }
    
    public PatientDTO checkLoginByID(long id) throws SQLException {
        PatientDTO patient = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN_BY_ID);
                ptm.setLong(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int patientID = rs.getInt("patientID");
                    String fullName = rs.getString("fullName");
                    String gmail=rs.getString("gmail");
                    patient = new PatientDTO(patientID, fullName, gmail,"PA");
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
        return patient;
    }
    
     public boolean checkDuplicateByID(long id) throws SQLException {
        List<PatientDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean check=false;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(CHECKDUPLICATE_ID);
                ptm.setLong(1, id);        
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
    
    
    public boolean registerUserbyGmail(PatientDTO patient) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String name=patient.getFullName();
                String email=patient.getGmail();
                pstm = conn.prepareStatement(REGISTER_USER_BY_GMAIL);
                pstm.setString(1, name);
                pstm.setString(2,email);
                pstm.setInt(3, 1);
                check = pstm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                pstm.close();
            }
        }
        return check;
    }
    
    
     public PatientDTO checkLoginByGmail(String gmail) throws SQLException {
        PatientDTO patient = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN_BY_GMAIL);
                ptm.setString(1, gmail);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int patientID = rs.getInt("patientID");
                    String fullName = rs.getString("fullName");   
                    patient = new PatientDTO(patientID, fullName, gmail,"PA");
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
        return patient;
    }
    
    public boolean checkDuplicateGmail (String gmail) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_GMAIL);
                ptm.setString(1, gmail);
                rs = ptm.executeQuery();
                if (rs.next()) {                    
                    check=true;
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
        return check;
    }
    
    public boolean registerUser(PatientDTO patient) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(REGISTER_USER);
                pstm.setString(1, patient.getFullName());
                pstm.setString(2, patient.getPassword());
                pstm.setString(3, patient.getGmail());
                pstm.setInt(4, patient.getPhone());
                pstm.setString(5, patient.getAddress());
                pstm.setString(6, patient.getGender());
                pstm.setInt(7, patient.getStatus());
                pstm.setString(8, patient.getRoleID());
                check = pstm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                pstm.close();
            }
        }
        return check;
    }

    public PatientDTO checkLogin(String gmail, String password) throws SQLException {
        PatientDTO patient = null;
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
                    int patientID = rs.getInt("patientID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    int phone = rs.getInt("phone");
                    String address = rs.getString("address");
                    String gender = rs.getString("gender");
                    int status = rs.getInt("status");
                    patient = new PatientDTO(patientID, fullName, password, roleID, gmail, phone, address, gender, status);
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
        return patient;
    }

    public List<PatientDTO> getAllListPatient() throws SQLException {
        List<PatientDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LIST_PATIENT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int patientID = rs.getInt("patientID");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String roleID = "PA";
                    String gmail = rs.getString("gmail");
                    int phone = rs.getInt("phone");
                    String address = rs.getString("address");
                    String gender = rs.getString("gender");
                    int status = rs.getInt("status");
                    list.add(new PatientDTO(patientID, fullName, password, roleID, gmail, phone, address, gender, status));
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

    public boolean updatePatient(PatientDTO patient) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(UPDATE_PATIENT);
                pstm.setInt(1, patient.getStatus());
                pstm.setInt(2, patient.getPatientID());
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

    public List<PatientDTO> searchPatientByName(String name) throws SQLException {
        List<PatientDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PATIENT_BY_NAME);
                ptm.setString(1, "%" + name + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int patientID = rs.getInt("patientID");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String gmail = rs.getString("gmail");
                    int phone = rs.getInt("phone");
                    String address = rs.getString("address");
                    String gender = rs.getString("gender");
                    int status = rs.getInt("status");
                    String roleID = "PA";
                    list.add(new PatientDTO(patientID, fullName, password, roleID, gmail, phone, address, gender, status));
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

    public boolean checkDuplicate(String patientID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, patientID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public List<PatientDTO> getListUser(String search) throws SQLException {
        List<PatientDTO> listPatient = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PATIENT);
            }
        } catch (Exception e) {
        }
        return listPatient;
    }
}
