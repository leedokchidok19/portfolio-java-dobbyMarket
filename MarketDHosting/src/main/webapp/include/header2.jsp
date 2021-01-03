<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}" />

<style>
* { margin: 0; padding: 0; }

.wrap {
	width: 100%;
	margin: 0 0 auto;
	background-color: #212529;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 25%;
}

.mul {
 background: #4e4e4e;

}


/* @group core nav menu */
#nav { margin: 0; padding: 0; list-style: none; height: 50px; padding-left: 15px; padding-right: 15px; background: #212529; }

#nav li { float: left; display: block; background: none; position: relative; z-index: 999; margin: 0 1px; }

#nav li a { display: block; padding: 0; font-weight: 700; line-height: 50px; text-decoration: none; color: #ffffff; padding: 0px 12px; }
#nav li a:hover, #nav li a.hover { color: #fec503; }

/* @group subnav */
#nav ul { position: absolute; left:0px; display: none; margin: 0; padding: 10px; list-style: none;}	
#nav ul li { width:180px; float: left;  text-align: left; }
#nav ul li:hover {}

#nav ul a { height: 20px; line-height: 20px; padding: 5px;  color: #ffffff; font-weight: normal; }
#nav ul a:hover { color: #fec503; }

* html #nav ul { width: 125px;
 height: 35px; margin: 0 0 0 1px; }

/** @group clearfix **/
.clearfix:after { content: "."; display: block; clear: both; visibility: hidden; line-height: 0; height: 0; }
.clearfix { display: inline-block; }
 
