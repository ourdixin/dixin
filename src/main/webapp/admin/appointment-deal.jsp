<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户产品预约（处理）</title>
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
        <td><input type="radio" name="radio" id="radio" value="radio" />
          已购买</td>
        <td>购买时间          </td>
        <td><input name="password" type="text" class="itstyle it160" id="pass" value="2015-12-5" onfocus="if(value==defaultValue){value='';this.style.color='#999'}" onblur="if(!value){value=defaultValue;this.style.color='#999'}"  /></td>
        <td>购买金额          </td>
        <td><input name="pass" type="text" class="itstyle it160" id="pass2"  maxlength="12" value="100万" onfocus="if(value==defaultValue){value='';this.style.color='#999'}" onblur="if(!value){value=defaultValue;this.style.color='#999'}"  /></td>
        
        <td>类型          </td>
        <td><select name="select" id="select">
          <option>请选择</option>
          <option>A类</option>
          <option>B类</option>
        </select></td>
        <td>期限          </td>
        <td><select name="select2" id="select2">
          <option>12月</option>
          <option>6月</option>
          <option>3月</option>
        </select></td>
        <td>利率          </td>
        <td><select name="select3" id="select3">
          <option>9.5折</option>
          <option>8折</option>
        </select></td>
        </tr>
      <tr>
        <td><input type="radio" name="radio" id="radio2" value="radio" />
          购买中</td>
        <td colspan="10">进程 
          <input maxlength="12" class="itstyle it" name="pass2" id="pass3" type="password" /></td>
        </tr>
      <tr>
        <td><input type="radio" name="radio" id="radio3" value="radio" />
          不购买</td>
        <td colspan="10">原因 
          <input maxlength="12" class="itstyle it" name="pass3" id="pass4" type="password" /></td>
        </tr>
      <tr>
        <td height="80" colspan="11"><span class="bnt_ok">确定</span><span class="cancel">取消</span></td>
        </tr>
  </table>
  </div>



</div>

<br class=" clear" />
</div>


<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
