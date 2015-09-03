$(document).ready(function(){
	
	function success(data){
		if(data.success){
			alert("注册成功！")
			location.href = data.url;
		}
		else
		{
			alert(data.msg)
		}
	};
	
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
	
	function randcodesuccess(data){
		if(data.success){
			//$("#getVerifyCode").removeClass("dis_getcode"); 
		}
		else{
			//$("#getVerifyCode").addClass("dis_getcode"); 
			alert(data.msg)
		}
		
	};	
	
	$('#randCode').blur(function() { 
		$.post(HOST_PATH+"/authentication/randcode", $("#regForm").serialize(), randcodesuccess);
	});	

	function sendSms(){
		 var phone = $("input[name='mobile']").val();
        var regex = /^1[3,4,5,7,8]\d{9}$/;
        if(!regex.exec(phone)) {
       	 alert("手机号输入不正确");
            return;
        }
       
		$.post(HOST_PATH+"/weixin/sendsms", $("#regForm").serialize(), smssuccess);
	}
	
	$('#getVerifyCode').click(function(){
		sendSms();
	});
	
	$('#randCodeImg').click(function(){
		var mydate = new Date();
		$("#randCodeImg").attr("src",HOST_PATH+"/authentication/getPic?time="+mydate.toLocaleString());
	});
	
	
	
	$('.login-btn').click(function(){
		
		 var phone = $("input[name='mobile']").val();
         var regex = /^1[3,4,5,7,8]\d{9}$/;
         if(!regex.exec(phone)) {
        	 alert("手机号输入不正确");
             return;
         }	
            
         var password = $("input[name='password']").val();
         var regex =/^(\w){6,10}$/;  
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
             alert("请先阅读并同意《9点财讯注册协议》才能注册用户！");
             return;
         }         
		
		$.post(HOST_PATH+"/weixin/user", $("#regForm").serialize(), success);
	});
});