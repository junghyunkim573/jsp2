<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

 
 <div class="container">
 	<div class="height_purchase"></div>
	 	<div class="text"></div>
	 		<form action="${home }/AdminpicmodifyProc.do" method="post" enctype="multipart/form-data">
	 			<div class="qna_title2">
 					<span class="qna_title_sujec1">경로1</span>
 					<span class="qna_input1">
 						<input type="textarea" name="pass1" class="qna_input_box1" value="${view.pass1}">
 					</span>
 				</div>
 				<div class="qna_title1">
 					<span class="qna_title_sujec">첨부1</span>
 					<span class="qna_input">
 						${view.file1}
 					</span>
 				</div>
 				<div class="qna_title1">
                	<span class="qna_title_sujec" >파일변경</span >
                  	<span class="qna_input">
                  		<input type="file" class="qna_input_box" name="file1">      
                   	</span>            
            	</div>
            	<div class="qna_title2">
 					<span class="qna_title_sujec1">경로2</span>
 					<span class="qna_input1">
 						<input type="textarea" name="pass2" class="qna_input_box1" value="${view.pass2}">
 					</span>
 				</div>
 				<div class="qna_title1">
 					<span class="qna_title_sujec">첨부2</span>
 					<span class="qna_input">
 						${view.file2}
 					</span>
 				</div>
 				<div class="qna_title1">
                	<span class="qna_title_sujec" >파일변경</span >
                  	<span class="qna_input">
                  		<input type="file" class="qna_input_box" name="file2">      
                   	</span>            
            	</div>
            	<div class="qna_title2">
 					<span class="qna_title_sujec1">경로3</span>
 					<span class="qna_input1">
 						<input type="textarea" name="pass3" class="qna_input_box1" value="${view.pass3}">
 					</span>
 				</div>
 				<div class="qna_title1">
 					<span class="qna_title_sujec">첨부3</span>
 					<span class="qna_input">
 						${view.file3}
 					</span>
 				</div>
 				<div class="qna_title1">
                	<span class="qna_title_sujec" >파일변경</span >
                  	<span class="qna_input">
                  		<input type="file" class="qna_input_box" name="file3">      
                   	</span>            
            	</div>
            	<div class="qna_title2">
 					<span class="qna_title_sujec1">경로4</span>
 					<span class="qna_input1">
 						<input type="textarea" name="pass4" class="qna_input_box1" value="${view.pass4}">
 					</span>
 				</div>
 				<div class="qna_title1">
 					<span class="qna_title_sujec">첨부4</span>
 					<span class="qna_input">
 						${view.file4}
 					</span>
 				</div>
 				<div class="qna_title1">
                	<span class="qna_title_sujec" >파일변경</span >
                  	<span class="qna_input">
                  		<input type="file" class="qna_input_box" name="file4">      
                   	</span>            
            	</div>
            	<br>
            	<div class="qna_sumit">
                		<button type="submit" value="수정하기" class="login_button">수정하기</button>
           		</div>
            		 
	 		</form>
 </div>	
         

<%@ include file="../foot.jsp" %>