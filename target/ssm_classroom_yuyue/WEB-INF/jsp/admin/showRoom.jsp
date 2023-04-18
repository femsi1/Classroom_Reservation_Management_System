<%@ page contentType="text/html;charset=UTF-8" language="java"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Classroom information display</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<!-- 引入JQuery  bootstrap.js-->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>

<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

</head>
<body>
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
							<h1 class="col-md-5">Classroom information management</h1>
							<form class="bs-example bs-example-form col-md-5" role="form"
								style="margin: 20px 0 10px 0;"
								action="${pageContext.request.contextPath}/admin/queryRoom"
								id="form1" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Classroom information management"
										name="findByName"> <span class="input-group-addon btn"
										onclick="document.getElementById('form1').submit" id="sub">search</span>
								</div>
							</form>
							<button class="btn btn-default col-md-2" style="margin-top: 20px"
								onClick="location.href='${pageContext.request.contextPath}/admin/addRoom'">
								Add classroom information
								<sapn class="glyphicon glyphicon-plus" />
							</button>

						</div>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Classroom number</th>
								<th>Classroom name</th>
								<th>Detailed information</th>
								<th>operation</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${roomList}" var="item">
								<tr>
									<td>${item.id}</td>
									<td>${item.name}</td>
									<td>${item.message}</td>
									<td>
										<button class="btn btn-default btn-xs btn-info"
											onClick="location.href='${pageContext.request.contextPath}/admin/editRoom?id=${item.id}'">modify</button>
										<button class="btn btn-default btn-xs btn-danger btn-primary"
											onclick="removeRoom(${item.id})">delete</button> <%--<button class="btn btn-default btn-xs btn-danger btn-primary" onClick="location.href='${pageContext.request.contextPath}/admin/removeRoom?id=${item.id}'">删除</button>--%>
										<!--弹出框-->
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="panel-footer">
						<c:if test="${pagingVO != null}">
							<nav style="text-align: center">
								<ul class="pagination">
									<li><a
										href="${pageContext.request.contextPath}/admin/showRoom?page=${pagingVO.upPageNo}">&laquo;Previous page</a></li>
									<li class="active"><a href="">${pagingVO.curentPageNo}</a></li>
									<c:if test="${pagingVO.curentPageNo+1 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/admin/showRoom?page=${pagingVO.curentPageNo+1}">${pagingVO.curentPageNo+1}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+2 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/admin/showRoom?page=${pagingVO.curentPageNo+2}">${pagingVO.curentPageNo+2}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+3 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/admin/showRoom?page=${pagingVO.curentPageNo+3}">${pagingVO.curentPageNo+3}</a></li>
									</c:if>
									<c:if test="${pagingVO.curentPageNo+4 <= pagingVO.totalCount}">
										<li><a
											href="${pageContext.request.contextPath}/admin/showRoom?page=${pagingVO.curentPageNo+4}">${pagingVO.curentPageNo+4}</a></li>
									</c:if>
									<li><a
										href="${pageContext.request.contextPath}/admin/showRoom?page=${pagingVO.totalCount}">The last page&raquo;</a></li>
								</ul>
							</nav>
						</c:if>
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
		<%--设置菜单中选中背景色改变,nth-child(1)中参数1表示第1个导航栏，参数不可重复--%>
		$("#nav li:nth-child(1)").addClass("active")

        <c:if test="${pagingVO != null}">
        if (${pagingVO.curentPageNo} == ${pagingVO.totalCount}) {
            $(".pagination li:last-child").addClass("disabled")
        };

        if (${pagingVO.curentPageNo} == ${1}) {
            $(".pagination li:nth-child(1)").addClass("disabled")
        };
        </c:if>

        function removeRoom(id) {
			if(confirm('确认要删除该教室吗?')) {
				$.post("${pageContext.request.contextPath}/admin/removeRoom",{"id":id},function(data){
					alert("教室删除更新成功！");
					window.location.reload();
				});
			}
        }

        $("#sub").click(function () {
            $("#form1").submit();
        });
	</script>
</html>