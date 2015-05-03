<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>增加新客户</title>
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
<div class="layout_a per_data"><div class="title clearfix">
<h3>个人资料</h3>
<ul class="wsd_box lt"><li>资料完善度</li><li id="infoProgress" class="to0"><p><em></em><span>0%</span></p></li></ul>
</div>
</div>
<div class="user_table">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="11%" align="right">用户名：</td>
      <td colspan="2">kpqd13928456069</td>
      </tr>
    <tr>
      <td align="right">QQ：</td>
      <td colspan="2"><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password"></td>
    </tr>
    <tr>
      <td align="right">所在地区：</td>
      <td width="11%">  <select name="select" id="select">
        <option>请选择</option>
        <option>北京</option>
        <option>上海</option>
        <option>深圳</option>
        <option>广州</option>
      </select></td>
      <td width="78%"><select name="select2" id="select2">
        <option>北京</option>
      </select></td>
    </tr>
    <tr>
      <td align="right">联系地址：</td>
      <td colspan="2"><input maxlength="12" class="itstyle lt it" name="pass" id="pass2" type="password" /></td>
      </tr>
  </table>
</div>
<div class="layout_a per_data"><div class="title clearfix">
<h3>安全中心</h3>
<div class="safe_grade lt">
<p id="safetyLevel" class="in">安全等级</p>
</div>
</div>
</div>
<div class="user_table">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="12%" align="right">登陆密码：</td>
      <td width="31%"><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password"></td>
      <td width="57%">修改</td>
    </tr>
    <tr>
      <td align="right">手机号码：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass" id="pass2" type="password" /></td>
      <td>修改</td>
    </tr>
  </table>
</div>


<div class="layout_a per_data"><div class="title clearfix">
<h3>会员权限</h3>
<div class="safe_grade lt">
<p id="safetyLevel" class="on">安全等级</p>
</div>
</div>
</div>
<div class="user_table">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="15%" align="right">实名认证：</td>
      <td width="29%"><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password"></td>
      <td width="15%" align="right">身份证：</td>
      <td width="29%"><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password" /></td>
      </tr>
    <tr>
      <td align="right">证券客户认证：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass" id="pass2" type="password" /></td>
      <td align="right">证券公司：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass" id="pass2" type="password" /></td>
      </tr>
    <tr>
      <td align="right">付费会员认证：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass2" id="pass3" type="password" /></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
      </tr>
  </table>
</div>
</div>

<br class=" clear" />
<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
