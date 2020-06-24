<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

 
      <div class="container">
        <div class="text">
            <a href="${home}/home.do" class="left">루팡홈</a>
            <a href="category1.html" class="left">>패션의류</a>
        </div>
  
      <!---카테고리--->
      <div id="div">
        <ul>
            <li>카테고리
                <ul>
                    <li><a href="${home}/Category.do?category=패션">패션의류</a></li>
                    <li><a href="${home}/Category.do?category=뷰티">뷰티</a></li>
                    <li><a href="${home}/Category.do?category=출산/유아아동">출산/유아아동</a></li>
                    <li><a href="${home}/Category.do?category=식품">식품</a></li>
                    <li><a href="${home}/Category.do?category=주방용품">주방용품</a></li>
                    <li><a href="${home}/Category.do?category=생홣용품">생활용품</a></li>
                    <li><a href="${home}/Category.do?category=홈인테리어"> 홈인테리어</a></li>
                    <li><a href="${home}/Category.do?category=가전디지털">가전디지털</a></li>
                    <li><a href="${home}/Category.do?category=스포츠">스포츠/레져</a></li>
                    <li><a href="${home}/Category.do?category=자동차">자동차용품</a></li>
                    <li><a href="${home}/Category.do?category=도서">도서/음반/DVD</a></li>
                    <li><a href="${home}/Category.do?category=완구">완구/취미</a></li>
                    <li><a href="${home}/Category.do?category=문구">문구/오피스</a></li>
                    <li><a href="${home}/Category.do?category=반려동물">반려동물 용품</a></li>
                    <li><a href="${home}/Category.do?category=헬스">헬스/건강식품</a></li>
                </ul>
            </li>
        </ul>
      </div>
      <!---스크립트이미지--->
      <div class="section_img1">
      	<div class="section_box">
            <a id="abc"><img src="${home }/upload/category1_1.jpg" name="banner" width="898px" height="500px"></a>
            <a class="section_purchase"><img src="${home }/img/purchase.png"></a>
      	</div>
      </div>
      <!---상품 순서보기--->
      <div class="stext">
        <p> <a href="#">쿠팡 랭킹순</a> | <a href="#">낮은가격순</a> | <a href="#">높은가격순</a> | <a href="#">판매량순</a> | <a href="#">최신순</a></p>
      </div>
      <!---상품등록--->
      <div id="intro">
		    <ul>
               
		    	<c:forEach var="category" items="${list}" varStatus="status">
                <!--샙플1~4-->
              <c:if test="${status.count ==1}">
              	<c:set var="aaa" value="${category.file1}"  />
              	<c:set var="auid" value="${category.uid}"  />
              </c:if> 
              <c:if test="${status.count ==2}">
              	<c:set var="bbb" value="${category.file1}"  />
              	<c:set var="buid" value="${category.uid}"  />
              </c:if>
              <c:if test="${status.count ==3}">
              	<c:set var="ccc" value="${category.file1}"  />
              	<c:set var="cuid" value="${category.uid}"  />
              </c:if>
              <c:if test="${status.count ==4}">
              	<c:set var="ddd" value="${category.file1}"  />
              	<c:set var="duid" value="${category.uid}"  />
              </c:if>               
               
				<li>
                    <div class="div">
                        <div class="hover">
                            <div class="div3">${status.count } 
                                <a href="${home }/Productpageview.do?uid=${category.uid}"><img src="${home }/upload/${category.file1}" width="160px" height="160px"></a>
                                    <c:if test="${ category.delivery ==1 }">
                                    <p class="ori">일반배송</p>
                                    </c:if>
    			                    <c:if test="${ category.delivery ==2 }">
                                    <p class="ori">무료배송</p>
                                    </c:if>
                                    <p class="ori"><a href="${home }/Productpageview.do?uid=${category.uid}">${category.name }</a></p>
                                    <p class="ori"> 원가: ${category.price *1.53}원53%</p>
                                    <p class="ori1"><b>${category.price}원</b></p>
                                    <p class="ori">화요일 도착 예정</p>
                            </div>
                        </div>
                    </div>
				</li>
				
				</c:forEach>
			</ul>	
        <!---상품 등록 줄 이미지--->
        <div id="intro1">
            <img src="${home }/img/line.png">
        </div>
        <a href="CategoryAll.do?category=${category }">전체 상품 보러가기</a>
    </div>
</div>
        <script>
          /*section 이미지 처리*/
            var bannerImg = new Array();
              // 이미지 지정
              bannerImg[0]="${home }/upload/${aaa}";
              bannerImg[1]="${home }/upload/${bbb}";
              bannerImg[2]="${home }/upload/${ccc}";
              bannerImg[3]="${home }/upload/${ddd}";
              

            var newBanner = 0;
            var totalBan = bannerImg.length;

            function startFun() {
              newBanner++;
              if (newBanner == totalBan) {
                newBanner = 0;
              }
              document.banner.src=bannerImg[newBanner];
             if(newBanner==0){
              document.getElementById( 'abc' ).setAttribute( 'href', '${home }/Productpageview.do?uid=${auid}' );
             }
            if(newBanner==1){
              document.getElementById( 'abc' ).setAttribute( 'href', '${home }/Productpageview.do?uid=${buid}' );
             }
            if(newBanner==2){
              document.getElementById( 'abc' ).setAttribute( 'href', '${home }/Productpageview.do?uid=${cuid}' );
             }  
            if(newBanner==3){
              document.getElementById( 'abc' ).setAttribute( 'href', '${home }/Productpageview.do?uid=${duid}' );
             }
            document.getElementById('abc');
            slideTime= setTimeout("startFun()", 1*1000); //1*1000은 1초 (시간지정)
            }
            
           // 이미지에 마우스 오버시 실행중인 setInerval 를 clearInterval 로 정지 합니다.
           function stopFun() {
               clearInterval(slideTime);    
           }
           // 브라우저 호환(크로스브라우징)을 위해 메소드 제공 여부를 체크 합니다. 
           // 이미지에 마우스오버시 "정지", 마우스아웃시 "시작" 이벤트를 적용합니다.
           if (document.addEventListener){
                document.banner.addEventListener("mouseover",stopFun,false);
                document.banner.addEventListener("mouseout",startFun,false);
           } else {
                document.banner.attachEvent("onmouseover",stopFun);
                document.banner.attachEvent("onmouseout",startFun);
           }
           // 페이지 로딩시 startFun() 함수를 실행 합니다.
           window.onload=startFun();
        </script>
 

<%@ include file="../foot.jsp" %>