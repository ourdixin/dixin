<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户产品转让（详细）</title>
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

<div class="tab1">
<div class="user_title">增益8号集合资金依托计划</div>
<div class="con_table">
  <table width="100%">
    <tbody>
      <tr>
        <td align="center" bgcolor="#FFFFFF">金额</td>
        <td bgcolor="#FFFFFF">3145万元</td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">联系人</td>
        <td bgcolor="#FFFFFF">余先生</td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">联系电话</td>
        <td bgcolor="#FFFFFF">15848548522</td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">转让条件</td>
        <td bgcolor="#FFFFFF">剩余半年内收益率9.5%</td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">有效性</td>
        <td bgcolor="#FFFFFF">未转让</td>
      </tr>
    </tbody>
  </table>
</div>

</div>
<div class="tab1">
<div class="user_title">产品信息</div>
<div class="con_table">
  <table width="100%">
    <tbody>
      <tr>
        <td align="center" bgcolor="#FFFFFF">项目名称</td>
        <td bgcolor="#FFFFFF">衡阳项目二期</td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">成立日期</td>
        <td bgcolor="#FFFFFF">2015-12-5</td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">收益分配</td>
        <td bgcolor="#FFFFFF">剩余半年内收益率9.5%</td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">有效性</td>
        <td bgcolor="#FFFFFF">未转让</td>
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
