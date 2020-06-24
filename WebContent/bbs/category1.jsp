<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>

 
      <div class="container">
        <div class="text">
            <a href="${home}/home.do" class="left">루팡홈</a>
            <a href="category1.jsp" class="left">>패션의류</a>
        </div>
  
      <!---카테고리--->
      <div id="div">
        <ul>
            <li>카테고리
                <ul>
                    <li><a href="${home}/Category.do?category=패션">패션의류</a></li>
                    <li><a href="${home}/Category.do?category=뷰티">뷰티</a></li>
                    <li><a href="${home}/Category.do?category=유아">출산/유아아동</a></li>
                    <li><a href="${home}/Category.do?category=식품">식품</a></li>
                    <li><a href="${home}/Category.do?category=주방용품">주방용품</a></li>
                    <li><a href="${home}/Category.do?category=생홣용품">생활용품</a></li>
                    <li><a href="${home}/Category.do?category=가구"> 홈인테리어</a></li>
                    <li><a href="${home}/Category.do?category=가전">가전디지털</a></li>
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
      <!---상품 순서보기--->
      <div class="categoryAll_section_box">
        <p> <a href="CategoryAll.do?category=${category }&orderby=ref">쿠팡 랭킹순</a> | 
        	<a href="CategoryAll.do?category=${category }&orderby=price&desc=asc">낮은가격순</a> | 
        	<a href="CategoryAll.do?category=${category }&orderby=price">높은가격순</a> | 
        	<a href="CategoryAll.do?category=${category }&orderby=amount">판매량순</a> | 
        	<a href="CategoryAll.do?category=${category }&orderby=date">최신순</a></p>
      </div>
      <!---상품등록--->
      
		    <ul>
               
		    	<c:forEach var="category" items="${list}" varStatus="status">
				<li>                
 					<div class="div">
                        <div class="hover">
                            <div class="div3">${status.count } 
                                <a href="${home }/Productpageview1.do?uid=${category.uid}"><img src="${home }/upload/${category.file1}" width="160px" height="160px"></a>
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
    </div>
        
<%@ include file="../foot.jsp" %>