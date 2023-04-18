<%--
  Created by IntelliJ IDEA.
  User: hanmeng
  Date: 2022-12-30
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to register</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>

<div class="form-div">
    <div class="reg-content">
        <h1>Welcome to register</h1>
        <span>Have an account?</span> <a href="${pageContext.request.contextPath}/login">Log in</a>
    </div>
    <form id="reg-form" action="${pageContext.request.contextPath}/register" method="post">

        <table>

            <tr>
                <td>Username</td>
                <td class="inputs">
                    <input name="username" type="text" id="username">
                    <br>
                    <span id="username_err" class="err_msg">${message}</span>
                </td>

            </tr>

            <tr>
                <td>password</td>
                <td class="inputs">
                    <input name="password" type="password" id="password">
                    <br>
                    <span id="password_err" class="err_msg" style="display: none">Incorrect password format</span>
                </td>
            </tr>

            <tr>
                <td>Verification code</td>
                <td class="inputs">
                    <input name="checkCode" type="text" id="checkCode">
                    <img src="${pageContext.request.contextPath}/checkcode" id="checkCodeImg">
                    <a href="#" id="changeImg">Can't see?</a>
                </td>
            </tr>

        </table>

        <div class="buttons">
            <input value="register" type="submit" id="reg_btn">
        </div>
        <br class="clear">
    </form>

</div>
</body>

<script>
    document.getElementById("changeImg").onclick = function () {
        // 加一个时间，避免图片缓存
        document.getElementById("checkCodeImg").src = "${pageContext.request.contextPath}/checkcode?"+new Date().getMilliseconds();
    }
</script>
</html>
