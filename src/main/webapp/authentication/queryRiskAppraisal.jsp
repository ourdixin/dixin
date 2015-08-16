<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心-风险评测</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css"
     rel="stylesheet" type="text/css" />
<script src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.scrollTo.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/js.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/authentication/RiskAppraisal.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->

	<c:if test="${null != grade && 0 != grade}"> 
<div id="main_right" style="background:#f1f1f1;">
<div id="title_xi"></div>
<div style="padding:0 20px;">
<div style="line-height:24px;">
	<table>
	<thead>
		<tr><td>
				<div style="font-size:16px;color:red;font-family:微软雅黑;">尊敬的${user.secUserName}用户，您好！</div>
		</td></tr>
	</thead>
	<tbody>
		<tr>
			<td align="left">
				<strong>您当前的评估结果：</strong>
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
	</table>
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
				考所用。此问卷内容及结果不构成与您进行交易之要约或要约邀请，亦非投资买卖建议。9点财讯不对此问卷之准确性及资<br>
				讯是否完整负责。<br>
				</span>
			</td>
		</tr>
	</tfoot>
	<td><br><strong style="font-size:14px;color:red;">如果您的评分结果与您的风险承受能力等级不匹配，您可以重新评测</strong><br></td>
	</div>
</div>
</div>
	</c:if>
<div id="main_right" style="background:#f1f1f1;">
<div style="padding:0 20px;">
<form  action="<%=request.getContextPath() %>/authentication/RiskAppraisal" method="post" id="assessmentForm">
  <p>&nbsp;</p>
  <div class="body_title">121金融合格投资人风险评测调查问卷</div>
  <p>&nbsp;</p>
 <%-- 
<div class="table_c">
  <table border="0" cellspacing="0" cellpadding="0">
     <tr>
      <td>姓名：</td>
      <td><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password" /></td>
      <td>电话：</td>
      <td><input maxlength="12" class="itstyle lt it" name="pass" id="pass2" type="password" />	</td>
      </tr>
    <tr>
      <td>身份证：</td>
      <td colspan="3"><input maxlength="12" class="itstyle lt it" name="pass2" id="pass3" type="password" /></td>
      </tr>-->
    <tr>
      <td>&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
  </table>
</div>
 --%>
<div style="line-height:24px;">　<strong>尊敬的投资人</strong>：本问卷旨在帮助您了解自己的风险承受能力，风险承受能力评估是本公司向您提供的适当性服务中的一环，其目的是使我司所提供的金融产品与您的风险承受能力等级相匹配。<br>
  本公司特别提醒您：本公司向客户履行风险承受能力评估等适当性职责，并不能取代您的投资判断，也不会降低金融产品的固有风险。<br>
  本公司提醒你：本公司根据您提供的信息对您进行风险承受能力评估，开展适当性工作。您应当如实提供相关信息及证明材料，并对所提供的信息和证明材料的真实性、准确性、完整性负责。<br>
  本公司建议：当您的各项状况发生重大变化时，需对您所投资的金融产品及时进行重新审视，以确保您的投资决定与您可承受的投资风险程度等实际情况一致。<br>
  本公司在此承诺，对于您在本问卷中所提供的一切信息，本公司将严格按照法律法规要求承担保密义务。除法律法规规定的有权机关依法定程序进行查询外，本公司保证不会将涉及您的任何信息提供、泄漏给第三方或者将相关信息用于违法、不当用途。</div>
<div id=question1>
  <table width="698" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="14" height="32" bgcolor="#eeeeee"> </td>
        <td width="678" bgcolor="#eeeeee"><strong>1、年龄状况：</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div >
          <ul>
            <li>
              <input type="radio" name="w1" id="w1" value="1,4">
              30岁以下</li>
            <li>
              <input type="radio" name="w1" id="w1" value="2,3">
              30至45岁之间</li>
            <li>
              <input type="radio" name="w1" id="w1" value="3,2">
              45岁至65岁之间</li>
            <li>
              <input type="radio" name="w1" id="w1" value="4,1">
              65岁以上</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
