<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
	
<%@ page import ="com.team.marketd.domain.MemberVo" %>

<c:set var="mv" value="${mv}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 페이지</title>

<!-- Bootstrap core CSS -->
<link href="${myContextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${myContextPath}/resources/css/login.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="${myContextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${myContextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">
	$(function() {
		var progress = $("#pb-modalreglog-progressbar").shieldProgressBar({
			value : 0
		}).swidget();

		$('#inputPwd').change(function() {
			if ($('#inputPwd').val().length > 1) {
				progress.value(progress.value() + 15);
			} else {
				progress.value(progress.value() - 15);
			}
		});

		$('#inputPwd2').change(function() {
			if ($('#inputPwd2').val().length > 1) {
				progress.value(progress.value() + 15);
			} else {
				progress.value(progress.value() - 15);
			}
		});
	})
</script>
</head>
<body>
	<div class="container pb-modalreglog-container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h3 class="card-title text-center">새 비밀번호 변경</h3>
						<form class="form-signin" action="${myContextPath}/PwdUpdateAction.dobby" method="post">
							<p>새 비밀번호</p>
							<div class="form-label-group">
							<input type="hidden" name="midx" value="${mv.midx}">
								<input type="password" name="newpwd" id="inputPwd" class="form-control"
									placeholder="새 비밀번호" required autofocus>

							</div>
							<p>새 비밀번호 확인</p>
							<div class="form-label-group">
								<input type="password" name="newpwd2" id="inputPwd2" class="form-control"
									placeholder="새 비밀번호확인" required>
							</div>

							<button
								class="btn btn-lg btn-outline-success btn-block text-uppercase"
								type="submit" style="font-size: 20px;">비밀번호 변경</button>
							<hr class="my-4">
							<div class="input-group pb-modalreglog-input-group">
								<button
									class="btn btn-secondary pb-modalreglog-submit btn-block text-uppercase"
									data-toggle="modal" data-target="#myModal" onclick="location.href='login.dobby'">로그인 화면으로</button>
								<button
									class="btn btn-secondary pb-modalreglog-submit btn-block text-uppercase"
									data-toggle="modal" data-target="#myModal2" onclick="location.href='index2.jsp'">메인 화면으로</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>