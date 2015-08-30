<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>产品预约</title>
	<link href="<%=request.getContextPath() %>/weixin/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/appointment.js"></script>
	<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>
<body>
	<div class="head">我要购买</div>
	<div class="center">
		<div class="cplb" style="margin-top: 0px;">
			<div class="linkk" style="background: none; font-size: 21px;">
				<p>
					为了确保您预约成功，请正确填写以下信息（<span class="red">*</span> 为必填项）
				</p>
			</div>
		</div>
		<div class="listable">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<form action="<%=request.getContextPath() %>/weixin/product/appointment" method="post" id="appointForm">
					<input name="productId" id="productId" value="${param.productid}" type="hidden" />
					<tr>
						<th width="100">预约产品</th>
						<td>第一创业证券·稳定收益第6期</td>
					</tr>
					<tr>
						<th>预约金额</th>
						<td><input type="text" name="amount" id="amount"
							style="width: 72%;"> 万元</td>
					</tr>
					<tr>
						<th>预计打款</th>
						<td><input type="text" name="reserve_date" id="reserve_date"
							style="width: 72%;"> 预计打款时间</td>
					</tr>
					<tr>
						<th>手机号码</th>
						<td><input type="text" name="tel" id="tel" style="width: 72%;"></td>
					</tr>
					<tr>
						<th>备注信息</th>
						<td><textarea name="msg" id="msg" cols="45" rows="5"
								style="width: 92%;"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><span id = "save" class="btn_red">马上购买</span></td>
					</tr>
				</form>
			</table>
		</div>

	</div>
	<div class="nav">
		<ul>
			<li><a href="#">待发行</a></li>
			<li><a href="#">正发行</a></li>
			<li><a href="#">已发行</a></li>
			<li><a href="#">登 录</a></li>
		</ul>
	</div>
</body>
</html>
