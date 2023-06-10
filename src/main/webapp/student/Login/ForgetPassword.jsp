<%--
  Created by IntelliJ IDEA.
  User: 12632
  Date: 2023/6/8
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
    <%String path = request.getContextPath(); %>
    <style>
        @import url(<%=path%>/student/css/Login.css);
    </style>
    <script type="text/javascript">
        let v = decodeURI('${cookie.username.value}');
        document.getElementById("username").value = v;
    </script>
</head>
<body>
<div class="login_div_1">
    <div class="login_div_2 login_div_6">
        <div class="login_div_3">
            <h1>更改密码</h1>
        </div>

        <div class="login_div_4" style="font-size: 16px">
            <form action="<%=path%>/UserServlet">
                <input type="hidden" name="operate" value="doForgetUser"/>
                <label class="login_label_1">
                    Username or email address
                </label>

                <label>
                    <input type="text" name="Username" class="login_form_1"/>
                </label>

                <div class="login_div_5">
                    <label class="login_label_1">
                        邮箱:
                    </label>

                    <label>
                        <input type="password" class="login_form_3"/>
                    </label>

                    <input type="button" id="btn" class="login_form_4" value="获取验证码" onclick="settime(this)"/>
                    <label>
                        验证码:
                    </label>

                    <label>
                        <input type="text" class="login_form_1"/>
                    </label>

                </div>
                <input type="submit" value="确认" class="login_form_2"/>
                <div>${message}</div>
            </form>
        </div>
    </div>
</div>

<script>
    let countdown = 60;

    function settime(val) {
        if (countdown === 0) {
            val.removeAttribute("disabled");
            val.value = "免费获取验证码";
            countdown = 60;
        } else {
            val.setAttribute("disabled", true);
            val.value = "重新发送(" + countdown + ")";
            countdown--;
        }
        setTimeout(function () {
            settime(val)
        }, 1000)
    }
</script>
</body>
</html>
