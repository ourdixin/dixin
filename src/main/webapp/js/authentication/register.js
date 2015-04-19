$(document).ready(function(){
	
	function success(data){
		alert("注册成功！")
		location.href = data.msg;
	};
	
	$('.bnt_ok').click(function(){
		$.post(HOST_PATH+"/authentication/user", $("#regForm").serialize(), success);
	});
});