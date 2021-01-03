<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:import url="/include/indexHeader.jsp" />

<c:set var="myContextPath" value="${pageContext.request.contextPath}" />

<c:set var="qv" value="${qv}" />

<div class="container">

	<div class="row">

<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Reply</h2>
          <h3 class="section-subheading text-muted">질문 답변하기</h3>
        </div>
      </div>

		<div class="col-lg-9 my-5">
			<div class="card my-3" style="height: 50rem;">
				<div class="card-body">
					<div class="row">
						 <div class="col-md-2">
        	    <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid"/>
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
					
					
					<div class="card card-inner">
						<div class="card-body">
							<div class="row my-5">
								<form class="" method="post" action="${myContextPath}/Question/QuestionReplyAction.dobby?qidx=${qv.qidx}">
									<fieldset>

										<div class="form-group">
											<span class="col-md-1 offset-md-2 text-xs-center"></span>
											<div class="col-md-8">
											<input id="qresubject"
													name="qresubject" type="text" placeholder="답변 제목을 입력해주세요."
													class="form-control" size="120">
											</div>
										</div>

										<div class="form-group">
											<span class="col-md-1 offset-md-2 text-xs-center"></span>
											<div class="col-md-8">
												<textarea class="form-control" id="qrecontent" name="qrecontent"
													placeholder="답변 내용을 정확히 입력해주세요." rows="15" size="120"></textarea>
											</div>
										</div>

										<div class="form-group" style="text-align:right;">
											<div class="col-md-8 " style="text-xs-center">
												<button type="submit" class="btn btn-outline-primary btn-lg"
													name="submit">등록</button>
												<a class="btn btn-outline-danger btn-lg" href="${myContextPath}/Question/QuestionList.dobby">취소</a>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		</div>
		</section>
	</div>
</div>
<style>
.header {
	color: #36A0FF;
	font-size: 27px;
	padding: 10px;
}

.bigicon {
	font-size: 35px;
	color: #36A0FF;
}
</style>

	<c:import url="/include/indexFooter.jsp" />