<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

   
   
   
	   <div class="picture_box">
	     
		   <div class="picture_index">파일1</div>
		   <div class="picture_index">파일2</div>
		   <div class="picture_index">파일3</div>
		   <div class="picture_index">파일4</div>
		   <div class="picture_index">경로1</div>
		   <div class="picture_index">경로2</div>
		   <div class="picture_index">경로3</div>
		   <div class="picture_index">경로4</div>
	   </div>
	   <c:set var="number" value="${number}"/>
	   
	   <div class="picture_box">
	   
		   <div class="picture_index_box"><a href="${home}/Adminpicmodify1.do?file=1">${picture.file1 }</a></div>
		   <div class="picture_index_box"><a href="${home}/Adminpicmodify1.do?file=2">${picture.file2 }</a></div>
		   <div class="picture_index_box"><a href="${home}/Adminpicmodify1.do?file=3">${picture.file3 }</a></div>
		   <div class="picture_index_box"><a href="${home}/Adminpicmodify1.do?file=4">${picture.file4 }</a></div>
		   <div class="picture_index_box"><a href="${home}/Adminpicmodify1.do?file=5">${picture.pass1 }</a></div>
		   <div class="picture_index_box"><a href="${home}/Adminpicmodify1.do?file=6">${picture.pass2 }</a></div>
		   <div class="picture_index_box"><a href="${home}/Adminpicmodify1.do?file=7">${picture.pass3 }</a></div>
		   <div class="picture_index_box"><a href="${home}/Adminpicmodify1.do?file=8">${picture.pass4 }</a></div>
	   
	   <c:set var="number" value="${number -1}"/>
	   </div>
	   <div class="box-modify">
			<button onclick="window.location.href='${home}/Adminpicview.do'" class="modify_button1">배너보기</button>
	    </div>
    
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
   

   <%@ include file="../foot.jsp" %>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   