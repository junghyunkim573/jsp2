<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>


 
 <div class="container">
 	<div class="height_purchase"></div>
	 	<div class="text"></div>
	 	<br>
	 	<br>
	 	<br>
	 		
		 		<div class="qna_title2">
					<span class="qna_title_sujec1">경로1</span>
					<span class="qna_input3">
						<c:if test="${view.file1 != null }">
							${view.pass1}
							<br>
							<img src="${home }/upload/${view.file1}" width="300px" height="300px">
						</c:if>
						<c:if test="${view.file1 == null }">
							${view.pass1}
						</c:if>
					</span>
				</div>
				<div class="qna_title2">
					<span class="qna_title_sujec1">경로2</span>
					<span class="qna_input3">
						<c:if test="${view.file2 != null }">
							${view.pass2}
							<br>
							<img src="${home }/upload/${view.file2}" width="300px" height="300px">
						</c:if>
						<c:if test="${view.file2 == null }">
							${view.pass2}
						</c:if>
					</span>
				</div>
				<div class="qna_title2">
					<span class="qna_title_sujec1">경로3</span>
					<span class="qna_input3">
						<c:if test="${view.file3 != null }">
							${view.pass3}
							<br>
							<img src="${home }/upload/${view.file3}" width="300px" height="300px">
						</c:if>
						${view.pass3}
						<c:if test="${view.file3 == null }">
							${view.pass3}
						</c:if>
					</span>
				</div>
				<div class="qna_title2">
					<span class="qna_title_sujec1">경로4</span>
					<span class="qna_input3">
						<c:if test="${view.file4 != null }">
							${view.pass4}
							<br>
							<img src="${home }/upload/${view.file4}" width="300px" height="300px">
						</c:if>
						<c:if test="${view.file4 == null }">
							${view.pass4}
						</c:if>
					</span>
				</div>
			
			<div class="qna_title3">
				<span class="qna_input4"><a href="${home }/Adminpiclist.do">[목록]</a></span>
	            <span class="qna_input5"><a href="${home }/Adminpicmodify.do">[수정]</a></span>
	            <span class="qna_input5"><a href="${home }/Adminqnadel.do">[삭제]</a></span>	
	        </div>
			     	   
 </div>	
         

<%@ include file="../foot.jsp" %>