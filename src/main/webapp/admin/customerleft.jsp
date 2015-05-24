<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
	<div id="main_body">
		<div id="main_left">
			<ul>
				<dt>后台管理</dt>
<dd><a href="<%=request.getContextPath()%>/admin/appointment"><img src="<%=request.getContextPath()%>/images/ico_14.png" width="20" height="20" />客户产品预约</a></dd>
<dd><a href="<%=request.getContextPath()%>/admin/SalesData.jsp"><img src="<%=request.getContextPath()%>/images/ico_16.png" width="20" height="20" />产品销售数据</a></dd>
<dd><a href="<%=request.getContextPath()%>/admin/message"><img src="<%=request.getContextPath()%>/images/ico_11.png" width="20" height="20" />客户在线留言</a></dd>
<dd><a href="<%=request.getContextPath()%>/admin/findAllUser"><img src="<%=request.getContextPath()%>/images/ico_07.png" width="20" height="20" />客户管理</a></dd>
<dd><a href="<%=request.getContextPath()%>/admin/manage.jsp"><img src="<%=request.getContextPath()%>/images/ico_12.png" width="20" height="20" />产品管理</a></dd>
<dd><a href="<%=request.getContextPath()%>/admin/product/assignment"><img src="<%=request.getContextPath()%>/images/ico_05.png" width="20" height="20" />客户产品转让</a></dd>
<dd><a href="<%=request.getContextPath()%>/#"><img src="<%=request.getContextPath()%>/images/ico_17.png" width="18" height="20" />权限管理</a></dd>
<dd><a href="<%=request.getContextPath()%>/#"><img src="<%=request.getContextPath()%>/images/ico_04.png" width="20" height="20" />我的基本信息</a></dd>
<dd><a href="<%=request.getContextPath()%>/authentication/logout"><img src="<%=request.getContextPath()%>/images/ico_20.png" width="17" height="20" />安全退出</a></dd>
			</ul>
		</div>
</body>
</html>
