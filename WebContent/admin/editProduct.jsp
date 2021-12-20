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
    
    <title>My JSP 'editScore.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
.div_ads {
	width: 75%;
	margin: 0 auto;
	margin-top: 50px;
	margin-left: 10%;
}
table {
	margin: 0 auto;
	width: 100%
}

table tr td {
	text-align: center;
	width:50%;
	height:50px;
}
</style>
</head>

<body>
	<form action="EditProductServlet" method="post">
		<div class="div_ads">
			<c:forEach var="list" items="${list }">
				<table>
					<tr>
						<td>商品号：</td>
						<td><input type="text" name="pid" class="form-control" value="${list.getPid() }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td>商品名：</td>
						<td><input type="text" name="pname" class="form-control" value="${list.getPname() }" /></td>
					</tr>
					<tr>
						<td>市场价：</td>
						<td><input type="text"  name="market_price" class="form-control" value="${list.getMarket_price() }"  /></td>
					</tr>
					<tr>
						<td>折后价：</td>
						<td><input type="text" name="shop_price" class="form-control" value="${list.getShop_price() }" /></td>
					</tr>
					<tr>
						<td>热&nbsp;&nbsp;&nbsp;门：</td>
						<!-- <td><input type="text" name="is_hot" class="form-control" value="${list.getIs_hot() }" /></td> -->
						<td>
						<select name="is_hot">
							<option>（请选择）：</option>
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>描&nbsp;&nbsp;&nbsp;述：</td>
						<td><input type="text" name="pdesc" class="form-control" value="${list.getPdesc() }" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="修改" class="btn btn-primary" /></td>
						<td><input type="button" value="取消" class="btn btn-primary" onclick="window.location='ProductFindAllServlet'" /></td>
					</tr>
				</table>
			</c:forEach>
		</div>
	</form>
</body>
</html>
