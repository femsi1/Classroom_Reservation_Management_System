<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav">
        <li><a href="${pageContext.request.contextPath}/admin/showRoom">Manage classroom<span class="glyphicon glyphicon-pencil pull-right"/></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/showReservation">Reservation management<span class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/showRecord">Reservation record history<span class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/showRecordReject">Rejected reservation record<span class="glyphicon glyphicon-pencil pull-right" /></a></li>

        <li><a href="${pageContext.request.contextPath}/admin/userRegister">Register user<sapn class="glyphicon glyphicon-repeat pull-right" /></a></li>
       <li><a href="${pageContext.request.contextPath}/admin/showUser">Modify personal information<sapn class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/logout">Exit system<sapn class="glyphicon glyphicon-log-out pull-right" /></a></li>
        <%--<li class="disabled"><a href="##">Responsive</a></li>--%>
    </ul>
</div>