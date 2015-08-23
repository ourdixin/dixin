<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户产品预约（处理）</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/appointment-deal.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
<!---TOP头部共用部份---->
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---管理左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---管理左侧共用部份结束---->
<div id="main_right">

<div class=" table_c">
	<form action="<%=request.getContextPath() %>/admin/appointment-deal"   id="dealForm">
		<input type="hidden" id="a1" name="reservationId" value="${param.reservationId}"/>
		<input type="hidden" id="a2" name="userId" value="${param.userId}"/>
		<input type="hidden" id="a3" name="productId" value="${param.productId}"/>
		<input type="hidden" id="a4" name="constant" value="${param.constant}"/>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	   		<tr>
	       		<c:choose>
	       			<c:when test="${param.constant==104}">
	       				<td><input type="radio" name="option" id="radio" value="104" checked/>已购买</td>
	       			</c:when>
	       			<c:otherwise>
	       				<td><input type="radio" name="option" id="radio" value="104" />已购买</td>
	       			</c:otherwise>
	       		</c:choose>
	       	    <td>购买时间 </td>
	        	<td><input name="buyDate" type="date" class="itstyle lt it" id="pass" maxlength="60"  value="2015-02-15" onfocus="if(value==defaultValue){value='';this.style.color='#999'}" onblur="if(!value){value=defaultValue;this.style.color='#999'}"  /></td>
	       		<td>购买金额          </td>
	        	<td><input name="amount" type="text" class="itstyle it160" id="pass2"  maxlength="12" value="100" onfocus="if(value==defaultValue){value='';this.style.color='#999'}" onblur="if(!value){value=defaultValue;this.style.color='#999'}"  />万元</td>
	        	<td>购买份额</td>
	        	<td><input name="volume" type="text" class="itstyle it160" id="pass3"  maxlength="12" value="10" onfocus="if(value==defaultValue){value='';this.style.color='#999'}" onblur="if(!value){value=defaultValue;this.style.color='#999'}"  />份</td>
	        </tr>
	      	<tr>
	      		<c:choose>
	       			<c:when test="${param.constant==105}">
	       				<td><input type="radio" name="option" id="radio2" value="105" checked/>购买中</td>
	       			</c:when>
	       			<c:otherwise>
	       				<td><input type="radio" name="option" id="radio2" value="105" />购买中</td>
	       			</c:otherwise>
	       		</c:choose>
	        	<td colspan="10">进程 <input maxlength="12" class="itstyle it" name="info" id="pass3" type="text" /></td>
	        </tr>
	      	<tr>
	      		<c:choose>
	       			<c:when test="${param.constant==106}">
	       				<td><input type="radio" name="option" id="radio3" value="106" checked/>不购买</td>
	       			</c:when>
	       			<c:otherwise>
	       				<td><input type="radio" name="option" id="radio3" value="106" />不购买</td>
	       			</c:otherwise>
	       		</c:choose>
	        	<td colspan="10">原因 <input maxlength="12" class="itstyle it" name="reason" id="pass4" type="text" /></td>
	        </tr>
	      	<tr>
	        	<td height="80" colspan="11"><span class="bnt_ok">确定</span><span class="cancel">取消</span></td>
	        </tr>
	  	</table>
	  </form>
</div>
</div>
<br class=" clear" />
</div>
<blockquote>&nbsp;	</blockquote>

<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
