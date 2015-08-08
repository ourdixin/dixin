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
			location.href = data.msg;
		}
		else
		{
			alert(data.msg)
		}
	};
	
	//修改基本信息
	$('.bnt_ok_person_base').click(function(){
		$.post(HOST_PATH+"/authentication/uppersonaldata", $("#baseInfoForm").serialize(), success);
	});
	
	
	$('#getVerifyCode').click(function(){
		 var phone = $("input[name='mobile']").val();
        var regex = /^1[3,4,5,7,8]\d{9}$/;
        if(!regex.exec(phone)) {
       	 alert("手机号输入不正确");
            return;
        }
        
		$.post(HOST_PATH+"/authentication/sendsms", $("#regForm").serialize(), success);
	});
	
	//修改手机号
	$('.bnt_ok_mobile').click(function(){
		/**
		_vCode = $("#_vCode").val(); 
		vCode = $("#vCode").val();
		if(_vCode != vCode) {
			alert("验证码错误");
			return;
		}
		**/
		$.post(HOST_PATH+"/authentication/uppersonaldata", $("#baseInfoForm").serialize(), success);
	});
	
	getProvinceList();
	
});