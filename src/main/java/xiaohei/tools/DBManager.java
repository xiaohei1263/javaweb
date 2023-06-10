package xiaohei.tools;

import java.sql.*;

public class DBManager {
    private Connection conn;
    private Statement stmt = null;
    private ResultSet rs = null;

    public DBManager() {
        this.conn = this.getConnection();
    }

    // 获取连接对象
    private Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("驱动加载正常");
            String user = "sa";
            String password = "plb123plb";
            String uri = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=exam;trustServerCertificate=true";
            conn = DriverManager.getConnection(uri, user, password);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("驱动程序加载异常");

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("获取连接错误");
        }

        return conn;
    }

    //查询方法
    public ResultSet executeQuery(String sql) {
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("SQL执行查询错误");
            e.printStackTrace();//打印堆栈跟踪
        }
        return rs;
    }

    //更新方法
    public int executeUpdate(String sql) {
        int count = 0;
        try {
            stmt = conn.createStatement();
            count = stmt.executeUpdate(sql);
        } catch (SQLException e) {
            System.out.println("SQL执行更新错误");
            e.printStackTrace();//打印堆栈跟踪
        }
        return count;
    }

    // 释放资源
    public void releaseResource() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
