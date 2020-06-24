<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
hi~
<script>
	var sum=0;
	for(var i=0; i<=10; i++){
		sum += 1;	
	}
	//alert("0~10까지의 합"+sum)
	//document.write("안녕하세요")
	//document.writeln("안녕하세요")
	
	//promtp()사용법
	ret=prompt("이름 입력해");
	
	if(ret == null){
		alert=("취소 버튼이나 다이얼로그를 닫은 경우");
	}else if(ref == ""){
		alert=("입력값이 없이 확인 버튼을 누른 경우");
	}else{
		alert=(ret+" : 입력하세요");
	}
</script>
안녕
</body>
</html>