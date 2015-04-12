$(document).ready(function(){
	function success(data){
		alert("发布成功！")
		location.href = data.msg;
	};
	
	$('.bnt_ok').click(function(){
		$.post("/dixin/product/appointment", $("#appointForm").serialize(), success);
	});
});