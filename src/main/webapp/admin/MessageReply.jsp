<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>留言回复</title>
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
    <th>留言时间</th>
    <th>客户代码</th>
    <th>客户姓名</th>
    <th>分类问题</th>
    <th>问题描述</th>
    </tr>
  </thead>
  <tbody>
      <tr>
        <td>2015-3-15</td>
        <td>12015</td>
        <td>张三</td>
        <td>产品预约</td>
        <td>我有100万的产品需要转让，如何转让啊</td>
        </tr>
      <tr>
        <td>2015-3-15</td>
        <td>12015</td>
        <td>张三</td>
        <td>产品转让</td>
        <td>利润很高</td>
        </tr>
      </tbody>
        </table>

</div>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><textarea name="pass" rows="4"  class="tareastyle tarea" id="pass2"></textarea></td>
  </tr>
  <tr>
    <td align="center">
<p><span class="bnt_ok">提交联系记录</span></p></td>
  </tr>
</table>
</div>

<br class=" clear" />
</div>


<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>