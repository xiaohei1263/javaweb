import xiaohei.tools.DBManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args){
        DBManager db = new DBManager();
        ResultSet rs = db.executeQuery("SELECT *FROM Username where username = 'xiaohei1263'  and  password = 'plb123plb'");
        while (true) {
            try {
                if (!rs.next()) break;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                System.out.println(rs.getString(1));
                System.out.println(rs.getString(2));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}