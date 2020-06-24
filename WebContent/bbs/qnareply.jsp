<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

 
 <div class="container">
    <div class="height_purchase"></div>
       <div class="text"></div>
          <form action="${home }/Qnareplyupdate.do" method="post" enctype="multipart/form-data">
             <input type="hidden" name="email" value="<%=session_email %>">
             <input type="hidden" name="name" value="<%=name %>">
             <input type="hidden" name="thread" value="${view1.thread }">
             <input type="hidden" name="fid" value="${view1.fid }">
                
                <div class="qna_title1">   
                   <span class="qna_title_sujec">제목</span>
                   <span class="qna_input"><input type="text" name="subject" class="qna_input_box"></span>
                </div>
                <div class="qna_title2">
                   <span class="qna_title_sujec1">내용</span>
                   <span class="qna_input1"><input type="textarea" name="comment" class="qna_input_box1"></span>
                </div>
                <div class="qna_title1">
                   <span class="qna_title_sujec">첨부</span>
                   <span class="qna_input"><input type="file" name="file1" class="qna_input_box2"></span>
                </div>
                
                
                <div class="qna_sumit">
                       <button type="submit" value="글쓰기" class="login_button">글쓰기</button>
                  </div>
                   
          </form>
 </div>   
         

<%@ include file="../foot.jsp" %>