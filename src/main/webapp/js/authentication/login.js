$(document).ready(function(){
	
	success: function success(data){
		if(data.success){
			alert('登录成功！');
		}else{
			alert(data.msg);
		}
	};
	
	$('.bnt_ok').click(function(){
		$.post("/dixin/authentication/login", $("#loginForm").serialize(), success);
	});
});