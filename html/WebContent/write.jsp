<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<form action="write_update.jsp" method="get">
	이름:<input type="text" name=name value=""><br>
	년도:
	<select name="year">
		<option value="">==선택==</option>
		<option value="2017">2017</option>
		<option value="2018">2018</option>
		<option value="2019">2019</option>
		
	</select><br>
	성별:
		<input type="radio" name="gender" value="M">남자	
		<input type="radio" name="gender" value="F">여자<br>
	내용:
		<textarea name="comment" style="width:300px; height50px"></textarea>
			
		<input type="submit" value="글쓰기">
</form>
</body>
</html>