<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../head.jsp" %>

       <div class="container2">
           
            <div class="login_box">
                <span class="login_box_icon" >
                 <label for="userID"><img src="${home}/img/message.jpg"  class="login_box_icon"></label>              
                </span >
                  <span class="login_box_input">  
                   <input type="text" class="login_input" placeholder="아이디(이메일)" autofocus id="userID" name="email" value="${user.email }" readonly >             
                </span>            
            </div>
                
            
             <div class="login_box">
                <span class="login_box_icon" >
                 <label for="userPW"><img src="${home}/img/lock.png" class="login_box_icon"></label>           
                </span>
                <span class="login_box_input">     
                   <input type="text" class="login_input" placeholder="숫자,영문,특수문자 최소 2개 조합하여 4~16자리" id="userPW" name="pass" value="${user.pass }" readonly>             
                 </span>
            </div>
             <div class="login_box">
                <span class="login_box_icon" >
                 <label for="userName"><img src="${home}/img/my_icon.png" class="login_box_icon"></label>           
                </span>
                <span class="login_box_input">   
                   <input  class="login_input" placeholder="이름" id="userName" readonly name="name" value="${user.name }">             
                </span>
            </div>
             <div class="login_box">
                <span class="login_box_icon" >
                 <label for="phone"><img src="${home}/img/phone.jpg" class="login_box_icon"></label>           
                </span>  
                  <select name="mobile1" class="login_select" >
                      <option value="${user.mobile1 }">${user.mobile1 }</option>
              
                  </select>
                   <input class="login_input_phone" placeholder=" - 제외한 뒷자리ex)32541524" id="phone" name="mobile2" readonly value="${user.mobile2 }">             
            </div>

            <br>
            <br>
            <br>
            <br>
            <br>
            <br>         
            <div class="box-modify">
                 <button onclick="window.location.href='${home}/MemberModify.do?email=${user.email }'" class="modify_button1">수정 하러 가기</button>
            </div>           
             <div class="box-modify">
                 <button onclick="window.location.href='${home}/MemberDelete.do?email=${user.email }'" class="modify_button2">회원 탈퇴</button>
            </div>
        </div>
 <%@ include file="../foot.jsp" %>  