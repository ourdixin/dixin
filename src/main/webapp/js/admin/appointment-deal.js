$(document).ready(function(){


	success: function success(data){
		if(data.success){
			alert('提交成功！');
			location.href=data.url;
		}else{
			alert('请重新登录！');
			location.href=data.url;
		}
	};
	
	$('.bnt_ok').click(function(){
		$.post(HOST_PATH+"/admin/appointment-deal", $("#dealForm").serialize(), success);
	});
});