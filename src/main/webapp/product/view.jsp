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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>
<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->

<div id="main_body">
<div class="wrap">
    <div class="maintitle">
     <div id="title_font">理财产品</div>
     <div class="dqwz">当前位置：<a href="<%=request.getContextPath()%>/">首页</a> &gt;  产品详情</div>
   </div>
<div class="table_c">
   <table width="100%">
    <tbody>
      <tr>
        <td width="0%" height="50" align="center" bgcolor="#f2f2f2"><strong>资管计划名称</strong></td>
        <td colspan="5" align="center" bgcolor="#f2f2f2"><font style="color:#F90; font-size:18px; font-weight:bold;">${product.name}
	        <c:if test='${product.code != null && product.code !="" }'>
	        	(${product.code})
	        </c:if>
	        </font>
        </td>
      </tr>
      <tr>
        <td width="0%" height="35" align="center" bgcolor="#FFFFFF">发行时间</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>
        <c:if test="${product.releaseDate < product.invalidDate}">
        	<fmt:formatDate value="${product.releaseDate}" pattern="yyyy年MM月dd日  HH:mm"/>      
        </c:if>
        <c:if test="${product.releaseDate >= product.invalidDate}">
        	待定
        </c:if>
        </strong></td>

        <c:if test="${product.profitId == 42}">
        <td width="0%" align="center" bgcolor="#FFFFFF">起息日</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>        
        <c:if test="${product.valueDate < product.invalidDate}">
        	<fmt:formatDate value="${product.valueDate}" pattern="yyyy年MM月dd日  HH:mm"/>      
        </c:if>
        <c:if test="${product.valueDate >= product.invalidDate}">
        	待定
        </c:if>
        </strong></td>        
        <td width="0%" align="center" bgcolor="#FFFFFF">产品期限</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>
        <c:if test="${product.term > 0}">
	        ${product.term}
	        <c:if test="${product.termUnit == 63}">
	        	年
	        </c:if>
	        <c:if test="${product.termUnit == 64}">
	        	个月
	        </c:if>        
	        <c:if test="${product.termUnit == 65}">
	        	天
	        </c:if>
	        
	        <c:if test="${product.appendTerm > 0}">
		        + ${product.appendTerm}
		        <c:if test="${product.appendTermUnit == 63}">
		        	年
		        </c:if>
		        <c:if test="${product.appendTermUnit == 64}">
		        	个月
		        </c:if>        
		        <c:if test="${product.appendTermUnit == 65}">
		        	天
		        </c:if>
	        </c:if> 	        
	          
        </c:if> 
        </strong></td>
        </c:if>
        <c:if test="${product.profitId == 43}">    
        <td width="0%" align="center" bgcolor="#FFFFFF">成立日</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>        
        <c:if test="${product.valueDate < product.invalidDate}">
        	<fmt:formatDate value="${product.valueDate}" pattern="yyyy年MM月dd日  HH:mm"/>      
        </c:if>
        <c:if test="${product.valueDate >= product.invalidDate}">
        	待定
        </c:if>
        </strong></td> 
			<td width="0%" align="center" bgcolor="#FFFFFF">封闭期限</td>
        	<td width="0%" align="center" bgcolor="#FFFFFF"><strong>
        		${product.closeTerm}
        		<c:if test="${product.closeTermUnit == 63}">
		        	年
		        </c:if>
		        <c:if test="${product.closeTermUnit == 64}">
		        	个月
		        </c:if>        
		        <c:if test="${product.closeTermUnit == 65}">
		        	天
		        </c:if>
        		</strong></td>        
        </c:if>
      </tr>
      <tr>
        <td width="0%" align="center" bgcolor="#FFFFFF" height="35">产品规模</td>
        <td width="0%" align="center" bgcolor="#FFFFFF">
        <c:if test="${product.amount  > 0 }">
        	<strong>预计为 <fmt:formatNumber value="${product.amount/100000000}"  minFractionDigits="0"/>亿元</strong>
        </c:if>
        </td>
        <td width="0%" align="center" bgcolor="#FFFFFF">投资起点</td>
        
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>
        <c:if test="${product.minAmount < 10000}">
        	 <fmt:formatNumber value="${product.minAmount}"  minFractionDigits="0"/>元
        </c:if>
        <c:if test="${product.minAmount > 10000}">
        	<fmt:formatNumber value="${product.minAmount/10000}"  minFractionDigits="0"/> 万元
        </c:if>
        <c:if test="${product.appendAmount >= 10000}">
        	+<fmt:formatNumber value="${product.appendAmount/10000}"  minFractionDigits="0"/>万元的整数倍
        </c:if>        
        <c:if test="${product.appendAmount < 10000 && product.appendAmount > 0}">
        	+<fmt:formatNumber value="${product.appendAmount}"  minFractionDigits="0"/>元的整数倍
        </c:if>           
        
        </strong></td>
        <c:if test="${product.profitId == 42}">
        	<td width="0%" align="center" bgcolor="#FFFFFF">利益分配方式</td>
        	<td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.payTypeInfo}</strong></td>
        </c:if>
        <c:if test="${product.profitId == 43}">
        	<td width="0%" align="center" bgcolor="#FFFFFF">基金经理</td>
        	<td width="0%" align="center" bgcolor="#FFFFFF"><strong>
        	<c:out value="${product.fundManagerHtml}" escapeXml="false" />
        	</strong></td>
        </c:if>        
      </tr>
      <tr>
        <td width="0%" align="center" bgcolor="#FFFFFF">资金投向</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.directionInfo}</strong></td>
        <c:if test="${product.profitId == 42}">
        <td width="0%" height="50" align="center" bgcolor="#FFFFFF">收益说明</td>
        <td align="center" bgcolor="#FFFFFF">
        <div>
        	<c:if test="${null != product.rateNote and '' != product.rateNote}">
        		${product.rateNote}
        	</c:if>
        	<c:if test="${null == product.rateNote or '' == product.rateNote}">        
        		<c:if test="${0 != product.partA and 0 == product.partB}">
        		${product.partA/10000}万元以上认购/参与金额（A1类）
        		</c:if>
        
        		<c:if test="${0 != product.partA and 0 != product.partB}">
        		${product.partA/10000}万元≤认购/参与金额＜${product.partB/10000}万元（A1类）
        		</c:if>
        		
        		 
	        	 <fmt:formatNumber value="${product.rateA}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>%
		       	 <c:if test="${0 != product.rateB and 0 == product.partB and 0 == product.partA}"> 
		        	 - <fmt:formatNumber value="${product.rateB}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>%
	          	 </c:if>	        	 
	       	 <c:if test="${0 != product.partB and 0 == product.partC}"> 
	        	 <br />
	          	 ${product.partB/10000}万元及以上认购/参与金额（A2类）
	          	 <fmt:formatNumber value="${product.rateB}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>  
	          	 %
          	 </c:if>	        	 
	       	 <c:if test="${0 != product.partB and 0 != product.partC}"> 
	        	 <br />
	          	 ${product.partB/10000}万元≤认购/参与金额＜${product.partC/10000}万元（A2类）
	          	 <fmt:formatNumber value="${product.rateB}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>  
	          	 %
          	 </c:if>
          	 
          	 <c:if test="${0 != product.partC and 0 == product.partD}"> 
	          	 <br />
	          	 ${product.partC/10000}万元及以上认购/参与金额（A3类）
	          	 <fmt:formatNumber value="${product.rateC}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>  
	          	 %
          	 </c:if>
          	 
           	 <c:if test="${0 != product.partC and 0 != product.partD}"> 
	          	 <br />
	          	 ${product.partC/10000}万元≤认购/参与金额<${product.partD/10000}万元（A3类）
	          	 <fmt:formatNumber value="${product.rateC}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>  
	          	 %
          	 </c:if>         	 
          	 
          	 <c:if test="${0 != product.partD}"> 
	          	 <br />
	          	 ${product.partD/10000}万元及以上认购/参与金额（A4类）
	          	 <fmt:formatNumber value="${product.rateD}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>  
	          	 %
          	 </c:if> 
          	</c:if>         	 
          </div>
          </td>
          
          <td width="0%" align="center" bgcolor="#FFFFFF">查看次数</td>
      	  <td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.viewNum}</strong></td>
          </c:if>
          
          <c:if test="${product.profitId == 43}">
			<td width="0%" align="center" bgcolor="#FFFFFF">业绩报酬</td>
        	<td width="0%" align="center" bgcolor="#FFFFFF"><strong>
        		${product.bonus}
        		</strong></td>  
			<td width="0%" align="center" bgcolor="#FFFFFF">开放日</td>
        	<td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.openDay}</strong></td>         	        
          </c:if>
      </tr>
      
      <c:if test="${product.profitId == 43}">
      <tr>
        <td width="0%" align="center" bgcolor="#FFFFFF">认购费</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>
        ${product.buyFee}
        </strong></td>      
        <td width="0%" align="center" bgcolor="#FFFFFF">管理费</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong><fmt:formatNumber value="${product.manageFee}"  minFractionDigits="0"/>%</strong></td>
        <td width="0%" align="center" bgcolor="#FFFFFF">退出费用</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.sellFee}</strong></td>
        </tr>
      </c:if>  
	  
    </tbody>
  </table>
  <div id="productInfo" >
	   <table width="100%">
		<thead>
	      <tr>
	         <th>日期</th>
	         <th>信息</th>
			 <th>数据</th>
	      </tr>
	      </thead>   
	    <tbody>
	    	<c:forEach var="item" items="${info}">
		      <tr>
		       <td width="20%" align="center" bgcolor="#FFFFFF" >
		       <fmt:formatDate value="${item.infoDate}" pattern="yyyy年MM月dd日 "/>   
		       </td>
		       <td width="20%" align="center" bgcolor="#FFFFFF">${item.infoName}</td>
		       <td width="60%" align="center" bgcolor="#FFFFFF">${item.value}</td>
		      <tr>
	      </c:forEach>
	    </tbody>
	  </table>       
  </div>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="60" align="center"><span class="single">产品推介单页下载<i><a 
    <c:if test="${product.adFile != null && product.adFile !='' }">
   	 	href="<%=request.getContextPath()%>/${product.adFile}" target="_blank"
    </c:if>
    >下载</a>
    </i></span>
    <span class="guide">定向客户指南下载<i>
    <a 
    <c:if test="${product.adFile != null && product.adFile !='' }">
    	href="<%=request.getContextPath()%>/${product.guideFile}" target="_blank"
    </c:if>
    >
    下载</a></i></span></td>
  </tr>
  <tr>
    <td>${product.info}</td>
  </tr>
  <tr>
    <td height="60" align="center">
		<c:if test="${product.state  >=59 && product.state<=61 }">
			<span class="bnt_ok">
				<a href="<%=request.getContextPath()%>/product/appointment.jsp?productId=${product.id}&productName=${product.name}" >预约</a>
			</span>
		</c:if>
	</td>
  </tr>
</table>


<br class=" clear" />
</div>
</div>

<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>