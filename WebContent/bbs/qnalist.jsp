<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<br>
<br>
<br>
<br>
<div class="container" >
   <div class="height_purchase">
      <div class="qna_title">
      total : ${count}
      <br>
         <div class="qna_index1">No</div>
         <div class="qna_index2">제목</div>
         <div class="qna_index3">글쓴이</div>
         <div class="qna_index4">조회수</div>
         
         <c:set var="number" value="${number}"/>
         <c:forEach var="gongji" items="${gongji }">
         <div class="qna_index_box1">공지</div>
         <div class="qna_index_box2"><a href="${home}/Qnaview.do?uid=${gongji.uid}">${gongji.subject }</a></div>
         <div class="qna_index_box3">${gongji.name }</div>
         <div class="qna_index_box4">${gongji.ref }</div>
         <c:set var="number" value="${number-1}"/>
         </c:forEach>
         
         
         
         <c:set var="number" value="${number}"/>
         <c:forEach var="qna" items="${list}">
         <div class="qna_index_box1">${number }</div>
         
         <c:if test="${ qna.gongji == 3}">
            <c:choose>
               <c:when test="${qna.email == session_email}">
                  <div class="qna_index_box2"><a href="${home}/Qnaview.do?uid=${qna.uid}">${qna.subject }</a></div>
               </c:when>
               <c:otherwise><div class="qna_index_box2">${qna.subject }</div></c:otherwise>
            </c:choose>
         </c:if>
         <c:if test="${ qna.gongji != 3}">
         <div class="qna_index_box2"><a href="${home}/Qnaview.do?uid=${qna.uid}">${qna.subject }</a></div>
         </c:if>
               <div class="qna_index_box3">${qna.name }</div>
         <div class="qna_index_box4">${qna.ref }</div>
         <c:set var="number" value="${number-1}"/>
         </c:forEach>
         <div class="qna_write">
            <span class="qna_write_p"><a href="${home}/Qnalist.do">새로고침</a></span>
            <span class="qna_write_w"><a href="${home}/Qnawrite.do">글쓰기</a></span>
         </div>
         	<div class="container3">
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
					            	<a href="${home}/Qnalist.do?pageNum=${1}">[처음] </a>
					            </c:if>
					               
					            <!-- 이전 링크 -->
					            <c:if test="${startPage > pageBlock}">
					                <a href="${home}/Qna.do?pageNum=${startPage - pageBlock }">[이전] </a>
					            </c:if>
					               
					            <!-- 페이징 링크 -->
					            <c:forEach var="i" begin="${startPage }" end="${endPage }">
					                <a href="${home}/Qnalist.do?pageNum=${i }">[${i }] </a>
					            </c:forEach>
					            
					            <!-- 다음 링크 -->
					            <c:if test="${endPage < pageCount }">
					                <a href="${home}/Qnalist.do?pageNum=${startPage + pageBlock}">[다음] </a>
					            </c:if>
					               
					            <!-- 맨끝 링크 -->
					            <c:if test="${startPage<pageCount}">
					                <a href="${home}/Qnalist.do?pageNum=${pageCount}">[맨끝] </a>
					            </c:if>
					            </c:if>
			               </td>
			            </tr>            
			         </table>
	         		 <div class="qna_search">
	            		 <span class="qna_search_select">
	               			 <select class="qna_search_select_box">
	                  			<option vlaue="제목">제목</option>
	                  			<option vlaue="글쓴이">글쓴이</option>
	                  			<option vlaue="내용">내용</option>
	               			 </select>
	            		 </span>
	            		 <span class="qna_search_input">
	               			 <input type="text" class="qna_search_input_box">
	            		 </span>
	            		 <span class="qna_search_input1">
	               			 <input type="submit" class="qna_search_input_box1" value="검색">
	            		 </span>
	         		 </div>
	         	</div>
	         </div>		 
      </div>      
   </div>
</div>   

   <%@ include file="../foot.jsp" %>
   
   
   
   