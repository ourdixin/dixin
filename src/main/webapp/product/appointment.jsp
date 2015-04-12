<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品预约</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/product/appointment.js"></script>
</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<div id="main_body">
<div id="main_left">
<ul>
<dt>我的121金融</dt>
<dd><a href="about.html">我购买的产品</a></dd>
<dd><a href="about.html">我的预约</a></dd>
<dd><a href="about.html">产品转让</a></dd>
<dd><a href="about.html">我的专属财富经理</a></dd>
<dd><a href="about.html">风险评估</a></dd>
<dd><a href="about.html">帐户设置</a></dd>
<dd><a href="about.html">安全退出</a></dd>
</ul>
</div>
<form action="<%=request.getContextPath() %>/product/appointment" method="post" id="appointForm">
<div id="main_right">
  <div class="table_c">
  <table width="100%" cellpadding="0" cellspacing="0">
    <tr>
      <td height="54" colspan="2" style="font-size:15px; font-weight:bold; padding-left:100px;">为了确保您预约成功，请正确填写以下信息(<font class="red">*</font>为必填项)</td>
      </tr>
    <tr>
      <td height="60" align="right">预约产品：</td>
      <td width="82%"><input maxlength="" id="productId" name="productId" class="itstyle lt it" type="text" /></td>
     </tr>
    <tr>
      <td height="60" align="right">预约金额：</td>
      <td width="81%"><input maxlength="12" class="itstyle lt it" name="amount" id="amount" type="text"  />
      万元</td>
      </tr>
    <tr>
      <td height="60" align="right">预计打款：</td>
      <td><input maxlength="12" class="itstyle lt it" name="reserve_date" id="reserve_date" type="date"  />
      预计打款时间</td>
      </tr>
    <tr>
      <td height="60" align="right">手机号码：</td>
      <td width="81%"><input maxlength="12" class="itstyle lt it" name="tel" id="tel" type="text" /></td>
      </tr>
    <tr>
      <td height="60" valign="top" align="right">备注信息：</td>
      <td height="25"><textarea name="msg" cols="65" rows="4"  id="msg" onfocus="if(value==defaultValue){value='';this.style.color='#999'}" onblur="if(!value){value=defaultValue;this.style.color='#999'}">感谢您预约我司产品！如您有相关的单号 或需要我们配合您的工作，可以在此留言，以便我司工作人员解答协助，您也可致电我司客服电话</textarea></td>
      </tr>
    <tr>
      <td width="18%" height="60" valign="top"></td>
      <td valign="top" width="81%"><br /><span class="bnt_ok">
        预约 </span><br /><br /></td>
    </tr>
  </table>
</div>
</div>
<br class=" clear" />
</div>
</form>
<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
