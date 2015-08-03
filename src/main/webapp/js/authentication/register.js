$(document).ready(function(){
	
	function success(data){
		if(data.success){
			alert("注册成功！")
			location.href = data.msg;
		}
		else
		{
			alert(data.msg)
		}
	};
	
	$('.dis_getcode').click(function(){
		 var phone = $("input[name='mobile']").val();
         var regex = /^1[3,4,5,7,8]\d{9}$/;
         if(!regex.exec(phone)) {
        	 alert("手机号输入不正确");
             return;
         }
         
		$.post(HOST_PATH+"/authentication/sendsms", $("#regForm").serialize(), success);
	});
	
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
         
         var bagree = $("input[id='agree']").attr("checked");
         if (bagree == false) {
             alert("请先阅读并同意《121金融注册协议》才能注册用户！");
             return;
         }         
		
		$.post(HOST_PATH+"/authentication/user", $("#regForm").serialize(), success);
	});
});