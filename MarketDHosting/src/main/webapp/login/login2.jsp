<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<!-- Bootstrap core CSS -->
<link href="${myContextPath}resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${myContextPath}/resources/css/login.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="${myContextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${myContextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<script type="text/javascript">
	$(function() {
		var progress = $("#pb-modalreglog-progressbar").shieldProgressBar({
			value : 0
		}).swidget();

		$('#inputId').change(function() {
			if ($('#inputId').val().length > 1) {
				progress.value(progress.value() + 15);
			} else {
				progress.value(progress.value() - 15);
			}
		});

		$('#inputPwd').change(function() {
			if ($('#inputPwd').val().length > 1) {
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
				<div class="card card1 card-signin my-5">
					<div class="card-body">
						<h3 class="card-title text-center">DOBBY MAKET</h3>
						<form class="form-signin" action="${myContextPath}/loginAction.dobby" method="post">
							<div class="form-label-group">
								<input type="text" id="inputId" name="id" class="form-control"
									placeholder="아이디" required autofocus>

							</div>

							<div class="form-label-group">
								<input type="password" id="inputPwd" name="pwd" class="form-control"
									placeholder="비밀번호" required>

							</div>

							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input"
									id="customCheck1" value="on"name="useCookie" > <label class="custom-control-label"
									for="customCheck1">자동 로그인</label>
							</div>
							<button
								class="btn btn-lg btn-outline-success btn-block text-uppercase"
								type="submit" style="font-size: 20px;">로그인</button>
							<hr class="my-4">
							<div class="input-group pb-modalreglog-input-group">
								<button
									class="btn btn-secondary pb-modalreglog-submit btn-block text-uppercase"
									data-toggle="modal" data-target="#myModal">아이디 찾기</button>
								<button
									class="btn btn-secondary pb-modalreglog-submit btn-block text-uppercase"
									data-toggle="modal" data-target="#myModal2">비밀번호 찾기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-md-4 offset-md-4">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">아이디 찾기</h4>
					</div>
					<div class="modal-body">
						<form action="IdFindAction.dobby" method="post">
							<div class="form-group">
								<label for="name">이름</label>
								<div class="input-group pb-modalreglog-input-group">
									<input type="text" name="name"class="form-control" id="mname"
										placeholder="이름"> <span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="birth">생년월일</label>
								<div class="input-group pb-modalreglog-input-group">
									<input type="text" class="form-control" name="birth"id="mbirth"
										placeholder="생년월일"> <span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="question">인증질문</label>
								<div class="input-group pb-modalreglog-input-group">
									<select class="custom-select" id="inputGroupSelect01">
										<option value="">질문을 선택해주세요</option>
										<option value="1">아버지의 성함은?</option>
										<option value="2">내가 태어난 곳은?</option>
										<option value="3">내 어렸을 때 별명은?</option>
										<option value="4">내 보물 1호는?</option>
										<option value="5">나의 첫사랑은?</option>
										<option value="6">나의 좌우명은?</option>
										<option value="7">내가 제일 좋아하는 음식은?</option>
										<option value="8">내가 가장 흥미로워하는 장소는?</option>
									</select> <span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="question">질문답변</label>
								<div class="input-group pb-modalreglog-input-group">
									<input type="text" name="question" class="form-control" id="mquestion"
										placeholder="답변"> <span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span>
								</div>
							</div>
												<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">검색</button>
					</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">비밀번호 찾기</h4>
					</div>
					<div class="modal-body">
						<form action="PwdFindAction.dobby" method="post">
							<div class="form-group">
								<label for="id">아이디</label>
								<div class="input-group pb-modalreglog-input-group">
									<input type="text" class="form-control" name="id" id="mid"
										placeholder="아이디"> <span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span>
								</div>
							</div>
							
														<div class="form-group">
								<label for="name">이름</label>
								<div class="input-group pb-modalreglog-input-group">
									<input type="text" class="form-control" name="name" id="name"
										placeholder="이름"> <span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span>
								</div>
							</div>
<!-- 							<div class="form-group">
								<label for="tell">연락처</label>
								<div class="input-group pb-modalreglog-input-group">
									<input type="text" class="form-control" id="mtell"
										placeholder="연락처"> <span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span>
								</div>
							</div> -->
							<div class="form-group">
								<label for="question">인증질문</label>
								<div class="input-group pb-modalreglog-input-group">
									<select class="custom-select" name="question" id="inputGroupSelect01">
										<option value="">질문을 선택해주세요</option>
										<option value="1">아버지의 성함은?</option>
										<option value="2">내가 태어난 곳은?</option>
										<option value="3">내 어렸을 때 별명은?</option>
										<option value="4">내 보물 1호는?</option>
										<option value="5">나의 첫사랑은?</option>
										<option value="6">나의 좌우명은?</option>
										<option value="7">내가 제일 좋아하는 음식은?</option>
										<option value="8">내가 가장 흥미로워하는 장소는?</option>
									</select> <span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span>
								</div>
							</div>
							<div class="form-group">
								<label for="question">질문답변</label>
								<div class="input-group pb-modalreglog-input-group">
									<input type="text" name="mquestion" class="form-control" id="mquestion"
										placeholder="답변"> <span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span>
								</div>
							</div>
												<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">검색</button>
					</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>