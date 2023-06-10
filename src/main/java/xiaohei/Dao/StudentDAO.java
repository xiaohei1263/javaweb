package xiaohei.Dao;

import xiaohei.model.StudentModel;
import xiaohei.tools.DBManager;

import java.sql.ResultSet;
import java.util.ArrayList;

public class StudentDAO {
    public DBManager db;

    public StudentDAO() {
        db = new DBManager();
    }

    public Boolean AddStudent(StudentModel studentModel) {
        boolean flag = false;
        String sql = "insert into student values" +
                "('" + studentModel.GetId() + "','" + studentModel.GetName() + "','"
                + studentModel.GetAge() + "','" + studentModel.GetJspScore() + "')";
        int count = db.executeUpdate(sql);
        if (count > 0) {
            flag = true;
        }
        db.releaseResource();
        return flag;
    }

    public ArrayList QueryStudent() {
        String sql = "SELECT id,name,age,jspScore FROM student ORDER BY student.id;";
        ArrayList ArrayStudent = new ArrayList();
        ResultSet rs = db. executeQuery(sql);
        try {
            while (rs.next()) {
                StudentModel student = new StudentModel();
                student.SetId(rs.getString(1));
                student.SetName(rs.getString(2));
                student.SetAge(rs.getString(3));
                student.SetJspScore(rs.getString(4));

                ArrayStudent.add(student);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return ArrayStudent;
    }

    public Boolean ChangeStudent(StudentModel studentModel) {
        boolean flag = false;
        String sql = "UPDATE student SET name =" +
                " '" + studentModel.GetName() + "',age = '" + studentModel.GetAge() + "', " +
                "jspScore = '" + studentModel.GetJspScore() + "' where id = '" + studentModel.GetId() + "';";
        int count = db.executeUpdate(sql);
        if (count > 0) {
            flag = true;
        }
        db.releaseResource();
        return flag;
    }

    public Boolean DeleteStudent(StudentModel studentModel) {
        boolean flag = false;
        String sql = "DELETE student where id = '" + studentModel.GetId() + "';";
        int count = db.executeUpdate(sql);
        if (count > 0) {
            flag = true;
        }
        db.releaseResource();
        return flag;
    }

    public Boolean AllDeleteStudent(String[] ids) {
        boolean flag = false;
        for (String id : ids) {
            String sql = "DELETE student where id = '" + id + "'";
            DBManager db = new DBManager();
            int count = db.executeUpdate(sql);
            if (count > 0) {
                flag = true;
            }
            db.releaseResource();
        }
        return flag;
    }
}
