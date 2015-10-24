<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>9点财讯</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">
<meta name="format-detection" content="address=no">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/user.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<link href="<%=request.getContextPath() %>/weixin/css/style.css" rel="stylesheet" type="text/css">
<style type="text/css" id="_zoom">.zoom {zoom:1.0625;-webkit-text-size-adjust:auto!important;}</style>
<script>
  var _w,_zoom,_hd,_orientationChange,_doc=document,__style=_doc.getElementById("_zoom");__style||(_hd=_doc.getElementsByTagName("head")[0],__style=_doc.createElement("style"),_hd.appendCHild(_style)),_orientationChange=function(){_w=_doc.documentElement.clientWidth||_doc.body.clientWidth,_zoom=_w/640,__style.innerHTML=".zoom {zoom:"+_zoom+";-webkit-text-size-adjust:auto!important;}"},_orientationChange(),window.addEventListener("resize",_orientationChange,!1);
</script>
</head>

<body>
<div class="act_wrapper zoom ">
  <div class="act_content">
<div class="head">我的财富</div>
<div class="center">
  <div class="cplb">
    <div style="background:none;font-size:24px;">
    	<c:if test="${null != user}"> 
      		<p style="border-bottom:1px solid #dddddd;padding-bottom:10px;">您好，${user.secUserName}	
			<a href="<%=request.getContextPath()%>/authentication/logout?backurl=/weixin/product/productlist?type=1">[退出登录]</a></p>
		</c:if>
 	<p style="padding-top:20px;float:left;">累计预估收益（元）：</p>
      <h1 style="border-bottom:1px solid #dddddd;padding-bottom:10px;margin-bottom:10px;">
     	<font size="66px" color="#c91e22"><fmt:formatNumber value="${user.pnl['pnl']}" type="currency" pattern="#,#00.00"/></font>
      </h1>
      <p style="padding-top:20px;float:left;">总资产（元）：</p>
      <h1 style="float:left;padding-left:10px;font-size:40px;font-weight:normal;">
      	<font size="66px" color="#c91e22"><fmt:formatNumber value="${user.pnl['amount']+user.pnl['pnl']}" type="currency" pattern="#,#00.00"/></font>
	  </h1>
    </div>
    <div class="clear"></div>
  </div>
  
  <div class="listable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <form name="form1" method="post" action=""><tr>
        <td width="30"><img src="<%=request.getContextPath()%>/weixin/images/Shopping.png" width="29" height="24"></td>
        <td><a href="<%=request.getContextPath()%>/weixin/product/boughtlist">我购买的产品</a></td>
        <td width="30" align="right"><a href="<%=request.getContextPath()%>/weixin/product/boughtlist">
        <img src="<%=request.getContextPath()%>/weixin/images/jtx.png" width="11" height="18" vspace="11"></a></td>
      </tr>
      <tr hidden>
        <td><img src="<%=request.getContextPath()%>/weixin/images/Credit-card-1png.png" width="30" height="20"></td>
        <td><a href="<%=request.getContextPath()%>/weixin/product/orderlist">对账单</a></td>
        <td align="right"><a href="<%=request.getContextPath()%>/weixin/product/orderlist">
        <img src="<%=request.getContextPath()%>/weixin/images/jtx.png" width="11" height="18" vspace="11"></a></td>
      </tr>
      <tr hidden>
        <td><img src="<%=request.getContextPath()%>/weixin/images/Cofee.png" width="24" height="23"></td>
        <td><a href="<%=request.getContextPath()%>/weixin/product/appointmentlist"> 我的预约   </a></td>
        <td align="right"><a href="<%=request.getContextPath()%>/weixin/product/appointmentlist">
        <img src="<%=request.getContextPath()%>/weixin/images/jtx.png" width="11" height="18" vspace="11"></a></td>
      </tr>
      <tr hidden>
        <td><img src="<%=request.getContextPath()%>/weixin/images/Settings.png" width="30" height="30"></td>
        <td><a href="<%=request.getContextPath()%>/weixin/authentication/account.jsp">帐户设置</a></td>
        <td align="right"><a href="<%=request.getContextPath()%>/weixin/authentication/account.jsp">
        <img src="<%=request.getContextPath()%>/weixin/images/jtx.png" width="11" height="18" vspace="11"></a></td>
      </tr>
      </form>
    </table>
  </div>
</div>
<br class=" clear" />
	<!---foot底部---->
	<c:import url="../nav.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</div>
</div>
</body>
</html>
