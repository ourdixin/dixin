$(document).ready(function(){

	function success(data){
		if(data.success )
		{
			var htmlStr = template('appointment', data.result);
			$('.main_width').html(htmlStr);
		}

		$("a[class='item']").click(function(){
			$.get(HOST_PATH+"/admin/appointment?pageNum="+this.text, null, success);
		});		
		
	};
	
	function searchAppointment()
	{
		$.get(HOST_PATH+"/admin/appointment", null, success);
	}
	
	template.config('openTag', '<#');
	template.config('closeTag', '#>');	
	
	searchAppointment();
	
});