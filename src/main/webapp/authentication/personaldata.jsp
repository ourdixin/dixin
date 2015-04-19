<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心-个人资料</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/LTT_user.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
<<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
<div id="main_right">

   
  <ul class="ul_1">
                <li class="tab1_1_on"  id="tab1_1" onMouseOver="set_tab('tab1', 1 ,4)">基本信息</li>
                <li class="tab1_2_off" id="tab1_2" onMouseOver="set_tab('tab1', 2 ,4)">个人资料</li>
                <li class="tab1_2_off" id="tab1_3" onMouseOver="set_tab('tab1', 3 ,4)">安全中心</li>
                <li class="tab1_2_off" id="tab1_4" onMouseOver="set_tab('tab1', 4 ,4)">会员权限</li>
          </ul>
            <div id="tab1_con_1"  style=" display:block; clear:both;" >
   <div class="user_right">
<div class="user_title">基本信息</div>
<div class="layout_a per_data"><div class="title clearfix">
<h3>个人资料</h3>
<ul class="wsd_box lt"><li>资料完善度</li><li id="infoProgress" class="to0">
  <p><em></em><span>0%</span></p></li></ul>
<a class="rt" href="/member/account/useredit.htm">编辑></a>
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
      <td width="15%">  <select name="select" id="select">
        <option>请选择</option>
        <option>北京</option>
        <option>上海</option>
        <option>深圳</option>
        <option>广州</option>
      </select></td>
      <td width="74%"><select name="select2" id="select2">
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
<a class="rt" href="#">编辑></a>
</div>
</div>
<div class="user_table">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="12%" align="right">登陆密码：</td>
      <td width="31%"><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password"></td>
      <td width="57%"><a href="#">修改</a></td>
    </tr>
    <tr>
      <td align="right">手机号码：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass" id="pass2" type="password" /></td>
      <td><a href="#">修改</a></td>
    </tr>
  </table>
</div>


<div class="layout_a per_data"><div class="title clearfix">
<h3>会员权限</h3>
<div class="safe_grade lt">
<p id="safetyLevel" class="on">安全等级</p>
</div>
<a class="rt" href="#">编辑></a>
</div>
</div>
<div class="user_table">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="14%" align="right">实名认证：</td>
      <td width="30%"><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password"></td>
      <td width="56%"><a href="#">修改</a></td>
    </tr>
    <tr>
      <td align="right">证券客户认证：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass" id="pass2" type="password" /></td>
      <td><a href="#">认证</a></td>
    </tr>
    <tr>
      <td align="right">付费会员认证：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass2" id="pass3" type="password" /></td>
      <td><a href="#">认证</a></td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</div>
</div>

            </div>
              
  
<div id="tab1_con_2" class="con"  style=" display:none;clear:both;">
              
<div class="user_title" >个人资料</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="11%" height="50" align="right">用户名：</td>
      <td colspan="2">kpqd13928456069</td>
      </tr>
    <tr>
      <td height="50" align="right">QQ：</td>
      <td colspan="2"><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password"></td>
    </tr>
    <tr>
      <td height="50" align="right">所在地区：</td>
      <td width="15%">  <select name="select" id="select">
        <option>请选择</option>
        <option>北京</option>
        <option>上海</option>
        <option>深圳</option>
        <option>广州</option>
      </select></td>
      <td width="74%"><select name="select2" id="select2">
        <option>北京</option>
      </select></td>
    </tr>
    <tr>
      <td height="50" align="right">邮政编码：</td>
      <td colspan="2"><input maxlength="12" class="itstyle lt  it160" name="pass2" id="pass3" type="password" /></td>
    </tr>
    <tr>
      <td height="50" align="right">联系地址：</td>
      <td colspan="2"><input maxlength="12" class="itstyle lt it" name="pass" id="pass2" type="password" /></td>
      </tr>
    <tr>
      <td height="50" align="right">&nbsp;</td>
      <td colspan="2"><span class="bnt_ok">提交</span></td>
    </tr>
  </table>
  </div>
    
