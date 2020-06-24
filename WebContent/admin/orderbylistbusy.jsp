<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

total : ${count}      
 
	<div class=all_order_list_box>
		<div class="order_index">번호</div><!-- 1 -->
	   	<div class="order_index">일련번호</div><!-- 2 -->
	   	<div class="order_index">구매자</div><!-- 3 -->
	   	<div class="order_index">상품 이름</div><!-- 4 -->
	   	<div class="order_index">구매 가격 /수량</div><!-- 5 -->
	   	<div class="order_index">총결제 금액</div><!-- 6 -->
	   	<div class="order_index">판매자 수입</div><!-- 7 -->
	   	<div class="order_index">물품 거래 승인 상태</div><!-- 9 -->
	   	<div class="order_index">거래 방법</div><!-- 10 -->
	   	<div class="order_index">은행</div><!-- 11 -->
	   	<div class="order_index">판매자 계좌 번호</div><!-- 12 -->
	   	<div class="order_index">결제 처리 상태 </div><!-- 13 -->
	   	
	</div>
	<c:set var="number" value="${number}"/>
	<c:forEach var="order" items="${buy_list }">
   	<div class="all_order_list_box"> 
   	   	<div class="order_index">${number }</div>
	   	<div class="order_index_box">${order.uid }</div>
	   	<fmt:parseNumber var="importseller" value="${order.product_price *0.9 *order.amount}" integerOnly="true" />
	   	<fmt:parseNumber var="importadmin" value="${order.product_price *0.1 *order.amount}" integerOnly="true" />
	   	<div class="order_index_box"><a href="${home}/Orderview.do?uid=${order.uid}">${order.buyer_name }</a></div><!-- 구매자 -->
	   	<div class="order_index_box"><a href="${home }/Productpageview.do?uid=${order.product_uid}">${order.product_name }</a></div><!--상품 이름 -->
	   	<div class="order_index_box">${order.product_price }원 / ${order.amount }개</div> <!-- 구매 가격 //수량 --> 
	   	<div class="order_index_box">${order.product_price *order.amount }원</div><!--총 결제 금액-->
	   	<div class="order_index_box">${importseller }원</div><!--판매자 수입 -->
	   	<div class="order_index_box">x</div><!--물품 거래 승인상태 -->
	   	<div class="order_index_box">${order.method }</div><!--거래 방법-->
	   	<div class="order_index">${order.product_account1 }</div>
	   	<div class="order_index">${order.product_account2 }</div>
	   	<div class="order_index_box"><button onclick=(); >승인</button></div>
	   	
	   	
	   	   
	  
	 </div>
	 <c:set var="number" value="${number -1}"/> 
	 </c:forEach>
		<div class="container4">
			<div class="center">	
			    <!-- 페이징 처리 -->	
			    	
				<table>
					<tr>
						<td>
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
								<a href="${home}/OrderbylistAll.do?pageNum=${1}">[처음] </a>
							</c:if>
								
							<!-- 이전 링크 -->
							<c:if test="${startPage > pageBlock}">
								<a href="${home}/OrderbylistAll.do?pageNum=${startPage - pageBlock }">[이전] </a>
							</c:if>
								
							<!-- 페이징 링크 -->
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${level == 5 }">
								<a href="${home}/OrderbylistAll.do?pageNum=${i }">[${i }] </a>
							</c:if>
							<c:if test="${level == 10 }">
								<a href="${home}/OrderbylistAll.do?pageNum=${i }">[${i }] </a>
							</c:if>
									
									
							</c:forEach>
							
							<!-- 다음 링크 -->
							<c:if test="${endPage < pageCount }">
								<a href="${home}/OrderbylistAll.do?pageNum=${startPage + pageBlock}">[다음] </a>
							</c:if>
								
							<!-- 맨끝 링크 -->
							<c:if test="${startPage<pageCount}">
								<a href="${home}/OrderbylistAll.do?pageNum=${pageCount}">[맨끝] </a>
							</c:if>
							</c:if>
						</td>
					</tr>				
				</table>
			</div>
		</div>			
   <%@ include file="../foot.jsp" %>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   