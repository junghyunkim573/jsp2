<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
       <div class="container">
       	<form  action="${home}/AllmembermodifyProc.do" method="post" enctype="multipart/form-data" >
           <div class="all_view_join_box">
                <span class="all_view_join_title" >
                 <label for="numbere">사업자 번호</label>              
                </span >
                  <span class="all_view_join_input_box">  
                   <input type="text" class="sell_join_input" placeholder="ex) 000-00-00000" autofocus id="numbere" name="companynumber" value="${all_view.companynumber}" >             
                </span>            
            </div>
            <div class="all_view_join_box1">
                <span class="all_view_join_title" >
                 <label for="number">상호명</label>              
                </span >
                  <span class="all_view_join_input_box">  
                   <input type="text" class="sell_join_input" placeholder="ex)삼성, 유니넷" autofocus id="number" name="company"value="${all_view.company}"  >             
                </span>            
            </div>
            <div class="all_view_join_box1">
                <span class="all_view_join_title" >
                 <label for="numbere">사업자 등록증</label>              
                </span >
                  <span class="all_view_join_input_box">
                    ${all_view.file1}            
                 </span>            
            </div>
            <div class="all_view_join_box1">
                <span class="all_view_join_title" >
                 <label for="numbere">파일변경</label>              
                </span >
                  <span class="all_view_join_input_box">
                   <input type="file" class="all_view_join_input_file" placeholder="필수항목" autofocus id="numbere" name="file1">       
                </span>            
            </div>         
            <div class="all_view_join_box1">
                <span class="all_view_join_title" >
                 <label for="userName">사업자 성함</label>           
                </span>
                <span class="all_view_join_input_box"1>   
                   <input  class="all_view_join_input" placeholder="ex)홍길동" id="userName"  name="name"  value="${all_view.name}">             
                </span>
            </div>
            <div class="all_view_join_box1">
                <span class="all_view_join_title" >
                 <label for="account">통장 번호</label>           
                </span>  
                  <select name="account1" class="all_view_join_select">
                   	<option value=""></option>
                   	<option value="국민">국민</option>
                    <option value="신협">신협</option>
					<option value="농협">농협</option>
					<option value="부산">부산</option>
                  </select>
                   <input class="all_view_input_phone" placeholder="- 제외한 통장번호" id="account" name="account2"  value="${all_view.account2}" >             
            </div>
            <div class="all_view_join_box1">
                <span class="all_view_join_title" >
                 <label for="userid">이메일</label>           
                </span>
                <span class="all_view_join_input_box"1>   
                   <input  class="all_view_join_input" placeholder="ex)1234@ropang.com" id="userid"  name="email"  value="${all_view.email}">             
                </span>
            </div>
            <div class="all_view_join_box1">
                <span class="all_view_join_title" >
                 <label for="userpw">패스워드</label>           
                </span>
                <span class="all_view_join_input_box"1>   
                   <input  class="all_view_join_input" placeholder="숫자,영문,특수문자 최소 2개 조합하여 4~16자리" id="userPW"  name="pass"  value="${all_view.pass}">             
                </span>
            </div>
            <div class="all_view_join_box"1>
                <span class="all_view_join_title" >
                 <label for="lel">전화번호</label>           
                </span>  
                  <select name="mobile1" class="all_view_join_select">
                   	<option value="010">010</option>
                    <option value="011">011</option>
					<option value="016">016</option>
					<option value="019">019</option>
                  </select>
				<input class="all_view_input_phone" placeholder=" - 제외한 뒷자리ex)32541524" id="phone" name="mobile2"  value="${all_view.mobile2 }">
            </div>
            <div class="all_view_join_box"1>
                <span class="all_view_join_title" >
                 <label for="lel">레벨</label>           
                </span>  
                  <select name="level" class="all_view_join_select">
                   	<option value="1">1</option>
                    <option value="5">5</option>
					<option value="10">10</option>
                  </select>
				<input class="all_view_input_phone" placeholder="ex)1 or 5" id="lel" name="level"  value="${all_view.level}" >  
            </div>
			<div class="login_box_submit">
                 <button type="submit" value="수정완료" class="login_button">수정 완료</button>
            </div>          
		</form>  
 	</div>
	        
<%@ include file="../foot.jsp" %>