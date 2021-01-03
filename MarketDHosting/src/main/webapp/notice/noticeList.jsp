<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<c:import url="/include/indexHeader.jsp" />
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
<c:set var="nv" value="${nv}" />


<div class="container">

	<div class="row">

<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">NoticeList</h2>
          <h3 class="section-subheading text-muted">공지사항</h3>
        </div>
      </div>

		<div class="col-lg-9 my-5">
		
			<div class="row my-5 justify-content-center">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="nvlist" items="${nv}" varStatus="status">
							<tr>
								<th scope="row">${status.count}</th>
								<td><a href="${myContextPath}/Notice/NoticeContent.dobby?nidx=${nvlist.nidx}">${nvlist.nsubject}</a></td>
								<td>운영자</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test='${midx le 10}'><!-- midx <= 10 -->
					<div class="col align-self-end">
						<a class="float-right btn btn-outline-primary" href="${myContextPath}/Notice/NoticeWrite.dobby">
							공지하기
						</a>
					</div>
				</c:if>
			</div>
			<div class="row my-2 justify-content-center ">
				<nav aria-label="Page navigation">
					<ul class="pagination">
					
					<c:if test="${pm.prev eq true }">
						<li class="page-item">
							<a class="page-link" aria-label="Previous"
							 href="${myContextPath}/Notice/NoticeList.dobby${pm.makePrev()}">
							  <span aria-hidden="true">&laquo;</span></a></li>
							</c:if>
							
						
		<c:forEach var="pmbt" begin="${pm.startPage}" end="${pm.endPage}">
         		 <li class="page-item">
           <a class="page-link" href="${myContextPath}/Notice/NoticeList.dobby${pm.makeSearch(pmbt)}">${pmbt}</a>
           		<!-- 메소드를 이용해서 깔끔하게 처리하였다. -->
           </li>
        </c:forEach>
						
							<c:if test="${pm.next eq true && pm.endPage gt 0}">
							<li class="page-item"> <a class="page-link" aria-label="Next"
							 href="${myContextPath}/Notice/NoticeList.dobby${pm.makeNext()}">
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