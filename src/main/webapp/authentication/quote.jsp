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
     <div class="dqwz">当前位置：<a href="<%=request.getContextPath() %>/">首页</a> &gt; A股开户</div>
   </div>
<div id="main_left">
<ul>
<dt>A股开户</dt>
<dd><a href="<%=request.getContextPath() %>/authentication/hkstock.jsp">港股开户</a></dd>
<dd><a href="<%=request.getContextPath() %>/authentication/future.jsp">期货开户</a></dd>
</ul>

</div>
<div id="main_right">
<div class="body_title">A股开户</div>
<div class="body_text">
<p>
    <span >第一创业证券是经中国证监会批准，由华熙昕宇投资有限公司、北京首都创业集团等多家股东投资设立的综合性证券公司。公司注册地为深圳市，注册资本为人民币19.7亿元。公司全资子公司分别为第一创业期货有限责任公司、第一创业投资管理有限公司，拥有第一创业摩根大通66.7%的股权和银华基金29%的股权。</span>
</p>
<p>
    <span style="white-space: nowrap;">公司网址:<a href="http://www.fcsc.cn" target="_blank">www.fcsc.cn</a></span>
</p>
<p>
    <span style="white-space: nowrap;">网上开户网址：<a href="http://kh.fcsc.com:889/osoa/views/index.html?r=0.23619042476920565" target="_blank">kh.fcsc.com</a></span>
</p>
<p>
    <span style="white-space: nowrap;">手机开户，请扫描二维码：<img src="../images/dycymobile.png"></span>
</p>
<p>
    <span style="white-space: nowrap;"><br/></span>
</p>

<p>
    <span >中信证券股份有限公司于1995年10月25日在北京成立。2003年1月6日在上海证券交易所挂牌上市交易，股票简称“中信证券”，股票代码“600030”。 2011年10月6日在香港联合交易所上市交易，股票代码为”6030”。截至2013年12月31日，公司总资产2714亿元，净资产877亿元，净资本348亿元，是国内规模最大的证券公司。</span>
</p>
<p>
    <span style="white-space: nowrap;"><br/></span>
</p>
<p>
    <span style="white-space: nowrap;">公司网址：<a href="http://www.cs.ecitic.com" target="_blank">www.cs.ecitic.com</a></span>
</p>
<p>
    <span style="white-space: nowrap;"><br/></span>
</p>
<p>
    <span style="white-space: nowrap;">网上开户网址：<a href="http://kh.cs.ecitic.com/webtrade/zxkh/index.html" target="_blank">kh.cs.ecitic.com/webtrade/zxkh/index.html</a></span>
</p>
<p>
    <span style="white-space: nowrap;">手机开户，请扫描二维码：<img src="../images/zxzqmobile.jpg"></span>
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
