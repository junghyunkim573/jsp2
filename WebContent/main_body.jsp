<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<script>
          /*section 이미지 처리*/
    var bannerImg = new Array();
          // 이미지 지정
          bannerImg[0]="${home}/upload/${banner.file1}";
          bannerImg[1]="${home}/upload/${banner.file2}";
          bannerImg[2]="${home}/upload/${banner.file3}";
          bannerImg[3]="${home}/upload/${banner.file4}";
          

        var newBanner = 0;
        var totalBan = bannerImg.length;

        function startFun() {
            newBanner++;
            if (newBanner == totalBan) {
              newBanner = 0;
            }
            document.banner.src=bannerImg[newBanner];
           if(newBanner==0){
            document.getElementById( 'abc' ).setAttribute( 'href', '${home}/${banner.pass1}' );
           }
          if(newBanner==1){
            document.getElementById( 'abc' ).setAttribute( 'href', '${home}/${banner.pass2}' );
           }
          if(newBanner==2){
            document.getElementById( 'abc' ).setAttribute( 'href', '${home}/${banner.pass3}' );
           }  
          if(newBanner==3){
            document.getElementById( 'abc' ).setAttribute( 'href', '${home}/${banner.pass4}' );
           }
          document.getElementById('abc');
          slideTime= setTimeout("startFun()", 1*1000); //1*1000은 1초 (시간지정)
          }
        window.onload=startFun;
        
	
        function category1(){
        		location.reload();
        		alert("aaaa");
        		
        	}
        	
        
        delta=1;
        $(window).on('resize', function(){ // resize 후 한번만 실행 
        clearTimeout( timer ); 
        timer = setTimeout( category1, delta ); 
        });

        
        
</script>
	<!-- 스크립트이미지 -->
  <section id="section">
          <div class="section_img">
            <a  id="abc"><img src="${home}/upload/${banner.file1}" name="banner" width="100%" height="500px"></a>
    	</div>
   </section>
   
                  
<div class="container">
        <div class="best_title">
            <h1><a href="#">BEST 메뉴</a> <span>| 가장 인기 잇고 많이 팔린 제품들</span></h1>
               <c:forEach var="category" items="${list}" varStatus="status">
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
                                    <fmt:parseNumber var="original" value="${category.price *1.53}" integerOnly="true"/>
                                    <p class="ori">원가: ${original}원 53% </p>
                                    <p class="ori1"><b>${category.price}원</b></p>
                                    <p class="ori">화요일 도착 예정</p>
                            </div>
                        </div>
                    </div>
				</li>
			  <c:if test="${status.count%5 ==0}">
		            <div id="intro1">
		                <img src="img/line_pp.png">
		            </div>      
              </c:if>      
				</c:forEach>
        <!---상품 등록 줄 이미지--->
            <div id="intro1">
                <img src="img/line_pp.png">
            </div>            
        </div>
    </div>
  
  