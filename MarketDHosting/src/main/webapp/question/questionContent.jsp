<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:import url="/include/indexHeader.jsp" />

<c:set var="myContextPath" value="${pageContext.request.contextPath}" />


<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" 
rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" 
crossorigin="anonymous">


<c:set var="qv" value="${qv}" />

<div class="container">

	<div class="row">
<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Contact</h2>
          <h3 class="section-subheading text-muted">문의하기</h3>
        </div>
      </div>

		<div class="col-lg-9 my-5">
	
	<div class="card card1 my-3 " style="height: 30rem;">
	    <div class="card-body">
	        <div class="row">
        	    <div class="col-md-2">
        	    <img src="${myContextPath}/resources/img/buyer.png" class="img img-rounded img-fluid"/>
                   <p class="text-secondary text-center">${qv.qwridate}</p>
        	    </div>
        	    <div class="col-md-10">
        	    
        	        <p>
        	            <strong> 제목 : ${qv.qsubject}</strong>   &nbsp;&nbsp;&nbsp;  작성자 :  ${qv.mname}
        	             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 문의 유형 : ${qv.cate}
        	            
        	       </p>
        	       
        	        <p>${qv.qcontent}</p>
        	    </div>
	        </div>
	        
	        <c:if test="${qv.qstate=='Y'}">
	        
	        	<div class="card card1 card-inner " style="margin-left: 4rem; height: 15rem;">
            	    <div class="card-body ">
            	        <div class="row ">
                    	    <div class="col-md-2">
                    	        <img src="${myContextPath}/resources/img/admin.png" class="img img-rounded img-fluid"/>
                    	        <p class="text-secondary text-center">${qv.qrewridate}</p>
                    	    </div>
                    	    <div class="col-md-10">
        	    
        	        <p>
        	            <strong> 제목 : ${qv.qresubject}</strong>   &nbsp;&nbsp;&nbsp;  작성자 : 관리자
        	       </p>
        	       
        	        <p>${qv.qrecontent}</p>
        	    </div>
            	        </div>
            	    </div>
            	    
	            </div> 
	            </c:if>   
	            <div class="card">
 <div class="bttn-back">
            	    	<c:if test="${midx<11}">
 		<button class="btn btn-outline-danger " 
 		onclick="location.href='${myContextPath}/Question/QuestionReply.dobby?qidx=${qv.qidx}'">답변하기</button>
		</c:if>
		<c:if test="${midx<11 or midx==qv.midx}">
 		<button class="btn btn-outline-danger " 
 		onclick="location.href='${myContextPath}/Question/QuestionDeleteAction.dobby?qidx=${qv.qidx}'">삭제</button>
		</c:if>
		<button class="btn btn-outline-danger " 
		onclick="location.href='${myContextPath}/Question/QuestionList.dobby'">목록</button>
            	     </div>
</div>
	    </div>
	   </div>
	   
	</div>
		   			
 	
	
	</div>
</section>		
					
</div>

</div>

						
	<c:import url="/include/indexFooter.jsp" />