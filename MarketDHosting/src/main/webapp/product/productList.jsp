<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<c:import url="/include/indexHeader.jsp" />
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
	
<c:set var="caidx2" value="${caidx}"/>

<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
 
 <script type="text/javascript">
 
$(function(){
	(function($){


$( document ).ready( function() {
	
 	$.productSerchList();
 	
 	 $('#btn2').click(function(){
 		 
			var keyword = $("#keyword").val();
			var keyword2 = $("#keyword2").val(); 
			var minPrice = $("#minPrice").val(); 
			var maxPrice = $("#maxPrice").val(); 
			
			if(keyword==""){$("#keyword").val('empty')}
			if(keyword2==""){$("#keyword2").val('empty')}
			if(minPrice==""){$("#minPrice").val('0')}
			if(maxPrice==""){$("#maxPrice").val('0')}
					 
			});
	 
	
 	   $('#more').click(function(){

			var npage = $("#nextPage").val(); //Criteria를 사용하지않고 Hidden속성의 inputbox를 이용(리스트를 전부 로드했을때 인설트시 1페이지로 돌아가는 문제때문)
			 
			$.ajax({
				type : "GET",
				url  : "${myContextPath}/Product/"+npage+"/${caidx}/${minPrice}/${maxPrice}/${keyword}/ProductSerchList.dobby",
				datatype : "json",
				cache : false,
				error : function(){
					alert("리스트 error");
				},
				success : function(data){


					
					$("#page").val(npage);	
					nextPage = (npage*1)+1;
					$("#nextPage").val(nextPage);
					var oblength = Object.keys(data).length;	
					$('#moreTotalCount').val(oblength);	
					$.moerCount();
					$.SerchList(data);
					}				 
			});
		}); //more 
	 
});//    $(function(){  
 	
 $.moerCount = function(){ //전체리스트와 로드된 리스트를 비교하는 함수
 
	 var page = $('#page').val();
	 
	$.ajax({
		type : "GET",
		url  : "${myContextPath}/Product/"+page+"/${caidx}/${minPrice}/${maxPrice}/${keyword}/ProductListTotal.dobby",
		//위의 url에 0을 사용함으로 전체를 로드한다.(쿼리문에서 if문을 사용하여 where조건을 걸렀다.)
		datatype : "json",
		cache : false,   
		error : function(){
			alert("more error");
		},
		success : function(data){	
			

			if(data==$('#moreTotalCount').val()){		//more에서 불러온 리스트와 갯수를 비교하여 같다면 more버튼을 사라지게 처리함
				 $('#more').hide(2000);
				}else{
					$('#more').show(2000);				//같지 않다면 more버튼 활성화(show를 해주지않는다면 같지않더라도 사라진후에 나타나지않음)
					}
			}
			})			
	};		//moercount  

	 $.productSerchList = function(){	//input에 저장해놓은 페이지로 select(criteria와 같은 기능,default값은 1이다.)

	 var page = $('#page').val();
	
	 	$.ajax({
			type : "GET",
			url  : "${myContextPath}/Product/"+page+"/${caidx}/${minPrice}/${maxPrice}/${keyword}/ProductSerchList.dobby",
			datatype : "json",
			cache : false,   
			error : function(){
				alert("리스트 error");
			},
			success : function(data){	
				var cate = ${caidx};
				$.SerchList(data);
				$('#caidx').val(cate);	
				var oblength = Object.keys(data).length;
				$('#moreTotalCount').val(oblength);	
				$.moerCount();
				}			
		});	 	 
	}; 		//$.productSerchList
	 
	  $.SerchList = function(data){
		  var str = '';	
		  var cate2 = data[0].cate;
		  
		  $('#productinfo').html(cate2+"상품을 검색하였습니다.")
		  
			 $(data).each(function(index){
				 
				 var writedate = this.pwridate.substr(0,10);
				 var fileCallPath = "http://thdkow.cafe24.com/upload/"+this.uploadPath+"/"+this.uuid+"_"+this.fileName;
				 
						str += "<div class='col-md-4 col-sm-6 portfolio-item'>"
							+"<a href='${myContextPath}/Product/ProductContent.dobby?pidx="+ this.pidx + "'>"
							+"<div class='portfolio-hover'><div class='portfolio-hover-content'></div>"
							+"</div><img class='img-fluid3' src='"+fileCallPath+"' alt=''>"
							+"<div class='portfolio-caption'><h4>" 
							+this.psubject+"</h4>"
							+  "<p class='text-muted'>가격 : "+this.pmoney+"원</p></div></a></div>";
						
						
						
				 });
						
				 $('#tbr').html(str);

			 
			 };		//SerchList  

		

	}(jQuery))
	})
	
	
	
</script>
 
 
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>MarketD</title>



</head>

<body id="page-top">

  <!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Product</h2>
          <c:choose>
          
          <c:when test="${caidx2==1000}">
          <h3 class="section-subheading text-muted">모든 카테고리의 물품을 검색하였습니다.</h3>
          </c:when>
          <c:otherwise>
          <h3 class="section-subheading text-muted" id="productinfo">검색한 물품을 찾을 수 없습니다.</h3>
          </c:otherwise>
          </c:choose>
          <form class="form-inline serch my-5" style="margin: 0 auto; width:800px;" action="${myContextPath}/Product/ProductList.dobby">
				<input class="form-control mr-sm-2" type="text" id="keyword2" name="keyword"
					placeholder="결과 내 검색" aria-label="text">
			 	<input class="form-control mr-sm-2" type="text" placeholder="최소값" id="minPrice" name="minPrice"
			 			aria-label="Search" size="10" value="">&nbsp;~&nbsp;&nbsp;
				<input class="form-control mr-sm-2 " type="text" placeholder="최대값" id="maxPrice" name="maxPrice"
						 aria-label="Search" size="10" value="">
				<input type="hidden" id="caidx" name="caidx" value="1000" >
				<button class="btn btn-outline-success my-2 my-sm-0"  id='btn2'>검색</button>

			</form>
          
        </div>
      </div>
       
       
      
      
      
      <div class="row" id="tbr">
        
       </div><!-- row -->
       
       
       <center>
		<a class="btn btn-primary " id='more'>Tell Me More</a>
		</center>
       
<input id='nextPage' type='hidden' value='2' />
<input id='moreTotalCount' type='hidden' value='' />
<input id='page' type='hidden' value='1' />
       
       
      </div>
  </section>

</body>

</html>

	<c:import url="/include/indexFooter.jsp" />