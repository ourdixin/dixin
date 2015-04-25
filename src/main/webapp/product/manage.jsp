<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产品管理</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/js/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/js/ueditor/lang/zh-cn/zh-cn.js"></script>

<style type="text/css">
div {
	width: 100%;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/product/manage.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";
</script>
</head>
<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->

	<div id="main_body">
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
									name="endDate" value="" type="date" /></td>
							</tr>
							<tr>
								<td class="t">期限：</td>
								<td><input class="itstyle lt it" id="term" name="term"
									value="" type="text" width="80" /> <select class="itstyle"
									name="termUnit" id="termUnit">
										<option value="63">年</option>
										<option value="64" selected>月</option>
										<option value="65">天</option>
								</select></td>
								<td class="t">利益分配方式：</td>
								<td><select class="itstyle" name="payType" id="payType">
										<option value="66" selected>自然季度付息</option>
										<option value="67">自然半年度付息</option>
										<option value="68">自然年度付息</option>
										<option value="69">季度付息</option>
										<option value="70">半年度付息</option>
										<option value="71">年度付息</option>
										<option value="72">到期还本付息</option>
										<option value="73">其他付息方式</option>
								</select> <input id="payTypeInfo" name="payTypeInfo" value="" type="text"
									style="display: none;" /></td>
							</tr>

							<tr>
								<td class="t">产品规模：</td>
								<td><input class="itstyle lt it" id="amount" name="amount"
									value="" type="text" />(单位:亿)</td>
								<td class="t">资金投向：</td>
								<td><select class="itstyle"
									name="direction" id="direction">
										<option value="49" selected>金融市场</option>
										<option value="50">公益</option>
										<option value="51">金融机构</option>
										<option value="52">房地产</option>
										<option value="53">工商企业</option>
										<option value="54">基础设施</option>
										<option value="55">实业企业</option>
										<option value="56">保障房</option>
										<option value="57">酒店类</option>
										<option value="58">其它</option>
								</select></td>
							</tr>
							<tr>
								<td class="t">投资起点：</td>
								<td><input class="itstyle lt it" id="minAmount"
									name="minAmount" value="" type="text" />(单位:万)</td>
								<td class="t">递增金额：</td>
								<td><input class="itstyle lt it" id="appendAmount"
									name="appendAmount" value="" type="text" />(单位:万)</td>
							</tr>
							<tr>
								<td class="t">续存：</td>
								<td><input class="itstyle lt it" id="appendTerm" name="appendTerm"
									value="" type="text" width="80" /> <select class="itstyle"
									name="appendTermUnit" id="appendTermUnit">
										<option value="63">年</option>
										<option value="64" selected>月</option>
										<option value="65">天</option>
								</select></td>
								<td class="t">收益类型：</td>
								<td><select class="itstyle"
									name="profitId" id="profitId">
										<option value="42" selected>固定</option>
										<option value="43">浮动</option>
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
								<td class="t">A类份额：</td>
								<td><input class="itstyle lt it" id="partA" name="partA"
									value="" type="text" /></td>
								<td class="t" nowrap>A类年华收益率：</td>
								<td><input class="itstyle lt it" id="rateA" name="rateA"
									value="" type="text" /></td>
							</tr>

							<tr>
								<td class="t">B类份额：</td>
								<td><input class="itstyle lt it" id="partB" name="partB"
									value="" type="text" /></td>
								<td class="t" nowrap>B类年华收益率：</td>
								<td><input class="itstyle lt it" id="rateB" name="rateB"
									value="" type="text" /></td>
							</tr>


							<tr>
								<td class="t">C类份额：</td>
								<td><input class="itstyle lt it" id="partC" name="partC"
									value="" type="text" /></td>
								<td class="t" nowrap>C类年华收益率：</td>
								<td><input class="itstyle lt it" id="rateC" name="rateC"
									value="" type="text" /></td>
							</tr>


							<tr>
								<td class="t">D类份额：</td>
								<td><input class="itstyle lt it" id="partD" name="partD"
									value="" type="text" /></td>
								<td class="t" nowrap>D类年华收益率：</td>
								<td><input class="itstyle lt it" id="rateD" name="rateD"
									value="" type="text" /></td>
							</tr>

							<tr>
								<td colspan="4"><script id="editor" type="text/plain"
										style="width:980px;height:500px;"></script></td>
							</tr>
							<tr>
								<td colspan="4"><center>
										<span class="bnt_ok">添加</span>
									</center></td>
							</tr>
						</tbody>
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
