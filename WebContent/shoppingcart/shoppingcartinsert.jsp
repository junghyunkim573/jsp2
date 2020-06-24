<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<div class="container">
	
		<table width="600">
		  <tr>
		  	<td>NO</td>
		    <td>상품이름</td>
		    <td>상품가격</td>
		    <td>상품갯수</td>
		    <td>첨부파일1</td>
		  	<td>배송</td>
		  </tr>
		  <tr><td colspan="7" width="100%" height="1" bgcolor="black"></td></tr>
		 <c:set var="number" value="${number}"/>
		 <c:forEach var="shoppingcart" items="${shoppingcart}">
			<tr>
			<td>${number}</td>
		    <td><a href="${home}/Shoppingcart.do?uid=${shoppingcart.uid}">${shoppingcart.email}</a></td>
		    <td>${shoppingcart.name}</td>
		    <td>${shoppingcart.price}</td>
		    <td>${shoppingcart.amount}</td>
		    <td>${shoppingcart.file1}</td>
		    <td>${shoppingcart.delivery}</td>
		  </tr>
		  <tr><td colspan="7" width="100%" height="1" bgcolor="black"></td></tr>
		<c:set var="number" value="${number -1}"/>
		</c:forEach>
		</table>






































<%@ include file="../foot.jsp" %>