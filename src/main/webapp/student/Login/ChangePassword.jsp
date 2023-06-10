<%--
  Created by IntelliJ IDEA.
  User: 12632
  Date: 2023/6/8
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>忘记密码</title>
    <%String path = request.getContextPath(); %>
    <style>
        @import url(<%=path%>/student/css/Login.css);
    </style>
    <script type="text/javascript">
        function checkpassword() {
            let password = document.getElementById("pw").value;
            let repassword = document.getElementById("repw").value;

            if (password.length < 6) {
                document.getElementById("length").innerHTML = "<span style='color: #1f883d'>密码少于六位</span>";
                document.getElementById("submit").disabled = false;
            } else {
                document.getElementById("length").innerHTML = "<span style='color: red'></span>";
            }

            if (password === repassword) {
                document.getElementById("diff").innerHTML = "<span style='color: #1f883d'>两次密码输入一致</span>";
                document.getElementById("submit").disabled = false;

            } else {
                document.getElementById("diff").innerHTML = "<span style='color: red'>两次密码输入不一致!</span>";
                document.getElementById("submit").disabled = true;
            }
        }
    </script>
</head>
<body>
<div class="login_div_1">
    <div class="login_div_2 login_div_6">
        <div class="login_div_3">
            <h1>更改密码</h1>
        </div>
        <div class="login_div_4">
            <form action="<%=path%>/UserServlet?">
                <input type="hidden" name="operate" value="doChangePasswordUser"/>
                <input type="hidden" name="Username" value="<%=request.getParameter("Username")%>"/>

                <div class="login_div_5">
                    <label class="login_label_1">
                        密码:
                        <span id="length"></span>
                    </label>
                    <input type="password" id="pw" name="Password" placeholder="密码(不少于6位)"
                           onkeyup="checkpassword()" class="login_form_1">
                    <label class="login_label_1">
                        确认密码:
                    </label>
                    <input type="password" id="repw" name="repassword" placeholder="密码(不少于6位)"
                           onkeyup="checkpassword()" class="login_form_1">

                    <span id="diff"></span>

                    <input type="submit" id="submit" value="确定" class="login_form_2"/>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
