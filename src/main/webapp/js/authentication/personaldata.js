$(document).ready(function(){

	function success(data){
		alert("发布成功！")
		location.href = data.msg;
	};
	//修改基本信息
	$('.bnt_ok_person_base').click(function(){
		$.post(HOST_PATH+"/authentication/uppersonaldata", $("#baseInfoForm").serialize(), success);
	});
	
	//修改手机号
	$('.bnt_ok_mobile').click(function(){
		_vCode = $("#_vCode").val(); 
		vCode = $("#vCode").val();
		if(_vCode != vCode) {
			alert("验证码错误");
			return;
		}
		$.post(HOST_PATH+"/authentication/uppersonaldata", $("#baseInfoForm").serialize(), success);
	});
});