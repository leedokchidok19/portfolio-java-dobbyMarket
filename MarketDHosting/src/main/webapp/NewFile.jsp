<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<c:set var="myContextPath" value="${pageContext.request.contextPath}"/>
<c:set var="alist" value="${requestScope.alist}"/>
<c:set var="pm" value="${requestScope.pm}"/>

<title>SalesList</title>


<link rel="stylesheet" type="text/css"
	href="${myContextPath}/include/member.css" />


	<!-- 테이블 시작 -->
	<div class="table default">
		<!-- 헤더 시작 -->
		<div class="table-header">
			<div class="table-row">
				<div class="table-head">pidx</div>
				<div class="table-head">제목</div>
				<div class="table-head">가격</div>
				<div class="table-head">final</div>
				<div class="table-head">날자</div>
			</div>
		</div>
		<!-- 헤더 끝 -->
		<!-- 테이블  로우 시작 -->
		<div id="rows" class="tableBody">

			<c:forEach items="${alist}" var="alist2" varStatus="status" >
			
				<div class='table-row'>
				<div class='table-cell'>${alist2.pidx}</div>
				<div class='table-cell ' align='left'>${alist2.psubject}</A></div>
				<div class='table-cell'>${alist2.pmoney}</div>
				<div class='table-cell'>${alist2.ofinal}</div>
				<div class='table-cell'>${alist2.pwridate}</div>
				</div>

			</c:forEach>
		</div>
		<!-- 테이블 로우 끝 -->

	</div>



