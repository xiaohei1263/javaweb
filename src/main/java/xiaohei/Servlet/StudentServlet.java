package xiaohei.Servlet;

import xiaohei.Dao.StudentDAO;
import xiaohei.model.StudentModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String operateName = request.getParameter("operate");
        Method method;
        try {
            method = getClass().getDeclaredMethod(operateName, HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   {

    }

    @SuppressWarnings("rawtypes")
    protected void doQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        StudentDAO studentDAO = new StudentDAO();
        ArrayList ArrayStudent = studentDAO.QueryStudent();
        request.setAttribute("ArrayStudent", ArrayStudent);
        RequestDispatcher rd = request.getRequestDispatcher("student/Query/query.jsp");
        rd.forward(request, response);
    }

    protected void doAdd(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String jspScore = request.getParameter("jspScore");

        StudentModel studentModel = new StudentModel();
        studentModel.SetId(id);
        studentModel.SetName(name);
        studentModel.SetAge(age);
        studentModel.SetJspScore(jspScore);

        StudentDAO studentDAO = new StudentDAO();
        boolean flag = studentDAO.AddStudent(studentModel);

        if (flag) {
            response.sendRedirect("student/Query/index.jsp");
        } else {
            System.out.println("添加失败");
        }
    }

    protected void doChange(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String jspScore = request.getParameter("jspScore");

        StudentDAO studentDAO = new StudentDAO();
        StudentModel studentModel = new StudentModel();

        studentModel.SetId(id);
        studentModel.SetName(name);
        studentModel.SetAge(age);
        studentModel.SetJspScore(jspScore);

        boolean flag = studentDAO.ChangeStudent(studentModel);
        //跳转
        if (flag) {
            response.sendRedirect("student/Query/index.jsp");
        } else {
            System.out.println("更改失败");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        StudentDAO studentDAO = new StudentDAO();
        StudentModel studentModel = new StudentModel();

        studentModel.SetId(id);

        boolean flag = studentDAO.DeleteStudent(studentModel);
        //跳转
        if (flag) {
            response.sendRedirect("student/Query/index.jsp");
        } else {
            System.out.println("删除失败");
        }
    }

    protected void doAllDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String[] ids = request.getParameterValues("stuIds");
        StudentDAO studentDAO = new StudentDAO();
        boolean flag = studentDAO.AllDeleteStudent(ids);
        if (flag) {
            response.sendRedirect("student/Query/index.jsp");
        }
        else {
            System.out.println("删除失败");
        }
    }
}
