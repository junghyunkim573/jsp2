<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<c:if test="${cancel == 1}">
	<script type="text/javascript">
		alert("총 구매수량이 상품 수량보다 많아 더이상 올리실수 없으십니다.");
   </script>
</c:if>
   <br>
   <br>
    <div class="container">
       <div class="cartview_join_box1">    
        <br>
        <br>
        <h1>장바구니</h1>
        <br>
        <br>
            <div class="cartview_join_box2">일반구매</div>
            <div class="cartview_join_box3">정기구매</div>
            <br>
            <br>
            <br>
            <br>
            <div class="cartview_join_title1">상품이미지</div>
            <div class="cartview_join_title2">상품정보</div>
            <div class="cartview_join_title3">상품금액</div>
            <div class="cartview_join_title3">배송비</div>
            <div class="cartview_join_title4">삭제</div>
            <c:set var="sum" value="0" />
            <c:forEach var="shoppingcart" items="${shoppingcart}" varStatus="status" >
            <form name="abc_${shoppingcart.uid}" action="${home }/ShoppingcartUpdate.do" method="post">
            <c:set var="i" value="${status.count }" />
            <input type="hidden" name="email" value="${session_email }">
            <input type="hidden" name="pt_uid${status.count}" value="${shoppingcart.pt_uid}">
            <input type="hidden" name="uid_${status.count}" value="${shoppingcart.uid}">
            <div class="cartview_join_input_box1">
                <a href="${home }/Productpageview.do?uid=${shoppingcart.pt_uid}"><img src="${home}/upload/${shoppingcart.file1 }" width="80px" height="80px"></a>
            </div>
            <div class="cartview_join_input_box2">       
             <a href="${home }/Productpageview.do?uid=${shoppingcart.pt_uid}"> ${shoppingcart.name } </a>
            </div>
            <div class="cartview_join_input_box3">
                <table  class="cart_box3">
                    <tr>
                        <td><input type='text' name='count_${status.count }' value='${shoppingcart.amount }' size='3' readonly class='cart_box3' id='${shoppingcart.uid}'></td>
                        <td>
                            <button type="submit" name="num" value="1">▲</button><br>
                            <button type="submit" name="num" value="-1">▼</button>
                    <!--버튼을 이미지로 바꾸세요 <img src='이미지경로' onclick='javascript_:change(1);'>-->
                        </td>
                    </tr>
                </table>
               
                <span class="cartview_p"><input type='text' size='3' readonly class='cart_box8' id='sum_${shoppingcart.uid}' value="${shoppingcart.price* shoppingcart.amount }원"></span>
            </div>
            </form>
            <div class="cartview_join_input_box4">${shoppingcart.price }</div>
            <div class="cartview_join_input_box5"><c:choose>
                <c:when test="${shoppingcart.delivery=='1'}">
                   <input type="hidden" name="delivery" value="1" checked/><b>2500</b>원               
                </c:when>
                <c:otherwise>
                   <input type="hidden" name="delivery" value="2" checked/><b>0</b>원
                </c:otherwise>
             </c:choose></div>
            <div class="cartview_join_input_box6"><a href="${home }/Shoppingcartdel.do?uid=${shoppingcart.uid}&email=${session_email}"><input type="button" class="cartview_input" value="삭제"></a></div>
             
			<!--     처음 왓을때 총합 계산 -->
             <c:if test="${shoppingcart.delivery=='1'}" >
             <c:set var="sum" value="${sum +shoppingcart.price* shoppingcart.amount +2500 }"   />

            </c:if>
            <c:if test="${shoppingcart.delivery=='2'}" >
             <c:set var="sum" value="${sum +shoppingcart.price* shoppingcart.amount }"   />

            </c:if>        
            </c:forEach>

         
                         
             
             
            
            <div class="cartview_join_input_file2">
                <input type="button" id="delete">
            </div>
            <div class="cartview_join_box"><b><input type="text" id="sum" 	readonly value="${sum}" ></b>원</div>
            <br>
            <br>
            <div class="cartview_box1">
                <a href="${home }/home.do"><input type="button" class="cart_box1" value="쇼핑하기"></a>
                
            </div>
            <div class="cartview_box2">
                <a href="${home }/Purchasesite.do?email=<%=session_email %>"><input type="submit" class="cart_box2" value="구매하기"></a>
            </div>
            <br>
            <br>
        </div>                    
    </div>
    <br>
    <br> 

<%@ include file="../foot.jsp" %>