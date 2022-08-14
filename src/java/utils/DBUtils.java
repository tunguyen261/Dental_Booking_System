
package utils;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {
    public static Connection getConnection() throws SQLException, ClassNotFoundException{
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;database=DentistBookingApp";
        conn = DriverManager.getConnection(url,"sa","123");
        return conn;
    }
}
