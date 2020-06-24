<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

 
 <div class="container">
    <div class="height_purchase"></div>
       <div class="text"></div>
       <br>
       <br>
          <form action="${home }/AdminpicmodifyProc1.do" method="post" enctype="multipart/form-data">
             <c:if test="${count ==5 ||count ==6 || count ==7 || count ==8  }">
             <div class="qna_title3">
                <span class="qna_title_sujec">경로1</span>
                <span class="qna_input">
                  
                      <c:if test="${count == 5 }">
                         <input name="file5" class="qna_input_box" value="${view.pass1}">
                     </c:if>
                     <c:if test="${count == 6 }">
                         <input name="file6" class="qna_input_box" value="${view.pass2}">
                     </c:if>
                     <c:if test="${count == 7 }">
                         <input name="file7" class="qna_input_box" value="${view.pass3}">
                     </c:if>
                     <c:if test="${count == 8 }">
                         <input name="file8" class="qna_input_box" value="${view.pass4}">
                     </c:if>
                </span>
             </div>
             </c:if>
             <br>
             <br>
             <c:if test="${count ==1 ||count ==2 || count ==3 || count ==4  }">
             <div class="qna_title3">
                <span class="qna_title_sujec">첨부1</span>
                <span class=	>
                   <c:choose>
                      <c:when test="${count == 1 }">
                         ${view.file1}
                      </c:when>
                      <c:when test="${count == 2 }">
                         ${view.file2}
                      </c:when>
                      <c:when test="${count == 3 }">
                         ${view.file3}
                      </c:when>
                      <c:when test="${count == 4 }">
                         ${view.file4}
                      </c:when>
                      <c:otherwise>
                      </c:otherwise>
                   </c:choose>      
                </span>
             </div>
             <div class="qna_title1">
                  <span class="qna_title_sujec" >파일변경</span >
                  <span class="qna_input">
                     
                        <c:if test="${count == 1 }">
                            <input type="file" class="qna_input_box" name="file1">      
                         </c:if>
                         <c:if test="${count == 2 }">
                            <input type="file" class="qna_input_box" name="file2">      
                         </c:if>
                         <c:if test="${count == 3 }">
                            <input type="file" class="qna_input_box" name="file3">      
                         </c:if>
                         <c:if test="${count == 4 }">
                            <input type="file" class="qna_input_box" name="file4">      
                         </c:if>
                          
                             
                </span>            
               </div>
               </c:if>
               <div class="qna_sumit">
                      <button type="submit" value="수정하기" class="login_button">수정하기</button>
                 </div>
                   
          </form>
 </div>   
         

<%@ include file="../foot.jsp" %>