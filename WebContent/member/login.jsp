<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../head.jsp" %>
    <script>
 		function send() {
			var x = document.inok
			if(x.email.value.length < 4 || x.email.value.length >30 ){
				alert("아이디는 최소 4자이상 30자 이하로 넣어주세요");
				return;
			}
			if(chkEmail(x.email.value) == false){
				alert("올바른 이메일 형식이 아닙니다.");
				return;		
			}
			if(x.pass.value.length < 4  ||  x.pass.value.length>16  ){
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
 
       <div class="container2">
           <form name="inok" action="${home}/LupangLoginOK.do" method="post">
            <div class="login_box">
                <span class="login_box_icon" >
                 <label for="userID"><img src="${home}/img/message.jpg"  class="login_box_icon"></label>              
                </span>
                <span class="login_box_input">   
                   <input type="text" class="login_input" placeholder="아이디(이메일)" autofocus id="userID" name="email" >             
                </span>
               </div>
                
            
             <div class="login_box">
                <span class="login_box_icon" >
                 <label for="userPW"><img src="${home}/img/lock.png" class="login_box_icon"></label>           
                </span>
                <span class="login_box_input">  
                   <input type="text" class="login_input" placeholder="비밀번호" id="userPW" name="pass" >             
                </span>
            </div>
            <div class="login_box1">
                <span class="login_input1"><input type="checkbox">자동로그인</span>
                <span class="login_input2"><a href="#">아이디(이메일)/비밀번호 찾기</a></span>
            </div>
            </form>  
            <div class="login_box_submit">
                 <button onclick="send()" class="login_button">로그인</button>
            </div>
            <div class="login_box_submit">
                 <button onclick="window.location.href='${home}/lupangmemberin.do'" class="login_button">회원가입</button>
            </div>
        </div>
<%@ include file="../foot.jsp" %> 