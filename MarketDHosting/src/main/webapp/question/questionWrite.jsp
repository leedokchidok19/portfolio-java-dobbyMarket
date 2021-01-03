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
          <h2 class="section-heading text-uppercase">Question</h2>
          <h3 class="section-subheading text-muted">질문하기</h3>
        </div>
      </div>
		<div class="col-lg-9 my-5">

			<div class="row my-5">
				<form class="" action="${myContextPath}/Question/QuestionWriteAction.dobby" method="post">
					<fieldset>

						<div class="form-group">
							<span class="col-md-1 offset-md-2 text-xs-center"></span>
							<div class="col-md-8"><input id="qsubject"
									name="qsubject" type="text" placeholder="문의 제목을 입력해주세요."
									class="form-control" size="120">
							</div>
						</div>
						<div class="form-group">
							<span class="col-md-1 offset-md-2 text-xs-center"></span>
							<div class="col-md-8">
								<select class="form-control" name="caidx">
									<option value="0" selected="selected">유형</option>
									<option value="201">회원정보</option>
									<option value="202">구매</option>
									<option value="203">판매</option>
									<option value="204">신고</option>
									<option value="205">기타</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<span class="col-md-1 offset-md-2 text-xs-center"></span>
							<div class="col-md-8">
								<textarea class="form-control" id="qcontent" name="qcontent"
									placeholder="문의 내용을 정확히 입력해주세요." rows="15" size="120"></textarea>
							</div>
						</div>


						<div class="form-group">
							<div class="col-md-8 text-xs-center"  style="text-align:right;">
								<button type="submit" class="btn btn-primary btn-lg"
									name="submit">등록</button>
								<a class="btn btn-danger btn-lg" href="${myContextPath}/Question/QuestionList.dobby">취소</a>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		</div>
		</section>
	</div>

</div>
<link rel="stylesheet" type="text/css"
	href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>

<script type="text/javascript">
	jQuery(function($) {
		$("#files").shieldUpload();
	});
</script>
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