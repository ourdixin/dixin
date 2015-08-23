$(document).ready(function(){

	function success(data){
		if(data.success )
		{
			var htmlStr = template('myreply', data.result);
			$('.main_width').html(htmlStr);
		}

		$("a[class='item']").click(function(){
			$.get(HOST_PATH+"/authentication/myReply?pageNum="+this.text, null, success);
		});		
		
	};
	
	function searchMyReply()
	{
		$.get(HOST_PATH+"/authentication/myReply", null, success);
	}
	
	template.config('openTag', '<#');
	template.config('closeTag', '#>');	
	
	searchMyReply();
	
});