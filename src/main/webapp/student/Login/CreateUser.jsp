<%--
  Created by IntelliJ IDEA.
  User: 12632
  Date: 2023/6/8
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>注册</title>
    <%String path = request.getContextPath(); %>
    <style>
        @import url(<%=path%>/student/css/Login.css);
    </style>
    <script type="text/javascript">
        function checkpassword() {
            let password = document.getElementById("pw").value;
            let repassword = document.getElementById("repw").value;

            if (password.length < 6){
                document.getElementById("length").innerHTML = "<span style='color: #1f883d'>密码少于六位</span>";
                document.getElementById("submit").disabled = false;
            }else{
                document.getElementById("length").innerHTML = "<span style='color: red'></span>";
            }

            if (password == repassword) {
                document.getElementById("diff").innerHTML = "<span style='color: red'></span>";
                document.getElementById("submit").disabled = false;

            } else {
                document.getElementById("diff").innerHTML = "<span style='color: red'>两次密码输入不一致!</span>";
                document.getElementById("submit").disabled = true;
            }
        }
        let v = decodeURI('${cookie.username.value}');
        document.getElementById("username").value = v;
    </script>
</head>
<body>
<div class="login_div_1">
    <div class="login_div_2 login_div_6">
        <div class="login_div_3">
            <h1>创建账号</h1>
        </div>

        <div class="login_div_4">
            <form action="<%=path%>/UserServlet">
                <input type="hidden" name="operate" value="doCreateUser"/>
                <label class="login_label_1">
                    昵称
                </label>

                <label>
                    <input type="text" name="Username" class="login_form_1"/>
                </label>

                <div class="login_div_5">
                    <label class="login_label_1">
                        密码
                        <span id="length"></span>
                    </label>

                    <label for="pw">
                        <input type="password" id="pw" name="Password" placeholder="密码(不少于6位)" onkeyup="checkpassword()" class="login_form_1">
                    </label>

                    <label>
                        再次输入密码
                    </label>

                    <label for="repw">
                        <input type="password" id="repw" name="repassword" placeholder="密码(不少于6位)" onkeyup="checkpassword()" class="login_form_1">
                    </label>

                    <span id="diff"></span>

                    <input type="submit" id="submit" value="注册" class="login_form_2"/>
                    <div>${message}</div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
