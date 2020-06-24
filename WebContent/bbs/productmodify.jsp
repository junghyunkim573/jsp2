<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../head.jsp" %>

       <div class="container2">
           <form action="${home}/Productmodifyproc.do?uid=${view.uid}" method="post" enctype="multipart/form-data">
             <input type="hidden" name="uid" value="${view.uid}"/>
             <div class="modify_join_box1">
                <span class="modify_join_title" >
                 <label>글쓴이</label>              
                </span >
                  <span class="modify_join_input_box">  
                   <input class="modify_join_input" placeholder="ex) lupang@lupang.com" name="email" value="${view.email}" >             
                </span>            
            </div>
            <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>상점</label>              
                </span >
                  <span class="modify_join_input_box">
                   <input class="modify_join_input_file" placeholder="롯데" name="company" value="${view.company }">             
                </span>            
            </div>   
            <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>상품이름</label>              
                </span >
                  <span class="modify_join_input_box">
                   <input class="modify_join_input_file" placeholder="스컷트, 탑" name="name" value="${view.name }">             
                </span>            
            </div>                
            <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>상품내용</label>              
                </span >
                  <span class="modify_join_input_box">  
                   <input class="modify_join_input" placeholder="ex) 아름답네요" name="content" value="${view.content }">             
                </span>            
            </div>
                        
             <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>상품가격</label>           
                </span>
                <span class="modify_join_input_box">     
                   <input class="modify_join_input" placeholder="35800" name="price" value="${view.price }" >             
                 </span>
            </div>
             <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>상품종류</label>           
                </span>  
                  <select name="kinds" class="modify_join_select">
                      <option value="${view.kinds }">${view.kinds }</option>
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
                   <input class="modify_input_phone" placeholder="페션, 뷰티">             
            </div>
             <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>상품갯수</label>           
                </span>
                <span class="modify_join_input_box">     
                   <input class="modify_join_input" placeholder="1,2" name="amount" value="${view.amount }">             
                 </span>
            </div>
            <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>택배회사</label>           
                </span>
                <span class="modify_join_input_box">     
                   <input class="modify_join_input" placeholder="롯데택배" name="delivery_company" value="${view.delivery_company }">             
                 </span>
            </div>
            <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>첨부파일1</label>           
                </span>
                <span class="modify_join_input_box">   
                   <input type="file" class="modify_join_input_file" placeholder="파일1" name="file1"> ${view.file1 }           
                </span>
            </div>
             <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>첨부파일2</label>           
                </span>
                <span class="modify_join_input_box">   
                   <input type="file" class="modify_join_input_file" placeholder="파일2" name="file2">${view.file2 }            
                </span>
            </div>
             <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>첨부파일3</label>           
                </span>
                <span class="modify_join_input_box">   
                   <input type="file" class="modify_join_input_file" placeholder="파일3" name="file3">${view.file3 }             
                </span>
            </div>
             <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>첨부파일4</label>           
                </span>
                <span class="modify_join_input_box">   
                   <input type="file" class="modify_join_input_file" placeholder="파일4" name="file4">${view.file4 }             
                </span>
            </div>
             <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>첨부파일5</label>           
                </span>
                <span class="modify_join_input_box">   
                   <input type="file" class="modify_join_input_file" placeholder="파일5" name="file5">${view.file5 }             
                </span>
            </div>
			
            <div class="modify_join_box">
                <span class="modify_join_title" >
                 <label>배송</label>           
                </span>
                <span class="modify_join_input_box">
                <c:choose>
	    			<c:when test="${view.delivery=='1'}">
	    				<input type="radio"  name="delivery" value="1">일반배송
	    				<input type="radio"  name="delivery" value="2" checked>무료배송
	    			</c:when>
	    			<c:otherwise>
	    				<input type="radio"  name="delivery" value="1">일반배송
	    				<input type="radio"  name="delivery" value="2" checked>무료배송
	    			</c:otherwise>
	    		</c:choose>             
                </span>
            </div>	
            
           
             <div class="login_box_submit">
                 <button type="submit" value="수정하기" class="login_button">수정하기</button>
            </div>
         </form> 
        </div>
 <%@ include file="../foot.jsp" %> 