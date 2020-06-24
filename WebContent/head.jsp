<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<c:set var="home" value="/lupang"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lupang</title>
<link rel="stylesheet" type="text/css" href="${home}/css/head3.css" />
</head>
<body>


<%
Date now=new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss"); 
String today=sf.format(now);
%>
<%
String session_email=(String)session.getAttribute("email");
String name=(String)session.getAttribute("name");
String company3=(String)session.getAttribute("company");
String level=(String)session.getAttribute("level");
if(session.getAttribute("level") != null){
	if(level.equals("1") || level.equals("5") || level.equals("10")){
		 session_email= (String)session.getAttribute("email");
		 name= (String)session.getAttribute("name");    
		 company3= (String)session.getAttribute("company");
		 level= (String)session.getAttribute("level");
	}else{
		 session_email= (String)session.getAttribute("email"); 
		 level= (String)session.getAttribute("level");
	}
}else{//비회원  세션
	String str = "";
	 int d = 0;
for (int i = 1; i <= 2; i++){
			    Random r = new Random();
			    d = r.nextInt(9);
			    str = str + Integer.toString(d);
			  }
		level="0";
		String abc= today+str;
		session.setAttribute("email", abc);
		session_email= (String)session.getAttribute("email");
		session.setAttribute("level", level);
		
}
 %>
 <!-- 세션값 유지시간 초단위 -->
<% session.setMaxInactiveInterval(3000);%>




<c:set var="session_email" value="<%=session_email %>"  />
<c:set var="name" value="<%=name %>"  />
<c:set var="level" value="<%=level %>"  />
<c:set var="company3" value="<%=company3 %>"  />
    <header id="header">
    <div class="container">
        <div class="header">
            <div class="header-menu">
           		<a href="#" class="left">즐겨찾기</a>
           <c:if test="${level !=5 && level !=10 && level !=1  }">
            	<a href="${home}/SelfSell.do" class="left">입점신청</a>
            </c:if>
            <c:if test="${level ==1  }">
            	<a href="${home}/membersellupdate.do?email=${session_email}" class="left">입점신청</a>
            	<a href="${home }/Orderbylist.do?email=${session_email}">내 주문 리스트</a>
            </c:if>
            <c:if test="${level==5 }">
	            <a href="${home}/Productwrite.do" class="left">상품등록</a>        
	            <a href="${home}/Productlist1.do?email=${session_email}&level=${level}">상품리스트</a>
	            <a href="${home }/Orderbylist.do?email=${session_email}">내 주문 리스트</a>
	            <a href="${home }/Orderbylistbusy.do">판매자 주문 리스트</a>
            </c:if>
            <c:if test="${level==10 }">
	            <a href="${home}/Productwrite.do" class="left">상품등록</a>        
	            <a href="${home}/Productlist.do?email=${session_email}&level=${level}">총상품리스트</a>
                <a href="${home }/Orderbylist.do?email=${session_email}">내 주문 리스트</a>
                <a href="${home}/Allmemberlist.do" class="left">총회원리스트</a>
                <a href="${home }/OrderbylistAll.do">총 주문 리스트</a>
                <a href="${home }/Adminpiclist.do">배너 리스트</a>
                
            </c:if>
       
            <span class="right">
            <c:if test="${level != 1 && level != 5 && level != 10 }">
            <a href="${home}/login.do" class="left">로그인</a>         	
            <a href="${home}/Qnalist.do" class="left">고객센터</a>                  	
            <a href="${home}/lupangmemberin.do">회원가입</a>  
           	</c:if>
            <c:if test="${level == 1 || level == 5 || level == 10 }">           	
            <a href="${home}/LupaungOut.do" class="left">로그아웃</a>
             <c:if test="${level==5 || level==10 }">
            <a href="${home}/SellMemberView.do?email=${session_email}">회원정보</a>
           
            </c:if>
            <c:if test="${level==1 }">
            <a href="${home}/MemberView.do?email=${session_email}">회원정보</a>
            </c:if>
            <a href="${home}/Qnalist.do" class="left">고객센터</a>         
            </c:if>
            </span>
            </div> 	
            <div class="header-tit">
               <div class="header-left">
                   <!--네비 수정-->
                   <div class="menubar">
                        <ul>
                            <li><img src="${home}/img/katagorie1.JPG">
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
               </div>
               <div class="header-center">
               <a href="${home}/home.do"><img src="${home}/img/logo.png" class="icon0"></a>
               <form action="${home }/Category.do" method="post">
                   <fieldset > 
                <select name="field" >
                <c:if test="${field == '전체' || field == null  }"> 
                    <option value="전체" selected>전체</option>
                	<option value="패션">패션</option>
                    <option value="뷰티">뷰티</option>
                    <option value="가구">가구</option>
                </c:if>    
                <c:if test="${field=='패션' }"> 
                    <option value="전체" >전체</option>
                	<option value="패션" selected>패션</option>
                    <option value="뷰티">뷰티</option>
                    <option value="가구">가구</option>
                </c:if>
                <c:if test="${field=='뷰티'}"> 
                    <option value="전체" >전체</option>
                	<option value="패션" >패션</option>
                    <option value="뷰티" selected>뷰티</option>
                    <option value="가구">가구</option>
                </c:if> 
                <c:if test="${field=='가구'}"> 
                    <option value="전체" >전체</option>
                	<option value="패션">패션</option>
                    <option value="뷰티" >뷰티</option>
                    <option value="가구" selected>가구</option>
                </c:if>     
                
                </select>
                <input type="text" name="search" placeholder="찾고 싶은 상품을 검색해 주세요" value="${search }">
                <button type="submit"><img src="${home}/img/glass.png" alt="검색" class="icon1"></button>
                <button type="button"><img src="${home}/img/mic.png" alt="음성인식" class="icon2"></button>
                </fieldset>
                </form>             
                  <div>
                   <a href="#">루팡소개!</a><a href="#">루팡나눔장소</a><a href="#">루팡인기물건</a><a href="#">이벤트/쿠폰</a><a href="#">기획</a>
               	  </div>	
               </div>
               <span class="header-right">
                <c:choose>
                	<c:when test="${level == 1 }">
                		<a href="${home}/MemberView.do?email=${session_email}"><img src="${home}/img/mypage.png"></a>
                	</c:when>
                	<c:when test="${level == 5 || level == 10  }">
                		<a href="${home}/SellMemberView.do?email=${session_email}"><img src="${home}/img/mypage.png"></a>
                	</c:when>
                	<c:otherwise>
                		<img src="${home}/img/mypage.png">
                	</c:otherwise>
                </c:choose>  
                   <a href="${home}/Shoppingcartview.do?email=${session_email }"><img src="${home}/img/basket.png"></a>
                   
               </span>
            </div>   
        </div>    
    </div>
  </header>
