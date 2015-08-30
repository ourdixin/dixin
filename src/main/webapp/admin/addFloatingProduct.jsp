<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产品管理</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/js/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/admin/addproduct.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";
</script>
</head>
<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	<div id="main_right">
		<div id="title_xi"></div>
		<div class="register">
			<div class="info_frm">
				<form id="addproductForm" name="addproductForm" method="post"
					action="<%=request.getContextPath()%>/product/add">
					<table>
						<tbody>
							<tr>
								<td class="t" width="100">产品代码：</td>
								<td><input class="itstyle lt it" id="code" name="code"
									value="" type="text" /></td>
								<td class="t" width="100">产品名称：</td>
								<td><input class="itstyle lt it" id="name" name="name"
									value="" type="text" /></td>
							</tr>
							<tr>
								<td class="t">发行时间：</td>
								<td><input class="itstyle lt it" id="releaseDate"
									name="releaseDate" value="2100-01-01 01:02" type="text" />(格式：yyyy-MM-dd HH:ss)</td>
								<td class="t">销售截止日期：</td>
								<td><input class="itstyle lt it" id="endDate"
									name="endDate" value="" type="text" />(格式：yyyy-MM-dd HH:ss)</td>
							</tr>

							<tr>
								<td class="t">产品规模：</td>
								<td><input class="itstyle lt it" id="amount" name="amount"
									value="" type="text" />(单位:亿)</td>
								<td class="t">资金投向：</td>
								<td><select class="itstyle"
									name="direction" id="direction">
										<option value="77" selected>货币型</option>
										<option value="78">债券型</option>
										<option value="79">股票型</option>
										<option value="80">私募股权</option>
										<option value="81">定向增发</option>
										<option value="82">海外市场</option>
										<option value="83">量化对冲</option>
										<option value="84">指数型</option>
										<option value="58">其它</option>
								</select></td>
							</tr>
							<tr>
								<td class="t">投资起点：</td>
								<td><input class="itstyle lt it" id="minAmount"
									name="minAmount" value="" type="text" />(单位:万元)</td>
								<td class="t">递增金额：</td>
								<td><input class="itstyle lt it" id="appendAmount"
									name="appendAmount" value="" type="text" />(单位:万元)</td>
							</tr>
							<tr hidden>
								<!--  td class="t">续存：</td>
								<td><input class="itstyle lt it" id="appendTerm" name="appendTerm"
									value="" type="text" width="80" /> <select class="itstyle"
									name="appendTermUnit" id="appendTermUnit">
										<option value="63">年</option>
										<option value="64" selected>月</option>
										<option value="65">天</option>
								</select></td -->
								<td hidden class="t">收益类型：</td>
								<td hidden><select class="itstyle"
									name="profitId" id="profitId">
										<option value="43" selected>浮动</option>
								</select></td>
							</tr>
							<tr>
								<td class="t">产品类别：</td>
								<td><select class="itstyle" name="catogryId" id="catogryId">
										<option value="31" selected>债券</option>
										<option value="32">银行理财</option>
										<option value="33">基金</option>
										<option value="34">券商理财</option>
										<option value="35">信托</option>
										<option value="36">资管</option>
								</select></td>
								<td class="t">推荐指数：</td>
								<td><select class="itstyle" name="star" id="star">
										<option value="1" selected>一星</option>
										<option value="2">二星</option>
										<option value="3">三星</option>
										<option value="4">四星</option>
										<option value="5">五星</option>
								</select></td>
							</tr>
							<tr>
								<td class="t" width="100">产品认购费：</td>
								<td><input class="itstyle lt it" id="buyFee" name="buyFee"
									value="" type="text" />(文本型描述)</td>
								<td class="t" width="100">封闭期限：</td>
								<td><input class="itstyle lt it" id="closeTerm" name="closeTerm"
									value="" type="text" /><select class="itstyle"
									name="closeTermUnit" id="closeTermUnit">
										<option value="63">年</option>
										<option value="64" selected>月</option>
										<option value="65">天</option>
								</select></td>
							</tr>
								<tr>
								<td class="t" width="100">基金经理姓名：</td>
								<td><input class="itstyle lt it" id="fundManager" name="fundManager"
									value="" type="text" /></td>
								<td class="t" width="100">基金经理介绍的网页链接：</td>
								<td><input class="itstyle lt it" id="fundManagerUrl" name="fundManagerUrl"
									value="" type="text" /></td>
							</tr>
							</tr>
								<tr>
								<td class="t" width="100">管理费：</td>
								<td><input class="itstyle lt it" id="manageFee" name="manageFee"
									value="" type="text" />%</td>
								<td class="t" width="100">开放日：</td>
								<td><input class="itstyle lt it" id="openDay" name="openDay"
									value="" type="text" />(文本型描述)</td>
							</tr>
							</tr>
								<tr>
								<td class="t" width="100">业绩提成：</td>
								<td><input class="itstyle lt it" id="bonus" name="bonus"
									value="" type="text" />(文本型描述)</td>
								<td class="t" width="100">退出费用：</td>
								<td><input class="itstyle lt it" id="sellFee" name="sellFee"
									value="" type="text" />(文本型描述)</td>
							</tr>
							</tr>
								<tr>
								<td class="t" width="100">成立日：</td>
								<td><input class="itstyle lt it" id="valueDate"
									name="valueDate" value="2100-01-01" type="text" />(格式：yyyy-MM-dd)</td>
								<td class="t" width="100"></td>
								<td></td>
							</tr>
							<tr>
								<td class="t">产品推介单页：</td>
								<td>
									<input hidden class="itstyle lt it" id="adFile" name="adFile" value="" type="text" />
									<input class="itstyle lt it" id="uploadadfile" name="uploadadfile" value="" type="file" />
									<input id="submitad" type="button" value="上传文件">
									<img id="adloading" src="<%=request.getContextPath()%>/images/loading.gif" style="display:none;" />
								</td>
								<td class="t" nowrap>定向客户指南：</td>
								<td>
									<input hidden class="itstyle lt it" id="guideFile" name="guideFile"	value="" type="text" />
									<input class="itstyle lt it" id="uploadguidefile" name="uploadguidefile" value="" type="file" />
									<input id="submitguide" type="button" value="上传文件">
									<img id="guideloading" src="<%=request.getContextPath()%>/images/loading.gif" style="display:none;" />
								</td>
							</tr>
							<tr>
								<td colspan="4"><script id="editor" type="text/plain"
										style="width:980px;height:500px;"></script></td>
							</tr>
							<tr>
								<td colspan="4">
									<center>
										<span style="height:30px;cursor:pointer;" class="bnt_ok">添加</span>
									</center>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>	
	</div>
<br class=" clear" />
</div>

	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
