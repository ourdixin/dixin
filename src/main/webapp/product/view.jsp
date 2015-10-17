<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产品详细</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/product/view.js"></script>
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

<div class="showbox">
  <div class="showtab">
  <div class="table_c">
   <table width="100%">
    <tbody>
      <tr>
        <td width="0%" height="50" align="center" bgcolor="#f2f2f2"><strong>资管计划名称</strong></td>
        <td colspan="3" align="center" bgcolor="#f2f2f2"><font style="color:#F90; font-size:18px; font-weight:bold;">${product.name}
	        <c:if test='${product.code != null && product.code !="" }'>
	        	(${product.code})
	        </c:if>
	        </font>
        </td>
      </tr>
      <c:if test="${product.profitId == 42}">
      <tr>
        <td width="0%" height="35" align="center" bgcolor="#FFFFFF">发行时间</td>
        <td width="0%" align="center" bgcolor="#FFFFFF">
	        <strong>
	        <c:if test="${product.releaseDate < product.invalidDate}">
	        	<fmt:formatDate value="${product.releaseDate}" pattern="yyyy年MM月dd日  HH:mm"/>      
	        </c:if>
	        <c:if test="${product.releaseDate >= product.invalidDate}">
	        	待定
	        </c:if>
	        </strong>
        </td>
        <td width="0%" align="center" bgcolor="#FFFFFF">起息日期</td>
        <td width="0%" align="center" bgcolor="#FFFFFF">
	        <strong>        
	        <c:if test="${product.valueDate < product.invalidDate}">
	        	<fmt:formatDate value="${product.valueDate}" pattern="yyyy年MM月dd日  HH:mm"/>      
	        </c:if>
	        <c:if test="${product.valueDate >= product.invalidDate}">
	        	待定
	        </c:if>
	        </strong>
        </td>
        
        <tr>
        <td width="0%" align="center" bgcolor="#FFFFFF">产品期限</td>
        <td width="0%" align="center" bgcolor="#FFFFFF">
	        <strong>
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
	        </strong>
        </td>
        <td width="0%" align="center" bgcolor="#FFFFFF" height="35">产品规模</td>
        <td width="0%" align="center" bgcolor="#FFFFFF">
	        <c:if test="${product.amount  > 0 }">
	        	<strong>预计为 <fmt:formatNumber value="${product.amount/100000000}"  minFractionDigits="0"/>亿元</strong>
	        </c:if>
        </td>
       </tr>
       <tr>
        <td width="0%" align="center" bgcolor="#FFFFFF">投资起点</td>
        <td width="0%" align="center" bgcolor="#FFFFFF">
	        <strong>
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
	        </strong>
        </td>
        <td width="0%" align="center" bgcolor="#FFFFFF">付息方式</td>
       	<td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.payTypeInfo}</strong></td>       
       </tr>
      <tr>
        <td width="0%" align="center" bgcolor="#FFFFFF">产品类型</td>
       	<td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.productType}</strong></td>
        <td width="0%" align="center" bgcolor="#FFFFFF">投资方向</td>
       	<td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.directionInfo}</strong></td>
      </tr>
      <tr>
       <td width="0%" height="50" align="center" bgcolor="#FFFFFF">收益说明</td>
        <td colspan="3" align="center" bgcolor="#FFFFFF">
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
      </tr>
     </c:if>
     
     <c:if test="${product.profitId == 43}">
      <tr>
        <td width="0%" height="35" align="center" bgcolor="#FFFFFF">发行时间</td>
        <td width="0%" align="center" bgcolor="#FFFFFF">
	        <strong>
	        <c:if test="${product.releaseDate < product.invalidDate}">
	        	<fmt:formatDate value="${product.releaseDate}" pattern="yyyy年MM月dd日  HH:mm"/>      
	        </c:if>
	        <c:if test="${product.releaseDate >= product.invalidDate}">
	        	待定
	        </c:if>
	        </strong>
        </td>
        <td width="0%" align="center" bgcolor="#FFFFFF">成立日期</td>
       	<td width="0%" align="center" bgcolor="#FFFFFF">
	       	<strong>        
	       	<c:if test="${product.valueDate < product.invalidDate}">
	       	<fmt:formatDate value="${product.valueDate}" pattern="yyyy年MM月dd日  HH:mm"/>      
	       	</c:if>
	       	<c:if test="${product.valueDate >= product.invalidDate}">
	       	待定
	       	</c:if>
	       	</strong>
       	</td> 
      </tr>  
      <tr>
        <td width="0%" align="center" bgcolor="#FFFFFF">基金经理</td>
       	<td width="0%" align="center" bgcolor="#FFFFFF"><strong><c:out value="${product.fundManagerHtml}" escapeXml="false" /></strong></td>
        <td width="0%" align="center" bgcolor="#FFFFFF">投资方向</td>
       	<td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.directionInfo}</strong></td>       	
      </tr>
      <tr>
        <td width="0%" align="center" bgcolor="#FFFFFF">投资起点</td>      
        <td width="0%" align="center" bgcolor="#FFFFFF">
	        <strong>
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
	        </strong>
        </td>
        <td width="0%" align="center" bgcolor="#FFFFFF" height="35">产品规模</td>
        <td width="0%" align="center" bgcolor="#FFFFFF">
	        <c:if test="${product.amount  > 0 }">
	        	<strong>预计为 <fmt:formatNumber value="${product.amount/100000000}"  minFractionDigits="0"/>亿元</strong>
	        </c:if>
        </td>       
      </tr>
      <tr>
      	<td width="0%" align="center" bgcolor="#FFFFFF">封闭期限</td>
      	<td width="0%" align="center" bgcolor="#FFFFFF">
	      	<strong>
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
	      	</strong>
      	</td>
      	<td width="0%" align="center" bgcolor="#FFFFFF">开放日</td>
		<td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.openDay}</strong></td>  
      </tr>
 	  <tr>
        <td width="0%" align="center" bgcolor="#FFFFFF">认购费</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.buyFee}</strong></td>        
        <td width="0%" align="center" bgcolor="#FFFFFF">退出费用</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.sellFee}</strong></td> 
 	  </tr>
 	  <tr>
 	    <td width="0%" align="center" bgcolor="#FFFFFF">管理费</td>
        <td width="0%" align="center" bgcolor="#FFFFFF"><strong><fmt:formatNumber value="${product.manageFee}"  minFractionDigits="0"/>%</strong></td>
		<td width="0%" align="center" bgcolor="#FFFFFF">业绩报酬</td>
       	<td width="0%" align="center" bgcolor="#FFFFFF"><strong>${product.bonus}</strong></td>
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
</div>  
  
     <div class="showright">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
       	<form id="appointForm" name="appointForm" method="post" action="">
         <tr>
           <td><h2>在线预约</h2></td>
           <td align="right">咨询热线：400-9922-519</td>
         </tr>
         <tr>
           <td height="50" colspan="2">
           	 <input  name="productId" id="productId" value="${product.id}" type="hidden" />
             <input type="text" name="name" id="name" value="填写您的称呼" class="ch" onFocus="if(value==defaultValue){value='';this.style.color='#999'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}"/>
           </td>
          </tr>
         <tr>
           <td height="50" colspan="2"><input name="tel" type="text" class="sjhm" id="tel" value="填写手机号码" onFocus="if(value==defaultValue){value='';this.style.color='#999'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}"/></td>
          </tr>
         <tr>
           <td height="50" colspan="2"><input name="amount" type="text" id="amount" class="je" value="填写金额(万元)" onFocus="if(value==defaultValue){value='';this.style.color='#999'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}"/></td>
          </tr>
         <tr hidden>
           <td height="50" colspan="2"><input name="reserve_date" type="date" id="reserve_date" class="je" value="2200-10-10" />预计打款时间</td>
          </tr>
         <tr>
           <td colspan="2"><textarea name="msg" id="msg" cols="45" rows="5"></textarea></td>
          </tr>
         <tr>
           <td colspan="2"><input id="bnt_ok" type="button" style="cursor:pointer;" value="立刻预约" /></td>
         </tr>
       	</form>
       </table>
     </div>
     <div class="clear"></div>
     <div class="showcz">
     	<img src="<%=request.getContextPath()%>/images/20151015_03.gif" width="13" height="14" align="absmiddle" /> ${product.reservationNum} &nbsp;&nbsp;&nbsp; 
     	<img src="<%=request.getContextPath()%>/images/20151015_04.gif" width="13" height="14" align="absmiddle" /> ${product.downNum} &nbsp;&nbsp;&nbsp; 
     	<img src="<%=request.getContextPath()%>/images/20151015_05.gif" width="17" height="14" align="absmiddle" /> ${product.viewNum}
     </div>  
  
