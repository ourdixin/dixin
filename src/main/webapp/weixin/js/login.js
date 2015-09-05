$(document).ready(function(){
	
	success: function success(data){
		if(data.success){
			location.href = data.url;
		}else{
			alert(data.msg);
		}
	};
	
	$('.login-btn').click(function(){
		var username = $("input[name='mobile']").val();
        var regex = /^1[3,4,5,7,8]\d{9}$/;
        if(!regex.exec(username)) 
        {
        	alert("手机号输入不正确");
            return;
        }
        var type = 0;
        if($('#normal_login').hasClass("over"))
        {
        	type = 0;
            var password = $("input[name='password']").val();
            var regex =/^(\w){6,20}$/;  
            if (!regex.exec(password)) {
           	 alert("密码输入错误");
           	 return;
            }
        }
        else
    	{
        	type = 1;
        	var verifyCode = $("input[name='verifyCode']").val();
        	if (verifyCode == null || verifyCode=="") {
              	 alert("请输入验证码！");
              	 return;
               }
    	}
        
		$.post(HOST_PATH+"/weixin/login", "type=" + type + "&" + $("#loginForm").serialize(), success);
	});

	
	$('#normal_login').click(function(){
		$('#normal_login').addClass("over");
		$('#mobile_login').removeClass("over");
		$('#mobile_login_box').hide();
		$('#normal_login_box').show();
	});
	
	$('#mobile_login').click(function(){
		$('#mobile_login').addClass("over");
		$('#normal_login').removeClass("over");
		$('#mobile_login_box').show();
		$('#normal_login_box').hide();		
	});	
	
	function smssuccess(data){
		if(data.success){
			curCount = 60;
			$("#getVerifyCode").html("重发(" + curCount + "s)");
			InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
	    	$('#getVerifyCode').unbind("click");
			alert("短信发送成功，请注意查收！")
		}
		else
		{
			alert(data.msg)
		}
	};
	
	function SetRemainTime() {
	    if (curCount == 0) {                
	        window.clearInterval(InterValObj);//停止计时器
	    	$('#getVerifyCode').click(function(){
	    		sendSms();
	    	});
	        $("#getVerifyCode").html("获取验证码");
	    }
	    else {
	        curCount--;
	        $("#getVerifyCode").html("重发(" + curCount + "s)");
	    }
	}
	
	function sendSms(){
		 var phone = $("input[name='mobile']").val();
       var regex = /^1[3,4,5,7,8]\d{9}$/;
       if(!regex.exec(phone)) {
      	 alert("手机号输入不正确");
           return;
       }
      
		$.post(HOST_PATH+"/weixin/sendsms", $("#loginForm").serialize(), smssuccess);
	}
	
	$('#getVerifyCode').click(function(){
		sendSms();
	});	
	
});