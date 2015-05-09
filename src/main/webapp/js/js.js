// JavaScript Document
    function set_tab(tab, id, num) {
       for ( var i = 1; i <= num; i++ ) {
          jQuery("#" + tab + '_' + i).attr('class', tab+'_'+i+'_off');
          jQuery("#" + tab + '_con_' + i).hide();
            }
          jQuery("#" + tab + '_' + id).attr('class', tab+'_'+id+'_on');
          jQuery("#" + tab + '_con_' + id).show();
    }
    

jQuery(function(){

   jQuery("#sexsty label").click(function(){
     jQuery(this).addClass("radio_on").siblings().removeClass("radio_on");

  })

     jQuery(".user_1").hover(function(){
        jQuery(this).children("span").toggle();


     })
	 
	$("#D2 .box").hover(function(){
		$(this).toggleClass("boxb");
	})
	$("#D2 .box2").hover(function(){
		$(this).toggleClass("box2b");
	})	
	$("#D2 .box3").hover(function(){
		$(this).toggleClass("box3b");
	})	 	 
	 
})
