<%--
  Created by IntelliJ IDEA.
  User: 12632
  Date: 2023/6/4
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>添加</title>
    <%String path = request.getContextPath(); %>
    <style>
        @import url(<%=path%>/student/css/style.css);
    </style>

</head>

<body id="body_1">

<div style="background-color:#284ae0; height:10px;"></div>

<h1 id="h_1">学生信息添加</h1>

<div style="background-color:#284ae0; height:10px; margin-bottom:20px"></div>

<form action="<%= path %>/StudentServlet" method="get">
    <table id="tb_2">
        <tr>
            <th>学号：</th>
            <td>
                <label>
                    <input name="id" type="text" value=""/>
                </label>
            </td>
        </tr>
        <tr>
            <th>姓名：</th>
            <td>
                <label>
                    <input name="name" type="text" value=""/>
                </label>
            </td>
        </tr>
        <tr>
            <th>年龄：</th>
            <td>
                <label>
                    <input name="age" type="text" value=""/>
                </label>
            </td>
        </tr>
        <tr>
            <th>成绩：</th>
            <td>
                <label>
                    <input type="text" name="jspScore" value=""/>
                </label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="hidden" name="operate" value="doAdd"/>
                <input type="submit" value="添加"/>
                <input type="reset" value="重置"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path%>/StudentServlet?operate=doQuery">返回查询页面</a>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
