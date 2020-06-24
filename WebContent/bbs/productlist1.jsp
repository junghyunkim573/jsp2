<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

 total : ${count}
 	<br>
 	<br>
 	<br>
 	<br>
	<br>  
	<div class="product_box">
	 
	   <div class="product_index">No</div>
	   <div class="product_index">글쓴이</div>
	   <div class="product_index">상점</div>
	   <div class="product_index">상품이름</div>
	   <div class="product_index">상품종류</div>
	   <div class="product_index">상품가격</div>
	   <div class="product_index">상품갯수</div>
	   <div class="product_index">택배회사</div>
	   <div class="product_index">썸네일파일</div>
	   <div class="product_index">첨부파일1</div>
	   <div class="product_index">첨부파일2</div>
	   <div class="product_index">첨부파일3</div>
	   <div class="product_index">첨부파일4</div>
	   <div class="product_index">첨부파일5</div>
	   <div class="product_index">배송</div>
	   <div class="product_index">조회</div>
	</div>
	<c:set var="number" value="${number}"/>
	<c:forEach var="product" items="${pro}">
   	<div class="product_box"> 
	   <div class="product_index_box">${number}</div>
	   <div class="product_index_box"><a href="${home}/Productview.do?uid=${product.uid}">${product.email}</a></div>
	   <div class="product_index_box">${product.company}</div>
	   <div class="product_index_box">${product.name}</div>
	   <div class="product_index_box">${product.kinds}</div>
	   <div class="product_index_box">${product.price}</div>
	   <div class="product_index_box">${product.amount}</div>
	   <div class="product_index_box">${product.delivery_company}</div>
	   <div class="product_index_box">${product.sum_file}</div>
	   <div class="product_index_box">${product.file1}</div>
	   <div class="product_index_box">${product.file2}</div>
	   <div class="product_index_box">${product.file3}</div>
	   <div class="product_index_box">${product.file4}</div>
	   <div class="product_index_box">${product.file5}</div>
	   <div class="product_index_box">
	   		<c:choose>
	   			<c:when test="${product.delivery == 1}">일반배송</c:when>
	   			<c:otherwise>무료배송</c:otherwise>
	   		</c:choose>
	   </div>
	   <div class="product_index_box">${product.ref}</div>
	   <c:set var="number" value="${number-1}"/>
	</div>
	</c:forEach>
	<div class="box-modify">
		<button onclick="window.location.href='${home }/bbs/productwrite.jsp'" class="modify_button1">상품등록</button>
    </div>
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
								<a href="${home}/Productlist1.do?pageNum=${1}">[처음] </a>
							</c:if>
								
							<!-- 이전 링크 -->
							<c:if test="${startPage > pageBlock}">
								<a href="${home}/Productlist1.do?email=${session_email }&level=${level}pageNum=${startPage - pageBlock }">[이전] </a>
							</c:if>
								
							<!-- 페이징 링크 -->
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${level == 5 }">
								<a href="${home}/Productlist1.do?email=${session_email }&level=${level}&pageNum=${i }">[${i }] </a>
							</c:if>
							<c:if test="${level == 10 }">
								<a href="${home}/Productlist.do?email=${session_email }&level=${level }&pageNum=${i }">[${i }] </a>
							</c:if>
									
									
							</c:forEach>
							
							<!-- 다음 링크 -->
							<c:if test="${endPage < pageCount }">
								<a href="${home}/Productlist1.do?email=${session_email }&level=${level}pageNum=${startPage + pageBlock}">[다음] </a>
							</c:if>
								
							<!-- 맨끝 링크 -->
							<c:if test="${startPage<pageCount}">
								<a href="${home}/Productlist1.do?email=${session_email }&level=${level}pageNum=${pageCount}">[맨끝] </a>
							</c:if>
							</c:if>
						</td>
					</tr>				
				</table>
			</div>	
		</div>	
<%@ include file="../foot.jsp" %>