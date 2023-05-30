<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>Reservation management</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 引入bootstrap -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<!-- 引入JQuery  bootstrap.js-->
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

</head>
<body>
	<!-- 顶栏 -->

	<!-- 中间主体 --><jsp:include page="top.jsp"></jsp:include>
	<div class="container" id="content">
		<div class="row">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="col-md-10">
				<div class="panel panel-default">
				    <div class="panel-heading">
						<div class="row">
					    	<h1 class="col-md-5">Your reservation in waitlist</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" action="${pageContext.request.contextPath}/ordinary/queryByUser" id="form1" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Please enter the name of the borrower" name="findByName">
									<span class="input-group-addon btn" onclick="document.getElementById('form1').submit" id="sub">search</span>
								</div>
							</form>
							<%--<button class="btn btn-default col-md-2" style="margin-top: 20px" onClick="location.href='${pageContext.request.contextPath}/admin/addTeacher'">
								添加教师信息
								<sapn class="glyphicon glyphicon-plus"/>
							</button>--%>

						</div>
				    </div>
				    <table class="table table-bordered">
					        <thead>
					            <tr>
									<th>Reservation number</th>
									<th>classroom</th>
									<th>Date of borrowing</th>
									<th>Start time</th>
									<th>End time</th>
									<th>borrower</th>
									<th>borrower's real name</th>
									<th>Reason for borrowing</th>
									<th>state</th>
									<th>operation</th>
					            </tr>
					        </thead>
					        <tbody>
							<c:forEach  items="${reserveList}" var="item">
								<tr>
									<td>${item.id}</td>
									<td>${item.name}</td>
									<td><fmt:formatDate value="${item.date}" dateStyle="medium" pattern="yyyy-MM-dd"/></td>
									<!--pattern="HH:mm:ss"为24小时计时法，pattern="hh:mm:ss"为12小时计时法-->
									<td>${item.beginTime}></td>
									<td>${item.endTime}></td>
									<td>${item.user}</td>
									<td>${item.username}</td>
									<td>${item.reason}</td>
									<td>${item.mark}</td>
									<td>
										<button class="btn btn-default btn-xs btn-info" onClick="location.href='${pageContext.request.contextPath}/ordinary/cancelApply?id=${item.id}'">cancel</button>
									</td>
								</tr>
							</c:forEach>
					        </tbody>
				    </table>
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
		$("#nav li:nth-child(4)").addClass("active")

        <c:if test="${pagingVO != null}">
			if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
				$(".pagination li:last-child").addClass("disabled")
			};

			if (${pagingVO.curentPageNo} == ${1}) {
				$(".pagination li:nth-child(1)").addClass("disabled")
			};
        </c:if>

        function confirmd() {
            var msg = "您真的确定要删除吗？！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }

        $("#sub").click(function () {
            $("#form1").submit();
        });
	</script>
</html>