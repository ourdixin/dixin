$(document).ready(function(){
	
	success: function success(data){
		alert("注册成功！")
	};
	
	$('.bnt_ok').click(function(){
		$.post("/dixin/authentication/user", $("#regForm").serialize(), success);
	});
});