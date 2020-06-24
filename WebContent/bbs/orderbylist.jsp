<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

   
 
 total : ${count}  
 <br>
 <br>
 <br>
 <br>
	<div class="order_box">
	 
	   <div class="order_index">일련번호</div>
	   <div class="order_index">이메일</div>
	   <div class="order_index">구매상품번호</div>
	   <div class="order_index">받는사람</div>
	   <div class="order_index">전화번호</div>
	   <div class="order_index">주소</div>
	   <div class="order_index">요구사항</div>
	   <div class="order_index">구매일자</div>
	   <div class="order_index">결제방법</div>
	   <div class="order_index">상품수량</div>
	</div>
	<c:forEach var="order" items="${buy_list }">
   	<div class="order_box"> 
	   <div class="order_index_box">${order.uid }</div>
	   <div class="order_index_box"><a href="${home}/Orderview.do?uid=${order.uid}">${order.email }</a></div>
	   <div class="order_index_box"><a href="${home}/Productpageview.do?uid=${order.uid}">${order.product_uid }</a></div>
	   <div class="order_index_box">${order.delivery_name }</div>
	   <div class="order_index_box">${order.delivery_mobile1 }-${order.delivery_mobile2 }</div>
	   <div class="order_index_box">${order.addr1 }${order.addr2 }${order.addr3 }${order.addr4 }</div>
	   <div class="order_index_box">${order.content }</div>
	   <div class="order_index_box">${order.buy_date }</div>
	   <div class="order_index_box">${order.method }</div>
	   <div class="order_index_box">${order.amount }</div>
	</div> 
	</c:forEach>
		<div class="container">
			<table class="center">
		         <tr>
		            <td>
				      <!-- 페이징 처리 -->
				      <c:if test="${count>0 }">
				      <c:set var="pageCount" value="${count / pageSize + (count % pageSize == 0 ? 0 : 1) }" />
				      <fmt:parseNumber var="pageCount" value="${pageCount}" integerOnly="true" />
				         
				      <!-- 2개의 변수 초기화 -->
				      <c:set var="startPage" value="${1}" />
				      <c:set var="pageBlock" value="${10}" />
				         
				      <!-- 다음 페이지 블럭이 존재 할 경우 startPage 값 변경 부분 -->
				      <c:if test="${pageNum > pageBlock}">
				            
				      <!-- 결과를 정수형으로 리턴 받아야 하기 대문에 fmt -->
				      <fmt:parseNumber var="result" value="${pageNum / pageBlock - (pageNum % pageBlock == 0 ? 1 : 0)}" integerOnly="true" />
				      <c:set var="startPage" value="${result * pageBlock + 1}" />
				      </c:if>
				         
				      <!-- endPage 값 설정 부분 -->
				      <c:set var="endPage" value="${startPage + pageBlock -1}" />
				      <c:if test="${endPage > pageCount }">
				      <c:set var="endPage" value="${pageCount }" />
				      </c:if>
				         
				      <!-- 처음 링크 -->
				      <c:if test="${pageBlock<pageNum}">
				      	<a href="${home}/Orderbylist.do?pageNum=${1}">[처음] </a>
				      </c:if>
				         
				      <!-- 이전 링크 -->
				      <c:if test="${startPage > pageBlock}">
				        <a href="${home}/Orderbylist.do?pageNum=${startPage - pageBlock }">[이전] </a>
				      </c:if>
				         
				      <!-- 페이징 링크 -->
				      <c:forEach var="i" begin="${startPage }" end="${endPage }">
				        <a href="${home}/Orderbylist.do?pageNum=${i }">[${i }] </a>
				      </c:forEach>
				      
				      <!-- 다음 링크 -->
				      <c:if test="${endPage < pageCount }">
				        <a href="${home}/Orderbylist.do?pageNum=${startPage + pageBlock}">[다음] </a>
				      </c:if>
				         
				      <!-- 맨끝 링크 -->
				      <c:if test="${startPage<pageCount}">
				        <a href="${home}/Orderbylist.do?pageNum=${pageCount}">[맨끝] </a>
				      </c:if>
				      </c:if>
		            </td>
		         </tr>            
		      </table>
 		</div>	
   

   <%@ include file="../foot.jsp" %>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   