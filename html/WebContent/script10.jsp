<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var n=prompt("구구단 2~9 숫자만 입력해~");
	gugudan(n);
	
	function gugudan(n){
		if(isNaN(n)){
			alert("숫자 입력해~");
			n= prompt("구구단 2~9슷자만 입력해~");
			gugudan(n);
		}else{
			n= parseInt(n);//문자열 숫자 변환
			if(n>9 || n<2){
				alert("단수는 2~9단만.. 입력해~");
				n= prompt("구구단 2~9슷자만 입력해~");
				gugudan(n);
				
			}else{
				for(i=1; i<=9; i++){
					document.write(n+"*"+i+"<br>");
			}
		}
				
	}
}

</script>