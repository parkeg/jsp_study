<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String login = null;
if(session.getAttribute("id")!=null){
	login = (String)session.getAttribute("id");
}
if(login == null){
%>
<form action="login.user" method="post">
아이디 : <input type="text" name="id" id="id"><br>
비밀번호 : <input type="password" name="pwd" id="pwd"><br>
<input type="hidden" name="command" value="login">
<input type="submit" value="로그인">

</form>
<%
}else {
	String id = (String)session.getAttribute("id");
	String userNo=(String)session.getAttribute("user_no");
	String name = (String)session.getAttribute("name");
	String hobby = (String)session.getAttribute("hobby");
	String result=userNo+"번째로 가입하신" +name+"님 반갑습니다.<br>";
	result += name+"님의 id는 "+id+"이며 취미는 아래와 같습니다.<br>";
    result += "취미 : "+hobby;
	out.println(result);
}

%>

</body>
</html>