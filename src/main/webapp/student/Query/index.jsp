<%--
  Created by IntelliJ IDEA.
  User: 12632
  Date: 2023/6/6
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
        <%String path = request.getContextPath(); %>
    <title>$Title$</title>
</head>

<body>
<%response.sendRedirect(""+path+"/StudentServlet?operate=doQuery"); %>
</body>
</html>
