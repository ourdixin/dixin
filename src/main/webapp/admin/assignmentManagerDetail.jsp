<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品转让</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/product/assignment.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/product/popwindow.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>
	";
</script>
</head>

<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	<form action="<%=request.getContextPath()%>/product/assignment"
		method="post" id="assiForm">
		<input name="productId" id="productId" value="${param.productId}"
			type="hidden"  style="display: none;" />
		<div id="main_right">

			<div class="tab1">
				<div class="user_title">${param.pname}</div>
				<div class="con_table">
					<table width="100%">
						<tbody>
							<tr>
								<td align="center" bgcolor="#FFFFFF">金额</td>
								<td bgcolor="#FFFFFF">${param.amount}万元</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#FFFFFF">联系人</td>
								<td bgcolor="#FFFFFF">${param.contactor}</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#FFFFFF">联系电话</td>
								<td bgcolor="#FFFFFF">${param.tel}</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#FFFFFF">转让条件</td>
								<td bgcolor="#FFFFFF">${param.assign_type}</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#FFFFFF">有效性</td>
								<td bgcolor="#FFFFFF"></td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
			<div class="tab1">
				<div class="user_title">产品信息</div>
				<div class="con_table">
					<table width="100%">
						<tbody>
							<tr>
								<td align="center" bgcolor="#FFFFFF">项目名称</td>
								<td bgcolor="#FFFFFF">${param.pname}</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#FFFFFF">成立日期</td>
								<td bgcolor="#FFFFFF">${param.releaseDate}</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#FFFFFF">收益分配</td>
								<td bgcolor="#FFFFFF">${param.payType}</td>
							</tr>
							<tr>
								<td align="center" bgcolor="#FFFFFF">有效性</td>
								<td bgcolor="#FFFFFF">未转让</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>

		<br class=" clear" />
	</form>
</div>
<blockquote>&nbsp;	</blockquote>
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
