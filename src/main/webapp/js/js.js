$(document).ready(function(){

	function success(data){
		alert("发布成功！")
		location.href = data.msg;
	};
	//修改基本信息
	$('.bnt_ok_person_base').click(function(){
		$.post(HOST_PATH+"/authentication/uppersonaldata", $("#baseInfoForm").serialize(), success);
	});
});