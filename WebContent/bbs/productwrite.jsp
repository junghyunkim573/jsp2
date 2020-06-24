<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

<script>
function send(){
	if(!isNaN(document.getElementById("price").value)){
		alert("숫자가 맞습니다");
	}else{
		alert("가격은 숫자만 입력해주세요");
	}
}
</script>

<div class="container">
	<div class="text">
	
	</div>
</div>	
<br>
<br>
       <div class="container2">
           <form action="${home}/ProductwriteProc.do" method="post" enctype="multipart/form-data" >
            <input type="hidden" name="email" value="${session_email}">
            
            	<div class="write_join_box1">
                <span class="write_join_title" >
                 <label for="company1">상호명</label>              
                </span >
                  <span class="write_join_input_box">  
                   <input type="text" class="write_join_input" autofocus id="company1" name="company" readonly value="${company3 }">             
                </span>            
            </div>
             <div class="write_join_box">
                <span class="write_join_title" >
                 <label for="price">상품가격</label>              
                </span >
                  <span class="write_join_input_box">  
                   <input type="text" class="write_join_input" autofocus id="price" name="price" >             
                </span>            
            </div>
            <div class="write_join_box">
                <span class="write_join_title" >
                 <label for="name1">상품이름</label>              
                </span >
                  <span class="write_join_input_box">  
                   <input type="text" class="write_join_input"  id="name1" name="name" >             
                </span>            
            </div>              
            <div class="write_join_box">
                <span class="write_join_title" >
                 <label for="content">상품내용</label>              
                </span >
                  <span class="write_join_input_box">  
                   <input type="text" class="write_join_input"  id="content" name="content" >             
                </span>            
            </div>
            <div class="write_join_box">
                <span class="write_join_title" >
                 <label for="kinds1">상품종류</label>           
                </span>  
                  <select name="kinds" class="write_join_select">
                      <option value="패션">패션</option>
                      <option value="뷰티">뷰티</option>
                      <option value="출산/유아아동">출산/유아아동</option>
                      <option value="식품">식품</option>
                      <option value="주방용품">주방용품</option>
                      <option value="생활용품">생활용품</option>
                      <option value="홈인테리어">홈인티테리어</option>
                      <option value="가전디지털">가전디지털</option>
                      <option value="스포츠/레저">스포츠/레저</option>
                      <option value="자동차용품">자동차용품</option>
                      <option value="도서/음반/DVD">도서/음반/DVD</option>
                      <option value="완구/취미">완구/취미</option>
                      <option value="문구/오피스">문구/오피스</option>
                      <option value="반려동물용품">반려동물용품</option>
                      <option value="헬스/건강용품">헬스/건강용품</option>
                  </select>
                  <input class="write_input_phone" placeholder="상품설명" id="kinds1" name="kinds1" value="" >             
            </div>
            <div class="write_join_box">
                <span class="write_join_title" >
                 <label for="delivery_company">택배회사이름</label>              
                </span >
                  <span class="write_join_input_box">  
                   <input type="text" class="write_join_input"  id="delivery_company" name="delivery_company" >             
                </span>            
            </div>
            <div class="write_join_box">
                <span class="write_join_title" >
                 <label for="delivery">배송</label>              
                </span >
                  <div class="write_join_radio_box">
                   
                   <input type="radio" id="delivery" name="delivery" value="1" >일반배송             
                   <input type="radio" id="delivery" name="delivery" value="2" >무료배송 
               		
                </div>            
            </div>
            <div class="write_join_box">
                <span class="write_join_title" >
                 <label for="userID">상품갯수</label>              
                </span >
                  <span class="write_join_input_box">  
                   <input type="text" class="write_join_input"  id="userID" name="amount" >             
                </span>            
            </div>
            <div class="write_join_box">
                <span class="write_join_title" >
                 <label for="numbere">첨부파일1</label>              
                </span >
                  <span class="write_join_input_box">
                   <input type="file" class="write_join_input_file" placeholder="필수항목" autofocus id="numbere" name="file1">             
                </span>            
            </div>                
			<div class="write_join_box">
                <span class="write_join_title" >
                 <label for="numbere">첨부파일2</label>              
                </span >
                  <span class="write_join_input_box">
                   <input type="file" class="write_join_input_file" placeholder="필수항목" autofocus id="numbere" name="file2">             
                </span>            
            </div>
            <div class="write_join_box">
                <span class="write_join_title" >
                 <label for="numbere">첨부파일3</label>              
                </span >
                  <span class="write_join_input_box">
                   <input type="file" class="write_join_input_file" placeholder="필수항목" autofocus id="numbere" name="file3">             
                </span>            
            </div>
            <div class="write_join_box">
                <span class="write_join_title" >
                 <label for="numbere">첨부파일4</label>              
                </span >
                  <span class="write_join_input_box">
                   <input type="file" class="write_join_input_file" placeholder="필수항목" autofocus id="numbere" name="file4">             
                </span>            
            </div>
            <div class="write_join_box">
                <span class="write_join_title" >
                 <label for="numbere">첨부파일5</label>              
                </span >
                  <span class="write_join_input_box">
                   <input type="file" class="write_join_input_file" placeholder="필수항목" autofocus id="numbere" name="file5">             
                </span>            
            </div>
            
                        
           
             <div class="login_box_submit">
                 <button onclick="send()" value="상품등록" class="login_button">상품등록</button>
            </div>
         </form> 
        </div>
        
        
<%@ include file="../foot.jsp" %>