html[xmlns] .clearfix { display: block; }
* html .clearfix { height: 1%; }
</style>
 

  <!-- Bootstrap core CSS -->
  <link href="${myContextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${myContextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

  <!-- Custom styles for this template -->
  <link href="${myContextPath}/resources/css/agency.min.css" rel="stylesheet">

	<script src="${myContextPath}/resources/js/jquery.min.js"></script>
	<script src="${myContextPath}/resources/js/jquery-3.2.1.min.js"></script>

 <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="${myContextPath}/index2.jsp">DobbyMarket</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          
          	<%
				if (session.getAttribute("midx") == null) {
					/* int	midx = (int)session.getAttribute("midx"); */
			%>
          <li class="nav-item">
            <a class="nav-link2" href="${myContextPath}/login2.dobby">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link2" href="${myContextPath}/MemberJoin.dobby">회원가입</a>
          </li>
          <%} %>
          <%
          if(session.getAttribute("midx")!=null){ %>
          <li class="nav-item">
            <a class="nav-link2" href="${myContextPath}/Needlogin/memberProfile.dobby">내정보</a>
          </li>
          <li class="nav-item">
            <a class="nav-link2" href="${myContextPath}/Needlogin/Cart/ShoppingCartList.dobby">장바구니</a>
          </li>
          <li class="nav-item">
            <a class="nav-link2" href="${myContextPath}/Needlogin/Product/ProductPaymentHistory.dobby">구매내역</a>
          </li>
          <li class="nav-item">
            <a class="nav-link2" href="${myContextPath}/Needlogin/Product/ProductSalesHistory.dobby">판매내역</a>
          </li>
           <li class="nav-item">
            <a class="nav-link2" href="${myContextPath}/logoutAction.dobby">로그아웃</a>
          </li>
          <%} %>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <header class="masthead2" style="background-image: url(${myContextPath}/resources/img/header-bg.jpg);">
    <div class="container">
      <div class="intro-text2">
      </div>
    </div>
    
    <!-- Navigation -->
      	<div class="wrap">
	<ul id="nav">
		<li class="menu-li"><a class="a" href="#">가구</a>
			<ul class="mul">
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=321&minPrice=0&maxPrice=0&keyword=empty">
				DIY</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=222&minPrice=0&maxPrice=0&keyword=empty">
				조명</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=323&minPrice=0&maxPrice=0&keyword=empty">
				침구/커튼</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=324&minPrice=0&maxPrice=0&keyword=empty">
				수납용품</a></li>
			</ul>
		</li>
			
		<li class="menu-li"><a class="a" href="#">패션의류</a>
			<ul class="mul">
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=301&minPrice=0&maxPrice=0&keyword=empty">
				남성의류</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=302&minPrice=0&maxPrice=0&keyword=empty">
				여성의류</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=303&minPrice=0&maxPrice=0&keyword=empty">
				아우터</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=304&minPrice=0&maxPrice=0&keyword=empty">
				모자</a></li>
			</ul>
		</li>
		<li class="menu-li"><a class="a"  href="#">도서</a>
			<ul class="mul">
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=341&minPrice=0&maxPrice=0&keyword=empty">
				도서</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=342&minPrice=0&maxPrice=0&keyword=empty">
				교육</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=343&minPrice=0&maxPrice=0&keyword=empty">
				음반</a></li>
			</ul>		
		</li>
		<li class="menu-li"><a class="a" href="#">스포츠</a>
			<ul class="mul">
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=361&minPrice=0&maxPrice=0&keyword=empty">
				휘트니스/수영</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=364&minPrice=0&maxPrice=0&keyword=empty">
				등산/아웃도어</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=365&minPrice=0&maxPrice=0&keyword=empty">
				캠핑/낚시</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=366&minPrice=0&maxPrice=0&keyword=empty">
				구기/라켓</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=367&minPrice=0&maxPrice=0&keyword=empty">
				자전거/보드</a></li>
			</ul>
		</li>
		<li class="menu-li"><a class="a" href="#">컴퓨터</a>
			<ul class="mul">
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=381&minPrice=0&maxPrice=0&keyword=empty">
				모니터</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=382&minPrice=0&maxPrice=0&keyword=empty">
				데스크탑</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=383&minPrice=0&maxPrice=0&keyword=empty">
				노트북</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=384&minPrice=0&maxPrice=0&keyword=empty">
				프린터</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=385&minPrice=0&maxPrice=0&keyword=empty">
				저장장치</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=386&minPrice=0&maxPrice=0&keyword=empty">
				PC주변기기</a></li>
			</ul>
		</li>
		<li class="menu-li"><a class="a" href="#">뷰티잡화</a>
			<ul class="mul">
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=401&minPrice=0&maxPrice=0&keyword=empty">
				신발</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=402&minPrice=0&maxPrice=0&keyword=empty">
				가방</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=403&minPrice=0&maxPrice=0&keyword=empty">
				주얼리</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=404&minPrice=0&maxPrice=0&keyword=empty">
				수입명품</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=405&minPrice=0&maxPrice=0&keyword=empty">
				시계</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=406&minPrice=0&maxPrice=0&keyword=empty">
				선글라스</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=407&minPrice=0&maxPrice=0&keyword=empty">
				기타</a></li>
			</ul>
		</li>
		<li class="menu-li"><a class="a" href="#">취미</a>
			<ul class="mul">
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=441&minPrice=0&maxPrice=0&keyword=empty">
				건강/의료</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=442&minPrice=0&maxPrice=0&keyword=empty">
				반려동물</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=443&minPrice=0&maxPrice=0&keyword=empty">
				악기</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=444&minPrice=0&maxPrice=0&keyword=empty">
				키덜트</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=445&minPrice=0&maxPrice=0&keyword=empty">
				사무용품</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=446&minPrice=0&maxPrice=0&keyword=empty">
				기타</a></li>
			</ul>
		</li>
		<li class="menu-li"><a class="a" href="#">디지털</a>
			<ul class="mul">
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=421&minPrice=0&maxPrice=0&keyword=empty">
				카메라</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=422&minPrice=0&maxPrice=0&keyword=empty">
				음향기기</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=423&minPrice=0&maxPrice=0&keyword=empty">
				게임</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=424&minPrice=0&maxPrice=0&keyword=empty">
				휴태폰</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=425&minPrice=0&maxPrice=0&keyword=empty">
				태블릿</a></li>
			</ul>
		</li>
		<li class="menu-li"><a class="a" href="#">생활가전</a>
			<ul class="mul">
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=461&minPrice=0&maxPrice=0&keyword=empty">
				대형가전</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=462&minPrice=0&maxPrice=0&keyword=empty">
				계절가전</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=463&minPrice=0&maxPrice=0&keyword=empty">
				주방가전</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=464&minPrice=0&maxPrice=0&keyword=empty">
				생활가전</a></li>
				<li><a href="${myContextPath}/Product/ProductList.dobby?caidx=465&minPrice=0&maxPrice=0&keyword=empty">
				미용가전</a></li>
			</ul>
		</li>
		
		<li class="menu-li" style="margin-left:10%;"><a class="a" href="${myContextPath}/Notice/NoticeList.dobby">공지사항</a></li>
		<li class="menu-li"><a class="a" href="${myContextPath}/Question/OftenList.dobby">FAQ</a></li>
		<li class="menu-li"><a class="a" href="${myContextPath}/Question/QuestionList.dobby">1:1문의하기</a></li>
	</ul>
      </div>
   
		
		
<script type="text/javascript">
$(document).ready(function() {	
	$('#nav li').hover(function() {
		$('ul', this).slideDown(200);
		$(this).children('a:first').addClass("hov");
	}, function() {
		$('ul', this).slideUp(100);
		$(this).children('a:first').removeClass("hov");		
	});
});
</script>
		
  </header>
 
 
 