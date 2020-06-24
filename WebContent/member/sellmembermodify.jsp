<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../head.jsp" %>
       <div class="container2">
           <form action="${home}/MemberModifyUpdate.do" method="post" enctype="multipart/form-data" >
           
            <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="numbere">사업자 번호</label>              
                </span >
                  <span class="sell_join_input_box">  
                   <input type="text" class="sell_join_input" placeholder="ex) 000-00-00000" autofocus id="numbere" name="companynumber" value="${user.companynumber}" readonly >             
                </span>            
            </div>
                        <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="number">상호명</label>              
                </span >
                  <span class="sell_join_input_box">  
                   <input type="text" class="sell_join_input" placeholder="ex)삼성, 유니넷" autofocus id="number" name="company"value="${user.company}" readonly >             
                </span>            
            </div>
            <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="numbere">사업자 등록증</label>              
                </span >
                  <span class="sell_join_input_box">
                    ${user.file1}            
                </span>            
            </div>
                        <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="numbere">파일변경</label>              
                </span >
                  <span class="sell_join_input_box">
                   <input type="file" class="sell_join_input_file" placeholder="필수항목" autofocus id="numbere" name="file1">       
                </span>            
            </div>                                
            <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="userID">아이디(email)</label>              
                </span >
                  <span class="sell_join_input_box">  
                   <input type="text" class="sell_join_input" placeholder="ex) lupang@google.com" readonly autofocus id="userID" name="email" value="${user.email}" >             
                </span>            
            </div>
                        
             <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="userPW">비밀번호</label>           
                </span>
                <span class="sell_join_input_box">     
                   <input type="text" class="sell_join_input" placeholder="숫자,영문,특수문자 최소 2개 조합하여 4~16자리" id="userPW"  value="${user.pass}" name="pass" >             
                 </span>
            </div>
             <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="userName">사업자 성함</label>           
                </span>
                <span class="sell_join_input_box">   
                   <input  class="sell_join_input" placeholder="ex)홍길동" id="userName" name="name"  value="${user.name}">             
                </span>
            </div>
             <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="phone">연락처</label>           
                </span>  
                  <select name="mobile1" class="sell_join_select">
                      <c:if test="${user.mobile1 ==010 }">
                      <option value="010">010</option>
                      </c:if>
                      <c:if test="${user.mobile1 ==011 }">
                      <option value="011">011</option>
                      </c:if>
                      <c:if test="${user.mobile1 ==016 }">
                      <option value="016">016</option>
                      </c:if>
                      <c:if test="${user.mobile1 ==019 }">
                      <option value="019">019</option>
                      </c:if>
                  </select>
                   <input class="sell_input_phone" placeholder="- 제외한 뒷자리ex)32541524" id="phone" name="mobile2" value="${user.mobile2}" >             
            </div>
            <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="account">통장 번호</label>           
                </span>  
                  <select name="account1" class="sell_join_select">
                   	<c:if test="${user.account1 =='국민' }">
                      <option value="국민">국민</option>
                    </c:if>
                    <c:if test="${user.account1 =='신협' }">
                      <option value="신협">신협</option>
                    </c:if>
                    <c:if test="${user.account1 =='부산' }">
                      <option value="부산">부산</option>
                    </c:if>
                    <c:if test="${user.account1 =='농협' }">
                      <option value="농협">농협</option>
                    </c:if>
                  </select>
                   <input class="sell_input_phone" placeholder="- 제외한 통장번호" id="account" name="account2" value="${user.account2}" >             
            </div>

             <div class="login_box_submit">
                 <button type="submit" value="로그인" class="login_button">수정 완료</button>
            </div>
         </form> 
            <div class="login_box_submit">
                 <button onclick="window.location.href='${home}/MemberDelete.do?email=${user.email }'"  value="로그인" class="login_button">회원 삭제</button>
            </div>
        </div>
        </div>
 <%@ include file="../foot.jsp" %>  