package xiaohei.Dao;

import xiaohei.model.UserModel;
import xiaohei.tools.DBManager;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
    public DBManager db;

    public UserDao() {
        db = new DBManager();
    }

    public Boolean LoginUser(UserModel usermodel) {
        boolean flag = false;
        String sql = "SELECT *FROM Username where username = '" + usermodel.GetUsername() + "'" +
                "and password = '" + usermodel.GetPassword() + "'";
        ResultSet rs = db.executeQuery(sql);
        try {
            if (rs.next())
                flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean CreateUser(UserModel usermodel) {
        boolean flag = false;
        String sql = "SELECT *FROM Username where username = '" + usermodel.GetUsername() + "'";
        ResultSet rs = db.executeQuery(sql);
        try {
            if (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        sql = "INSERT INTO Username(username, password) VALUES ('" + usermodel.GetUsername() + "','" + usermodel.GetPassword() + "');";
        int count = db.executeUpdate(sql);
        if (count > 0) {
            flag = true;
        }
        db.releaseResource();
        return flag;
    }

    public Boolean ForgetUser(UserModel usermodel) {
        boolean flag = false;
        String sql = "SELECT *FROM Username where username = '" + usermodel.GetUsername() + "'";
        ResultSet rs = db.executeQuery(sql);
        try {
            if (rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean ChangePasswordUser(UserModel usermodel) {
        boolean flag = false;
        String sql = "UPDATE  Username SET password = '" + usermodel.GetPassword() + "' where username ='"+usermodel.GetUsername()+"'";
        int count = db.executeUpdate(sql);
        if (count > 0) {
            flag = true;
        }
        db.releaseResource();
        return flag;
    }
}
