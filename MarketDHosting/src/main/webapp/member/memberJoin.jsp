<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<c:import url="/include/indexHeader.jsp" />
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />
	
<c:set var="mv" value="${mv}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
margin: 0;
padding: 0;
background: #efefef;
color: #777;
font-family: sans-serif;
font-weight: 300;
}
#login-box{
	position: relative;
	margin: 7% auto;
	height: 600px;
	width: 800px;
	background: #fff;
	box-shadow: 0 2px 4px rbga(0, 0, 0, 0.6);
}
.left-box{
position: absolute;
top: 0;
left: 0;
box-sizing: border-box;
padding: 40px;
width: 400px;
height: 600px;
}
h1 {
	margin: 0 0 20px 0;
	font-weight: 300;
	font-size: 28px;
}
input[type="text"],
input[type="password"]{
margin-bottom:5px;
box-sizing: border-box;
padding: 4px;
height: 32px;
border: none;
outline: none;
border-bottom: 1px solid #aaa;
font-family: sans-serif;
font-weight: 400;
font-size: 15px;
transition: 0.2s ease;
}
.text,
input[type="password"],
.intext{
width: 220px;
}
.sex-box{
display: block;
}
.selectEmail, .phone, .bank, .secret{
}
input[type="submit"]{
margin-bottom: 28px;
width: 120px;
height: 32px;
background: #f44336;
border: none;
border-radius: 2px;
color: #fff;
font-family: sans-serif;
font-weight: 500;
text-transform: uppercase;
transition: 0.2s ease;
cursor: pointer;
}
input[type="submit"]:hover,
input[type="submit"]:focus {
	background: #ff5722;
	transition: 0.2s ease;
}
.right-box{
position: absolute;
top: 0;
right: 0;
box-sizing: border-box;
padding: 90px;
width: 400px;
height: 600px;
background-size: cover;
background-position: center;
}
.or{
position: relative;
top: 45%;
left: 48%;
width: 40px;
height: 40px;
background: #efefef;
border-radius: 50%;
box-shadow: 0 2px 4px rgba(0, 0, 0, 0.6);
line-height:  40px;
text-align: center;
}
.right-box .signinwith{
	 display: block;
	 margin-bottom: 40px;
	 font-size: 28px;
	 color: #fff;
	 text-align: center;
	 text-shadow: 0 2px 4px rgba(0, 0, 0, 0.6);
}
button.social{
margin-bottom: 20px;
width: 220px;
height: 36px;
border: none;
border-radius: 2px;
color: #fff;
font-family: sans-serif;
font-weight: 500;
transition : 0.2s ease;
cursor: pointer;
}
.facebook{
	background: #32508e;
}
.twitter{
	background: #55acee;
}
.google{
	background: #dd4b39;
}
.rule{
position: relative;
margin:auto;
width: 800px;
height: auto;
}
.flip1, .flip1-1, p{
font-size:24px;
font-weight: bold;
text-align: center;
}
</style>
</head>
<body>
<div id="login-box">
	<div class="left-box">
		<h1> sign up</h1>
		<form name="form1">
				<input class="text" type="text" name="id" placeholder="아이디">
				<button type="button" id="idCheck" name="idCheck"
					class="btn btn-outline-success" style="font-size: 12px;"
					onclick="idCheck();">중복체크</button>
			
			<input type="password" name="pwd" placeholder="비밀번호">
			<input type="password" name="pwd2" placeholder="비밀번호 확인">
			<input class="text" type="text" name="name" placeholder="이름">
			<input class="text" type="text" name="birth" placeholder="생년월일" maxlength="6">
		<div class="sex-box">
			<input type="radio" name="sex" placeholder="남자" value="M">남
			<input type="radio" name="sex" placeholder="여자" value="F">여
		</div>	
			<input class="small-text" type="text" name="mmail1" placeholder="이메일" maxlength="9">
		@
			<select style="margin-right: 10px" id="selectEmail" name="mmail2" size="1" width="100px">
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
								</select>
				<input type="text" id="str_email02" name="mmail3" size="9" disabled="">
							<div class="phone">		
									<select name="phone1">
										<option value="">선택</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
								- 
								<input type="text" name="phone2" size="4" maxlength="4">
								-
								<input type="text" name="phone3" size="4" maxlength="4">
							</div>	
							<div class="bank">
								<select name="caidx">
										<option value="">은행 선택</option>
										<option value="1">하나은행</option>
										<option value="2">신한은행</option>
										<option value="3">농협</option>
										<option value="4">IBK기업은행</option>
										<option value="5">외환은행</option>
										<option value="6">KB국민은행</option>
										<option value="7">우리은행</option>
										<option value="8">새마을금고</option>
								</select>
			<input type="text" name="maccount" size="20" placeholder="계좌번호">
							</div>	
			<input class="intext" type="text" name="mkakao" size="13" placeholder="카카오 아이디를 입력해주세요">
							<div class="secret">	
								<select name="question">
										<option value="">질문을 선택해주세요</option>
										<option value="1">아버지의 성함은?</option>
										<option value="2">내가 태어난 곳은?</option>
										<option value="3">내 어렸을 때 별명은?</option>
										<option value="4">내 보물 1호는?</option>
										<option value="5">나의 첫사랑은?</option>
										<option value="6">나의 좌우명은?</option>
										<option value="7">내가 제일 좋아하는 음식은?</option>
										<option value="8">내가 가장 흥미로워하는 장소는?</option>
								</select>
			<input class="intext" type="text" name="mquestion" size="10" placeholder="답을 적어주세요">
							</div>	
		</form>				
		<input type="submit" name="signup-button" value="가입" onclick="check();">
		<input type="submit" name="signup-button" value="취소"
							onclick="location.href='index2.jsp'" />
	</div>
	
	<div class="right-box" style="background-image: url('${myContextPath}/resources/img/iphone-fixa.jpg');">
		
	</div>