</div>

   <div class="showcen">
     <div class="showtit">
       <h2>产品详情</h2>
       <input hidden name="adFileSrc" type="text" id="adFileSrc" 
       	<c:if test="${product.adFile != null && product.adFile !='' }">
       		value="<%=request.getContextPath()%>/${product.adFile}" 
       	</c:if>
       />
     	<div class="show">
     		<div>
		     	<a id="adFile" name="productId=${product.id}" href="javascript:void(0)" target="_blank" >
					<img src="<%=request.getContextPath()%>/images/20151015_06.gif" width="115" height="30" />
				</a>
			</div>
			<div class="bdsharebuttonbox"> 
		      	<a href="<%=request.getContextPath()%>/weixin/product/productdetail?productid=${product.id}" class="bds_weixin" data-cmd="weixin"
		      		style="background-image:url('<%=request.getContextPath()%>/images/20151015_07.gif');background-position:center;height:30px;width:87px;margin: 8px 0px 6px 0px;"
		      	></a>
	      	</div>
      		<script>window._bd_share_config={"common":{bdUrl:'<%=request.getScheme()%>://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/weixin/product/productdetail?productid=${product.id}',"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"32"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>     	
		</div>     
     </div>
     <div class="showtext">
		${product.info}
	 </div>
     <div class="show">
     	<a id="adFile2" name="productId=${product.id}" href="javascript:void(0)">
		<img src="<%=request.getContextPath()%>/images/20151015_06.gif" width="115" height="30" /></a>
     	<a href="#"><img src="<%=request.getContextPath()%>/images/20151015_07.gif" width="87" height="30" /></a>
     </div>
   </div>
<br class=" clear" />
</div>
</div>

<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->


</body>
</html>