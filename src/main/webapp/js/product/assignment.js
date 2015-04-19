$(document).ready(function(){

	function success(data){
		alert("发布成功！")
		location.href = data.msg;
	};
	
	$('.bnt_ok').click(function(){
		$.post(HOST_PATH+"/product/assignment", $("#assiForm").serialize(), success);
	});
});