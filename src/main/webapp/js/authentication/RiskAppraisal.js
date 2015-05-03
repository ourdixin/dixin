$(document).ready(function(){
	
	$('.bnt_ok').click(function(){
		//$.post(HOST_PATH+"/authentication/RiskAppraisal", $("#assessmentForm").serialize(), success);
		$('#assessmentForm').submit();
	});
});