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
	var grade;
	var score=prompt("0~100점수를 입력하세요");
	score=parseInt(score);
	
	if(score>=90){
		grade="A";
	}else if(score>=80){
		grade="B";
	}else if(score>=70){
		grade="C";
	}else if(score>=60){
		grade="D";
	}else{
		grade="F";
	}
	
	document.write("점수는 "+score+"학점은 "+grade+" 입니다.");
		
</script>
</body>
</html>