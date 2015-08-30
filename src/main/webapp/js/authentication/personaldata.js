$(document).ready(function(){

	function getProvinceSuccess(data){
		if(data.success)
		{
			for(i=0;i < data.result.length;i++){
				$("#province").append("<option value='" + data.result[i].id + "'>" + data.result[i].name + "</option>");  
			}
			getCityList();
		}
	};
	
	function getProvinceList()
	{
		$.post(HOST_PATH+"/authentication/getcitylist",null, getProvinceSuccess);
	}

	function getCitySuccess(data){		
		if(data.success)
		{
			$("#areaId").empty();
			for(i=0;i < data.result.length;i++){
				$("#areaId").append("<option value='" + data.result[i].id + "'>" + data.result[i].name + "</option>");  
			}
		}		
	};	
	
	function getCityList()
	{
		$.post(HOST_PATH+"/authentication/getcitylist","pid=" + $("#province").val(), getCitySuccess);
	}
	
	$('#province').change(function(){
		getCityList();
	});
	
	function success(data){
		if(data.success){
			alert("发布成功！")
			location.href = data.url;
		}
		else
		{
			alert(data.msg)
		}
	};
	
	//修改基本信息
	$('.bnt_ok').click(function(){
		$.post(HOST_PATH+"/authentication/uppersonaldata", $("#baseInfoForm").serialize(), success);
	});
	
	
	function smssuccess(data){
		if(data.success){
			alert("短信发送成功，请注意查收！")
		}
		else
		{
			alert(data.msg)
		}
	};
	
	
	
	function randcodesuccess(data){
		if(data.success){
			//$("#getVerifyCode").removeClass("dis_getcode"); 
		}
		else{
			//$("#getVerifyCode").addClass("dis_getcode"); 
			alert(data.msg)
		}
		
	};	
	
	
	//生成图形验证码
	$('#randCodeImg').click(function(){
		var mydate = new Date();
		$("#randCodeImg").attr("src",HOST_PATH+"/authentication/getPic?time="+mydate.toLocaleString());
	});
	
	//检查图形验证码
	$('#randCode').blur(function() { 
		$.post(HOST_PATH+"/authentication/randcode", $("#baseInfoForm").serialize(), randcodesuccess);
	});	
	
	//发送验证码
	$('#getVerifyCode').click(function(){
		 var phone = $("input[name='mobile']").val();
        var regex = /^1[3,4,5,7,8]\d{9}$/;
        if(!regex.exec(phone)) {
       	 alert("手机号输入不正确");
            return;
        }
        
		$.post(HOST_PATH+"/authentication/sendsms", $("#baseInfoForm").serialize(), smssuccess);
	});
	
	
	//修改手机号
	$('.bnt_ok_mobile').click(function(){
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
		$.post(HOST_PATH+"/authentication/uppersonaldata", $("#baseInfoForm").serialize(), success);
	});
	
	getProvinceList();
	
});