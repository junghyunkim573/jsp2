<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../head.jsp" %>

       <div class="container">
      <div class="text"></div>
         <br>
         <br>          
           <div class="view_join_box1">
                <span class="modify_join_title" >
                 <label>글쓴이</label>              
                </span >
                  <span class="view_join_input_box">  
                   <input class="view_join_input" placeholder="ex) lupang@lupang.com" readonly name="email" value="${view.email}" >             
                </span>            
            </div>
            <div class="view_join_box">
                <span class="view_join_title" >
                 <label>상점</label>              
                </span >
                  <span class="view_join_input_box">
                   <input class="view_join_input_file" placeholder="스컷트, 탑" readonly name="name" value="${view.company }">             
                </span>            
            </div> 
            <div class="view_join_box">
                <span class="view_join_title" >
                 <label>상품이름</label>              
                </span >
                  <span class="view_join_input_box">
                   <input class="view_join_input_file" placeholder="스컷트, 탑" readonly name="name" value="${view.name }">             
                </span>            
            </div>                
            <div class="view_join_box">
                <span class="view_join_title" >
                 <label>상품내용</label>              
                </span >
                  <span class="view_join_input_box">  
                   <input class="view_join_input" placeholder="ex) 아름답네요" readonly name="content" value="${view.content }">             
                </span>            
            </div>
                        
             <div class="view_join_box">
                <span class="view_join_title" >
                 <label>상품가격</label>           
                </span>
                <span class="view_join_input_box">     
                   <input class="view_join_input" placeholder="35800" readonly name="price" value="${view.price }" >             
                 </span>
            </div>
             <div class="view_join_box">
                <span class="view_join_title" >
                 <label>상품종류</label>           
                </span>  
                  <select name="kinds" class="view_join_select">
                      <option value="${view.kinds }">${view.kinds }</option>
                  </select>
                   <input class="view_input_phone" placeholder="페션, 뷰티">             
            </div>
             <div class="view_join_box">
                <span class="view_join_title" >
                 <label>상품갯수</label>           
                </span>
                <span class="view_join_input_box">     
                   <input class="view_join_input" placeholder="1,2" readonly name="amount" value="${view.amount }">             
                 </span>
            </div>
            <div class="view_join_box">
                <span class="view_join_title" >
                 <label>택배회사</label>           
                </span>
                <span class="view_join_input_box">     
                   <input class="view_join_input" placeholder="롯데택배" readonly readonly name="delivery_company" value="${view.delivery_company }">             
                 </span>
            </div>
             <div class="view_join_box">
                <span class="view_join_title" >
                 <label>첨부파일1</label>           
                </span>
                <span class="view_join_input_box">   
                   <input type="file" class="view_join_input_file" readonly placeholder="파일1" name="file1"> ${view.file1 }           
                </span>
            </div>
             <div class="view_join_box">
                <span class="view_join_title" >
                 <label>첨부파일2</label>           
                </span>
                <span class="view_join_input_box">   
                   <input type="file" class="view_join_input_file" readonly placeholder="파일2" name="file2">${view.file2 }            
                </span>
            </div>
             <div class="view_join_box">
                <span class="view_join_title" >
                 <label>첨부파일3</label>           
                </span>
                <span class="view_join_input_box">   
                   <input type="file" class="view_join_input_file" readonly placeholder="파일3" name="file3">${view.file3 }             
                </span>
            </div>
             <div class="view_join_box">
                <span class="view_join_title" >
                 <label>첨부파일4</label>           
                </span>
                <span class="view_join_input_box">   
                   <input type="file" class="modify_join_input_file" readonly placeholder="파일4" name="file4">${view.file4 }             
                </span>
            </div>
             <div class="view_join_box">
                <span class="view_join_title" >
                 <label>첨부파일5</label>           
                </span>
                <span class="view_join_input_box">   
                   <input type="file" class="view_join_input_file" readonly placeholder="파일5" name="file5">${view.file5 }             
                </span>
            </div>
         
            <div class="view_join_box">
                <span class="view_join_title" >
                 <label>배송</label>           
                </span>
                <span class="view_join_input_box">
                <c:choose>
                <c:when test="${view.delivery=='1'}">
                   <input type="radio"  name="delivery" value="1" readonly>일반배송
                   
                </c:when>
                <c:otherwise>
                  
                   <input type="radio"  name="delivery" value="2" checked readonly>무료배송
                </c:otherwise>
             </c:choose>             
                </span>
            </div>   
           
                        
         <div class="box-modify">
                 <button onclick="window.location.href='${home }/Productmodify.do?uid=${view.uid}'" class="modify_button1">수정 하러 가기</button>
            </div>           
             <div class="box-modify">
                 <button onclick="window.location.href='${home }/Productdel.do?uid=${view.uid}'" class="modify_button2">상품 삭제</button>
            </div>           
             
          
        </div>
 <%@ include file="../foot.jsp" %> 