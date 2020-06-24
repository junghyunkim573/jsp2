<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var day=now.getDay();
	
	var yoil=now.getDay();
	
	var hour=now.getHours();
	var minute=now.getMinutes();
	var second= now.getSeconds();
	var millisecond=now.getMilliseconds();
	
	document.write(year+"년"+month+"월"+day+"일")
	document.write(hour+"시간"+minute+"분"+second+"초")
	if(second%2 == 0){
		color=blue;
		document.write("<span style='color:red'>"+second+"</span>")
	}else{
		document.write("<span style='color:blue'>"+second+"</span>")
	}
</script>