<div id="tab1_con_3" class="con"  style=" display:  block;clear:both;">
              
<div class="user_title" >安全中心</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top">
    
    <div style="background:#f1f1f1; padding:0 10px 10px 10px; width:310px; height:330px;margin-top:10px;">
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="50" colspan="2"><font style=" font-size:18px;">修改登陆密码</font></td>
          </tr>
        <tr>
          <td height="50" align="right">当前密码：</td>
          <td><input maxlength="12" class="itstyle lt it" name="pass3" id="pass4" type="password" /></td>
          </tr>
        <tr>
          <td height="35" align="right" valign="bottom">新密码：</td>
          <td valign="bottom"><input maxlength="12" class="itstyle lt it" name="pass6" id="pass7" type="password" /></td>
          </tr>
        <tr>
          <td height="25" colspan="2" align="right"><font style=" font-size:12px; color:#999">密码6-12位数字组成，区分大小写，不含空格。</font></td>
          </tr>
        <tr>
          <td height="50" align="right">密码强度：</td>
          <td><div class="safe_grade" style="margin-left:0">
            <p id="safetyLevel2"></p>
            </div></td>
          </tr>
        <tr>
          <td height="50" align="right">确认新密码：</td>
          <td><input maxlength="12" class="itstyle lt it" name="pass3" id="pass4" type="password" /></td>
          </tr>
        <tr>
          <td height="50" align="right">&nbsp;</td>
          <td><span class="bnt_ok">修改</span><a href="#">忘记新密码？</a></td>
          </tr>
      </table>
    </div></td>
    <td valign="top">
    <div style="background:#f1f1f1; padding:0 10px 10px 10px; width:310px; height:330px; margin-top:10px;">
      <table border="0" cellspacing="0" cellpadding="0" >
        <tr>
          <td height="50" colspan="3"><font style=" font-size:18px;">手机验证码</font></td>
          </tr>
        <tr>
          <td width="74" height="50" align="right">当前手机：</td>
          <td colspan="2"><input maxlength="12" class="itstyle lt it" name="pass7" id="pass8" type="password" /></td>
          </tr>
        <tr>
          <td height="50" align="right">新手机：</td>
          <td colspan="2"><input maxlength="12" class="itstyle lt it" name="pass8" id="pass9" type="password" /></td>
          </tr>
        <tr>
          <td height="50" align="right">验证码：</td>
          <td width="82"><input maxlength="12" class="itstyle lt it160" name="pass7" id="pass10" type="password" /></td>
          <td width="154"><font style=" border:1px solid #ccc; padding:3px 10px; background:#f1f1f1"><a href="#">验证码</a></font></td>
          </tr>
        <tr>
          <td height="50" align="right">&nbsp;</td>
          <td colspan="2"><span class="bnt_ok">提交</span></td>
          </tr>
      </table>
    </div></td>
  </tr>
</table>
</div>
    
 
<div id="tab1_con_4" class="con"  style=" display:  block;clear:both;">
              
<div class="user_title" >会员权限</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="50" colspan="2"><font style=" font-size:18px;">&nbsp;&nbsp;&nbsp;证券客户认证</font></td>
      </tr>
    <tr>
      <td width="11%" height="50" align="right">姓名：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass4" id="pass5" type="password" /></td>
      </tr>
    <tr>
      <td height="50" align="right">资金帐户：</td>
      <td><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password"></td>
    </tr>
    <tr>
      <td height="50" align="right">认证公司：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass5" id="pass6" type="password" /></td>
      </tr>
    <tr>
      <td height="50" align="right">&nbsp;</td>
      <td><span class="bnt_ok">提交</span></td>
    </tr>
  </table>
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="<%=request.getContextPath() %>/images/pp_03.png" width="203" height="196" /></td>
    <td><img src="<%=request.getContextPath() %>/images/pp_05.png" width="204" height="196" /></td>
    <td><img src="<%=request.getContextPath() %>/images/pp_07.png" width="203" height="196" /></td>
  </tr>
</table>
<br />
</div>
  

</div>

<br class=" clear" />
</div>

<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
