<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>Book a classroom</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <!-- 引入JQuery  bootstrap.js-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

    <script>
        function validateReservation() {
            // Get the selected start time and end time from the form input fields
            var startTime = new Date(document.getElementById("startTime").value);
            var endTime = new Date(document.getElementById("endTime").value);

            // Iterate over the list of existing reservations
            var reservations = JSON.parse('<%=new Gson().toJson(recordList)%>');
            for (var i = 0; i < reservations.length; i++) {
                var reservationStart = new Date(reservations[i].startTime);
                var reservationEnd = new Date(reservations[i].endTime);

                // Check if there is an overlap between the selected time range and the current reservation
                if ((startTime >= reservationStart && startTime < reservationEnd) ||
                    (endTime > reservationStart && endTime <= reservationEnd) ||
                    (startTime <= reservationStart && endTime >= reservationEnd)) {
                    alert("The selected time range overlaps with an existing reservation.");
                    return false; // Prevent form submission
                }
            }

            return true; // Allow form submission
        }
    </script>

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
                        <h1 style="text-align: center;">Add classroom reservation</h1>
                    </div>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form"
                          action="${pageContext.request.contextPath}/ordinary/reserveRoom" id="editfrom" method="post">

                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">Classroom name</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="inputPassword3" name="name">
                                    <c:forEach items="${nameList}" var="item">
                                        <option value="${item.name}">${item.name}</option>
                                    </c:forEach>
                                </select>
                                <%--<input type="text" class="form-control" id="inputPassword3" name="name" placeholder="请输入教室名称">--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">borrower</label>
                            <div class="col-sm-10">
                                <input readonly="readonly" type="text" class="form-control" id="inputPassword3-1" name="user"
                                       value=<shiro:principal/>>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">borrower name</label>
                            <div class="col-sm-10">
                                <input readonly="readonly" type="text" class="form-control" id="inputPassword3-1" name="username"
                                      value="${object.username}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">Reason for borrowing</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputPassword3-1" name="reason"
                                    >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label" name="mobile">Contact number</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputPassword3-2" name="mobile"
                                       placeholder="Please enter the borrower's phone number">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label" name="date">Date of borrowing</label>
                            <div  class="col-sm-10">
                                <%--<input type="date" value="2018-01-01" name="date" />--%>
                                <select class="form-control" name="date">
                                    <option>${dateList[0]}</option>
                                    <option >${dateList[1]}</option>
                                    <option >${dateList[2]}</option>
                                    <option >${dateList[3]}</option>
                                    <option >${dateList[4]}</option>
                                    <option >${dateList[5]}</option>
                                    <option >${dateList[6]}</option>
                                    <option >${dateList[7]}</option>
                                    <option >${dateList[8]}</option>
                                    <option >${dateList[9]}</option>
                                    <option >${dateList[10]}</option>
                                    <option >${dateList[11]}</option>
                                    <option >${dateList[12]}</option>
                                    <option >${dateList[13]}</option>
                                    <option >${dateList[14]}</option>
                                </select>
                            </div>
                        </div>
                        <%--怎么打印queryByTime申请到的信息到js控制台--%>
                        <c:forEach items="${recordList}" var="item">
    <c:out value="${item.roomName}"/> <!-- 输出roomName属性值 -->
    <c:out value="${item.date}"/> <!-- 输出date属性值 -->
    <c:out value="${item.time}"/> <!-- 输出time属性值 -->
