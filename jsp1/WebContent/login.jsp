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
		var value=this.value;
	if(value == "회원탈퇴"){
		$("#command").val("delete");
		
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
<form action="login.user" method="post">
아이디 : <input type="text" name="id" id="id"><br>
비밀번호 : <input type="password" name="pwd" id="pwd"><br>
<input type="hidden" name="command" value="login">
<input type="submit" value="로그인">

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
<input type="hidden" name="command" id="command" value="logout">
<input type="hidden" name="userNo" value="<%=userNo%>>">
</form>	
<%	
}

%>

</body>
</html>