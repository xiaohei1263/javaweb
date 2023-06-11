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

<body class="body_1">
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String jspScore = request.getParameter("jspScore");
%>
<h1 class="h_1">学生信息修改</h1>

<div class="query_div_2">
    <div class="query_div_3">
        <form action="<%= path %>/StudentServlet" method="get">
            <table id="tb_2">
                <tr>
                    <th>学号：</th>
                    <td>
                        <label>
                            <input type="text" name="id" class="query_from_6" value="<%=id %>" readonly/>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>姓名：</th>
                    <td>
                        <label>
                            <input type="text" name="name" class="query_from_6" value="<%=name %>"/>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>年龄：</th>
                    <td>
                        <label>
                            <input type="text" name="age" class="query_from_6" value="<%=age %>"/>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>成绩：</th>
                    <td>
                        <label>
                            <input type="text" name="jspScore" class="query_from_6" value="<%=jspScore %>"/>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="hidden" name="operate" value="doChange"/>
                        <input type="submit" value="修改" class="query_from_2 query_from_4"/>
                        <input type="reset" value="重置" class="query_from_2 query_from_4"/>
                        <input type="button" name="" value="返回" class="query_from_2 query_from_4"
                               onclick='location.href=("<%=path%>/StudentServlet?operate=doQuery")'>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