<div id=question2>
  <table width="698" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="14" height="32" bgcolor="#eeeeee"> </td>
        <td width="678" height="32" bgcolor="#eeeeee"><strong>2、您的主要收入来源：</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div>
          <ul>
            <li>
              <input type="radio" name="w2" id="w2" value="1,4">
              工资、劳务报酬</li>
            <li>
              <input type="radio" name="w2" id="w2" value="2,3">
              生产经营所得</li>
            <li>
              <input type="radio" name="w2" id="w2" value="3,2">
              利息、股息、转让证券等金融性资产收入</li>
            <li>
              <input type="radio" name="w2" id="w2" value="4,1">
              出租、出售房地产等非金融性资产收入</li>
            <li>
              <input type="radio" name="w2" id="w2" value="5,0">
              无固定收入</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
<div id=question3>
  <table width="698" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="14" height="32" bgcolor="#eeeeee"> </td>
        <td width="678" bgcolor="#eeeeee"><strong>3、您对金融投资风险的了解程度：</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div>
          <ul>
            <li>
              <input type="radio" name="w3" id="w3" value="1,4">
              有专业证照</li>
            <li>
              <input type="radio" name="w3" id="w3" value="2,3">
              财经专业毕业</li>
            <li>
              <input type="radio" name="w3" id="w3" value="3,2">
              自修有心得</li>
            <li>
              <input type="radio" name="w3" id="w3" value="4,1">
              懂一些</li>
            <li>
              <input type="radio" name="w3" id="w3" value="5,0">
              一无所知</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
<!--  
<div>
  <table width="698" border="0" cellspacing="0" cellpadding="0">
    <tbody>
      <tr>
        <td width="14"> </td>
        <td width="678"><strong>4、您是否了解基金公司资产管理计划或相关政策法规：</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div>
          <ul>
            <li>
              <input type="radio" name="w4" id="w4" value="1">
              是</li>
            <li>
              <input type="radio" name="w4" id="w4" value="2">
              否</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
-->
<div id=question4>
  <table width="698" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="14" height="32" bgcolor="#eeeeee"> </td>
        <td width="678" bgcolor="#eeeeee"><strong>4、您当前的主要资产配置情况：(可多选)</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div>
          <ul>
            <li>
              <input type="checkbox" name="w4" value="1-4">
              股票</li>
            <li>
              <input type="checkbox" name="w4" value="2-3">
              基金</li>
            <li>
              <input type="checkbox" name="w4" value="3-2">
              信托</li>
            <li>
              <input type="checkbox" name="w4" value="4-1">
              房产</li>
            <li>
              <input type="checkbox" name="w4" value="5-0">
              储蓄</li>
            <li>
              <input type="checkbox" name="w4" value="6-1">
              外汇</li>
            <li>
              <input type="checkbox" name="w4" value="7-2">
              黄金</li>
            <li>
              <input type="checkbox" name="w4" value="8-3">
              外盘</li>
            <li>
              <input type="checkbox" name="w4" value="9-4">
              衍生品</li>
            <li>
              <input type="checkbox" name="w4" value="10-0">
              其他</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
<div id=question5>
  <table width="698" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="14" height="32" bgcolor="#eeeeee"> </td>
        <td width="678" height="32" bgcolor="#eeeeee"><strong>5、您投资首要考虑因素：</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div>
          <ul>
            <li>
              <input type="radio" name="w5" id="w5" value="1,4">
              赚取短期差价</li>
            <li>
              <input type="radio" name="w5" id="w5" value="2,3">
              长期稳健获利</li>
            <li>
              <input type="radio" name="w5" id="w5" value="3,2">
              每年固定分红</li>
            <li>
              <input type="radio" name="w5" id="w5" value="4,1">
              抗通胀保值</li>
            <li>
              <input type="radio" name="w5" id="w5" value="5,0">
              保本</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
<div id=question6>
  <table width="698" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="14" height="32" bgcolor="#eeeeee"> </td>
        <td width="678" height="32" bgcolor="#eeeeee"><strong>6、您当前使用您个人总资产的百分之多少进行投资：</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div>
          <ul>
            <li>
              <input type="radio" name="w6" id="w6" value="1,0">
              无投资</li>
            <li>
              <input type="radio" name="w6" id="w6" value="2,1">
              10%之内的资产</li>
            <li>
              <input type="radio" name="w6" id="w6" value="3,2">
              10%-20%之间</li>
            <li>
              <input type="radio" name="w6" id="w6" value="4,3">
              25%-50%之间</li>
            <li>
              <input type="radio" name="w6" id="w6" value="5,4">
              超过50%</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
