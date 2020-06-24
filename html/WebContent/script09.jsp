<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	//eval()사용
	var a="2*3+4+6";
	var a=eval("2*3+4+6");//문자열 형태로 전달받아 수식으로 실행
	
	//alert(a);
	//alert(b);
	
	//isNaN()사용
	var n="hello";
	if(isNaN(n)){
		document.write(n+"는 숫자가 아닙니다")
	}else{
		document.write(n+"는 숫자다")
	}
	
</script>