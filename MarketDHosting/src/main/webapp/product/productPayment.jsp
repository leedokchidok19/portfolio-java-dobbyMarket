<%@ page import ="com.team.marketd.domain.ProductVo" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<c:import url="/include/indexHeader.jsp" />
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
	
<c:set var="pv" value="${pv}" />
<c:set var="fileCallPath" value="http://thdkow.cafe24.com/upload/${pv.uploadPath}/${pv.uuid}_${pv.fileName}"/>

<script src="${myContextPath}/resources/js/jquery.min.js"></script>
<script src="${myContextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
				
				$(document).ready(function() {
				
				
				$("#payment2").click(function(){//#으로 id를 호출하여 jquery를 사용하였다.
					
				 	if($("#drecipt").val() == ""){//이처럼 텍스트에 들어온 값을 비교하려면 .val을 사용하여야 한다. #subject만 했을시 x
					
					$("#sid1").html("<b>수령인을 입력해주세요</b>");
					$("#focus").focus();
					$("#sid1").show();
					$("#sid1").hide(5000);//하이드를사용하여서 출력한 문구를 지웠는데 다시눌렀을때 출력이되지않아 show를 이용하였다.
					} 
				 	else if($("#dtell").val() == ""){
						$("#sid2").html("<b>연락처를 입력해주세요</b>"); 
						$("#focus").focus();
						$("#sid2").show();
						$("#sid2").hide(5000);
						}
				 	else if($("#daddr").val() == ""){
					
					$("#sid3").html("<b>주소를 입력해주세요</b>");
					$("#focus").focus();
					$("#sid3").show();
					$("#sid3").hide(5000);
					}
					else if($("#ddetails").val() == ""){
						$("#sid4").html("<b>상세주소를 입력해주세요</b>");
						$("#focus").focus();
						$("#sid4").show();
						$("#sid4").hide(5000);
						}
					else if($("#paname").val() == ""){
						$("#sid5").html("<b>입금자명을 입력해주세요</b>");
						$("#focus").focus();
						$("#sid5").show();
						$("#sid5").hide(5000);
						}else{
							document.getElementById('frmpp').submit();
						}
						
							
							
							return;
					});	
				
				
			}); 
	
</script>

