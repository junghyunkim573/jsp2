<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../head.jsp" %>  

   <br>
   <br>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
        <form action="${home }/PurchaseProc.do" method="post" >
        
   <div class="container" >
      <div class="height_purchase">
       <div class="purchase_text1">주문/결제
           <span class="purchase_text3">결제</span>
           <span class="purchase_text2">주문/</span>
       </div>            
       <div class="purchase_text4">구매자 정보</div>                
       <div class="purchase_table1"><span class="purchase_table_text">이름</span></div>
       <div class="purchase_table2"><input name="buyer_name" value="${purchase_member.name }"></div>    
       <div class="purchase_table1"><span class="purchase_table_text">이메일</span></div>
       <div class="purchase_table2"><input name="email" value="${purchase_member.email }"></div>    
       <div class="purchase_table3"><span class="purchase_table_text">휴대폰번호</span></div>
       <div class="purchase_table4">
       <input name="buyer_mobile1" value="${purchase_member.mobile1}" width="300">-
       <input name="buyer_mobile2" value="${purchase_member.mobile2}">
       </div>
       <div class="purchase_table5">* 인증 번호를 못 받았다면, 1577-7011 번호 차단 및 스팸 설정을 확인해 주세요.</div>
       <div class="purchase_text4">
       <span class="purchase_text5">받는사람 정보</span>
       <span class="purchase_text6"><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></span>
       </div>                
       <div class="purchase_table1"><span class="purchase_table_text">이름</span></div>
       <div class="purchase_table2"><input type="text" name="deliver_name" placeholder="이름" value="${purchase_member.name }"></div>    
       <div class="purchase_table1"><span class="purchase_table_text">배송지 주소</span></div>
       <div class="purchase_table2">
       <input type="text" id="sample4_postcode" name="addr1" placeholder="우편번호">
        <input type="text" id="sample4_roadAddress" name="addr2" placeholder="도로명주소">

      </div>   
       <div class="purchase_table1"><span class="purchase_table_text">상세</span></div>
             <div class="purchase_table2">
      <input type="text" id="sample4_jibunAddress"  name="addr3" placeholder="지번주소">
      <input type="text" id="sample4_detailAddress" name="addr4" placeholder="상세주소">
      </div>  
       <div class="purchase_table1"><span class="purchase_table_text">연락처</span></div>
       <div class="purchase_table5">
       <input name="delivery_mobile1" value="${purchase_member.mobile1}" width="300">-
       <input name="delivery_mobile2" placeholder="ex)41118887" value="${purchase_member.mobile2}">
       </div>
       <div class="purchase_table1"><span class="purchase_table_text">배송시 요청사항</span></div>
       <div class="purchase_table5"><input type="text" name="content" placeholder="아기가 있으니 벨누르지 말아주세요"></div>
       <div class="purchase_text7">배송 물건 </div>
       <div class="purchase_table6">월요일 2/3 도착 보장</div>
       <c:set var="delivery_price" value="0" />
       <c:set var="sum" value="0" />
       <c:set var="total_count" value="0" />
       <!-- 위에는 바로구매 밑에는  장바구니 구매일 경우 -->
       <c:forEach var="purchase" items="${purchase}" varStatus="status">
       <c:choose>
          <c:when test="${purchase.uid != ''}">
             <input type="hidden" name="product_${status.count }"  value="${purchase.uid}"> 
          </c:when>
          <c:otherwise>
             <input type="hidden" name="product_${status.count }" value="${purchase.pt_uid}">
          </c:otherwise>
       </c:choose>
       
       <input type="hidden" name="amount_${status.count }" value="${purchase.amount }">
        <c:set var="total_count" value="${total_count +1 }" />
        
      
       <div class="purchase_table7"><span>${status.count } ${purchase.name} </span><span class="purchase_table_text2">수량: ${purchase.amount } 개/<c:if test="${purchase.delivery ==1 }">
                                                                                                 일반배송
                                                                                                 </c:if>
                                                                                              <c:if test="${purchase.delivery ==2 }">
                                                                                                    무료배송
                                                                                              </c:if>
                                                                                              </span>
       </div>
       
          <c:if test="${purchase.delivery=='1'}" >
                <c:set var="sum" value="${sum +purchase.price* purchase.amount  }" />
                <c:set var="delivery_price" value="${delivery_price  + 2500 }" />
            </c:if>
            <c:if test="${purchase.delivery=='2'}" >
                <c:set var="sum" value="${sum +purchase.price* purchase.amount }"   />
                <c:set var="delivery_price" value="${delivery_price }" />
            </c:if> 
       </c:forEach>
       <input type="hidden" name="total_count" value="${total_count }">
       <div class="purchase_text4"><span class="purchase_text5">결제 정보</span></div>                
       <div class="purchase_table1"><span class="purchase_table_text">총 상품 가격</span></div>
       <div class="purchase_table2"><b><input type="text" name="add2sum" value="${sum }"></b>원</div>    
       <div class="purchase_table1"><span class="purchase_table_text">할인쿠폰</span></div>
       <div class="purchase_table2">0원</div>    
       <div class="purchase_table1"><span class="purchase_table_text">배송비</span></div>
       <div class="purchase_table5"><b><input type="text" name="buydelivery" value="${delivery_price }"></b>원</div>
       <div class="purchase_table1"><span class="purchase_table_text">쿠팡캐쉬</span></div>
       <div class="purchase_table5">0원</div>
       <div class="purchase_table1"><span class="purchase_table_text">총결제금액</span></div>
       <div class="purchase_table5"><b><input type="text" name="addsum" value="${sum+delivery_price }"></b>원</div>
       <div class="purchase_table8"><span class="purchase_table_text">결제방법</span></div> 
       <div class="purchase_table4"><input id="bt" type="radio" name="method" value="계좌이체">
                                    <label for="bt"><b>계좌이체</b></label>&nbsp;
                                    <input id="cp" type="radio"  name="method" value="쿠페이">&nbsp;
                                    <label for="cp"><b>쿠페이</b></label>
                                    <input id="card" type="radio" name="method" value="신용카드/체크카드" >&nbsp;
                                    <label for="card"><b>신용카드/체크카드</b></label>
                                    <input id="cp_card" type="radio"  name="method" value="법인카드">&nbsp;
                                    <label for="cp_card"><b>법인카드</b></label>&nbsp;
                                    <input id="bd" type="radio" name="method" value="무통장입금" checked>
                                    <label for="bd"><b>무통장 입금</b></label>    
       </div>
       <div class="purchase_table9">
           <div class="purchase_table_table">&nbsp;*입금은행 &nbsp;&nbsp;<select>
                                                                            <option>부산은행</option>
                                                                            <option>국민은행</option>
                                                                            <option>기업은행</option>
                                                                            <option>하나은행</option>
                                                                            <option>대구은행</option>
                                                                        </select>


           </div>
           <div class="purchase_table_table2">&nbsp;*입금기한 &nbsp;&nbsp;2020년 02월 04일 08시 24분까지</div>
           <div class="purchase_table_table2">&nbsp;* 현금으로 결제한 모든 금액은 우리은행과 채무지급보증계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.</div>
       </div>
       <div class="purchase_table4">무통장 시 유의사항</div>
       <div class="purchase_table4"><span class="purchase_table_text3">* 입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.</span></div>
       <div class="purchase_table4"><span class="purchase_table_text3">* 무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.</span></div>
       <div class="purchase_table10"><span class="purchase_table_text4">* 은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.</span></div>
       <div class="purchase_text8">위 주문 내용을 확인 하였으며, 회원 본인은 결제에 동의합니다.</div>
       <div class="purchase_input_area1"><span class="purchase_input_span_area1"><input type="button" class="purchase_input1" value="쿠페이 머니 결제"></span></div>
       <div class="purchase_input_area2"><span class="purchase_input_span_area2"><input type="submit" class="purchase_input2" value="결제하기"></span></div>
    </div>   
    </div>
    </form>
  <%@ include file="../foot.jsp" %>  