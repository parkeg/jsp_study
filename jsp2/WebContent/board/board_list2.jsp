<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<title>게시판</title>
<script>

	function callback(result){
		result = JSON.parse(result);
		var str = "";
		for(var i=0, max=result.length;i<max;i++){
			var b = result[i];
			str += "<tr>";
			str += "<td>"+b.bNum+"</td>";
			str += "<td>"+b.title+"</td>";
			str += "<td>"+b.content+"</td>";
			str += "<td>"+b.writer+"</td>";
			str += "<td>"+b.regDate+"</td>";
			str += "</tr>";
		}
		$("#r_div").html(str);
	}
	
	$(document).ready(function(){
		var param = "?command=list";
		param = encodeURI(param);
		var au = new AjaxUtil("list.board",param,"post");
		au.changeCallBack(callback);
		au.send();
	})
</script>
</head>
<body>
<div id="r_div"></div>
<table border='1'>
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>내용</td>
		<td>생성자</td>
		<td>생성일자</td>
	</tr>
	<tbody id="r_tbody">
	</tbody>
</table>
게시판리스트입니다.
</body>
</html>