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
     <div class="dqwz">当前位置：<a href="<%=request.getContextPath() %>/">首页</a> &gt; 港股开户</div>
   </div>
<div id="main_left">
<ul>
<dd><a href="<%=request.getContextPath() %>/authentication/quote.jsp">A股开户</a></dd>
<dt>港股开户</dt>
<dd><a href="<%=request.getContextPath() %>/authentication/future.jsp">期货开户</a></dd>
</ul>

</div>
<div id="main_right">
<div class="body_title">港股开户</div>
<div class="body_text">

<p>
    <span >中信证券国际有限公司&nbsp;是中信证券旗下全资附属子公司。</span>
</p>
<p>
    <span style="white-space: nowrap;">&nbsp;</span>
</p>
<p>
    <span >中信证券国际为中信证券海外业务拓展的平台，积极拓展业务至全球金融市场，包括中信证券国际之所在地香港。</span>
</p>
<p>
    <span style="white-space: nowrap;">&nbsp;</span>
</p>
<p>
    <span >里昂证券(CLSA)是一家领先的独立券商和投资集团，业务遍布亚洲、欧洲和美国等21个城市，而中信证券国际现正成为其母公司。里昂证券为全球的企业及机构客户提供企业融资、股票经纪及资产管理方面的服务。该公司以其卓越服务、创新产品和屡获殊荣的独立观点而著称。里昂证券还凭借其在亚洲市场首屈一指的证券研究和宏观经济分析赢得了良好的声誉。</span>
</p>
<p>
    <span style="white-space: nowrap;">&nbsp;</span>
</p>
<p>
    <span >中信证券国际将与里昂证券共同扩大双方国内外的服务范围，携手为广大国内投资者提供更佳服务。与此同时，两家公司还将面向全球各地的机构投资者，协助它们发掘中国以至整个亚洲的庞大市场机会。</span>
</p>
<p>
    <span style="white-space: nowrap;">&nbsp;</span>
</p>

<p>
    <span >公司网址:<a href="http://www.citics.com.hk" target="_blank">www.citics.com.hk</a></span>
</p>
<p>
    <span >开户咨询&nbsp;400-6262-121</span>
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
