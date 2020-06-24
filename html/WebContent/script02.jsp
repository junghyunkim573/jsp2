<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	ret=confirm("전송할까요?");
	
	if(ret == true){
		alert("확인 버튼을 누른경우")	
	}else{
		alert("취소버튼, 다이얼 로그를 닫은경우")
	}
</script>
</body>
</html>