$(document).ready(function(){

	function success(data){
		alert(data.msg)
		//location.href = data.msg;
	};
	
	$('.bnt_ok').click(function(){
		$.post(HOST_PATH+"/product/customer", $("#customerForm").serialize(), success);
	});
});