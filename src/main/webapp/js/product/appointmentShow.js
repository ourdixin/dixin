$(document).ready(function(){

	function success(data){
		if(data.success )
		{
			var htmlStr = template('appointment', data.result);
			$('.con').html(htmlStr);
		}

				
		$("a[class='item']").click(function(){
			$.get(HOST_PATH+"/product/queryAppointment?pageNum="+this.text, null, success);
		});		
		
	};
	
	function searchAppointment()
	{
		//if($('#search_text').attr("value") == undefined)
		//	$.get(HOST_PATH+"/product/queryAppointment?profitType="+profitType, null, success);
		//else
			$.get(HOST_PATH+"/product/queryAppointment", null, success);
	}
	
	template.config('openTag', '<#');
	template.config('closeTag', '#>');	
	
	searchAppointment();
	
});