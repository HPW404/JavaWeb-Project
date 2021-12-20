<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studentAll.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/mr-01.css" type="text/css">
	<script src="js/jsArr01.js" type="text/javascript"></script>
	<script src="js/module.js" type="text/javascript"></script>
	<script src="js/jsArr02.js" type="text/javascript"></script>
	<script src="js/tab.js" type="text/javascript"></script>
<style type="text/css">
.div_list {
	width: 75%;
	margin: 0 auto;
	margin-top: 50px;
	margin-left: 20%;

}
#tableClass{
margin:0 auto;
width: 100%

}
.form1{
	width: 200px;
	display: inline-block
}

font {
	color: red;
	font-weight: bold;
	text-align: center;
}
table{
margin:0 auto;

}
table tr td{
text-align: center;
width:150px;
height:40px;
}
a{
text-decoration: none;
}
</style>
  </head>
  
  <body>
  	<div id="tab" class="panel">
	    <div class="div_list panel panel-default">
					<div class="panel-heading">商品信息</div>
			<table class="table panel-body" id="tableClass">
				<tr>
					<td><b>订单号</b></td>
					<td><b>下单人</b></td>
					<td><b>联系电话</b></td>
					<td><b>地址</b></td>
					<td><b>金额</b></td>
				</tr>
				<c:forEach var="orderList" items="${orderList }">
				<tr>
					<td>${orderList.getOid() }</td>
					<td>${orderList.getName() }</td>
					<td>${orderList.getTelephone() }</td>
					<td>${orderList.getAddress() }</td>
					<td>${orderList.getTotal() }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		
		<!-- 分页 -->
		<div id="page" class="ja-tab-subcontent">
			<ul> 
				<c:if test="${currentPage==1 }">
					<li>《</li>	
				</c:if>
				<c:if test="${currentPage!=1 }">
					<li><a href="OrderFindServlet?currentPage=${currentPage-1}">《</a></li>
				</c:if>
				<c:forEach var="page" begin="1" end="${pages }">
					<c:if test="${page==currentPage }">
						<li><font style="font-size: 18px;color: red"><a href="OrderFindServlet?currentPage=${page}">${page }</a></font></li>
					</c:if>
					<c:if test="${page!=currentPage }">
						<li><a href="OrderFindServlet?currentPage=${page}">${page }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage==pages }">
					<li>》</li>
				</c:if>
				<c:if test="${currentPage!=pages }">
					<li><a href="OrderFindServlet?currentPage=${currentPage+1}">》</a></li>
				</c:if>
			</ul>  
		</div> 
	</div>
  </body>
</html>
