<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:import url="/include/indexHeader.jsp" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#panel1").slideToggle(0);
		$("#panel2").slideToggle(0);
		$("#panel3").slideToggle(0);
		$("#panel4").slideToggle(0);
		$("#panel5").slideToggle(0);
		$("#panel6").slideToggle(0);
		$("#panel7").slideToggle(0);
		$("#panel8").slideToggle(0);
		$("#panel9").slideToggle(0);
		$("#panel10").slideToggle(0);

		$("#flip1").click(function() {
			$("#panel1").slideToggle("700");
		});
		$("#flip2").click(function() {
			$("#panel2").slideToggle("700");
		});
		$("#flip3").click(function() {
			$("#panel3").slideToggle("700");
		});
		$("#flip4").click(function() {
			$("#panel4").slideToggle("700");
		});
		$("#flip5").click(function() {
			$("#panel5").slideToggle("700");
		});
		$("#flip6").click(function() {
			$("#panel6").slideToggle("700");
		});
		$("#flip7").click(function() {
			$("#panel7").slideToggle("700");
		});
		$("#flip8").click(function() {
			$("#panel8").slideToggle("700");
		});
		$("#flip9").click(function() {
			$("#panel9").slideToggle("700");
		});
		$("#flip10").click(function() {
			$("#panel10").slideToggle("700");
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
          <h2 class="section-heading text-uppercase">FAQ</h2>
          <h3 class="section-subheading text-muted">자주묻는 질문</h3>
        </div>
      </div>

		<div class="col-lg-9 my-5">

			<div class="row my-5">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">종류</th>
							<th scope="col">질문</th>
							<th scope="col">작성자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">Q1</th>
							<td>판매</td>
							<td id="flip1">판매하려는 물품은 어떻게 등록하나요?</td>
							<td>운영자</td>
						</tr>
						<tr id="panel1">
							<td></td>
							<td colspan="3" >판매하시려는 아이템은 홈 화면 상단 오른쪽에 [판매하기]
								버튼을 누른 후 <br /> 아이템 제목, 이미지, 상세설명, 카테고리, 상태 등의 세부정보를 입력하여<br />
								등록하실 수 있습니다.
							</td>
						</tr>
						<tr>
							<th scope="row">Q2</th>
							<td>판매</td>
							<td id="flip2">판매하면 안되는 항목이 있나요?</td>
							<td>운영자</td>
						</tr>
						<tr id="panel2">
							<td></td>
							<td colspan="3" >판매하시려는 아이템은 홈 화면 상단 오른쪽에 [판매하기]
								버튼을 누른 후 <br /> 아이템 제목, 이미지, 상세설명, 카테고리, 상태 등의 세부정보를 입력하여<br />
								등록하실 수 있습니다.
							</td>
						<tr>
							<th scope="row">Q3</th>
							<td>검색</td>
							<td id="flip3">아이템 검색은 어떻게 하나요?</td>
							<td>운영자</td>
						</tr>
						<tr id="panel3">
							<td></td>
							<td colspan="3" >판매하시려는 아이템은 홈 화면 상단 오른쪽에 [판매하기]
								버튼을 누른 후 <br /> 아이템 제목, 이미지, 상세설명, 카테고리, 상태 등의 세부정보를 입력하여<br />
								등록하실 수 있습니다.
							</td>
						<tr>
							<th scope="row">Q4</th>
							<td>기타</td>
							<td id="flip4">유의해야 하는 행동이 있나요?</td>
							<td>운영자</td>
						</tr>
						<tr id="panel4">
							<td></td>
							<td colspan="3" >판매하시려는 아이템은 홈 화면 상단 오른쪽에 [판매하기]
								버튼을 누른 후 <br /> 아이템 제목, 이미지, 상세설명, 카테고리, 상태 등의 세부정보를 입력하여<br />
								등록하실 수 있습니다.
							</td>
						<tr>
							<th scope="row">Q5</th>
							<td>회원</td>
							<td id="flip5">회원정보 수정은 어떻게 하나요?</td>
							<td>운영자</td>
						</tr>
						<tr id="panel5">
							<td></td>
							<td colspan="3" >판매하시려는 아이템은 홈 화면 상단 오른쪽에 [판매하기]
								버튼을 누른 후 <br /> 아이템 제목, 이미지, 상세설명, 카테고리, 상태 등의 세부정보를 입력하여<br />
								등록하실 수 있습니다.
							</td>
						<tr>
							<th scope="row">Q6</th>
							<td>회원</td>
							<td id="flip6">판매자 등급이 무엇인가요?</td>
							<td>운영자</td>
						</tr>
						<tr id="panel6">
							<td></td>
							<td colspan="3" >판매하시려는 아이템은 홈 화면 상단 오른쪽에 [판매하기]
								버튼을 누른 후 <br /> 아이템 제목, 이미지, 상세설명, 카테고리, 상태 등의 세부정보를 입력하여<br />
								등록하실 수 있습니다.
							</td>
						<tr>
							<th scope="row">Q7</th>
							<td>회원</td>
							<td id="flip7">탈퇴는 어떻게 하나요?</td>
							<td>운영자</td>
						</tr>
						<tr id="panel7">
							<td></td>
							<td colspan="3" >판매하시려는 아이템은 홈 화면 상단 오른쪽에 [판매하기]
								버튼을 누른 후 <br /> 아이템 제목, 이미지, 상세설명, 카테고리, 상태 등의 세부정보를 입력하여<br />
								등록하실 수 있습니다.
							</td>
						<tr>
							<th scope="row">Q8</th>
							<td>판매</td>
							<td id="flip8">판매글 삭제는 어떻게 하나요?</td>
							<td>운영자</td>
						</tr>
						<tr id="panel8">
							<td></td>
							<td colspan="3" >판매하시려는 아이템은 홈 화면 상단 오른쪽에 [판매하기]
								버튼을 누른 후 <br /> 아이템 제목, 이미지, 상세설명, 카테고리, 상태 등의 세부정보를 입력하여<br />
								등록하실 수 있습니다.
							</td>
						<tr>
							<th scope="row">Q9</th>
							<td>게시판</td>
							<td id="flip9">홈 화면에 보이는 물품들은 무엇인가요?</td>
							<td>운영자</td>
						</tr>
						<tr id="panel9">
							<td></td>
							<td colspan="3" >판매하시려는 아이템은 홈 화면 상단 오른쪽에 [판매하기]
								버튼을 누른 후 <br /> 아이템 제목, 이미지, 상세설명, 카테고리, 상태 등의 세부정보를 입력하여<br />
								등록하실 수 있습니다.
							</td>
						<tr>
							<th scope="row">Q10</th>
							<td>판매</td>
							<td id="flip10">판매한 물품이 분실 또는 파손되었을 경우 어떻게하나요?</td>
							<td>운영자</td>
						</tr>
						<tr id="panel10">
							<td></td>
							<td colspan="3" >판매하시려는 아이템은 홈 화면 상단 오른쪽에 [판매하기]
								버튼을 누른 후 <br /> 아이템 제목, 이미지, 상세설명, 카테고리, 상태 등의 세부정보를 입력하여<br />
								등록하실 수 있습니다.
							</td>
					</tbody>
				</table>

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