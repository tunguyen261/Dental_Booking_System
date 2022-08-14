/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package serviceImage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import patients.PatientDTO;
import utils.DBUtils;

/**
 *
 * @author Doan
 */
public class ServiceImageDAO {

    public String GET_IMAGE_BY_SERVICE_ID = "select image, serviceID from tblServiceImages WHERE serviceID = ?";
    public String DELETE_IMAGE_BY_IMG_ID = "DELETE FROM tblServiceImages WHERE serviceImageID= ?";
    public String CREATE_IMAGE_BY_IMG_ID = "INSERT INTO tblServiceImages (image, serviceID ) VALUES (?,?);";
    
    public boolean createImage(ServiceImageDTO img) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(CREATE_IMAGE_BY_IMG_ID);
                pstm.setString(1, img.getImage());
                pstm.setInt(2, img.getServiceID());
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
    
    public boolean deleteImg(int id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_IMAGE_BY_IMG_ID);
                ptm.setInt(1, id);
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
    
    public List<ServiceImageDTO> getImageByServiceID(int id) throws SQLException {
        List<ServiceImageDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_IMAGE_BY_SERVICE_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    int serviceID = rs.getInt("serviceID");
                    list.add(new ServiceImageDTO(image, serviceID));
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
    
    //lay het image serviceimage theo service
     public List<ServiceImageDTO> getAllListServiceImage() throws SQLException {
        List<ServiceImageDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                String url = "select si.serviceImageID, s.serviceID, si.image from tblServiceImages si, tblServices s WHERE s.serviceID = si.serviceID";
                ptm = conn.prepareStatement(url);
                rs= ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    int serviceID = rs.getInt("serviceID");
                    int imageID= rs.getInt("serviceImageID");
                    list.add(new ServiceImageDTO(image, serviceID,imageID));
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
