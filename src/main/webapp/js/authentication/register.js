$(document).ready(function(){
	
	function success(data){
		alert("注册成功！")
		location.href = data.msg;
	};
	
	$('.bnt_ok').click(function(){
		$.post("/dixin/authentication/user", $("#regForm").serialize(), success);
	});
});