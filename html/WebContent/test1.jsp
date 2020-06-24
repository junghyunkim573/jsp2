<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/basiccss.css">
<script src="/js/basic.js">
</script>
<style>
.ab{color:blue;
}
#bc{color:green;
}

</style>
</head>
<body>
<div style="color:red">a 에이다.</div>

<div class="ab">a 에이다.</div>

<div id="bc">a 에이다.</div>

<div>a 에이다.</div>

<img src="/img/shine.png" onmouseover="this.src='/img/2222.png'"onmouseout="this.src='/img/shine.png'">
<a href="javascript:alert('바로클릭 했을 경우');">클릭을 해보자</a>
<a onclick="alert('하하하')">클릭해보자.</a>
<a onclick="aaa()">클릭해보자.</a>
</body>
</html>