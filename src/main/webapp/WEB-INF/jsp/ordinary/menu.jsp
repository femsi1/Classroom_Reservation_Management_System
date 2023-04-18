<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav">
        <li><a href="${pageContext.request.contextPath}/ordinary/showRoom">Classroom information<sapn class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/ordinary/showRecord">Appointment record inquiry<span class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/ordinary/reserveRoom">Book a classroom<sapn class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/ordinary/cancelApplication?user=<shiro:principal/>">Cancellation request<sapn class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/ordinary/showUser">Personal information modification<sapn class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/logout">Exit system<sapn class="glyphicon glyphicon-log-out pull-right" /></a></li>
        <%--<li class="disabled"><a href="##">Responsive</a></li>--%>
    </ul>
</div>