<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>마우스 무브</h3>
<hr>
이미지 위에 마우스 움직일때 onmousemove 리스너 실행, 마우스 위치를 보여줌
<p>
<img src="img/Desert.jpg" width=300 onmousemove="where(event)">
<p>
<div id="div"></div>

<script type="text/javascript">
var div=document.getElementById("div");
function where(e){
var text =" 버튼="+e.button+"<br>";
text += "(screenX, screenY)"+e.screenX+","+e.screenY+"<br>";
text += "(clientX, clientY)"+e.clientX+","+e.clientY+"<br>";
text += "(offsetX, offsetY)"+e.offsetX+","+e.offsetY+"<br>";
text += "(X, Y)"+e.x+","+e.y+"<br>";

div.innerHTML = text;
}
</script>
<!-- <script type="text/javascript"> -->
<!-- let timerId = setTimeout(function tick() { -->
<!-- 	  alert('tick'); -->
<!-- 	  timerId = setTimeout(tick, 2000); // (*) -->
<!-- 	}, 2000); -->
<!-- </script> -->
</body>
</html>