<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品预约详细信息</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
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
<div class="user_title">产品名称：${param.productName}</div>
<div class="user_title">客户姓名：${param.userName}</div>
<div class="con_table">
  	<input type="hidden" name="reservationId" id="a1" value="${param.reservationId }"/>
  	<table width="1200">
    	<thead>
     	 	<tr>
        		<th align="center" bgcolor="#FFFFFF">进程时间</th>
        		<th bgcolor="#FFFFFF">进程状态</th>
         		<th bgcolor="#FFFFFF">备注信息</th>
        	</tr>
        </thead>
        <tbody>
    		<c:choose>
    			<c:when test="${empty list}">
    				<tr>
    					<td></td><td></td><td></td>
    				</tr>
    			</c:when>
    			<c:otherwise>
    				<c:forEach var="process" items="${list}">
    					<tr>
    						<td>
    							<fmt:formatDate value="${process.date}" pattern="yyyy-MM-dd HH:mm"/>
    						</td>
    						<td>
    							${process.state}
    						</td>
    						<td>
    							${process.info}
    						</td>
    					</tr>
    				</c:forEach>
    			</c:otherwise>
    		</c:choose>
      
    	</tbody>
  </table>
  		
  
  
</div>


<br class=" clear" />
</div>


<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
