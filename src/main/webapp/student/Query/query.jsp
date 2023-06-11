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

<body class="query_body_1">

<%
    ArrayList ArrayStudent = (ArrayList) request.getAttribute("ArrayStudent");
%>
<h1 class="h_1">学生信息查询</h1>
<form action="<%=path%>/StudentServlet" method="get">
    <table class="query_table_1">
        <tr>
            <th><label for="all"></label><input type="checkbox" id="all" onclick="setAll()"/>选择</th>
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
        <tr class="query_from_1">
            <td>
                <label>
                    <input type="checkbox" name="stuIds" value="<%=student.GetId()%>"/>
                </label>
                <%=student.GetId()%>
            </td>
            <td>
                <%=student.GetId()%>
            </td>
            <td><%=student.GetName()%>
            </td>
            <td><%=student.GetAge()%>
            </td>
            <td><%=student.GetJspScore()%>
            </td>
            <td><input type="button" id="btn" class="query_from_2" value="修改"
                       onclick='location.href=("<%=path%>/student/Changes/change.jsp?id=<%=student.GetId() %>&name=<%=student.GetName() %>&age=<%=student.GetAge() %>&jspScore=<%=student.GetJspScore() %>")'/>
            </td>
            <td>
                <input type="button" class="query_from_2" value="删除"
                       onclick='location.href=("<%=path%>/StudentServlet?operate=doDelete&id=<%=student.GetId()%>"); return ifDE()'>
        </tr>
        <%}%>
        <tr>
            <td colspan="7">
                <input type="hidden" name="operate" value="doAllDelete"/>
                <input id="delete" type="submit" class="query_from_2 query_from_3 " onclick="return ifDE()"
                       value="批量删除"/>&nbsp;&nbsp;&nbsp;
                <input type="button" name="" value="添加学生成绩记录" class="query_from_2 query_from_4"
                       onclick='location.href=("<%=path%>/student/Changes/addFrom.jsp")'>
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