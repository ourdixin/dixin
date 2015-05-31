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
</head>

<body>
<!---TOP头部共用部份---->
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---管理左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---管理左侧共用部份结束---->
<div id="main_right">
<div class="user_title">产品名称：中信证券•千石资本•宁聚优债季享4期</div>
<div class="user_title">客户姓名：13436636208</div>
<div class="con_table">
  <table width="1200">
    <thead>
      <tr>
        <th align="center" bgcolor="#FFFFFF">进程时间</th>
        <th bgcolor="#FFFFFF">进程状态</th>
         <th bgcolor="#FFFFFF">备注信息</th>
        </tr>
        </thead>
        <tbody>
      <tr>
        <td align="center" bgcolor="#FFFFFF">2015年5月1日</td>
        <td bgcolor="#FFFFFF">未购买</td>
         <td bgcolor="#FFFFFF"> 12</td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">2015年5月10日</td>
        <td bgcolor="#FFFFFF">购买中 </td>
        <td bgcolor="#FFFFFF"> 22</td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">2015年5月20日</td>
        <td bgcolor="#FFFFFF">已购买</td>
        <td bgcolor="#FFFFFF"> 33</td>
      </tr>
      
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
