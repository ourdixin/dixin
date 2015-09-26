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
     <div id="title_font">金融折扣</div>
     <div class="dqwz">当前位置：<a href="<%=request.getContextPath() %>/">首页</a> &gt; 期货开户</div>
   </div>
<div id="main_left">
<ul>
<dd><a href="<%=request.getContextPath() %>/authentication/quote.jsp">A股开户</a></dd>
<dd><a href="<%=request.getContextPath() %>/authentication/hkstock.jsp">港股开户</a></dd>
<dt>期货开户</dt>
</ul>

</div>
<div id="main_right">
<div class="body_title">期货开户</div>
<div class="body_text">
<p>
    <span style="white-space: nowrap;">中信期货是中信证券股份有限公司的全资子公司。公司注册资本15亿元。客户权益120亿</span>
</p>
<p>
    <span style="white-space: nowrap;"><br/></span>
</p>
<p>
    <span style="white-space: nowrap;">居行业第一。40家营业网点（含筹7家）布局全国。</span>
</p>
<p>
    <span style="white-space: nowrap;">&nbsp;</span>
</p>
<p>
    <span style="white-space: nowrap;">公司网址:www.citicsf.com</span>
</p>
<p>
    <span style="white-space: nowrap;"><br/></span>
</p>
<p>
    <span style="white-space: nowrap;">开户咨询 400-6262-121</span>
</p>
<p>
    <br/>
</p>

</div>
</div>
</div>

<br class="clear" />
</div>
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
