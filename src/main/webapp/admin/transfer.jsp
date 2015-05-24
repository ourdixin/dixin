<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户产品转让</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!---TOP头部共用部份---->
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
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
    <th>客户代码</th>
    <th>客户姓名</th>
    <th>产品名称</th>
    <th>转让金额/万元</th>
    <th>联系人</th>
    <th>发布时间</th>
    <th>有效性</th>
    <th>&nbsp;</th>
    <th>操作</th>
    </tr>
  </thead>
  <tbody>
      <tr>
        <td>12015</td>
        <td>张三</td>
        <td>衡阳城投二期</td>
        <td>100</td>
        <td>张三</td>
        <td>2015-3-15</td>
        <td>已转让</td>
        <td><b><a href="<%=request.getContextPath()%>/admin/transfer-detail.jsp">详细</a></b>&nbsp;</td>
        <td><em>删除</em></td>
        </tr>
      <tr>
        <td>12015</td>
        <td>张三</td>
        <td>衡阳城投二期</td>
        <td>200</td>
        <td>张三</td>
        <td>2015-3-15</td>
        <td>已转让</td>
        <td><b><a href="<%=request.getContextPath()%>/admin/transfer-detail.jsp">详细</a></b></td>
        <td><em>删除</em></td>
        </tr>
      <tr>
        <td>12015</td>
        <td>张三</td>
        <td>衡阳城投二期</td>
        <td>350</td>
        <td>张三</td>
        <td>2015-3-15</td>
        <td>未转让</td>
        <td>&nbsp;<b><a href="<%=request.getContextPath()%>/admin/transfer-detail.jsp">详细</a></b></td>
        <td><em>删除</em></td>
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
