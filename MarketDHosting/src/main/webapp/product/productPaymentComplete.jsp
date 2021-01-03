<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<c:import url="/include/indexHeader.jsp" />
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />


<div class="container">

	<div class="row">

		<div class="col-lg-9 my-5">
				<table class="table my-5">
					<tbody>
						<tr>
							<th><img
									src="${myContextPath}/resources/img/dobby2.png" height="150" width="150"
									alt=""></th>
							<td class="align-middle" style="font-size: 30px;">구매해주셔서 감사합니다.</td>
						</tr>
												<tr>
						<td colspan="2" class="text-center"><button type="button" class="btn btn-outline-primary" 
						onclick="location.href='${myContextPath}/index2.jsp'"  style="font-size: 20px;">확인</button></td>
						<tr>
					</tbody>
				</table>
		</div>
	</div>
</div>
	<c:import url="/include/indexFooter.jsp" />