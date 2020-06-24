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
	var x=100;//전역변수
	
	function f(){
		var y;
		x=10;//지역변수
		y=10;
			
		alert(x);
		alert(this.x);
	}
	//f();
	
	var a=3,b=5;
	if(a>b){
		alert("a가 크다")
	}else{
		alert("a가 작다")
	}
	alert((a>b?"a가크다":"a가작다"))
		
</script>
<a onclick="f()">실행</a>
</body>
</html>