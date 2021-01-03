<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:import url="/include/indexHeader.jsp" />

<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
<c:set var="dv" value="${requestScope.dv}"/>

<div class="container">

	<div class="row">

<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio" style="text-align: center;">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Start Delivery</h2>
          <h3 class="section-subheading text-muted">배송 시작.</h3>
        </div>
      </div>

		<div class="col-lg-9 my-5">
			<form action="${myContextPath}/Product/ProductStartDeliveryAction.dobby" method="post">
			<div class="row clearfix my-5">
				<table class="table">
					<tbody>

						<tr>
							<td>
								<p style="font-size: 30px; text-align: center;">배송정보</p>
								<div class="input-group  col-md-13">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">수&nbsp;&nbsp;령&nbsp;&nbsp;인&nbsp;</span>
									</div>
									<p class="form-control" >${dv.drecipt}</p>
								</div>
								<div class="input-group  col-md-13 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">연&nbsp;&nbsp;락&nbsp;&nbsp;처&nbsp;</span>
									</div>
									<p class="form-control" >${dv.dtell}</p>
								</div>
								<div class="input-group  col-md-13 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;</span>
									</div>
									<p class="form-control" >${dv.daddr}</p>
								</div>
								<div class="input-group  col-md-13 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">상세&nbsp;주소&nbsp;</span>
									</div>
									<p class="form-control" >${dv.ddetails} </p>
								</div>
								<div class="input-group  col-md-13 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">배송&nbsp;메모&nbsp;</span>
									</div>
									<p class="form-control" >${dv.dmemo}</p>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								
							
								<p style="font-size: 30px; text-align: center;">택배정보</p>

								<div class="input-group  col-md-13">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">택&nbsp;배&nbsp;&nbsp;회&nbsp;사</span>
									</div>
									<select class="custom-select" id="caidx" name="caidx">
								<option selected>택배회사</option>
								<option value="101">동부택배</option>
								<option value="102">KGB택배</option>
								<option value="103">CJ대한통운택배</option>
								<option value="104">한진택배</option>
								<option value="105">로젠택배</option>
								<option value="106">YELLOWCAP택배</option>
								<option value="107">현대택배</option>
								<option value="108">우체국택배</option>
							</select>
								</div>
								<div class="input-group  col-md-13 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" >운송장번호</span>
									</div>
									<input type="text" name="dwaybill" id="dwaybill" 
									class="form-control" placeholder="운송장번호를 입력해주세요.">
									<input type="hidden" name="oidx" id="oidx" value="${dv.oidx}">
									
								</div>
								
							
							</td>
						</tr>
						<tr>
							<td class="text-center"><button type="submit"
									class="btn btn-outline-danger" style="font-size: 20px;">배송하기</button></td>
						<tr>
						
					</tbody>
				</table>
			</div>
			<!-- /.row -->
				</form>
		</div>
		<!-- /.col-lg-9 -->

	 </div>
	</section>

	</div>
	<!-- /.row -->

</div>

	<c:import url="/include/indexFooter.jsp" />