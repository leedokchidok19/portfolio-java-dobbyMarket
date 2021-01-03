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
h1{
text-align: center;
}
.table{
color: black;
}
.table th{
border-right: 1px solid #dee2e6;
background-color: rgba(30,30,30,0.3);
}
.table td:hover{
cursor: pointer;
}
input[type="text"],
input[type="password"],
.select,#selectEmail{
background-color: rgba(30,30,30,0.3);
border: none;
vertical-align: middle;
height: 25px;
}

</style>
<div class="container">

	<div class="row">
	
	
	<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 text-center">
          <h2 class="section-heading text-uppercase">Update Profile</h2>
          <h3 class="section-subheading text-muted">회원정보 수정</h3>
        </div>
      </div>

		<div class="col-lg-8 my-5">
			<div class="row clearfix my-4">
			<form name="form1">
				<table class="table">
					<input type="hidden" value="${mv.midx}" name="midx">
					<tbody>
						<tr>
							<th scope="row">아 이 디</th>
							<td>${mv.mid}</td>
						</tr>
								<tr>
							<th scope="row">이름</th>
							<td>${mv.mname}</td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td><input type="password" name="pwd" size="7"></td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인</th>
							<td><input type="password" name="pwd2" size="7"></td>
						</tr>
						<tr>
							<th scope="row">이 메 일</th>
							<td>
								<input type="text" name="mmail1" size="9">
								@
								<select id="selectEmail" name="mmail2" size="1">
									<option value="" selected="">이메일을 선택해주세요</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="outlook.com">outlook.com</option>
									<option value="yahoo.com">yahoo.com</option>
									<option value="daum.com">daum.com</option>
									<option value="aol.com">aol.com</option>
									<option value="nate.com">nate.com</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="epost.kr">epost.kr</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="1">직접 입력</option>
							</select> <input type="text" id="str_email02" name="mmail3" size="9"
								disabled=""></td>
						</tr>
						<tr>
							<th scope="row">휴대전화</th>
							<td><select class="select" name="phone1">
									<option value="">선택</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
									<option value="010">010</option>
							</select>- <input type="text" size="4" maxlength="4" name="phone2">- <input
								type="text" size="4" maxlength="4" name="phone3"></td>
						</tr>
						<tr>
							<th scope="row">거래 계좌</th>
							<td><select class="select" name="caidx">
									<option value="">은행 선택</option>
									<option value="1">하나은행</option>
									<option value="2">신한은행</option>
									<option value="3">농협</option>
									<option value="4">IBK기업은행</option>
									<option value="5">외환은행</option>
									<option value="6">KB국민은행</option>
									<option value="7">우리은행</option>
									<option value="8">새마을금고</option>
							</select> <input type="text" name="maccount" size="20"></td>
						</tr>
						<tr>
							<th scope="row">카톡 아이디</th>
							<td><input type="text" name="mkakao" size="10"></td>
						</tr>
						<tr>
							<th scope="row">인증 질문</th>
							<td><select class="select">
									<option value="">질문을 선택해주세요</option>
									<option value="1">아버지의 성함은?</option>
									<option value="2">내가 태어난 곳은?</option>
									<option value="3">내 어렸을 때 별명은?</option>
									<option value="4">내 보물 1호는?</option>
									<option value="5">나의 첫사랑은?</option>
									<option value="6">나의 좌우명은?</option>
									<option value="7">내가 제일 좋아하는 음식은?</option>
									<option value="8">내가 가장 흥미로워하는 장소는?</option>
							</select> <input type="text" name="mquestion" size="10"></td>
						</tr>
					</tbody>
				</table>
				<div class="col align-self-end">
				<a class="float-right btn btn-outline-danger" onclick="location.href='index.jsp'">취소</a>
				<button type="button" class="float-right btn btn-outline-primary mr-3" onclick="check();">수정</button>
			</div>
				</form>		
			</div>
			<!-- End your code here -->
		</div>
	</div> <!-- row -->
</div>
<script>
function check() {
	var frm = document.form1;
	var midx = frm.midx.value;
	var pwd = frm.pwd.value;
	var pwd2 = frm.pwd2.value;
	var mmail1 = frm.mmail1.value;
	var mmail2 = frm.mmail2.value;
	var phone1 = frm.phone1.value;
	var phone2 = frm.phone2.value;
	var phone3 = frm.phone3.value;
	var caidx = frm.caidx.value;
	var maccount = frm.maccount.value;
	var mkakao = frm.mkakao.value;
/* 	var question = frm.question.value;
	alert(question);
	var mquestion = frm.mquestion.value; 
	alert(mquestion);
	 */
 	if (pwd == "") {
		alert("비밀번호를 입력하세요");
		frm.pwd.focus();
		return;
	}else if (pwd2 == "") {
		alert("비밀번호 확인을 입력하세요");
		frm.pwd2.focus();
		return;
	}else if (pwd != pwd2) {
		alert("비밀번호가 일치하지않습니다.");
		frm.pwd.value = "";
		frm.pwd2.value = "";
		frm.pwd.focus();
		return;
	}else if ( mmail1 ==""){
		alert("본인의 이메일을 입력해주세요.");
		frm.mmail1.focus();
		return;
	}else if (mmail2 == ""){
		alert("본인의 이메일을 선택해주세요.");
		frm.mmail2.focus();
		return;
	}else if (phone1 ==""){
		alert("휴대폰 번호 앞자리를 선택해주세요.");
		frm.phone1.focus();
		return;
	}else if(phone2 == ""){
		alert("휴대폰 번호 가운데 4자리를 입력해주세요.");
		frm.phone2.focus();
		return;
	}else if(isNaN(phone2) == true){
		alert("휴대폰 번호는 숫자만 입력해주세요.");
		frm.phone2 = "";
		frm.phone2.focus();
		return;
	}else if(phone3 == ""){
		alert("휴대폰 번호 마지막 4자리를 입력해주세요.");
		frm.phone3.focus();
		return;
	}else if(isNaN(phone3) == true){
		alert("휴대폰 번호는 숫자만 입력해주세요.");
		frm.phone3 = "";
		frm.phone3.focus();
		return;
	}else if(caidx == ""){
		alert("거래계좌를 선택해주세요.");
		frm.cadix.focus();
		return;
	}else if(maccount == ""){
		alert("계좌번호를 입력해주세요.");
		frm.maccount.focus();
		return;
	}else if(isNaN(maccount) == true){
		alert("계좌번호는 숫자만 입력해주세요.");
		frm.maccount = "";
		frm.maccount.focus();
		return;
	}else if(mkakao == ""){
		alert("카카오톡 아이디를 입력해주세요.")
		frm.mkakao.focus();
		return;
	}
 	
	frm.action = "${myContextPath}/memberUpdate.dobby";
	frm.method = "post"; // post 방식으로 데이터 전달 post:  파라미터에 노출이안됨 get: 파라미터에 노출됨
	frm.submit();
	return;
}
</script>
<script>
	$('#selectEmail').change(function() {
		$("#selectEmail option:selected").each(function() {
			if ($(this).val() == '1') { //직접입력일 경우 
				$("#str_email02").val(''); //값 초기화 
				$("#str_email02").attr("disabled", false); //활성화
			} else { //직접입력이 아닐경우 
				$("#str_email02").val($(this).text()); //선택값 입력
				$("#str_email02").attr("disabled", true); //비활성화 
			}
		});
	});
	</script>
	<c:import url="/include/indexFooter.jsp" />
