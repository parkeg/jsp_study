<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="/js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$("input[type='button']").click(function(){//$는 jquery
		if(this.getAttribute("id")=="btnLogin") return;
		var value=this.value;
	if(value == "회원탈퇴"){
		$("#command").val("delete");
		
	}else if(value == "회원정보수정"){
		location.href="/user/update.jsp";
		return;
	}else if(value=="회원리스트"){
		location.href="/user/list.jsp";
		return;
	}
	this.form.submit();
		//alert(this.value);//여기부턴 자바스크립트
	})
})
</script>
<body>
<%
Map<String, String> user = null;
//String login = null;
if(session.getAttribute("user")!=null){
	user = (Map<String, String>)session.getAttribute("user");
}
if(user == null){
%>
<script>
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

$(document).ready(function(){
	$("#btnLogin").click(function(){
		var idValue=$("#id").val().trim();
		var pwdValue=$("#pwd").val().trim();
		if(idValue==""){
			alert("아이디를 적어야지!!");
			$("#id").val("");
			$("#id").focus();
			return;
		}
		if(pwdValue==""){
			alert("비밀번호는 안적냐!!");
			$("#pwd").val("");
			$("#pwd").focus();
			return;
		}
		var param={};
		param["id"]=idValue;
		param["pwd"]=pwdValue;
		
		param="?command=login&param=" + JSON.stringify(param);
		param=encodeURI(param);//unicode로 바꿔줌
		var au = new AjaxUtil("test.user",param,"post");
		au.changeCallBack(callback);
		au.send();
	});
})

function callback(result){
	var re = JSON.parse(result);
	alert(re.result);
	location.href=re.url;
}
</script>
<form action="login.user" method="post">
아이디 : <input type="text" name="id" id="id"><br>
비밀번호 : <input type="password" name="pwd" id="pwd"><br>
<input type="hidden" name="command" id="command" value="login">
<input type="button" id="btnLogin" value="로그인">

</form>
<%
}else {
	String id = user.get("id");
	String userNo=user.get("user_no");
	String name = user.get("name");
	String hobby = user.get("hobby");
	String result=userNo+"번째로 가입하신" +name+"님 반갑습니다.<br>";
	result += name+"님의 id는 "+id+"이며 취미는 아래와 같습니다.<br>";
    result += "취미 : "+hobby;
	out.println(result);
%>	
<form action="some.user" method="post">
<input type="button" value="로그아웃">
<input type="button" value="회원탈퇴">
<input type="button" value="회원정보수정">
<input type="button" value="회원리스트">
<input type="hidden" name="command" id="command" value="logout">
<input type="hidden" name="userNo" value="<%=userNo%>">
</form>	
<%	
}

%>

</body>
</html>