<div id=question7>
  <table width="698" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="14" height="32" bgcolor="#eeeeee"> </td>
        <td width="678" height="32" bgcolor="#eeeeee"><strong>7、您刚将您的一大笔钱进行投资，预期能涨50%的，结果不到半个月价格跌了15%。假如这项投资的基本没有发生改变，您会怎么做：</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div>
          <ul>
            <li>
              <input type="radio" name="w7" id="w7" value="1,4">
              加码继续买入，相信长期投资会带来丰厚的收益</li>
            <li>
              <input type="radio" name="w7" id="w7" value="2,3">
              不特别担心，持有，观望</li>
            <li>
              <input type="radio" name="w7" id="w7" value="3,2">
              暂时的亏损让您感觉不舒服，暂时持有，密切关注</li>
            <li>
              <input type="radio" name="w7" id="w7" value="4,1">
              卖出，以后再也不涉及这个领域</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
<!--  
<div>
  <table width="698" border="0" cellspacing="0" cellpadding="0">
    <tbody>
      <tr>
        <td width="14"> </td>
        <td width="678"><strong>9、您更愿意投资于哪种类型资管计划：(可多选)</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div>
          <ul>
            <li>
              <input type="checkbox" name="w9[]" value="1">
              房地产类</li>
            <li>
              <input type="checkbox" name="w9[]" value="2">
              政府融资平台类</li>
            <li>
              <input type="checkbox" name="w9[]" value="3">
              上市公司股权质押类</li>
            <li>
              <input type="checkbox" name="w9[]" value="4">
              现金管理类</li>
            <li>
              <input type="checkbox" name="w9[]" value="5">
              矿产类、艺术品类、PE投资类</li>
            <li>
              <input type="checkbox" name="w9[]" value="6">
              证券投资类</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
-->
<div id=question8>
  <table width="698" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="14" height="32" bgcolor="#eeeeee"> </td>
        <td width="678" height="32" bgcolor="#eeeeee"><strong>8、您更倾向于多长的投资期限：</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div>
          <ul>
            <li>
              <input type="radio" name="w8" id="w8" value="1,1">
              1年以内</li>
            <li>
              <input type="radio" name="w8" id="w8" value="2,2">
              1-2年</li>
            <li>
              <input type="radio" name="w8" id="w8" value="3,3">
              2-3年</li>
            <li>
              <input type="radio" name="w8" id="w8" value="4,4">
              3年以上</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
<div id=question9>
  <table width="698" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="14" height="32" bgcolor="#eeeeee"> </td>
        <td width="678" height="32" bgcolor="#eeeeee"><strong>9、您过去的投资绩效：</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div>
          <ul>
            <li>
              <input type="radio" name="w9" id="w9" value="1,4">
              只赚不赔</li>
            <li>
              <input type="radio" name="w9" id="w9" value="2,3">
              赚多赔少</li>
            <li>
              <input type="radio" name="w9" id="w9" value="3,2">
              损益两平</li>
            <li>
              <input type="radio" name="w9" id="w9" value="4,1">
              赚少赔多</li>
            <li>
              <input type="radio" name="w9" id="w9" value="5,0">
              只赔不赚</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
<!-- 
<div>
  <table width="698" border="0" cellspacing="0" cellpadding="0">
    <tbody>
      <tr>
        <td width="14"> </td>
        <td width="678"><strong>10、您本次认购该资管计划的主要目的是什么：</strong></td>
      </tr>
      <tr>
        <td> </td>
        <td><div>
          <ul>
            <li>
              <input type="radio" name="w12" id="w12" value="1">
              退休金、拆迁款的储蓄保值</li>
            <li>
              <input type="radio" name="w12" id="w12" value="2">
              子女教育基金的储蓄保值</li>
            <li>
              <input type="radio" name="w12" id="w12" value="3">
              固定资产变现后用于理财</li>
            <li>
              <input type="radio" name="w12" id="w12" value="4">
              资产配置的部分选择，资管计划占50%以上</li>
            <li>
              <input type="radio" name="w12" id="w12" value="5">
              资产配置的部分选择，资管计划占50%以下</li>
          </ul>
        </div></td>
      </tr>
    </tbody>
  </table>
</div>
 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="8%" height="80"> </td>
    <td width="76%" height="80"> <span class="bnt_ok">立即提交</span></td>
  </tr>
  </table>

</form>
</div>
</div>

<br class=" clear" />

</div>

	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>