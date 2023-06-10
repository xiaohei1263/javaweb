<%@ page import="java.util.ArrayList" %>
<%@ page import="xiaohei.model.StudentModel" %>
<%--
  Created by IntelliJ IDEA.
  User: 12632
  Date: 2023/6/5
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>学生管理系统</title>
    <%String path = request.getContextPath(); %>
    <style>
        @import url(<%=path%>/student/css/style.css);
    </style>
</head>

<body id="body_1">

<%
    ArrayList ArrayStudent = (ArrayList) request.getAttribute("ArrayStudent");
%>
<div id="div_1"></div>
<h1 id="h_1">学生信息查询</h1>
<div id="div_1"></div>
<form action="<%=path%>/StudentServlet" method="get">
    <table class="tb_1">
        <tr>
            <th>
                <label for="all"></label><input type="checkbox" id="all" onclick="setAll()"/>选择
            </th>
            <th>学号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>成绩</th>
            <th colspan="2">操作</th>
        </tr>
        <%
            for (Object o : ArrayStudent) {
                StudentModel student = (StudentModel) o;
        %>
        <tr class="tr_1">
            <td>
                <label>
                    <input type="checkbox" name="stuIds" value="<%=student.GetId()%>"/>
                </label>
                <%=student.GetId()%>
            </td>

            <td>
                <%=student.GetId()%>
            </td>

            <td>
                <%=student.GetName()%>
            </td>

            <td>
                <%=student.GetAge()%>
            </td>

            <td>
                <%=student.GetJspScore()%>
            </td>

            <td>
                <a class="all_a"
                   href="<%=path%>/student/Changes/change.jsp?id=<%=student.GetId() %>&name=<%=student.GetName() %>&age=<%=student.GetAge() %>&jspScore=<%=student.GetJspScore() %>">修改</a>
            </td>

            <td>
                <a class="all_a" href="<%=path%>/StudentServlet?operate=doDelete&id=<%=student.GetId()%>"
                   onclick="return ifDE()">删除</a>
            </td>

        </tr>

        <%}%>
        <tr>
            <td colspan="7">
                <input type="hidden" name="operate"  value="doAllDelete"/>
                <input id="delete" type="submit" onclick="return ifDE()" value="批量删除"/>&nbsp;&nbsp;&nbsp;
                <a class="all_a" href="<%=path%>/student/Changes/addFrom.jsp">添加学生成绩记录</a>
            </td>
        </tr>

    </table>
</form>
</body>
<script type="text/javascript">
    function ifDE() {
        return window.confirm("你确定要删除吗？");
    }

    function setAll() {
        let all = document.getElementById("all");
        let stuIds = document.getElementsByName("stuIds");
        for (let i = 0; i < stuIds.length; i++) {
            stuIds[i].checked = all.checked;
        }
    }
</script>
</html>