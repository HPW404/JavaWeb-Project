<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'addScore.jsp' starting page</title>

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
	width:100%;
	border-collapse:separate; 
	border-spacing:0px 10px;
}

table tr td {
	text-align: center;
	width: 5%;
	height: 44px;
}

font {
	color: red;
	font-weight: bold;
}
</style>
<Script Language="JavaScript">
    function upload() {
		document.form1.action="UploadServlet";
	}
    function add() {
    	document.form1.action="AddProductServlet";
    	document.form.submit();
    }
    </Script>
</head>

<body>
	<form action="AddProductServlet" method="post">

		<div class="div_ads">
			<%
				String message = (String)request.getAttribute("message");         // 获取错误属性
				if(message != null) {
			%>
			<script type="text/javascript" language="javascript">
				alert("<%=message%>");                                            // 弹出错误信息
				window.location='admin/addScore.jsp' ;                            // 跳转到登录界面
			</script>
			<%
				}
			%>
			<table>
				<tr>
					<td>商品号：</td>
					<td>
						<input required="required" type="text" name="pid" class="put form-control" id="pid" />
					</td>
				</tr>
				<tr>
					<td>商品名：</td>
					<td>
						<input required="required" type="text" id="pname" name="pname" class="put form-control">
					</td>
				</tr>
				<tr>
					<td>市场价：</td>
					<td>
						<input required="required" type="text" id="market_price" name="market_price" class="put form-control">
					</td>
				</tr>
				<tr>
					<td>折后价：</td>
					<td>
						<input required="required" type="text" id="shop_price" name="shop_price" class="put form-control" />
					</td>
				</tr>
				<tr>
					<td>商品图：</td>
					<td>
						<input required="required" type="file" name="pimage" id="pimage" />
					</td>
				</tr>
				<tr>
					<td>增添日期：</td>
					<td>
						<!-- <input required="required" type="text" name="pdate" class="put form-control" id="pdate" /> -->
						<input required="required" type="date" name="pdate" id="pdate" />
					</td>
				</tr>
				<tr>
					<td>是否热门：</td>
					<td>
						<!-- <input required="required" type="text" name="is_hot" class="put form-control" id="is_hot" /> -->
						<select required="required" class="put form-comtrol" id="is_hot" name="is_hot">
							<option>（请选择）：</option>
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>商品描述：</td>
					<td>
						<input required="required" type="text" name="pdesc" class="put form-control" id="pdesc" />
					</td>
				</tr>
				<tr>
					<td>商品类别：</td>
					<td>
						<!-- <input required="required" type="text" name="cid" class="put form-control" id="cid" /> -->
						<select required="required" class="put form-comtrol" id="cid" name="cid">
							<option>（请选择）：</option>
							<option value="1">手机数码</option>
							<option value="2">电脑办公</option>
							<option value="3">家具家居</option>
							<option value="4">鞋靴箱包</option>
							<option value="5">图书音像</option>
							<option value="6">母婴孕婴</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="添加" class="putb btn btn-primary" />
					</td>
					<td>
						<input type="reset" value="清空" class="putb btn btn-danger" />
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
