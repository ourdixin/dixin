$(document).ready(function(){
	
	success: function success(data){
		if(data.success){
			location.href = data.url;
		}else{
			alert(data.msg);
		}
	};
	$('.bnt_ok').click(function(){
		var username = $("input[name='username']").val();
        var regex = /^1[3,4,5,7,8]\d{9}$/;
        if(!regex.exec(username)) 
        {
       	 alert("手机号输入不正确");
            return;
         }
        
        var password = $("input[name='password']").val();
        var regex =/^(\w){6,20}$/;  
        if (!regex.exec(password)) {
       	 alert("密码输入错误");
       	 return;
        }
        
		$.post(HOST_PATH+"/authentication/login", $("#loginForm").serialize(), success);
	});
});