<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav">
        <li><a href="${pageContext.request.contextPath}/admin/showRoom">Classroom information management<span class="glyphicon glyphicon-pencil pull-right"/></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/showReservation">Appointment audit management<span class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/showRecord">Appointment record inquiry<span class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/showRecordReject">The reservation record query was rejected<span class="glyphicon glyphicon-pencil pull-right" /></a></li>

        <li><a href="${pageContext.request.contextPath}/admin/userRegister">User registration management<sapn class="glyphicon glyphicon-repeat pull-right" /></a></li>
       <li><a href="${pageContext.request.contextPath}/admin/showUser">Modify personal information<sapn class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/logout">Exit system<sapn class="glyphicon glyphicon-log-out pull-right" /></a></li>
        <%--<li class="disabled"><a href="##">Responsive</a></li>--%>
    </ul>
</div>