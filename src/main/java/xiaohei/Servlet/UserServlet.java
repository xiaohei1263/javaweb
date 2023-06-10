package xiaohei.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import xiaohei.Dao.UserDao;
import xiaohei.model.UserModel;

import java.io.IOException;
import java.lang.reflect.Method;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        doGet(request, response);
    }


    protected void doLoginUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");
        UserModel usermodel = new UserModel();
        usermodel.SetUsername(Username);
        usermodel.SetPassword(Password);

        UserDao userdao = new UserDao();
        boolean flag = userdao.LoginUser(usermodel);

        if (!flag) {
            request.setAttribute("message","账号或密码错误！");
            request.getRequestDispatcher("student/Login/Login.jsp").forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("student/Query/index.jsp");
            rd.forward(request, response);
        }
    }

    protected void doCreateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");
        UserModel usermodel = new UserModel();
        usermodel.SetUsername(Username);
        usermodel.SetPassword(Password);

        UserDao userdao = new UserDao();
        boolean flag = userdao.CreateUser(usermodel);

        if (!flag) {
            request.setAttribute("message", "用户名已被占用");
            request.getRequestDispatcher("/student/Login/CreateUser.jsp").forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/student/Login/Login.jsp");
            rd.forward(request, response);
        }
    }

    protected void doForgetUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Username = request.getParameter("Username");
        UserModel usermodel = new UserModel();
        usermodel.SetUsername(Username);

        UserDao userdao = new UserDao();
        boolean flag = userdao.ForgetUser(usermodel);

        if (!flag) {
            request.setAttribute("message", "查找不到用户");
            request.getRequestDispatcher("/student/Login/ForgetPassword.jsp?Username="+Username+"").forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/student/Login/ChangePassword.jsp?Username="+Username+"");
            rd.forward(request, response);
        }
    }
    protected void doChangePasswordUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");
        UserModel usermodel = new UserModel();
        usermodel.SetUsername(Username);
        usermodel.SetPassword(Password);

        UserDao userdao = new UserDao();
        boolean flag = userdao.ChangePasswordUser(usermodel);

        if (flag) {
            response.sendRedirect("student/Login/Login.jsp");
        } else {
            System.out.println("更改失败");
        }
    }
}
