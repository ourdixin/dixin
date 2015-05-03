<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品销售数据（编辑）</title>
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
<div class=" table_c">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
      
        <td>起息日          </td>
        <td width="25%"><input name="password" type="text" class="itstyle it160" id="pass" value="2015-12-5" onfocus="if(value==defaultValue){value='';this.style.color='#999'}" onblur="if(!value){value=defaultValue;this.style.color='#999'}"  /></td>
        <td>到期日          </td>
        <td><input name="pass" type="text" class="itstyle it160" id="pass2" value="2015-12-5" onfocus="if(value==defaultValue){value='';this.style.color='#999'}" onblur="if(!value){value=defaultValue;this.style.color='#999'}"  /></td>
        
        <td>付息方式          </td>
        <td width="28%"><select name="select" id="select">
          <option>请选择</option>
          <option>年付</option>
          <option>季度付</option>
        </select></td>
        </tr>
      <tr>
        <td>回执          </td>
        <td><select name="select2" id="select2">
          <option>请选择</option>
          <option>已收到</option>
          <option>未收到</option>
        </select></td>
        <td>状态          </td>
        <td><select name="select3" id="select3">
          <option>请选择</option>
          <option>续存</option>
        </select></td>
        <td colspan="2">&nbsp;</td>
        </tr>
      <tr>
        <td>备注          </td>
        <td><textarea name="pass3" class="itstyle it" id="pass4"></textarea></td>
        <td colspan="2">&nbsp;</td>
        <td colspan="2">&nbsp;</td>
        </tr>
      <tr>
        <td height="80" colspan="8"><span class="bnt_ok">提交</span><span class="cancel">取消</span></td>
        </tr>
    </table>
  </div>



</div>

<br class=" clear" />
</div>
<blockquote>&nbsp;</blockquote>
<blockquote>&nbsp;	</blockquote>


<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