</c:forEach>





                        <%--下拉框start time 到end time预约的时间段不能重复比如说a同学预约了教室a 3月14日的 9:00:00到10:00:00 同学b的预约时间就不包含a同学的预约过的时间段
                        ordinaryController.java 里面的model.addAttribute("recordList", list);
                        --%>


                        <form action="..." method="post" onsubmit="return validateReservation()">
                            ...
                        </form>


                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label" name="beginTime">Start time</label>
                            <div class="col-sm-10">

                            <%--修改为预约的时间段不能重复比如说a同学预约了教室a 3月14日的 9:00:00到10:00:00 同学b的预约时间就不包含a同学的预约过的时间段--%>

                               <%--<c:forEach items="${dateList}" var="item">--%>
                                <%--<option>${item}</option>--%>
                                <%--</c:forEach>--%>
                                <%--<select class="form-control" name="beginTime">--%>
                                <%--<c:forEach items="${recordList}" var="item">--%>
                                <%--<option>${item.beginTime}</option>--%>
                                <%--</c:forEach>--%>
                                <%--</select>--%>
                                <%--<select class="form-control" name="endTime">--%>
                                <%--<c:forEach items="${recordList}" var="item">--%>
                                <%--<option>${item.endTime}</option>--%>
                                <%--</c:forEach>--%>
                                <%--</select>--%>
                                <%--<select class="form-control" name="beginTime">--%>
                                <%--<option>9:00:00</option>--%>
                                <%--<option>10:00:00</option>--%>

                                <%--
                                       List<Record> recordList=recordService.getRecordByDateAndName(date,name);
                                       request.setAttribute("recordList",recordList);
                                   }
                                   catch (Exception e)
                                   {
                                      e.printStackTrace();
                                 }
                                 --%>
                                 <%--上面的注释应该放到哪个文件里？  为什么放到这里会报错--%>


                                <table>
                                <c:forEach  items="${recordList}" var="item">
                                    <tr>
                                        <td><fmt:formatDate value="${item.date}" dateStyle="medium" pattern="yyyy-MM-dd"/></td>
                                        <!--pattern="HH:mm:ss"为24小时计时法，pattern="hh:mm:ss"为12小时计时法-->
                                        <td>${item.beginTime}</td>
                                        <td>${item.endTime}</td>
                                    </tr>
                                </c:forEach>
                                </table>


                                <%--<select class="form-control" name="beginTime">
                                    <option >9:00:00</option>
                                    <option >9:30:00</option>
                                    <option >10:00:00</option>
                                    <option >10:30:00</option>
                                    <option >11:00:00</option>
                                    <option >11:30:00</option>
                                    <option >12:00:00</option>
                                    <option >12:30:00</option>
                                    <option >13:00:00</option>
                                    <option >13:30:00</option>
                                    <option >14:00:00</option>
                                    <option >14:30:00</option>
                                    <option >15:00:00</option>
                                    <option >15:30:00</option>
                                    <option >16:00:00</option>
                                    <option >16:30:00</option>
                                    <option >17:00:00</option>
                                    <option >17:30:00</option>
                                    <option >18:00:00</option>
                                    <option >18:30:00</option>
                                    <option >19:00:00</option>
                                    <option >19:30:00</option>
                                    <option >20:00:00</option>
                                    <option >20:30:00</option>
                                    <option >21:00:00</option>
                                    <option >21:30:00</option>
                                    <option >22:00:00</option>
                                    <option >22:30:00</option>
                                    <option >23:00:00</option>
                                    <option >23:30:00</option>
                                    <option >24:00:00</option>  --%>    <%--  <option >${item.beginTime}</option>  --%>


                                <select class="form-control" name="beginTime">
                                    <option >9:00:00</option>
                                    <option >9:30:00</option>
                                    <option >10:00:00</option>
                                    <option >10:30:00</option>
                                    <option >11:00:00</option>
                                    <option >11:30:00</option>
                                    <option >12:00:00</option>
                                    <option >12:30:00</option>
                                    <option >13:00:00</option>
                                    <option >13:30:00</option>
                                    <option >14:00:00</option>
                                    <option >14:30:00</option>
                                    <option >15:00:00</option>
                                    <option >15:30:00</option>
                                    <option >16:00:00</option>
                                    <option >16:30:00</option>
                                    <option >17:00:00</option>
                                    <option >17:30:00</option>
                                    <option >18:00:00</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label" name="endTime">End time</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="endTime">
                                    <option >9:00:00</option>
                                    <option >9:30:00</option>
                                    <option >10:00:00</option>
                                    <option >10:30:00</option>
                                    <option >11:00:00</option>
                                    <option >11:30:00</option>
                                    <option >12:00:00</option>
                                    <option >12:30:00</option>
                                    <option >13:00:00</option>
                                    <option >13:30:00</option>
                                    <option >14:00:00</option>
                                    <option >14:30:00</option>
                                    <option >15:00:00</option>
                                    <option >15:30:00</option>
                                    <option >16:00:00</option>
                                    <option >16:30:00</option>
                                    <option >17:00:00</option>
                                    <option >17:30:00</option>
                                    <option >18:00:00</option>
                                </select>
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
    <%--怎么打印queryByTime申请到的信息到js控制台--%>
    console.log(${queryByTime})
    <%--设置菜单中--%>
    $("#nav li:nth-child(3)").addClass("active")

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
        var msg = "您真的确定要删除吗？！";
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
</html>
