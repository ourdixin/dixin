<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户信息管理</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---管理左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---管理左侧共用部份结束---->
<div id="main_right">

<div class="main_width">
<div class="con_table">
<table width="100%">
  <thead>
  <tr>
    <th width="13%">注册时间</th>
    <th width="13%">客户代码</th>
    <th width="13%">客户姓名</th>
    <th width="12%">QQ</th>
    <th width="13%">地址</th>
    <th colspan="2">会员权限审核</th>
    <th width="19%">操作</th>
    </tr>
  </thead>
  <tbody>
      <tr>
        <td>2015-3-15</td>
        <td>12015</td>
        <td>张三</td>
        <td>152145</td>
        <td>北京市海淀区</td>
        <td width="9%">高级</td>
        <td width="8%"><b><a href="<%=request.getContextPath()%>/admin/Vip-audit.jsp">审核</a></b>&nbsp;</td>
        <td><em>删除</em><span><a href="<%=request.getContextPath()%>/admin/Vip-information.jsp">修改</a></span><i><a href="<%=request.getContextPath()%>/admin/Vip-add.jsp">添加</a></i></td>
        </tr>
      <tr>
        <td>2015-3-15</td>
        <td>12015</td>
        <td>张三</td>
        <td>494865878</td>
        <td>深圳市福田</td>
        <td>普通</td>
        <td>&nbsp;</td>
        <td><em>删除</em><span><a href="<%=request.getContextPath()%>/admin/Vip-information.jsp">修改</a></span><i><a href="<%=request.getContextPath()%>/admin/Vip-add.jsp">添加</a></i></td>
        </tr>
      <tr>
        <td>2015-3-15</td>
        <td>12015</td>
        <td>张三</td>
        <td>152145</td>
        <td>深圳市福田</td>
        <td>中级</td>
        <td>&nbsp;<b><a href="<%=request.getContextPath()%>/admin/Vip-audit.jsp">审核</a></b></td>
        <td><em>删除</em><span><a href="<%=request.getContextPath()%>/admin/Vip-information.jsp">修改</a></span><i><a href="<%=request.getContextPath()%>/admin/Vip-add.jsp">添加</a></i></td>
        </tr>
      </tbody>
        </table>

</div>
</div>
</div>

<br class=" clear" />



<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
