<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品销售数据</title>
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

<div>
	<a href="<%=request.getContextPath()%>/admin/addSalesData">添加产品销售数据</a>
</div>

<div class="con_table">
<table width="1200">
  <thead>
  <tr>
    <th>产品代码</th>
    <th>产品名称</th>
  <th>类型</th>
  <th>销售金额/万元</th>
  <th>起息日</th>
  <th>到期日</th>
  <th>付息方式</th>
  <th>回执</th>
  <th>状态</th>
  <th>备注</th>
  <th width=50>操作</th>
  </tr>
  </thead>
  <tbody>
      <tr>
        <td>102158415</td>
        <td>衡阳城投二期</td>
        <td>A类</td>
        <td>100<span><a href="<%=request.getContextPath() %>/admin/SalesData-detail.jsp">明细</a></span></td>
        <td>2015-3-15</td>
        <td>2016-3-15</td>
        <td>年付</td>
        <td>已收到</td>
        <td>存续</td>
        <td>无</td>
        <td><i><a href="<%=request.getContextPath() %>/admin/SalesData-editor.jsp">编辑</a></i></td>
        </tr>
      <tr>
        <td>102158415</td>
        <td>衡阳城投二期</td>
        <td>B类</td>
        <td>450<span><a href="<%=request.getContextPath() %>/admin/SalesData-detail.jsp">明细</a></span></td>
        <td>2015-3-15</td>
        <td>2016-3-15</td>
        <td>自然年付</td>
        <td>未收到</td>
        <td>存续</td>
        <td>延期3个月，利率上浮1%到期付30%</td>
        <td><i><a href="<%=request.getContextPath() %>/admin/SalesData-editor.jsp">编辑</a></i></td>
        </tr>
      <tr>
        <td>102158415</td>
        <td>衡阳城投二期</td>
        <td>A类</td>
        <td>200<span><a href="<%=request.getContextPath() %>/admin/SalesData-detail.jsp">明细</a></span></td>
        <td>2015-3-15</td>
        <td>2016-3-15</td>
        <td>半年付</td>
        <td>已收到</td>
        <td>到期</td>
        <td>无</td>
        <td><i><a href="<%=request.getContextPath() %>/admin/SalesData-editor.jsp">编辑</a></i></td>
        </tr>
      <tr>
        <td>102158415</td>
        <td>衡阳城投二期</td>
        <td>B类</td>
        <td>350<span><a href="<%=request.getContextPath() %>/admin/SalesData-detail.jsp">明细</a></span></td>
        <td>2015-3-15</td>
        <td>2016-3-15</td>
        <td>季度付</td>
        <td>已收到</td>
        <td>到期</td>
        <td>无</td>
        <td><i><a href="<%=request.getContextPath() %>/admin/SalesData-editor.jsp">编辑</a></i></td>
        </tr>
      </tbody>
        </table>

</div>
</div>
<div class="page_menu">
          <a class="item">  <  </a>
          <a class="item">1</a>
          <a class="item">2</a>
          <a class="item">3</a>
          <a class="item">4</a>
          <a class="item">5</a>
          <a class="item">6</a>
          <a class="item"> >  </a>
     
</div>
</div>

<br class=" clear" />
</div>


<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
