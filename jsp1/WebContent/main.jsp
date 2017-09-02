<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<title>Insert title here</title>
</head>
<script>
$(document).ready(function(){
	$("input[type='button']").click(function(){//$는 jquery
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
if(user != null){
	String id = user.get("id");
	String userNo=user.get("user_no");
	String name = user.get("name");
	String hobby = user.get("hobby");
	String result=userNo+"번째로 가입하신" +name+"님 반갑습니다.<br>";
	result += name+"님의 id는 "+id+"이며 취미는 아래와 같습니다.<br>";
	result += "취미 : "+hobby;
	out.println(result);
}
%>	
<form action="some.user" method="post">
<input type="button" value="로그아웃">
<input type="button" value="회원탈퇴">
<input type="button" value="회원정보수정">
<input type="button" value="회원리스트">
<input type="hidden" name="command" id="command" value="logout">
</form>	
</body>
</html>