<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>Personal information modification</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- 引入JQuery  bootstrap.js-->
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

</head>
<body>
	<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currDate = dateFormat.format(new Date());
    List dateList=new ArrayList();
    for (int i = 0; i < 16; i++) {

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(dateFormat.parse(currDate));

        calendar.add(Calendar.DAY_OF_MONTH, i);

        String nextDay= dateFormat.format(calendar.getTime());
        dateList.add(nextDay);
    }
    request.setAttribute("dateList",dateList);
%>
	<!-- 顶栏 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 中间主体 -->
	<div class="container" id="content">
		<div class="row">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<h1 style="text-align: center;">Personal information modification</h1>
						</div>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form"
							onsubmit="return check()"
							action="${pageContext.request.contextPath}/ordinary/changeUser"
							id="editfrom" method="post">
							<div class="form-group">
								<label class="col-sm-2 control-label">User ID</label>
								<div class="col-sm-10">
									<input readonly="readonly" type="text" class="form-control"
										id="id" name="id" value="${object.id}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">Username</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										id="username" name="username" value="${object.username}">
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">User password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="password"
										name="password" value="${object.password}">
								</div>
							</div>
							<div class="form-group">
								<label for="repassword" class="col-sm-2 control-label">Repeat password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="repassword"
										name="repassword" value="${object.password}">
								</div>
							</div>

							<div class="form-group" style="text-align: center">
								<button class="btn btn-default" type="submit">submit</button>
								<button class="btn btn-default" type="reset">reset</button>
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>
	<div class="container" id="footer">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
    <%--设置菜单中--%>
    $("#nav li:nth-child(5)").addClass("active")

    <c:if test="${pagingVO != null}">
    if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
        $(".pagination li:last-child").addClass("disabled")
    }
    ;

    if (${pagingVO.curentPageNo} == ${1}) {
        $(".pagination li:nth-child(1)").addClass("disabled")
    }
    ;
    </c:if>

    function confirmd() {
        var msg = "Are you sure you want to delete it？！";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }

    $("#sub").click(function () {
        $("#form1").submit();
    });
</script>
<script type="text/javascript">
function check(){
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var repassword = document.getElementById("repassword").value;
	if(!username){
		alert("Please enter the username！");
		return false;
	}
	if(!password){
		alert("Please enter password！");
		return false;
	}
	if(!repassword){
		alert("Please re-enter the password！");
		return false;
	}
	if(password!=repassword){
		alert("The two passwords are different！");
		return false;
	}
	return true;
	}
</script>

</html>