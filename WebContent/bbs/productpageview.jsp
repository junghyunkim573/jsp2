<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
        <script language='javascript'>
          
           //수량 증가 처리
           function change(num)
             {
             var x  = document.form;
             var y = Number(x.count.value) + num;
               
             if(y < 1) y = 1;
             x.count.value = y;
             
             }
           //바로구매 페이지 수량 가져가기
            function abc(){
               abc = document.getElementById("count").value;
               //alert(abc);
               location.href="${home }/Purchasesite.do?email=${session_email }&uid=${view.uid }&amount="+abc;
            }
             
             
         </script>
  <!---헤더끝--->
  <c:if test="${cancel == 1}">
   <script type="text/javascript">
      alert("총 구매수량이 상품 수량보다 많아 더이상 올리실수 없으십니다. 총 수량이 "+${amount} +"개 남았습니다.");
      
   </script>

</c:if>
  <section id="section">
      <div class="container">
        <div class="text">
            <a href="index.html" class="left">루팡홈</a>
            <a href="${home}/Category.do?category=${view.kinds }" class="left">>${view.kinds }</a>
        </div>
      
      <!---썸네일--->
      <div class="div1">
        <img src="${home }/upload/${view.sum_file }" width="60px" height="60px">
      </div>
      <!---상품이미지--->
      <div class="div2">
        <img src="${home }/upload/${view.file1 }" width="430px" height="430px">
      </div>
      <!---상품 설명--->
      <div class="div4">
        <div>
          <P class="text1"><b>NewCare 당일출고]  ${view.name }   </b></P>
        </div> 
            <img src="${home }/img/line_p.png">
          <br>
          <br>
          <P> 원가: ${view.price *1.53 }원53%</P>
        <div>
          <p class="text1"><b> ${view.price }원</b></p>
        </div><br>
          최대${view.price *0.03 }원 적립
            <img src="${home }/img/line_p.png">
          <br>
          <br>
          <c:if test="${view.delivery ==1 }">
          <p><b>일반배송</b></p>
          </c:if>
          <c:if test="${view.delivery ==2 }">
          <p><b>무료배송</b></p>
          </c:if>
          <p>모레 목 1/23일 도착예정</p>
            <img src="${home }/img/line_p.png">
          <br>
          <br>
          <p>판매자:<a href="#">${view.company }</a></p>
          <p>택배사:${view.delivery_company }</p>
            <img src="${home }/img/line_p.png">
          <br>
          <br>
          <p><b>사이즈: Free   </b></p> <br>
         
          <br>
          <p>캐쉬적립 혜택 | 최대1230원 적립</p>
            <img src="${home }/img/line_p.png">
          <!---상품 장바구니및 구매--->
              <form name='form' action="${home }/Shoppingcartinsert.do" method="post" >
              <input type="hidden" name="email" value="${session_email }">
              <input type="hidden" name="pt_uid" value="${view.uid }">
              
              <table  class="box">
               <tr>
                <td><input type='text' id='count' name='count' value='1' size='3' readonly class='box1'></td>
                <td>
                    <a href='#' onclick='javascript_:change(1);'>▲</a><br>
                    <a href='#' onclick='javascript_:change(-1);'>▼</a>
                    <!--버튼을 이미지로 바꾸세요 <img src='이미지경로' onclick='javascript_:change(1);'>-->
                 </td>
                </tr>
              </table>
           <table  class="box2">
               <tr>
                <td><input type= "submit" class="box3" value="장바구니 담기"></td>
               </tr>
             </table>
               </form> 
               <c:set var="amount" value="&{amount};" />  
              
               <table  class="box4">
               <tr>
                <td><a onclick="abc()" ><input type="button" class="box5" value="바로구매"></a></td>
               </tr>
             </table>   
      </div>
 
     <!---다른상품 썸네일--->
      <div>
          <p class="ori2"><b>다른 고객이 함께 구매한 상품</b></p>
          <ul>
                <li >
                    <div class="wab">
                        <div class="hover">
                            <div class="wab2">
                                <a href="#"><img src="${home }/img/category1_1_1.jpg" width="160px" height="160px"></a>
                                    <p class="ori"><a href="#">반짝 트위스 드레스</a></p>
                                    <p class="ori1"><b>24600원</b></p>
                            </div>
                        </div>
                    </div>
            </li>
                <li >
                    <div class="wab">
                        <div class="hover">
                            <div class="wab2">
                                <a href="#"><img src="${home }/img/category1_1_1.jpg" width="160px" height="160px"></a>
                                    <p class="ori"><a href="#">반짝 트위스 드레스</a></p>
                                    <p class="ori1"><b>24600원</b></p>
                            </div>
                        </div>
                    </div>
            </li>
                <li >
                    <div class="wab">
                        <div class="hover">
                            <div class="wab2">
                                <a href="#"><img src="${home }/img/category1_1_1.jpg" width="160px" height="160px"></a>
                                    <p class="ori"><a href="#">반짝 트위스 드레스</a></p>
                                    <p class="ori1"><b>24600원</b></p>
                            </div>
                        </div>
                    </div>
            </li>
                <li >
                    <div class="wab">
                        <div class="hover">
                            <div class="wab2">
                                <a href="#"><img src="${home }/img/category1_1_1.jpg" width="160px" height="160px"></a>
                                    <p class="ori"><a href="#">반짝 트위스 드레스</a></p>
                                    <p class="ori1"><b>24600원</b></p>
                            </div>
                        </div>
                    </div>
            </li>
                <li >
                    <div class="wab">
                        <div class="hover">
                            <div class="wab2">
                                <a href="#"><img src="${home }/img/category1_1_1.jpg" width="160px" height="160px"></a>
                                    <p class="ori"><a href="#">반짝 트위스 드레스</a></p>
                                    <p class="ori1"><b>24600원</b></p>
                            </div>
                        </div>
                    </div>
            </li>        
            </ul>            
        </div>
               <div>
                 <c:if test="${view.file1 != ''}">
                      <img src="${home }/upload/${view.file1}">
                 </c:if>
               <c:if test="${view.file2 != ''}">
                      <img src="${home }/upload/${view.file2}">
                 </c:if>
               <c:if test="${view.file3 != ''}">
                      <img src="${home }/upload/${view.file3}">
                 </c:if>
               <c:if test="${view.file4 != ''}">
                      <img src="${home }/upload/${view.file4}">
                 </c:if>
               <c:if test="${view.file5 != ''}">
                      <img src="${home }/upload/${view.file5}">
                 </c:if>
                  
              </div>
             
        
        <!---상품상세보기 및 평, 문의,배송관련--->
        <div class="pdiv">
            <div class="pdiv1"><a href="#a">상품 상세</a></div>
            <div class="pdiv2"><a href="#b">상품평</a></div>
            <div class="pdiv3"><a href="#c">상품 문의</a></div>
            <div class="pdiv4"><a href="#d">배송/교환/반품 안내</a></div>
        </div>
            <img src="${home }/img/line_pp.png" id="a">             
        <br>
        <br>
        <br>
         <form action="${home }/Commentupdate.do?uid=${view.uid }" method="post" >
               <input type="hidden" name="email" value="${session_email }">
               <input type="hidden" name="name" value="${name }">
               <table width="100%">
               <tr><td colspan=3 width=100% height=1 bgcolor=#e0dfdb></td></tr>
               <tr>
                  <td width=80 class="ltext">한줄댓글</td>
                  <td><input name="view_comment" style="width:80%"></td>
                  <td><input type=submit value="작성"></td>
               </tr>
               <tr><td colspan=3 width=100% height=1 bgcolor=#e0dfdb></td></tr>
            </table>   
         </form>
            
            <!-- 한줄 댓글 리스트 -->
            <table width="100%">
               <tr>
                  <td class="ltext">이름</td>
                  <td class="ltext">내용</td>
                  <td class="ltext">날짜</td>
                  <td></td>
               </tr>
               <c:forEach var="comment" items="${comment}">
               <tr>
                  <td class="ltext">${comment.name }</td>
                  <td class="ltext">${comment.comment }</td>
                  <td class="ltext">${comment.data }</td>
                  <td class="ltext">
                  <c:choose>
                   <c:when test="email.equals(session_email)">
                      <a href="${home }/Commentdel.do?uid=${comment.uid }">[x]</a>
                   </c:when>
                   <c:otherwise></c:otherwise>
                   </c:choose>
                  </td>
               </tr>
               <tr><td colspan=3 width=100% height=1 bgcolor=#e0dfdb></td></tr>
              </c:forEach> 
            </table>   
         
        <br>
        <br>

            <img src="${home }/img/line_pp.png" id="b">
        <div>
            <p class="ptext">${view.company }</p><br>
            <p class="ptext">NewCare 당일출고] ${view.name }</p><br>
            <p class="ptext">${view.content }</p><br>
            <p class="ptext"><b>평소사이즈</b></p>
            <p class="ptext"><b>키</b></p>
            <p class="ptext"><b>사이즈</b></p>
            <img src="${home }/img/line_pp.png">
        </div>       
                
        <div id="c" class="sdiv">
            <div class="sdiv2"><a herf="#">문의하기</a></div>
            <p class="ptext2">상품문의</p><br>
            <p class="ptext">구매한 상품의 취소/반품은 마이루팡 구매내역에서 신청 가능합니다.</p>
            <p class="ptext">상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</p><br>
            <p class="ptext"><b>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는</b> 고객센터 내 1:1 문의하기를 이용해주세요.</p>
            <p class="ptext"><b>해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</b></p>
            <p class="ptext">공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</p>
                <img src="${home }/img/line_pp.png">
            <p>질문</p>
            <p>답변</p>
        </div>
        <div id="d" class="sdiv3">
            <br>
            <br>
            <P class="ptext2"><b>배송정보</b></P>
            <table class="tb">
                <tr>
                    <td style="background-color: #e9f3ff;" width="15%">배송방법</td>
                    <td width="35%">순차배송</td>
                    <td rowspan="2" style="background-color: #e9f3ff; " width="15%">배송비</td>
                    <td rowspan="2" width="35%">무료배송 - 도서산간 지역의 경우, 추가비용 발생가능</td>
                </tr>
                <tr>
                    <td style="background-color: #e9f3ff; " width="15%">배송사</td>
                    <td width="35%">롯데택배</td>
                </tr>
                <tr>
                    <td style="background-color: #e9f3ff; " width="15%">묶음 배송 여부</td>
                    <td colspan="3">가능</td>
                </tr>
                <tr>
                    <td style="background-color: #e9f3ff; " width="15%">배송기간</td>
                    <td colspan="3">ㆍ도서산간 지역 등은 배송에 3-5일이 더 소요될 수 있습니다.
  - 천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 다소 지연될 수 있는 점 양해 부탁드립니다.</td>
                </tr>
            </table> 
      </div>
      <div class="sdiv3">
            <br>
            <br>
            <P class="ptext2"><b>교환 반품 안내</b></P>
            <table class="tb">
                <tr>
                    <td style="background-color: #e9f3ff;" width="20%">
                        환/반품 비용 (왕복비용)
                    </td>
                    <td width="80%">
                        5,000원
                        - 단, 고객 변심의 경우에만 발생
                        - 도서산간 및 일부 지역 추가비용 발생
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #e9f3ff; " width="20%">
                        교환/반품 신청 기준일
                    </td>
                    <td width="80%">
                        ㆍ단순변심에 의한 교환/반품은 제품 수령 후 7일이내까지만 가능 (배송비용과 교환/반품비용 왕복배송비 고객부담)
                        ㆍ상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터
                        30일 이내에 청약철회 가능
                    </td>
                </tr>
            </table> 
      </div>
      <div class="sdiv3">
            <br>
            <br>
            <P class="ptext2"><b>교환/반품 제한사항</b></P>
            <br>
            <p>ㆍ주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</p>
            <p>ㆍ상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우 (단, 내용 확인을 위한 포장 개봉의 경우는 예외)</p>
            <p>ㆍ고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</p>
            <p>ㆍ세트상품 일부 사용, 구성품을 분실하였거나 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</p>
            <p>ㆍ모니터 해상도의 차이로 인해 색상이나 이미지가 실제와 달라, 고객이 단순 변심으로 교환/반품을 무료로 요청하는 경우</p>
            <p>ㆍ제조사의 사정 (신모델 출시 등) 및 부품 가격 변동 등에 의해 무료 교환/반품으로 요청하는 경우</p>
      </div>
      <div class="sdiv3">
            <br>
            <P>※ 각 상품별로 아래와 같은 사유로 취소/반품이 제한 될 수 있습니다.</P>
                <table class="tb">
                    <tr>
                        <td style="background-color: #e9f3ff;" width="20%">
                            의류/잡화/수입명품
                        </td>
                        <td width="80%">
                            ㆍ상품의 택(TAG) 제거, 라벨 및 상품 훼손, 구성품 누락으로 상품의 가치가 현저히 감소된 경우
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #e9f3ff; " width="20%">
                            계절상품/식품/화장품
                        </td>
                        <td width="80%">
                            ㆍ신선냉동 식품의 단순변심의 경우ㆍ뷰티 상품 이용 시 트러블(알러지, 붉은 반점, 가려움, 따가움)이 발생하는 경우,
                            진료 확인서 및 소견서 등을 증빙하면 환불이 가능 (제반비용 고객부담)
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #e9f3ff; " width="20%">
                            전자/가전/설치상품
                        </td>
                        <td width="80%">
                            ㆍ설치 또는 사용하여 재판매가 어려운 경우, 액정이 있는 상품의 전원을 켠 경우
                            상품의 시리얼 넘버 유출로 내장된 소프트웨어의 가치가 감소한 경우 (내비게이션, OS시리얼이 적힌 PMP)
                            ㆍ홀로그램 등을 분리, 분실, 훼손하여 상품의 가치가 현저히 감소하여 재판매가 불가할 경우 (노트북, 데스크탑 PC 등)
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #e9f3ff; " width="20%">
                            자동차용품
                        </td>
                        <td width="80%">
                            ㆍ상품을 개봉하여 장착한 이후 단순변심인 경우
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #e9f3ff; " width="20%">
                            CD/DVD/GAME/BOOK
                        </td>
                        <td width="80%">
                            ㆍ복제가 가능한 상품의 포장 등을 훼손한 경우
                        </td>
                    </tr>
                </table> 
      </div>
       <div class="sdiv3">
            <br>
                <table class="tb">
                    <tr>
                        <td style="background-color: #e9f3ff;" width="15%">
                            상호/대표자
                        </td>
                        <td width="35%">
                            뉴케어 / 김상수
                        </td>
                        <td style="background-color: #e9f3ff;" width="15%">
                            사업장 소재지
                        </td>
                        <td width="35%">
                            경상남도 김해시 호계로555번길 25 301호 (대성동)
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #e9f3ff;" width="15%">
                            e-mail
                        </td>
                        <td width="35%">
                            new-care@naver.com
                        </td>
                        <td style="background-color: #e9f3ff;" width="15%">
                            연락처
                        </td>
                        <td width="35%">
                            010-5710-5318
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #e9f3ff;" width="15%">
                            통신판매업 신고번호
                        </td>
                        <td width="35%">
                            2018-경남김해-0589
                        </td>
                        <td style="background-color: #e9f3ff;" width="15%">
                            2018-경남김해-0589
                        </td>
                        <td width="35%">
                            2018-경남김해-0589
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #e9f3ff;" width="15%">
                            구매안전 서비스
                        </td>
                        <td colspan="3">
                            02-006-00032 서비스 가입사실 확인 >
                            본 판매자는 고객님의 안전거래를 위해 관련 법률에 의거하여 쿠팡의 구매안전서비스를 적용하고 있습니다.
                        </td>
                    </tr>
           </table> 
      </div>
      <div class="sdiv3">
      <br>
      미성년자가 체결한 계약은 법정대리인이 동의하지 않는 경우 본인 또는 법정대리인이 취소할 수 있습니다. 쿠팡은 통신판매중개자로서 통신판매의 당사자가 아니며, 광고, 상품 주문, 배송 및 환불의 의무와 책임은 각 판매자에 있습니다.
      </div>
     </div> 
    </div> 
  </section>               
  <!---푸터시작--->
<%@ include file="../foot.jsp" %>