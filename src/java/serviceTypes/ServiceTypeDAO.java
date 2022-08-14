package serviceTypes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import services.ServiceType;
import utils.DBUtils;
import serviceTypes.ServiceTypeDTO;
public class ServiceTypeDAO {

       public List<ServiceTypeDTO> getListServiceType() throws SQLException {
        List<ServiceTypeDTO> getListServiceType = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                getListServiceType = new ArrayList<>();
                String sql = " SELECT serviceTypeID, serviceTypeName "
                        + " FROM tblServiceTypes ";
                pstm = conn.prepareStatement(sql);
                resultSet = pstm.executeQuery();
                while (resultSet.next()) {
                    int serviceTypeID = resultSet.getInt("serviceTypeID");
                    String serviceTypeName = resultSet.getString("serviceTypeName");
                    getListServiceType.add(new ServiceTypeDTO(serviceTypeID, serviceTypeName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return getListServiceType;
    }

}
