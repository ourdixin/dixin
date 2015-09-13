<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>我要购买</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	<meta name="format-detection" content="email=no">
	<meta name="format-detection" content="address=no">
	<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
	<link href="<%=request.getContextPath() %>/weixin/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/appointment.js"></script>
	<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
	<style type="text/css" id="_zoom">.zoom {zoom:1.0625;-webkit-text-size-adjust:auto!important;}</style>
	<script>
	  var _w,_zoom,_hd,_orientationChange,_doc=document,__style=_doc.getElementById("_zoom");__style||(_hd=_doc.getElementsByTagName("head")[0],__style=_doc.createElement("style"),_hd.appendCHild(_style)),_orientationChange=function(){_w=_doc.documentElement.clientWidth||_doc.body.clientWidth,_zoom=_w/640,__style.innerHTML=".zoom {zoom:"+_zoom+";-webkit-text-size-adjust:auto!important;}"},_orientationChange(),window.addEventListener("resize",_orientationChange,!1);
	</script>
</head>

<body>
<div class="act_wrapper zoom ">
  <div class="act_content">
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
						<th width="120">预约产品</th>
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
	<!---foot底部---->
	<c:import url="../nav.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
	</div>
</div>
</body>
</html>
