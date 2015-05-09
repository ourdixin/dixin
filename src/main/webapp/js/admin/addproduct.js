$(document).ready(function(){
	
	//实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
    
	function addsuccess(data){
		alert("添加成功！")
		//location.href = data.msg;
	};
	
	$('.bnt_ok').click(function(){
		$.post(HOST_PATH+"/product/add", $("#addproductForm").serialize(), addsuccess);
	});   
	
	$('#submitad').click(function(){
		$("#adloading").ajaxStart(function(){  
            $(this).show();  
        }).ajaxComplete(function(){  
            $(this).hide();  
        });  
		
		   $.ajaxFileUpload({  
	            url:HOST_PATH+"/product/uploadadfile",  
	            secureuri:false,  
	            type: 'post',
	            fileElementId:"uploadadfile",  
	            dataType: 'json',
	            success : function (data, status){
	                if(typeof(data.success) != 'undefined'){
	                    if(!data.success){
	                        alert(data.error);
	                    }else{
	                        //alert(data.msg);
	                    	alert("上传成功！");
	                    	if(data.result.length > 0 )
	                    		$("#adFile").val(data.result);
	                    }
	                }
	            },
	            error: function(data, status, e){
	                alert(e);
	            }
	        });		
		
	});
	$('#submitguide').click(function(){
		$("#guideloading").ajaxStart(function(){  
            $(this).show();  
        }).ajaxComplete(function(){  
            $(this).hide();  
        });  
		
		   $.ajaxFileUpload({  
	            url:HOST_PATH+"/product/uploadguidefile",  
	            secureuri:false,  
	            type: 'post',
	            fileElementId:"uploadguidefile",  
	            dataType: 'json',
	            success : function (data, status){
	                if(typeof(data.success) != 'undefined'){
	                    if(!data.success){
	                        alert(data.error);
	                    }else{
	                        //alert(data.msg);
	                    	alert("上传成功！");
	                    	$("#guideFile").val(data.result);
	                    }
	                }
	            },
	            error: function(data, status, e){
	                alert(e);
	            }
	        });		
		
	});	
	
	$('#submitproductfile').click(function(){
		$("#productfileloading").ajaxStart(function(){  
            $(this).show();  
        }).ajaxComplete(function(){  
            $(this).hide();  
        });  
		
		   $.ajaxFileUpload({  
	            url:HOST_PATH+"/product/addProductList",  
	            secureuri:false,  
	            type: 'post',
	            fileElementId:"productfile",  
	            dataType: 'json',
	            success : function (data, status){
	                if(typeof(data.success) != 'undefined'){
	                    if(!data.success){
	                        alert(data.msg);
	                    }else{
	                    	alert("产品添加成功！");
	                    }
	                }
	            },
	            error: function(data, status, e){
	                alert(e);
	            }
	        });		
		
	});		
	
	/** 
	 * 时间对象的格式化; 
	 */  
	Date.prototype.format = function(format) {  
	    /* 
	     * eg:format="yyyy-MM-dd hh:mm:ss"; 
	     */  
	    var o = {  
	        "M+" : this.getMonth() + 1, // month  
	        "d+" : this.getDate(), // day  
	        "h+" : this.getHours(), // hour  
	        "m+" : this.getMinutes(), // minute  
	        "s+" : this.getSeconds(), // second  
	        "q+" : Math.floor((this.getMonth() + 3) / 3), // quarter  
	        "S" : this.getMilliseconds()  
	        // millisecond  
	    }  
	  
	    if (/(y+)/.test(format)) {  
	        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4  
	                        - RegExp.$1.length));  
	    }  
	  
	    for (var k in o) {  
	        if (new RegExp("(" + k + ")").test(format)) {  
	            format = format.replace(RegExp.$1, RegExp.$1.length == 1  
	                            ? o[k]  
	                            : ("00" + o[k]).substr(("" + o[k]).length));  
	        }  
	    }  
	    return format;  
	}  
	
	var myDate = new Date();
	$('#endDate').attr("value",myDate.format("yyyy-MM-dd"));
	
	
	$('#payType').change(function(){ 
		if(this.value == 73)
		{
			$('#payTypeInfo').show();
		}
		else
		{
			$('#payTypeInfo').hide();
		}
	});
	
	
});