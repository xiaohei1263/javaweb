<%--
  Created by IntelliJ IDEA.
  User: 12632
  Date: 2023/6/6
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>登录</title>
    <%String path = request.getContextPath(); %>
    <style>
        @import url(<%=path%>/student/css/Login.css);
    </style>

</head>
<script>
    let v = decodeURI('${cookie.username.value}');
    document.getElementById("message").value = v;
</script>

<body>

<div class="login_div_1">
    <div class="login_div_2">
        <div class="login_div_3">
            <h1>登录</h1>
        </div>

        <div class="login_div_4">
            <form action="<%=path%>/UserServlet" method="post">
                <input type="hidden" name="operate" value="doLoginUser"/>
                <label>
                    昵称或邮箱
                </label>
                <label>
                    <input type="text" name="Username" class="login_form_1"/>
                </label>

                <div class="login_div_5">
                    <label class="login_label_1">
                        密码
                    </label>

                    <label>
                        <input type="password" name="Password" class="login_form_1"/>
                    </label>

                    <p style='color:red'>${message }</p>

                    <input type="submit" value="登录" class="login_form_2"/>

                    <a class="login_a_1" tabindex="0" href="<%=path%>/student/Login/ForgetPassword.jsp">忘记密码?</a>

                </div>
            </form>

        </div>
        <p class="login_p_1">
            创建新账号？
            <a href="<%=path%>/student/Login/CreateUser.jsp">Create</a>
        </p>
    </div>
</div>
</body>
</html>
