<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function adder(a,b){
		sum=a+b;
		//alert(sum);
		return sum;
	}

	var n=adder(10,5);
	alert(n);
	
</script>
<a onclick="adder(10,3)">합산클릭</a>