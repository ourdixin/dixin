<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品转让</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath() %>/js/popwindow.js"></script>
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
<form action="<%=request.getContextPath() %>/product/assignment" method="post" id="assiForm">
	<div id="main_right">  
		<ul class="ul_1">
			<li class="tab1_1_on"  id="tab1_1" onMouseOver="set_tab('tab1', 1 ,4)">发布产品</li>
			<li class="tab1_2_off" id="tab1_2" onMouseOver="set_tab('tab1', 2 ,4)">已发布产品</li>
		</ul>
		<div id="tab1_con_1" class=" table_c" style=" display:block; clear:both;">
				<table width="100%" >
					<tbody>
						  <tr>
						      <td width="18%" height="30" align="right">产品名称：</td>
						      <td width="82%"><input maxlength="11" id="mobile" name="mobile" class="itstyle lt it" type="text" /></td>
						   </tr>
						  <tr>
						    <td height="30" align="right">产品类型/信托/资管：</td>
						    <td><input maxlength="11" id="mobile2" name="mobile2" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">成立时间：</td>
						    <td><input maxlength="11" id="mobile3" name="mobile3" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">期限：</td>
						    <td><input maxlength="11" id="mobile4" name="mobile4" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">收益分配：</td>
						    <td><input maxlength="11" id="mobile5" name="mobile5" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">金额：</td>
						    <td><input maxlength="11" id="mobile6" name="mobile6" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">联系人：</td>
						    <td><input maxlength="11" id="mobile7" name="mobile7" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">联系电话：</td>
						    <td><input maxlength="11" id="mobile8" name="mobile8" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">转让时间：</td>
						    <td><input maxlength="11" id="mobile9" name="mobile9" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="55" align="right">&nbsp;</td>
						    <td><span class="bnt_ok" style="padding:5px 50px; font-size:14px;">发布</span></td>
						  </tr>
			      </tbody>
			</table>
		</div>
		<br class=" clear" />
	</div>
</from>
<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
