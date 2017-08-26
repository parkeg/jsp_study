<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="/js/jquery-3.2.1.min.js"></script><!-- 이게 있어야 jquery 사용가능 -->

<script>
$(document).ready(function(){
	$("#btn1").click(function(){
		var name = $("#name").val();
		var age = $("#age").val();
		var result="이름 : "+name;
		result += "나이 : "+age;
		$("#result_div").html(result);
	})//html함수와  append함수 구별!! append함수는 div사이에 있는 값이 그대로 나오고 html은 사라짐
})
/*function test(){
	var name=$("#name").val();
	var age=$("#age").val();
	var result="이름 : "+name;
	result += "나이 : "+age;
	$("#result_div").html(result);*/
	//alert($("input[name='nameInput']").val());//모든 input태그를 바라봄
	//alert($("#name").val());//jquery함수사용 #이 들어가면 무조건 id바라봄
	/*var nameObj=document.getElementById("name");
	alert(nameObj.value);*/

/* test=function(){
	alert(1);
}
test="1"; 오버라이딩? 오버로딩?*/
</script>
<body>
이름 : <input type="text" name="name" id="name">
<br>
나이 : <input type="text" name="age" id="age">
<br>
<div id="result_div">아무거나</div>>
<input type="button" value="클릭해봐" id="btn1"><!-- on들어가면 무조건 이벤트임 -->
</body>

</html>