<%--
  Created by IntelliJ IDEA.
  User: 12632
  Date: 2023/6/4
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>修改</title>
    <%String path = request.getContextPath(); %>
    <style>
        @import url(<%=path%>/student/css/style.css);
    </style>
</head>

<body id="body_1">
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String jspScore = request.getParameter("jspScore");
%>
<h1 id="h_1">学生信息修改</h1>

<div style="background-color:#284ae0; height:10px;margin-bottom:20px;"></div>

<form action="<%= path %>/StudentServlet" method="get">
    <table id="tb_2">
        <tr>
            <th>学号：</th>
            <td>
                <label>
                    <input type="text" name="id" value="<%=id %>" readonly/>
                </label>
                <span style="color:red;">*学号为只读</span>
            </td>
        </tr>
        <tr>
            <th>姓名：</th>
            <td>
                <label>
                    <input type="text" name="name" value="<%=name %>"/>
                </label>
            </td>
        </tr>
        <tr>
            <th>年龄：</th>
            <td>
                <label>
                    <input type="text" name="age" value="<%=age %>"/>
                </label>
            </td>
        </tr>
        <tr>
            <th>成绩：</th>
            <td>
                <label>
                    <input type="text" name="jspScore" value="<%=jspScore %>"/>
                </label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="hidden" name="operate" value="doChange"/>
                <input type="submit" value="修改"/>
                <input type="reset" value="重置"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="all_a" href="<%=path%>/StudentServlet?operate=doQuery">返回查询页面</a></td>
        </tr>
    </table>
</form>
</body>
</html>
