<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<c:import url="/include/indexHeader.jsp" />
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
	
<c:set var="alist" value="${requestScope.alist}"/>
	
<script src="${myContextPath}/resources/js/jquery.min.js"></script>
<script src="${myContextPath}/resources/js/jquery-3.2.1.min.js"></script>
 
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>MarketD</title>

<script type="text/javascript">
$(function(){
	(function($){


$( document ).ready( function() {
	
 	$.productNewList();
	
	   $('#more').click(function(){

			var npage = $("#nextPage").val(); //Criteria를 사용하지않고 Hidden속성의 inputbox를 이용(리스트를 전부 로드했을때 인설트시 1페이지로 돌아가는 문제때문)
			 
			$.ajax({
				type : "GET",
				url  : "${myContextPath}/Product/"+npage+"/ProductNewList.dobby",
				
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
					$.newList(data);
					}			
			});	 
			
		}); //more
	 
});//    $(function(){  
	
 $.moerCount = function(){ //전체리스트와 로드된 리스트를 비교하는 함수

 
	$.ajax({
		type : "GET",
		url  : "${myContextPath}/Product/1/1000/0/0/empty/ProductListTotal.dobby",
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

	 $.productNewList = function(){	

		var page = $('#page').val();
	
		$.ajax({
			type : "GET",
			url  : "${myContextPath}/Product/"+page+"/ProductNewList.dobby",
			datatype : "json",
			cache : false,   
			error : function(){
				alert("리스트1 error");
			},
			success : function(data){	
			
				$.newList(data);
				var oblength = Object.keys(data).length;
				$('#moreTotalCount').val(oblength);	
				$.moerCount();
				}			
		});	 	
	}; 
	 
	 $.newList = function(data){
		var str = '';	
	
	 $(data).each(function(index){
		 
		 var upload = this.uploadPath;
		 
			 
			 var fileCallPath = "http://thdkow.cafe24.com/upload"+"/"+upload+"/"+this.uuid+"_"+this.fileName;
			 var writedate = this.pwridate.substr(0,10);
			 
			 		
				str +="<div class='col-md-4 col-sm-6 portfolio-item'>"
				+"<a href='${myContextPath}/Product/ProductContent.dobby?pidx="+ this.pidx + "'>"
				+"<div class='portfolio-hover'><div class='portfolio-hover-content'>"
				+"</div>"
				+"</div><img class='img-fluid3' src='"+fileCallPath+"' alt=''>"
				+"<div class='portfolio-caption'><h4>" 
				+this.psubject+"</h4>"
				+  "<p class='text-muted'>가격 : "+this.pmoney+"원</p></div></a></div>";
				
		 });
				
		 $('#tbr').html(str);

			 
			 };		//newList 

}(jQuery))
})



</script>

</head>

<body id="page-top">


  <!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">NewProduct</h2>
          <h3 class="section-subheading text-muted">새로들어온 상품들 입니다.</h3>
        </div>
      </div>
      
      
      
      
      <div class="row" id="tbr">
        
       </div><!-- row -->
       
       
       <center>
		<a class="btn btn-primary " id='more'>더보기</a>
		</center>
       
       <input id='nextPage' type='hidden' value='2' />
<input id='moreTotalCount' type='hidden' value='12' />
<input id='page' type='hidden' value='1' />
       
       
      </div>
  </section>

<c:import url="/include/indexFooter.jsp" />

</body>

</html>