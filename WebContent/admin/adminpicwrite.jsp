<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

 
 <div class="container">
 	<div class="height_purchase"></div>
	 	<div class="text"></div>
	 		<br>
	 		<br>
	 		<br>
	 		<form action="${home }/AdminpicwriteProc.do" method="post" enctype="multipart/form-data">
	 			<div class="qna_title1">
 					<span class="qna_title_sujec">첨부1</span>
 					<span class="qna_input"><input type="file" name="file1" class="qna_input_box2"></span>
 				</div>
 				<div class="qna_title1">
 					<span class="qna_title_sujec">첨부2</span>
 					<span class="qna_input"><input type="file" name="file2" class="qna_input_box2"></span>
 				</div>
 				<div class="qna_title1">
 					<span class="qna_title_sujec">첨부3</span>
 					<span class="qna_input"><input type="file" name="file3" class="qna_input_box2"></span>
 				</div>
 				<div class="qna_title1">
 					<span class="qna_title_sujec">첨부4</span>
 					<span class="qna_input"><input type="file" name="file4" class="qna_input_box2"></span>
 				</div>
 				<div class="qna_title1">	
	 					<span class="qna_title_sujec">경로1</span>
	 					<span class="qna_input"><input type="text" name="pass1" class="qna_input_box"></span>
	 			</div>
	 			<div class="qna_title1">	
	 					<span class="qna_title_sujec">경로2</span>
	 					<span class="qna_input"><input type="text" name="pass2" class="qna_input_box"></span>
	 			</div>
	 			<div class="qna_title1">	
	 					<span class="qna_title_sujec">경로3</span>
	 					<span class="qna_input"><input type="text" name="pass3" class="qna_input_box"></span>
	 			</div>
	 			<div class="qna_title1">	
	 					<span class="qna_title_sujec">경로4</span>
	 					<span class="qna_input"><input type="text" name="pass4" class="qna_input_box"></span>
	 			</div>
 				<br>
 				<br>
 				<div class="qna_sumit">
                		<button type="submit" value="사진등록" class="login_button">사진등록</button>
           		</div>
            		 
	 		</form>
 </div>	
         

<%@ include file="../foot.jsp" %>