<div class="container">

	<div class="row">
	
	<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Payment</h2>
          <h3 class="section-subheading text-muted">주문/결제</h3>
        </div>
      </div>
	
		<div class="col-lg-9 my-5">
			<div class="row clearfix">
				<table class="table table-hover my-4">
					<thead>
						<tr>
							<th scope="col" class="text-center">상품</th>
							<th scope="col" class="text-center" width="500">주문정보</th>
							<th scope="col" class="text-center" width="150">판매자</th>
							<th scope="col" class="text-center" width="150">상품가격</th>
							<th scope="col" class="text-center" width="150">배송비</th>
							<th scope="col" class="text-center" width="150">할인</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><a href="#"> <img
									src="${fileCallPath}" height="100" width="100"
									alt=""></a></th>
							<td><a href="#">${pv.psubject}</a></td>
							<td class="text-center"><a href="#">${pv.mname}님</a></td>
							<td class="text-center">${pv.pmoney}원</td>
							<td class="text-center">${pv.pfee}원</td>
							<td class="text-center">0원</td>
						</tr>
					</tbody>
				</table>
				<h4>총 1개 상품</h4>
				<form id="frmpp" action="${myContextPath}/Product/ProductPaymentAction.dobby?pidx=${pv.pidx}" method="post">
				
				<input type="hidden"  name="omoney" value="${pv.pmoney+pv.pfee}"> <!-- 가격 -->
				
				
				
				<table class="table" id="focus">
					<thead>
						<tr>
							<th scope="col" class="text-center">상품가격</th>
							<th scope="col"></th>
							<th scope="col" class="text-center">택배비</th>
							<th scope="col"></th>
							<th scope="col" class="text-center">할인</th>
							<th scope="col"></th>
							<th scope="col" class="text-center">합계</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center">${pv.pmoney}원</td>
							<td class="text-center"><img alt="+" height="25" width="25"
								src="/resources/img/plus.png"></td>
							<td class="text-center">${pv.pfee}원</td>
							<td class="text-center"><img alt="-" height="25" width="25"
								src="/resources/img/minus.png"></td>
							<td class="text-center">0원</td>
							<td class="text-center"><img alt="=" height="20" width="20"
								src="/resources/img/equal.png"></td>
							<td class="text-center">${pv.pmoney+pv.pfee}원</td>
						</tr>
						<tr>
							<td colspan="7">
								<p style="font-size: 30px; text-align: center;">배송정보</p>
								<div class="input-group  col-md-8">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">수&nbsp;&nbsp;령&nbsp;&nbsp;인&nbsp;</span>
									</div>
									<input type="text" class="form-control" id="drecipt" name="drecipt"placeholder="수령인">
									<span id="sid1"></span>
								</div>
								<div class="input-group  col-md-8 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">연&nbsp;&nbsp;락&nbsp;&nbsp;처&nbsp;</span>
									</div>
									<input type="text" class="form-control" id="dtell" name="dtell" placeholder="연락처">
									<span id="sid2"></span>
								</div>
								<div class="input-group  col-md-8 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp;</span>
									</div>
									<input type="text" class="form-control" id="daddr" name="daddr" placeholder="주소-지역정보">
									<span id="sid3"></span>
								</div>
								<div class="input-group  col-md-8 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">상세&nbsp;주소&nbsp;</span>
									</div>
									<input type="text" class="form-control" id="ddetails" name="ddetails" placeholder="주소-건물정보">
									<span id="sid4"></span>
								</div>
								<div class="input-group  col-md-8 my-4">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">배송&nbsp;메모&nbsp;</span>
										<span id="sid1"></span>
									</div>
									<input type="text" class="form-control" name="dmemo" placeholder="배송메모">
									
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="7">
								<p style="font-size: 30px; text-align: center;">결제방법</p>
								<div class="col-md-8 my-3">무통장 입금</div>
								<div class="input-group col-md-14">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">&nbsp;입금자명&nbsp;</span>
									</div>
									<input type="text" class="form-control" id="paname" name="paname" placeholder="입금자명">
									<span id="sid5"></span>
								</div>
								<div class="col-md-8 my-3">입금계좌:&nbsp;&nbsp;&nbsp;&nbsp;농협&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;301123456789&nbsp;&nbsp;&nbsp;&nbsp;Dobby</div>
							</td>
						</tr>
						<tr>
							<td colspan="7" id="flip1"><p style="font-size: 15px; text-align: center;">이용약관▼</p></td>
						</tr>
						<tr id="panel1">
							<td colspan="7">제 1 장 총 칙<br /> 제 1 조 (목적)본 약관은 서비스 이용자가
								주식회사 (이하 “회사”라 합니다)가 제공하는 온라인상의 인터넷 서비스(이하 “서비스”라고 하며, 접속 가능한
								유∙무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는 모든 “서비스”를 의미합니다. 이하 같습니다)에
								회원으로 가입하고 이를 이용함에 있어 회사와 회원(본 약관에 동의하고 회원등록을 완료한 서비스 이용자를 말합니다.
								이하 “회원”이라고 합니다)의 권리•의무
							</td>
						</tr>
						<tr><td colspan="7"><input type="checkbox">&nbsp;약관동의</td>
						</tr>
						<tr>
						<td colspan="2" class="text-center align-middle" style="font-size: 15px;">총 1개 상품</td>
						<td colspan="5" class="text-right" style="font-size: 35px;">${pv.pmoney+pv.pfee}</td>
						<input type="hidden" name="omoney" value="${pv.pmoney+pv.pfee}"/>
						</tr>
						<tr>
						<td colspan="7" class="text-center"><button type="button" id="payment2" class="btn btn-outline-danger" style="font-size: 20px;">결제하기</button></td>
						<tr>
					</tbody>
				</table>
				</form>
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