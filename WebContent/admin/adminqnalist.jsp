<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

   
   <div class="height_purchase">
   total : ${count}
   <br>
   <br>
   <br>
   <br>
	   <div class="all_box">   
		   <div class="all_index">이메일</div>
		   <div class="all_index">패스워드</div>
		   <div class="all_index">사업자성함</div>
		   <div class="all_index">전화번호1</div>
		   <div class="all_index">전화번호2</div>
		   <div class="all_index">레벨</div>
		   <div class="all_index">사업자번호</div>
		   <div class="all_index">상호명</div>
		   <div class="all_index">통장</div>
		   <div class="all_index">계좌번호</div>
		   <div class="all_index">사업자등록증</div>
	   
   
   </div>
	   <c:set var="number" value="${number}"/>
	   <c:forEach var="member" items="${list}">
	   <div class="all_box">  
		   <div class="all_index_box"><a href="${home}/Allmemberview.do?email=${member.email}">${member.email }</a></div>
		   <div class="all_index_box">${member.pass }</div>
		   <div class="all_index_box">${member.name }</div>
		   <div class="all_index_box"><a href="${home}/Allmemberview.do?email=${member.email}">${member.mobile1 }-${member.mobile2 }</a></div>
		   <div class="all_index_box">${member.level }</div>
		   <div class="all_index_box">${member.companynumber }</div>
		   <div class="all_index_box">${member.company }</div>
		   <div class="all_index_box">${member.account1 }</div>
		   <div class="all_index_box">${member.account2 }</div>
		   <div class="all_index_box">${member.file1 }</div>
		   <c:set var="number" value="${number -1}"/>
	   </div>
   	   </c:forEach>
   	   		<div class="container4">
		   	   <div class="center">
				   <table>
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
						      	<a href="${home}/Allmemberlist.do?pageNum=${1}">[처음] </a>
						      </c:if>
						         
						      <!-- 이전 링크 -->
						      <c:if test="${startPage > pageBlock}">
						      	<a href="${home}/Allmemberlist.do?pageNum=${startPage - pageBlock }">[이전] </a>
						      </c:if>
						         
						      <!-- 페이징 링크 -->
						      <c:forEach var="i" begin="${startPage }" end="${endPage }">
						      	<a href="${home}/Allmemberlist.do?pageNum=${i }">[${i }] </a>
						      </c:forEach>
						      
						      <!-- 다음 링크 -->
						      <c:if test="${endPage < pageCount }">
						      	<a href="${home}/Allmemberlist.do?pageNum=${startPage + pageBlock}">[다음] </a>
						      </c:if>
						         
						      <!-- 맨끝 링크 -->
						      <c:if test="${startPage<pageCount}">
						      	<a href="${home}/Allmemberlist.do?pageNum=${pageCount}">[맨끝] </a>
						      </c:if>
						      </c:if>
				            </td>
				         </tr>            
				      </table>
				</div>		      
			</div>	
   </div>   

   <%@ include file="../foot.jsp" %>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   