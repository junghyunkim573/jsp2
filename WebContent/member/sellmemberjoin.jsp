<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../head.jsp" %>
       <div class="container2">
           <form action="${home}/MemberJoin.do" method="post" enctype="multipart/form-data" >
            
            <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="numbere">사업자 번호</label>              
                </span >
                  <span class="sell_join_input_box">  
                   <input type="text" class="sell_join_input" placeholder="ex) 000-00-00000" autofocus id="numbere" name="companynumber" >             
                </span>            
            </div>
                        <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="number">상호명</label>              
                </span >
                  <span class="sell_join_input_box">  
                   <input type="text" class="sell_join_input" placeholder="ex)삼성, 유니넷" autofocus id="number" name="company" >             
                </span>            
            </div>
            <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="numbere">사업자 등록증</label>              
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
                   <input type="text" class="sell_join_input" placeholder="ex) lupang@google.com" autofocus id="userID" name="id" >             
                </span>            
            </div>
                        
             <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="userPW">비밀번호</label>           
                </span>
                <span class="sell_join_input_box">     
                   <input type="text" class="sell_join_input" placeholder="숫자,영문,특수문자 최소 2개 조합하여 4~16자리" id="userPW" name="pass" >             
                 </span>
            </div>
             <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="userPW">비밀번호 확인</label>           
                </span>
                <span class="sell_join_input_box">     
                   <input type="text" class="sell_join_input" placeholder="비밀번호 확인!" id="userPW" name="pass2" >             
                 </span>
            </div>
             <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="userName">사업자 성함</label>           
                </span>
                <span class="sell_join_input_box">   
                   <input  class="sell_join_input" placeholder="ex)홍길동" id="userName" name="name" >             
                </span>
            </div>
             <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="phone">연락처</label>           
                </span>  
                  <select name="mobile1" class="sell_join_select">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="016">016</option>
                      <option value="019">019</option>
                  </select>
                   <input class="sell_input_phone" placeholder="- 제외한 뒷자리ex)32541524" id="phone" name="mobile2" >             
            </div>
            <div class="sell_join_box">
                <span class="sell_join_title" >
                 <label for="account">통장 번호</label>           
                </span>  
                  <select name="account1" class="sell_join_select">
                      <option value="국민">국민</option>
                      <option value="신협">신협</option>
                      <option value="농협">부산</option>
                      <option value="부산">농협</option>
                  </select>
                   <input class="sell_input_phone" placeholder="- 제외한 통장번호" id="account" name="account2" >             
            </div>

                        
           
             <div class="login_box_submit">
                 <button type="submit" value="로그인" class="login_button">입점 신청하기</button>
            </div>
         </form> 
        </div>
 <%@ include file="../foot.jsp" %>   