/**
 * 
 */

$(document).ready(function(){
	$("#left_menu").children().each(function(index,element){
		if($(element.children).attr("href") != undefined && $(element.children).attr("href").indexOf(HOST_URL.slice(0,-4)) != -1)
		{
			$(element.children).css("background","#e1e1e1");
			
			var name = $(element.children).html();
			var pos = name.indexOf(">") + 1;
			name = name.substring(pos);
			
			//$("#title_font").html(name);
			$("#title_name").html(name);
		}
	});
	
});
