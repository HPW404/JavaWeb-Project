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
					<td><b>商品号</b></td>
					<td><b>商品名</b></td>
					<td><b>市场价</b></td>
					<td><b>折后价</b></td>
					<td><b>是否热门</b></td>
					<td><b>商品类别</b></td>
					<td><b>操作</b></td>
				</tr>
				<c:forEach var="productList" items="${productList }">
				<tr>
					<td>${productList.getPid() }</td>
					<td>${productList.getPname() }</td>
					<td>${productList.getMarket_price() }</td>
					<td>${productList.getShop_price() }</td>
					<td>${productList.getIs_hot() }</td>
					<td>${productList.getCid() }</td>
					<td><a href="SearchProductServlet?pid=${productList.getPid() }">修改</a>&nbsp;&nbsp;&nbsp;<a href="DeleteProductServlet?pid=${productList.getPid() }" onclick="return confirm('是否确认删除？')">删除</a></td>
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
					<li><a href="ProductFindAllServlet?currentPage=${currentPage-1}">《</a></li>
				</c:if>
				<c:forEach var="page" begin="1" end="${pages }">
					<c:if test="${page==currentPage }">
						<li><font style="font-size: 18px;color: red"><a href="ProductFindAllServlet?currentPage=${page}">${page }</a></font></li>
					</c:if>
					<c:if test="${page!=currentPage }">
						<li><a href="ProductFindAllServlet?currentPage=${page}">${page }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${currentPage==pages }">
					<li>》</li>
				</c:if>
				<c:if test="${currentPage!=pages }">
					<li><a href="ProductFindAllServlet?currentPage=${currentPage+1}">》</a></li>
				</c:if>
			</ul>  
		</div> 
	</div>
  </body>
</html>
