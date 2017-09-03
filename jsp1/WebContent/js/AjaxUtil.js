var AjaxUtil = function(p_url, p_params, p_method, p_aSync){
	if(!p_url || p_url.trim()==""){
		alert("AjaxUtil호출시 url은 필수 입니다.");
		return;
	}
	this.params = p_params;
	var getHttpXmlObj = function(){
		if(window.XMLHttpRequest){
	  		return new XMLHttpRequest();
	 	}else if(window.ActiveXObject){
	  		return new ActiveXObject("Microsoft.XMLHTTP");
	 	}
		alert("해당 브라우져가  Ajax를 지원하지 않습니다.");
	}
	this.xhr = getHttpXmlObj();
	var method = p_method?p_method:"get";
	var url = p_url;
	var aSync = p_aSync?p_aSync:true;//비동기가 true
	this.xhr.callback=null;
	this.xhr.onreadystatechange=function(){//이벤트
   		if (this.readyState==4){//4가 서버에서 요청한 것 다 끝났을 때
   			if(this.status==200){//200-209까지가 성공, 그 외에는 에러
	   			var result = decodeURIComponent(this.responseText);//this는 xhr임
	   			if(this.callback){
	   				this.callback(result);
	   			}else{
	   				alert(result);
	   			}
	   				
   			}else{
   				var result=docodeURIComponent(this.responseText);
   				alert(result);
   			}
   		}
	}
	this.changeCallBack = function(func){
		this.xhr.callback = func;
	}
   	this.xhr.open(method, url+this.params, aSync);//연결준비
   	this.send = function(){
   		this.xhr.send.arguments = this;
   	   	this.xhr.send();//이동
   	}
}