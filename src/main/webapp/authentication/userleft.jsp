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
				<dt>我的121金融</dt>
				<dd>
					<a href="boughtproduct.jsp"><img src="<%=request.getContextPath()%>/images/ico_03.png" width="12" height="12" />我购买的产品</a>
				</dd>
				<dd>
					<a href=""><img src="<%=request.getContextPath()%>/images/ico_18.png" width="15" height="15" />我的预约</a>
				</dd>
				<dd>
					<a href="<%=request.getContextPath()%>/product/assignment.jsp"><img src="<%=request.getContextPath()%>/images/ico_13.png" width="20" height="16" />产品转让</a>
				</dd>
				<dd>
					<a href="myselfwealthers.jsp"><img src="<%=request.getContextPath()%>/images/ico_06.png" width="13" height="20" />我的专属财富经理</a>
				</dd>
				<dd>
					<a href="RiskAppraisal.jsp"><img src="<%=request.getContextPath()%>/images/ico_10.png" width="16" height="17" />风险评估</a>
				</dd>
				<dd>
					<a href="personaldata.jsp"><img src="<%=request.getContextPath()%>/images/ico_17.png" width="18" height="20" />帐户设置</a>
				</dd>
				<dd>
					<a href="about.html"><img src="<%=request.getContextPath()%>/images/ico_20.png" width="17" height="20" />安全退出</a>
				</dd>
			</ul>
		</div>
</body>
</html>