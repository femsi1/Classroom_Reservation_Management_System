<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--开启el表达式--%>
<%@ page  isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
    <title>错误提示</title>
</head>
<body>
    <h1>${message}</h1>
    <a href="<%=basePath%>login/index">重新登录</a>
</body>
</html>
