$(document).ready(function(){
	
	success: function success(data){
		if(data.success){
			location.href = data.msg;
		}else{
			alert(data.msg);
		}
	};
	
	$('.bnt_ok').click(function(){
		$.post("/dixin/authentication/login", $("#loginForm").serialize(), success);
	});
});