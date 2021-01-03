<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<c:import url="/include/indexHeader.jsp" />
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
	
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<c:set var="nv" value="${nv}" />

<div class="container">

	<div class="row">
	
	<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Notice</h2>
          <h3 class="section-subheading text-muted">공지사항</h3>
        </div>
      </div>

		<div class="col-lg-9 my-5">

			<div class="card my-3 " style="height: 15rem;">
				<div class="card-body">
					<div class="row">
						<div class="col-md-2">
								<img src="${myContextPath}/resources/img/admin.png" class="img img-rounded img-fluid"/>
							<p class="text-secondary text-center">${nv.nwridate}</p>
						</div>
						<div class="col-md-10">
							<p>
								<strong>${nv.nsubject}</strong>
							</p>
							<p>${nv.ncontent}</p>
						</div>
					</div>
				</div>
			</div>
			<c:if test='${midx le 10}'>
				<!-- midx <= 10 -->
				<div class="col align-self-end">
					<a class="float-right btn btn-outline-primary"
						href="${myContextPath}/Notice/NoticeDeleteAction.dobby?nidx=${nv.nidx}"> 삭제하기
					</a>
				</div>
			</c:if>
		</div>

	</div>
	</section>

</div>
</div>

	<c:import url="/include/indexFooter.jsp" />