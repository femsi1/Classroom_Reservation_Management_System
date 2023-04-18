<%--
  Created by IntelliJ IDEA.
  User: Admiral
  Date: 2017/11/28
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--shiro标签--%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!-- 顶栏 -->
<div class="container" id="top">
    <div class="row">
        <div class="col-md-12">
            <!--加入导航条标题-->
            <div class="navbar navbar-default" role="navigation">
                　<div class="navbar-header">
                　    <a href="##" class="navbar-brand">Online Classroom Reservation System (Administrator)</a>
                　</div>
                <form action="##" class="navbar-form navbar-right" rol="search">
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" style="margin-right: 20px; ">
                            <%--登录用户名--%>
                            <span class="glyphicon glyphicon-user"><shiro:principal/></span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation">
                                <a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/admin/showRoom">
                                    <span class="glyphicon glyphicon-cog pull-right"></span>
                                    Modify classroom information
                                </a>
                            </li>
                            <li role="presentation" class="divider"></li>
                            <li role="presentation">
                                <a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/admin/showReservation">
                                    <span class="glyphicon glyphicon-cog pull-right"></span>
                                    Appointment audit management
                                </a>
                            </li>
                            <!-分割线--->
                            <li role="presentation" class="divider"></li>
                            <li role="presentation">
                                <a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/logout">
                                    <span class="glyphicon glyphicon-off pull-right"></span>
                                    log out
                                </a>
                            </li>
                        </ul>
                    </div>

                </form>
            </div>

        </div>
    </div>
</div>
