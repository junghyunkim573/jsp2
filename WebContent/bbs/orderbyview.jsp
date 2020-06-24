<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../head.jsp" %>  
  
        
   <div class="container" >
      <div class="height_purchase">
       <div class="purchase_text1">주문/결제
           <span class="purchase_text3">결제</span>
           <span class="purchase_text2">주문/</span>
       </div>            
       <div class="purchase_text4">구매자 정보</div>                
       <div class="purchase_table1"><span class="purchase_table_text">이름</span></div>
       <div class="purchase_table2">${buy.buyer_name }</div>    
       <div class="purchase_table1"><span class="purchase_table_text">이메일</span></div>
       <div class="purchase_table2">${buy.email }</div>    
       <div class="purchase_table3"><span class="purchase_table_text">휴대폰번호</span></div>
       <div class="purchase_table4">${buy.buyer_mobile1}-${buy.buyer_mobile2}</div>
       <div class="purchase_table5">* 인증 번호를 못 받았다면, 1577-7011 번호 차단 및 스팸 설정을 확인해 주세요.</div>
       <div class="purchase_text4"><span class="purchase_text5">받는사람 정보</span></div>                
       <div class="purchase_table1"><span class="purchase_table_text">이름</span></div>
       <div class="purchase_table2">${buy.delivery_name }</div>    
       <div class="purchase_table1"><span class="purchase_table_text">배송주소</span></div>
       <div class="purchase_table2">${buy.addr1 }${buy.addr2 }${buy.addr3 }${buy.addr4 }</div>    
       <div class="purchase_table1"><span class="purchase_table_text">연락처</span></div>
       <div class="purchase_table5">${buy.delivery_mobile1 }-${buy.delivery_mobile2 }</div>
       <div class="purchase_table1"><span class="purchase_table_text">배송 요청사항</span></div>
       <div class="purchase_table5">${buy.content }</div>
       <div class="purchase_text7">배송 1건 중 1</div>
       <div class="purchase_table6">월요일 2/3 도착 보장</div>
       <c:set var="delivery_price" value="0" />
       <c:set var="sum" value="0" />
       <div class="purchase_table7"><span><a href="${home }/Productpageview.do?uid=${pro.uid }">${pro.name }</a></span><span class="purchase_table_text2">${buy.amount }/<c:if test="${pro.delivery ==1 }">
          																													일반배송
          																												</c:if>
          																												<c:if test="${pro.delivery ==2 }">
          																													무료배송
          																												</c:if>
          																												</span>
       </div>
       
              
       <div class="purchase_text4"><span class="purchase_text5">${buy.method }</span></div>                
           
       <div class="purchase_table1"><span class="purchase_table_text">할인쿠폰</span></div>
       <div class="purchase_table2">0원</div>    
       <div class="purchase_table1"><span class="purchase_table_text">배송비</span></div>
       <div class="purchase_table5"><b><c:if test="${pro.delivery == 1 }">2500</c:if><c:if test="${pro.delivery == 2 }">0</c:if></b>원</div>
       <div class="purchase_table1"><span class="purchase_table_text">쿠팡캐쉬</span></div>
       <div class="purchase_table5">0원</div>
       <div class="purchase_table1"><span class="purchase_table_text">총결제금액</span></div>
       <div class="purchase_table5"><b><c:if test="${pro.delivery == 1 }">${pro.price+2500 }</c:if><c:if test="${pro.delivery == 2 }">${pro.price }</c:if></b>원</div>
       <div class="purchase_table8"><span class="purchase_table_text">결제방법</span></div> 
       <div class="purchase_table4">
		<input id="bd" type="radio" name="payment" value="bd" /checked>
	       <label for="bd"><b>${buy.method}</b></label>    
       </div>
       <div class="purchase_table9">
           <div class="purchase_table_table">&nbsp;*입금은행 &nbsp;&nbsp;부산은행</div>
           <div class="purchase_table_table2">&nbsp;*입금기한 &nbsp;&nbsp;2020년 02월 04일 08시 24분까지</div>
           <div class="purchase_table_table2">&nbsp;* 현금으로 결제한 모든 금액은 우리은행과 채무지급보증계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.</div>
       </div>
       <div class="purchase_table4">무통장 시 유의사항</div>
       <div class="purchase_table4"><span class="purchase_table_text3">* 입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.</span></div>
       <div class="purchase_table4"><span class="purchase_table_text3">* 무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.</span></div>
       <div class="purchase_table10"><span class="purchase_table_text4">* 은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.</span></div>
    </div>   
    </div>
  <%@ include file="../foot.jsp" %>  