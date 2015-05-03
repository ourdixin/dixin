<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>风险评测调查结果</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css"
     rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
<script type="<%=request.getContextPath() %>/text/javascript" src="js/js.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	
<div id="main_right" style="background:#f1f1f1;">
<div id="title_xi"></div>
<div id="title_font">121金融合格投资人风险评测调查结果</div>
<div style="padding:0 20px;">
<%-- <div class="table_c">
  <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>姓名：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass" id="pass" type="password" /></td>
      <td>电话：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass" id="pass2" type="password" />	</td>
      </tr>
    <tr>
      <td>身份证：</td>
      <td colspan="3"><input maxlength="12" class="itstyle lt it" name="pass2" id="pass3" type="password" /></td>
      </tr>
    <tr>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
  </table>
</div>--%>
<div style="line-height:24px;">
<table>
	<thead>
		<tr><td>
				<div style="font-size:16px;color:red;font-family:微软雅黑;">您好，${user.userName}！</div>
		</td></tr>
	</thead>
	<tbody>
		<tr>
			<td align="left">
				<strong>评估结果：</strong>
			</td>
		</tr>
		<tr>
			<td>
				根据您对评估问卷的勾选结果，您的得分总计为 <span style="font-size:16px;color:red;" >${grade}</span>分。
				根据您的评估结果鉴定您对投资风险的适应度，您的风险承受能力等级为 <span style="font-size:16px;color:red;" >${level}</span>级。<br>
				A级(12分以下)	保守型投资人：适合政府融资平台、上市公司股权质押类项目。<br>
				B级(12分-24分(不含24分))	稳健型投资人：适合现金管理类、企业融资类、房地产类项目。<br>
				C级(24分及以上)	积极型投资人：适合PE类、纯投资类和浮动收益类项目。<br>
			</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td>
				<span style="font-size:16px;color:red;" >重要声明：</span>
			</td>
		</tr>
		<tr>
			<td>
				<span>
				本评估问卷结果是根据您填写时所提供的资料而推论得知，且其结果将作为您未来在投资本公司资管计划时的参<br>
				考所用。此问卷内容及结果不构成与您进行交易之要约或要约邀请，亦非投资买卖建议。121金融不对此问卷之准确性及资<br>
				讯是否完整负责。<br>
				</span>
			</td>
		</tr>
	</tfoot>
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
