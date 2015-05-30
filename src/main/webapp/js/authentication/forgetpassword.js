$(document).ready(function(){

	function success(data){
		alert(data.msg)
		//location.href = data.msg;
	};
	
	$('.bnt_ok').click(function(){
		var phone = $("input[name='mobile']").val();
        var regex = /^1[3,4,5,7,8]\d{9}$/;
        if(!regex.exec(phone)) {
       	 alert("手机号输入不正确");
            return;
        }	
           
        var password = $("input[name='password']").val();
        var regex =/^(\w){6,20}$/;  
        if (!regex.exec(password)) {
       	 alert("密码输入不合法");
       	 return;
        }
        
        var rpassword = $("input[name='rpassword']").val();
        if (password != rpassword) {
            alert("两次密码输入不一致");
            return;
        }         
        
		$.post(HOST_PATH+"/authentication/forgetpassword", $("#forgetpasswordForm").serialize(), success);
	});
});