<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../head.jsp" %>  
<div class="body">  
    <br>
    <br>    
   
      <br>
       <br>
      <div class="pay_title">
         <span class="pay_title_span">주문완료</span>
         <span class="pay_title_span2">04 주문완료</span>
         <span class="pay_title_span1">03 주문/선택</span>
         <span class="pay_title_span1">02 장바구니</span>
         <span class="pay_title_span1">01 옵션선택</span>
      </div>            
         <div class="pay_title1">
         	
         <p class="pay_title_p2">입금을 서둘려 주세요!</p>
      </div>
      <div class="pay_title2">
         <p class="pay_title_p3">${buy.product_account1 }${buy.product_account2 }</p>
         <p class="pay_title_p4">${addsum }</p>
         <p class="pay_title_p5"><input type="button" value="입금계좌 복사하기" class="pay_title_input"></p>
         <p class="pay_title_p6"><b class="pay_title_b">내일(2/11) 09:14분까지</b> 미입금 시 취소</p>
      </div>
      <div class="pay_title3">
         <p class="pay_title_p7">환불계좌가 등록되지 않은 경우 <b class="pay_title_b">쿠페이 머니</b>로 환불해드립니다.</p>
         <span class="pay_title_span3"><input type="button" value="환불 계좌 등록" class="pay_title_input1"></span>
         <span class="pay_title_span4"><input type="button" value="쿠페니 머니 알아보기" class="pay_title_input2"></span>
      </div>
      <br>
      <br>
      <div class="pay_title4">
         <div class="pay_title5">
            <span class="pay_title_span4">받는사람 정보</span><br><br><br>
            <p>
               <span class="pay_title_span7">받는사람</span>
               <span class="pay_title_span6">${view.delivery_name } / ${view.delivery_mobile1 }-${view.delivery_mobile2 }</span>
            </p>
            <p>
               <table>
                  <tr>
                     <td class="pay_title_span14">받는주소</td>
                     <td class="">${view.addr1 }${view.addr2 }${view.addr3 }${view.addr4 }</td>
                     <td class="pay_title_span8">변경></td>               
               </table>
               
            </p>
            <p>
               <span class="pay_title_span7">배송 요청 사항</span>
               <span class="pay_title_span6">${view.content }</span>
               <span class="pay_title_span8">변경></span>
            </p>
         </div>
         <c:set var="delivery_price" value="0" />
		 <c:set var="sum" value="0" />
         <c:set var="total_count" value="0" />
        
       		
       
       
        <c:set var="total_count" value="${total_count +1 }" />
         <div class="pay_title6">
            <span class="pay_title_span4">결제정보</span><br><br><br>
            <p>
               <table>
                  <tr>
                     <td class="pay_title_span14">주문금액</td>
                     <td class="pay_title_span11">${addsum-buydelivery }</td>
                  </tr>
                  <tr>
                     <td class="pay_title_span14">쿠폰할인</td>
                     <td class="pay_title_span11">-0원</td>
                  </tr>   
               </table>
            </p>
            <p>   
               <span class="pay_title_span9">배송비</span>
               <span class="pay_title_span10">${buydelivery }원</span>
            </p>   
               <span class="pay_title_span4">총 결제 금액</span>
               <span class="pay_title_span13">${addsum }</span>
               <span class="pay_title_span12">${buy.product_account1 }${view.method }</span>
            <p class="pay_title_p8">* 결제금액이 출금내역과 다른 경우, 은행에서 이체수수료가 부과된 것 입니다.
            (해당 은행으로 확인해주세요.)
            </p>
         </div>
      
         <br>
         <br>
      </div>
      <br>
      <br>
      <div class="pay_title1">
            <span class="pay_title_span15"><a href="${home}/Orderview.do?uid=${view.uid}"><input type="button" class="pay_title_input3" value="주문 상세 보기"></a></span>
            <span class="pay_title_span16"><a href="${home}/home.do"><input type="button" class="pay_title_input4" value="쇼핑 하려 가기"></a></span>
      </div>
      <br>
      <br>
   
<br>
<br>   
</div>
<br>
<br>      
  <%@ include file="../foot.jsp" %>  