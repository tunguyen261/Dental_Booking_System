package discounts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class DiscountDAO {

    private static final String GET_ALL_LIST_DISCOUNT = "SELECT  * FROM tblDiscounts";
    private static final String GET_LIST_DISCOUNT_SERVICE = "SELECT d.discountID, d.title, d.description, d.percentDiscount, d.status,si.image, d.createDate, d.expiredDate, d.adminID\n" +
" FROM tblDiscounts d, tblServices s, tblServiceImages si \n" +
" WHERE s.serviceID = si.serviceImageID AND s.serviceID = d.serviceID";
    private static final String SEARCH_DISCOUNT_BY_TITLE = "SELECT discountID, title, description, percentDiscount, status, createDate, expiredDate, adminID, serviceID FROM tblDiscounts WHERE title like ?";
    private static final String UPDATE_DISCOUNT = "UPDATE tblDiscounts SET percentDiscount =?, status =?, description=?, title=?, createDate=? , expiredDate=?" 
                        + " WHERE discountID =? ";
    private static final String GET_DISCOUNT_BY_SERVICE_ID= "select * from tblDiscounts WHERE expiredDate> GETDate() AND status =1 AND serviceID =?";
    private static final String CREATE_DISCOUNT = "INSERT tblDiscounts ([title], [description], [percentDiscount], [status], [createDate], [expiredDate], [adminID], [serviceID]) VALUES (?,?,?,?,?,?,?,?)";
    
    public boolean createDiscount(DiscountDTO discount) throws SQLException{
         boolean check=false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(CREATE_DISCOUNT);
                pstm.setString(1, discount.getTitle());
                pstm.setString(2, discount.getDescription());
                pstm.setInt(3, discount.getPercentDiscount());
                pstm.setInt(4, discount.getStatus());
                pstm.setString(5, discount.getCreateDate());
                pstm.setString(6, discount.getExpiredDate());
                pstm.setInt(7, discount.getAdminID());
                pstm.setInt(8, discount.getServiceID());
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
    
    
     public DiscountDTO getDiscountByServiceID(int id) throws SQLException{
        DiscountDTO ds = new DiscountDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn !=null){
                ptm = conn.prepareStatement(GET_DISCOUNT_BY_SERVICE_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while(rs.next()){
                    int discountID = rs.getInt("discountID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    int percentDiscount = rs.getInt("percentDiscount");
                    String createDate = rs.getString("createDate");
                    String expiredDate = rs.getString("expiredDate");
                    int status = 1;
                    int adminID = rs.getInt("adminID");
                    int serviceID = rs.getInt("serviceID");
                    ds= new DiscountDTO(discountID, title, description, percentDiscount, status,  createDate, expiredDate,adminID,serviceID);
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
        return ds;
    }
    
    public List<DiscountDTO> getAllListDiscount() throws SQLException {
        List<DiscountDTO> list = new ArrayList<>();

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LIST_DISCOUNT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int discountID = rs.getInt("discountID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    int percentDiscount = rs.getInt("percentDiscount");
                    int status = rs.getInt("status");
                    String createDate = rs.getString("createDate");
                    String expiredDate = rs.getString("expiredDate");
                    int adminID = rs.getInt("adminID");
                    int serviceID=rs.getInt("serviceID");
                    list.add(new DiscountDTO(discountID, title, description, percentDiscount, status, createDate, expiredDate, adminID,serviceID));
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
    
    public List<DiscountDTO> getListDiscountService() throws SQLException {
        List<DiscountDTO> list = new ArrayList<>();

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_DISCOUNT_SERVICE);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int discountID = rs.getInt("discountID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    int percentDiscount = rs.getInt("percentDiscount");
                    int status = rs.getInt("status");
                    String image = rs.getString("image");
                    String createDate = rs.getString("createDate");
                    String expiredDate = rs.getString("expiredDate");
                    int adminID = rs.getInt("adminID");
                    list.add(new DiscountDTO(discountID, title, description, percentDiscount, status, image, createDate, expiredDate, adminID));
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

    public List<DiscountDTO> searchDiscountByTitle(String name) throws SQLException {
        List<DiscountDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_DISCOUNT_BY_TITLE);
                ptm.setString(1, "%" + name + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int discountID = rs.getInt("discountID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    int percentDiscount = rs.getInt("percentDiscount");
                    int status = rs.getInt("status");
                    String createDate = rs.getString("createDate");
                    String expiredDate = rs.getString("expiredDate");
                    int adminID = rs.getInt("adminID");
                    int serviceID = rs.getInt("serviceID");
                    list.add(new DiscountDTO(discountID, title, description, percentDiscount, status, createDate, expiredDate, adminID, serviceID));
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
 
    public boolean checkDuplicate(DiscountDTO discount) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT discountID FROM tblDiscounts WHERE discountID=?";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, discount.getDiscountID());
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

     public boolean updateDiscount(DiscountDTO discount) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(UPDATE_DISCOUNT);
                pstm.setInt(1, discount.getPercentDiscount());               
                pstm.setInt(2, discount.getStatus());
                pstm.setString(3, discount.getDescription());
                pstm.setString(4, discount.getTitle());
                pstm.setString(5, discount.getCreateDate());
                pstm.setString(6, discount.getExpiredDate());
                pstm.setInt(7, discount.getDiscountID());
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
