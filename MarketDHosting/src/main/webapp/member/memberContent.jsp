<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<c:import url="/include/indexHeader.jsp" />
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
	
<%@ page import ="com.team.marketd.domain.MemberVo" %>

<c:set var="mv" value="${mv}" />
<style>

.row{
flex-direction: row;
justify-content: center;
midth:100%;
}
input[type="password"]{
background-color: rgba(30,30,30,0.3);
color: rgba(200,130,35,6);
}
h1{
text-align: center;
}
.table{
color: black;
}
.td2{
color: black;
}
.table th{
border-right: 1px solid #dee2e6;
background-color: rgba(30,30,30,0.3);
}
.table td:hover{
font-weight: bold;
cursor: pointer;
}
input[type="password"]{
 border: none;
 }
</style>
<script>
function check() {
	var frm = document.form1;
	var pwd = frm.pwd.value;
	var pwd2 = frm.pwd2.value; 
	if (pwd == "") {
		alert("비밀번호를 입력하세요.");
		frm.pwd.focus();
		return;	
	}else if(pwd != pwd2){
		alert("비밀번호가 맞지 않습니다.")
		frm.pwd.focus();
		return;	
	}
		frm.action = "${myContextPath}/memberCheck.dobby";
		frm.method = "post"; // post 방식으로 데이터 전달 post:  파라미터에 노출이안됨 get: 파라미터에 노출됨
		frm.submit();
		return;
	}
	
</script>
<div class="container">
	<div class="row">
	
	<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 text-center">
          <h2 class="section-heading text-uppercase">My Profile</h2>
          <h3 class="section-subheading text-muted">내정보 보기</h3>
        </div>
      </div>
	
		<div class="col-lg-8 my-5">
			<div class="col-lg-8 my-4">
			<form name="form1">
				<table class="table">
					<tbody>
						<tr>
							<th scope="row" class="text-center td2">아 이 디</th>
							<td>${mv.mid}</td>
						</tr>
						<tr>
							<th scope="row" width="100px" class="text-center td2">비밀번호</th>
							<td>
							<input type="password" name="pwd" size="13">
							<input type="hidden" name="pwd2" value="${mv.mpwd }">
							</td>
						</tr>
						<tr>
							<th scope="row" class="text-center td2">이    름</th>
							<td>${mv.mname}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center td2">생년월일</th>
							<td>${mv.mbirth}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center td2">성    별</th>
							<td>${mv.msex}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center td2">이 메 일</th>
							<td>${mv.mmail}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center td2">휴대전화</th>
							<td>${mv.mtell}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center td2">거래 계좌</th>
							<td>${mv.maccount}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center td2">카톡 ID</th>
							<td>${mv.mkakao}</td>
						</tr>
						<tr>
							<th scope="row" class="text-center td2">인증 질문</th>
							<td>${mv.mquestion}</td>
						</tr>
					</tbody>
				</table>	
				<div class="col align-self-end"> 
				
				<button type="button" class="float-right btn btn-outline-primary" onclick="check();">수정 </button>
				</div>		
			</form>
							
			</div>
			<!-- End your code here -->
		</div>
		</div>
		</section>
	</div>
</div>

	<c:import url="/include/indexFooter.jsp" />