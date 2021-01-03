<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:import url="/include/indexHeader.jsp" />

<c:set var="myContextPath" value="${pageContext.request.contextPath}" />


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

			<div class="row my-5 clearfix">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">문의유형</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성날짜</th>
							<th scope="col">답변유무</th>
							
						</tr>
					</thead>
					<tbody>
					
					 <c:forEach var="alist2" items="${alist}" varStatus="status">
							<tr>
								<th scope="row">${status.count}</th>
								<td>${alist2.cate}</td>
								<td><a href="${myContextPath}/Question/QuestionContent.dobby?qidx=${alist2.qidx}">${alist2.qsubject}</td>
								<td>${alist2.mname}</td>
								<td>${alist2.qwridate}</td>
								<td>${alist2.qstate}</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
				
				<div class="col align-self-end">
						<a class="float-right btn btn-outline-primary" href="${myContextPath}/NeedLogin/Question/QuestionWrite.dobby">
							문의하기
						</a>
					</div>
					
			</div>
			
			<div class="row my-2 justify-content-center ">
				<nav aria-label="Page navigation">
					<ul class="pagination">
					
					<c:if test="${pm.prev eq true }">
						<li class="page-item">
							<a class="page-link" aria-label="Previous"
							 href="${myContextPath}/Question/QuestionList.dobby${pm.makePrev()}">
							  <span aria-hidden="true">&laquo;</span></a></li>
							</c:if>
							
						
		<c:forEach var="pmbt" begin="${pm.startPage}" end="${pm.endPage}">
         		 <li class="page-item">
           <a class="page-link" href="${myContextPath}/Question/QuestionList.dobby${pm.makeSearch(pmbt)}">${pmbt}</a>
           		<!-- 메소드를 이용해서 깔끔하게 처리하였다. -->
           </li>
        </c:forEach>
						
							<c:if test="${pm.next eq true && pm.endPage gt 0}">
							<li class="page-item"> <a class="page-link" aria-label="Next"
							 href="${myContextPath}/Question/QuestionList.dobby${pm.makeNext()}">
							 <span aria-hidden="true">&raquo;</span>
						</a></li>
						</c:if> 
						
					</ul>
				</nav>
			</div>
			<!-- /.row -->
			
		</div>
		<!-- /.col-lg-9 -->
		</div>
	</section>
	</div>
	<!-- /.row -->

</div>

	<c:import url="/include/indexFooter.jsp" />