</div>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('#idCheck').click(function() {
			var id = $('#id').val();
			
			$.ajax({
				type : "GET",
				url : "${myContextPath}/Member/"+id+"/idCheck.dobby",
				datatype : "json",
				cache : false,
				error : function() {
					alert("error");
				},
				success : function(data) {
					/* var cnt_data = JSON.stringify(data); json 객체를 string 타입으로 형변환 하는 메소드*/ 
				cnt_data = data.cnt; //.cnt를 통해서 HashMap에 담아준 cnt 객체의 리턴값을 뽑아온다
					if(data.cnt == 1){
						alert("이미 존재하는 아이디입니다.");
						
/* 	document.getElementById("idCheck").btn btn-outline-success = "btn btn-outline-danger"; */						
						 return;
					}else if(data.cnt == 0){
						alert("사용 가능한 아이디 입니다.");
						return;
					} //조건문 끝
				} //success 끝
			});//ajax 끝
		});
		
	});
	
	//jquery id는 : '#id', class는 :'.id'

</script>
<%--  <script>
	function idcheck(){
		alert("중복체크실행?");
		var frm = document.form1;
		var id = frm.id.value;
		
		frm.action = "<%=request.getContextPath() %>idCheck.dobby";
		frm.method = "post"; // post 방식으로 데이터 전달 post:  파라미터에 노출이안됨 get: 파라미터에 노출됨
		frm.submit();
		return;
}
</script>  --%>
<script type="text/javascript">
	function check() {
		alert("체크확인");
		//var id2 = document.getElementsByName("id")[0].value;
		var frm = document.form1;
		var id = frm.id.value;
		var pwd = frm.pwd.value;
		var pwd2 = frm.pwd2.value;
		var name = frm.name.value;
		var birth = frm.birth.value;
		var sex = frm.sex.value;
		var mmail1 = frm.mmail1.value;
		var mmail2 = frm.mmail2.value;
		var phone1 = frm.phone1.value;
		var phone2 = frm.phone2.value;
		var phone3 = frm.phone3.value;
		var caidx = frm.caidx.value;
		var maccount = frm.maccount.value;
		var mkakao = frm.mkakao.value;
		var question = frm.question.value;
		var mquestion = frm.mquestion.value; 
		
	 	if (id == "") {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return;
		}else if(cnt_data == 1){
			alert("다른 아이디를 입력해주세요.")
			frm.id.focus();
			return;
		}else if (pwd == "") {
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
		}else if (name == "") {
			alert("이름을 입력하세요");
			frm.name.focus();
			return;
		}else if (birth == "") {
			alert("생년월일를 입력하세요.");
			frm.birth.focus();
			return;
		}else if (isNaN(birth) == true) {
			alert("생년월일은 숫자만 입력하세요.");
			frm.birth.value = "";
			frm.birth.focus();
			return;
		}else if ( sex == ""){
			alert("본인의 성별을 선택해주세요.");
			frm.sex.focus();
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
		}else if(mquestion ==""){
			alert("인증 질문답변을 입력해주세요.");
			frm.mquestion.focus();
			return;
		} 
	 	
		frm.action = "${myContextPath}/MemberJoinAction.dobby";
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
</body>
</html>

	<c:import url="/include/indexFooter.jsp" />