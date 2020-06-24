<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String a=request.getParameter("name");
String b=request.getParameter("year");
String c=request.getParameter("gender");
String d=request.getParameter("comment");

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름 : <%=a%><br>
년도 : <%=b%><br>
성별 : <%=c%><br>
내용 : <%=d%><br>

</body>
</html>