<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线客服</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/product/customer.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<div id="main_body">

<div id="title_xi"></div>
<div id="title_font">在线客服</div>
<div class=" table_c" >
<form action="<%=request.getContextPath() %>/product/customer"  method ="post" id="customerForm">
   <table>
    <tbody>
      <tr>
        <td height="25" colspan="2" bgcolor="#efb270"><span style="color:#fff">&nbsp;&nbsp;请填写您的提问，我们会及时给您答复！</span></td>
        </tr>
      <tr>
        <td width="14%" height="35" align="center" bgcolor="#FFFFFF"><font class="font_red">*</font>问题类型：</td>
        <td width="86%" bgcolor="#FFFFFF"><select name="select2" id="select2">
          <option>浮动收益类产品</option>
          <option>固定收益类产品</option>
          <option>其他</option>
        </select></td>
        </tr>
      <tr>
        <td height="35" align="center" bgcolor="#FFFFFF"><font class="font_red">*</font>问题描述：</td>
        <td bgcolor="#FFFFFF"><textarea name="questions" rows="10" class="itstyle lt it" id="pass" style="height:100px; width:300px;"></textarea></td>
      </tr>
      <tr>
        <td height="35" align="center" bgcolor="#FFFFFF">&nbsp;</td>
        <td bgcolor="#FFFFFF"><span class="bnt_ok">确定</span></td>
      </tr>
    </tbody>
  </table>
</form>
</div>
<br class=" clear" />
</div>



	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
