<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../head.jsp" %>

       <div class="container2">
           <form name="join" action="${home}/MemberJoin.do" method="post" enctype="multipart/form-data"  >
            
            <div class="login_box">
                <span class="login_box_icon" >
                 <label for="userID"><img src="${home}/img/message.jpg"  class="login_box_icon"></label>              
                </span >
                  <span class="login_box_input">  
                   <input type="text" class="login_input" placeholder="아이디(이메일)" autofocus id="userID" name="id" >             
                </span>            
            </div>
                
            
             <div class="login_box">
                <span class="login_box_icon" >
                 <label for="userPW"><img src="${home}/img/lock.png" class="login_box_icon"></label>           
                </span>
                <span class="login_box_input">     
                   <input type="text" class="login_input" placeholder="숫자,영문,특수문자 최소 2개 조합하여 4~16자리" id="userPW" name="pass" >             
                 </span>
            </div>
             <div class="login_box">
                <span class="login_box_icon" >
                 <label for="userPW2"><img src="${home}/img/lock.png" class="login_box_icon"></label>           
                </span>
                <span class="login_box_input">   
                   <input  class="login_input" placeholder="비밀번호 확인" id="userPW2" name="pass2" >             
                </span>    
            </div>
             <div class="login_box">
                <span class="login_box_icon" >
                 <label for="userName"><img src="${home}/img/my_icon.png" class="login_box_icon"></label>           
                </span>
                <span class="login_box_input">   
                   <input  class="login_input" placeholder="이름" id="userName" name="name" >             
                </span>
            </div>
             <div class="login_box">
                <span class="login_box_icon" >
                 <label for="phone"><img src="${home}/img/phone.jpg" class="login_box_icon"></label>           
                </span>  
                  <select name="mobile1" class="login_select">
                      <option value="010">010</option>
                      <option value="011">011</option>
                      <option value="016">016</option>
                      <option value="019">019</option>
                  </select>
                   <input class="login_input_phone" placeholder=" - 제외한 뒷자리ex)32541524" id="phone" name="mobile2" >             
            </div>      
      	   </form>      
             <div class="login_box_submit">
                 <button onclick="send()" value="가입하기" class="login_button">가입하기</button>
            </div>
      
        </div>

        <script>
 		function send() {
			var x = document.join
	
			if(x.id.value.length < 4 || x.id.value.length >30 ){
				alert("아이디는 최소 4자이상 30자 이하로 넣어주세요");
				return;
			}
			if(chkEmail(x.id.value) == false){
				alert("올바른 이메일 형식이 아닙니다.");
				return;		
			}
			if(x.pass.value.length<4  ||  x.pass2.value.length>16  ){
				alert("비밀번호는 최소 4자이상 16자 이하로 넣어주세요");
				return;		
			}	
			return x.submit();	
		}
 		function chkEmail(str) {
 		    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
 		    if (regExp.test(str)) return true;
 		    else return false;
 		}



</script>
<%@ include file="../foot.jsp" %> 
