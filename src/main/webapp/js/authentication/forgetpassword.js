$(document).ready(function(){
	
	function success(data){
		alert(data.msg)
		//location.href = data.msg;
	};
	
	$('.bnt_ok').click(function(){
		$.post("/dixin/authentication/forgetpassword", $("#forgetpasswordForm").serialize(), success);
	});
});