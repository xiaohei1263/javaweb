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

<body class="query_body_1">

<h1 class="h_1">学生信息添加</h1>
<div class="query_div_2">
    <div class="query_div_3">
        <form action="<%= path %>/StudentServlet" method="get">
            <table >
                <tr>
                    <th>学号：</th>
                    <td>
                        <label>
                            <input name="id" type="text" value="" class="query_from_6"/>
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>姓名：</th>
                    <td>
                        <label>
                            <input name="name" type="text" value=""  class="query_from_6" />
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>年龄：</th>
                    <td>
                        <label>
                            <input name="age" type="text" value=""  class="query_from_6" />
                        </label>
                    </td>
                </tr>
                <tr>
                    <th>成绩：</th>
                    <td>
                        <label>
                            <input type="text" name="jspScore" value=""  class="query_from_6" />
                        </label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="hidden" name="operate" value="doAdd"/>
                        <input type="submit" value="添加" class="query_from_2 query_from_4"/>
                        <input type="reset" value="重置" class="query_from_2 query_from_4"/>
                        <input type="button" name="" value="返回" class="query_from_2 query_from_4"
                               onclick='location.href=("<%=path%>/StudentServlet?operate=doQuery")'>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
