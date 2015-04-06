<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产品详细</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->

<div id="main_body">
<div class="padding_top_10"></div>
<div class="con_table">
   <table width="100%">
    <tbody>
      <tr>
        <td width="0%" height="50" align="center" bgcolor="#FFFFFF">资管计划名称</td>
        <td colspan="5" align="center"><font style="color:#F90; font-size:18px; font-weight:bold;">${product.name}</font></td>
      </tr>
      <tr>
        <td width="0%" height="35" align="center" bgcolor="#FFFFFF">发布时间</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>
        <fmt:formatDate value="${product.releaseDate}" pattern="yyyy年MM月dd日 "/>      
        </strong></td>
        <td width="0%" align="center" bgcolor="#FFFFFF">查看次数</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.name}</strong></td>
        <td width="0%" align="center" bgcolor="#FFFFFF">产品期限</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.term}个月</strong></td>
      </tr>
      <tr>
        <td width="0%" align="center" bgcolor="#FFFFFF" height="35">产品规模</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>预计为${product.amount/100000000}亿元</strong></td>
        <td width="0%" align="center" bgcolor="#FFFFFF">投资起点</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.minAmount/10000}万元</strong></td>
        <td width="0%" align="center" bgcolor="#FFFFFF">利益分配方式</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>按自然半年分配预期收益</strong></td>
      </tr>
      <tr>
        <td width="0%" height="50" align="center" bgcolor="#FFFFFF">预期年化收益率</td>
        <td colspan="5" align="center" bgcolor="#FFFFFF">
        <div>${product.partA/10000}万元≤认购/参与金额＜${product.partB/10000}万元（A1类）
        	 <fmt:formatNumber value="${product.rateA*100}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>
        	 %<br />
          	 ${product.partB/10000}万元≤认购/参与金额（A2类）
          	 <fmt:formatNumber value="${product.rateB*100}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>  
          	 %</div>
          </td>
      </tr>
    </tbody>
  </table>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="60" align="center"><span class="single">产品推介单页下载<i><a href="<%=request.getContextPath()%>/file/${product.adFile}">下载</a></i></span>
    <span class="guide">定向客户指南下载<i><a href="<%=request.getContextPath()%>/file/${product.guideFile}">下载</a></i></span></td>
  </tr>
  <tr>
    <td>${product.info}</td>
  </tr>
</table>

<p style="margin-left:420px;"><span class="bnt_ok">预约</span></p>


<br class=" clear" />
</div>

<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>