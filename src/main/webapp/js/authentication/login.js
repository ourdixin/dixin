$(document).ready(function(){
	
	success: function success(data){
		if(data.success){
			//alert('登录成功！');
			var htmlStr = template('login_span_tpl', data);
			$('#login_span').html(htmlStr);
			$('.index_login').hide();
		}else{
			alert(data.msg);
		}
	};
	
	$('.bnt_ok').click(function(){
		$.post("/dixin/authentication/login", $("#loginForm").serialize(), success);
	});
});