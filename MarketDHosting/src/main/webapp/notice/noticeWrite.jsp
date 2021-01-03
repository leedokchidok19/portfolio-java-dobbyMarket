<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<c:import url="/include/indexHeader.jsp" />
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />


<div class="container">

	<div class="row">

<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">NoticeWrite</h2>
          <h3 class="section-subheading text-muted">공지사항 작성</h3>
        </div>
      </div>

		<div class="col-lg-9 my-5">

			<div class="row my-5">
				<form class="" action="${myContextPath}/Notice/NoticeWriteAction.dobby" method="post">
					<fieldset>

						<div class="form-group">
							<span class="col-md-1 offset-md-2 text-xs-center"></span>
							<div class="col-md-8"><input id="fname"
									name="nsubject" type="text" placeholder="공지 제목을 입력해주세요."
									class="form-control" size="120">
							</div>
						</div>

						<div class="form-group">
							<span class="col-md-1 offset-md-2 text-xs-center"></span>
							<div class="col-md-8">
								<textarea class="form-control" id="message" name="ncontent"
									placeholder="공지 내용을 정확히 입력해주세요." rows="15" size="150"></textarea>
							</div>
						</div>

						<div class="form-group" style="text-align:right;">
							<div class="col-md-8 text-xs-center">
								<button type="submit" class="btn btn-primary btn-lg"
									name="submit">등록</button>
								<a class="btn btn-danger btn-lg" href="${myContextPath}/Notice/NoticeList.dobby">취소</a>
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