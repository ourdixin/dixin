<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>关于9点财讯</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<div id="main_body">
<div class="wrap">
    <div class="maintitle">
     <div id="title_font">关于我们</div>
     <div class="dqwz">当前位置：<a href="<%=request.getContextPath() %>/">首页</a> &gt; 关于我们</div>
   </div>
<div id="main_left">
<ul>
<dt>关于我们</dt>

</ul>

</div>
<div id="main_right">
<div class="body_title">关于我们</div>
<div class="body_text">
9点财讯（www.9diancaixun.com）所提供的各项服务的所有权和运作权均归的信金融信息服务（上海）有限公司（以下简称“的信金融”）所有。9点财讯是中国专业的理财产品信息服务平台。9点财讯不仅为用户提供金融机构发行的理财产品信息服务，同时为用户提供专业理财咨询服务。
</div>

</div>
<br class="clear" />
</div>
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
