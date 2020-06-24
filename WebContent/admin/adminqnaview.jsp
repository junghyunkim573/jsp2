<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>


 
 <div class="container">
 	<div class="height_purchase"></div>
	 	<div class="text"></div>
	 	<br>
	 	<br>
	 	<br>
	 		
	 		<div class="qna_title">  
				<span class="qna_title_sujec">옵션</span>
				<span  class="qna_input2" >
					<c:if test="${ view.gongji ==1 }">
	                  	공지글
					</c:if>
	                <c:if test="${ view.gongji ==2 }">
	            		일반글	
	                </c:if>
	                <c:if test="${ view.gongji ==3 }">
	            		비밀글	
	                </c:if>
	            </span>
			</div>
			<div class="qna_title1">	
				<span class="qna_title_sujec">제목</span>
				<span class="qna_input2">${view.subject}</span>
			</div>
			<div class="qna_title2">
				<span class="qna_title_sujec1">내용</span>
				<span class="qna_input3">
					<c:if test="${view.file1 != null }">
						${view.comment}
						<br>
						<img src="${home }/upload/${view.file1}" width="300px" height="300px">
					</c:if>
					<c:if test="${view.file1 == null }">
						${view.comment}
					</c:if>
				</span>
			</div>
			<div class="qna_title3">
	             <span class="qna_input4"><a href="${home }/Adminqnalist.do">[목록]</a></span>
	             <span class="qna_input5"><a href="${home }/Adminqnareply.do?uid=${view.uid}">[답변]${view.uid}</a></span>
	             <c:if test="${view.email == session_email}"> 
	             <span class="qna_input5"><a href="${home }/Adminqnamodify.do?uid=${view.uid}">[수정]</a></span>
	             <span class="qna_input5"><a href="${home }/Adminqnadel.do?uid=${view.uid}">[삭제]</a></span>	
	             </c:if>
	             <c:if test="${view.email != session_email}">
	             <span class="qna_input5">[수정X]</span>
	             <span class="qna_input5">[삭제X]</span>
	             </c:if>	
	        </div>
			     	   
 </div>	
         

<%@ include file="../foot.jsp" %>