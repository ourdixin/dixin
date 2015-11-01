<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>9点财讯</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">
<meta name="format-detection" content="address=no">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<link href="<%=request.getContextPath() %>/weixin/css/style.css" rel="stylesheet" type="text/css">
<style type="text/css" id="_zoom">.zoom {zoom:1.0625;-webkit-text-size-adjust:auto!important;}</style>
<script>
  var _w,_zoom,_hd,_orientationChange,_doc=document,__style=_doc.getElementById("_zoom");__style||(_hd=_doc.getElementsByTagName("head")[0],__style=_doc.createElement("style"),_hd.appendCHild(_style)),_orientationChange=function(){_w=_doc.documentElement.clientWidth||_doc.body.clientWidth,_zoom=_w/640,__style.innerHTML=".zoom {zoom:"+_zoom+";-webkit-text-size-adjust:auto!important;}"},_orientationChange(),window.addEventListener("resize",_orientationChange,!1);
</script>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/product.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>

</head>

<body>
<div class="act_wrapper zoom ">
  <div class="act_content">
<div class="head">产品详情</div>
<div class="center">
  <span class="hb" style="margin-top:20px;"></span>
  <div class="cplb">
    <h2>${product.name}</h2>
	<div style="line-height:1.5em;font-size:28px;background:none;">
      <p style="float:left;padding-top:30px;padding-right:20px;">预计年化收益率</p><h1 style="font-size:66px;color:#c91e22;line-height:1.2em;float:left;">${product.rate}</h1>
    </div>
    <div class="cplb_zy">
      <ul>
		<c:if test="${product.profitId == 42}">
          <li class="cplb_red">期限
					<c:if test="${product.profitId==42}">
						${product.term}
						<c:choose>
							<c:when test="${product.termUnit==63}">年</c:when>
							<c:when test="${product.termUnit==64}">月</c:when>
							<c:otherwise>天</c:otherwise>
						</c:choose>
					</c:if>
		 </li>
		 </c:if>
         <li>
					<c:choose>
						<c:when test="${product.minAmount>10000}">  
							<fmt:formatNumber value="${product.minAmount/10000}"  minFractionDigits="0"/>万元      
						</c:when>
						<c:otherwise> 
							<fmt:formatNumber value="${product.minAmount}"  minFractionDigits="0"/>元
						</c:otherwise>
					</c:choose>起购
		  </li>
          <li>
			<c:if test="${product.releaseDate < product.invalidDate}">
				<fmt:formatDate pattern="yyyy/MM/dd hh:mm" value="${product.releaseDate}"/>发行    
			</c:if>
			<c:if test="${product.releaseDate >= product.invalidDate}">
				待定
			</c:if>
		  </li>
      </ul>
    </div>
  </div>
  
  <div class="listable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	<c:if test="${product.profitId == 42}">
      <tr>
        <th width="120">产品规模</th>
        <td>${product.amount/100000000}亿</td>
      </tr>
      <tr>
        <th>投资起点</th>
        <td><c:choose>
				<c:when test="${product.minAmount>10000}">  
					<fmt:formatNumber value="${product.minAmount/10000}"  minFractionDigits="0"/>万元      
				</c:when>
				<c:otherwise> 
					<fmt:formatNumber value="${product.minAmount}"  minFractionDigits="0"/>元
				</c:otherwise>
			</c:choose>
			+
			<c:choose>
				<c:when test="${product.appendAmount>10000}">  
					<fmt:formatNumber value="${product.appendAmount/10000}"  minFractionDigits="0"/>万元      
				</c:when>
				<c:otherwise> 
					<fmt:formatNumber value="${product.appendAmount}"  minFractionDigits="0"/>元
				</c:otherwise>
			</c:choose>
			整数倍
		</td>
      </tr>
      <tr>
        <th>付息方式</th>
        <td>${product.payTypeInfo}</td>
      </tr>
      <tr>
        <th>资金投向</th>
        <td>${product.directionInfo}</td>
      </tr>
      <tr>
        <th>收益说明</th>
        <td>
        	<c:if test="${null != product.rateNote and '' != product.rateNote}">
        		${product.rateNote}
        	</c:if>
        	<c:if test="${null == product.rateNote or '' == product.rateNote}">             
        
        		<c:if test="${0 != product.partA and 0 == product.partB}">
        		${product.partA/10000}万元以上,
        		</c:if>
        
        		<c:if test="${0 != product.partA and 0 != product.partB}">
        		${product.partA/10000}万元≤X＜${product.partB/10000}万元,
        		</c:if>
        		
        		 
	        	 <fmt:formatNumber value="${product.rateA}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>%
		       	 <c:if test="${0 != product.rateB and 0 == product.partB and 0 == product.partA}"> 
		        	 - <fmt:formatNumber value="${product.rateB}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>%
	          	 </c:if>	        	 
	       	 <c:if test="${0 != product.partB and 0 == product.partC}"> 
	        	 <br />
	          	 ${product.partB/10000}万元及以上,
	          	 <fmt:formatNumber value="${product.rateB}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>  
	          	 %
          	 </c:if>	        	 
	       	 <c:if test="${0 != product.partB and 0 != product.partC}"> 
	        	 <br />
	          	 ${product.partB/10000}万元≤X＜${product.partC/10000}万元,
	          	 <fmt:formatNumber value="${product.rateB}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>  
	          	 %
          	 </c:if>
          	 
          	 <c:if test="${0 != product.partC and 0 == product.partD}"> 
	          	 <br />
	          	 ${product.partC/10000}万元及以上,
	          	 <fmt:formatNumber value="${product.rateC}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>  
	          	 %
          	 </c:if>
          	 
           	 <c:if test="${0 != product.partC and 0 != product.partD}"> 
	          	 <br />
	          	 ${product.partC/10000}万元≤X<${product.partD/10000}万元,
	          	 <fmt:formatNumber value="${product.rateC}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>  
	          	 %
          	 </c:if>         	 
          	 
          	 <c:if test="${0 != product.partD}"> 
	          	 <br />
	          	 ${product.partD/10000}万元及以上,
	          	 <fmt:formatNumber value="${product.rateD}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>  
	          	 %
          	 </c:if>         
        	</c:if> 
        </td>
      </tr> 
	</c:if>
	<c:if test="${product.profitId == 43}">
      <tr width="120">
        <th>基金经理</th>
        <td><c:out value="${product.fundManagerHtml}" escapeXml="false" /></td>
      </tr>
      <tr>
        <th>投资方向</th>
        <td>${product.directionInfo}</td>
      </tr>
      </tr>
      <tr>
        <th>投资起点</th>
        <td>
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
		</td>
      </tr>	 
      <tr>
        <th>封闭期限</th>
        <td>
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
		</td>
      </tr>
      <tr>
        <th>开放日</th>
        <td>${product.openDay}</td>
      </tr>
      <tr>
        <th>认购费</th>
        <td>${product.buyFee}</td>
      </tr>
      <tr>
        <th>退出费用</th>
        <td>${product.sellFee}</td>
      </tr>
      <tr>
        <th>管理费</th>
        <td><fmt:formatNumber value="${product.manageFee}"  minFractionDigits="0"/>%</td>
      </tr>	
      <tr>
        <th width="120">业绩报酬</th>
        <td>${product.bonus}</td>
      </tr>	  
	</c:if>
      <tr>
        <th >产品详情</th >
		<td>&nbsp;</td>
      </tr>     
      <tr border="0">
        <td colspan="2">${product.info}</td>
      </tr>
      <tr hidden>
        <td colspan="2"><a href="<%=request.getContextPath() %>/weixin/product/goappointment?productid=${product.id}&name=${product.name}" class="btn_red">我要购买</a></td>
      </tr>
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
