<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:import url="/include/indexHeader.jsp" />

<c:set var="myContextPath" value="${pageContext.request.contextPath}" />


<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">

	function fnCngList(sVal) {

		var f = document.getElementById("SDIV");

		var opt = $("#SDIV option").length;

		if (sVal == "") {

			num = new Array("소분류");

			vnum = new Array("");

		} else if (sVal == "패션의류") {
			
			num = new Array("남성의류", "여성의류", "아우터", "모자");

			vnum = new Array("301", "302", "303" , "304");

		} else if (sVal == "가구") {

			num = new Array("DIY", "조명", "침구/커튼", "수납용품");

			vnum = new Array("321", "322", "323", "324");

		} else if (sVal == "도서") {

			num = new Array("도서", "교육", "음반");

			vnum = new Array("341", "342", "343");

		} else if (sVal == "스포츠") {

			num = new Array("휘트니스/수영", "등산/아웃도어", "캠핑/낚시", "구기/라켓", "자전거/보드");

			vnum = new Array("361", "364", "365", "366", "367");

		} else if (sVal == "컴퓨터") {

			num = new Array("모니터", "데스크탑", "노트북", "프린터", "저장장치", "PC주변기기");

			vnum = new Array("381", "382", "383", "384", "385", "386");

		} else if (sVal == "뷰티잡화") {

			num = new Array("신발", "가방", "주얼리", "수입명품", "시계", "선글라스", "기타");

			vnum = new Array("401", "402", "403", "404", "405", "406", "407");

		} else if (sVal == "디지털") {

			num = new Array("카메라", "음향기기", "게임", "휴대폰", "태블릿");

			vnum = new Array("421", "422", "423","424", "425");

		} else if (sVal == "취미") {

			num = new Array("건강/의료", "반려동물", "악기", "키덜트", "사무용품", "기타");

			vnum = new Array("441", "442", "443", "444", "445", "446");

		} else if (sVal == "생활가전") {

			num = new Array("대형가전", "계절가전", "주방가전", "생활가전", "미용가전");

			vnum = new Array("461", "462", "463", "464", "465");

		}

		

		for (var i = 0; i < opt; i++) {
			
			f.options[0] = null;

		}

		for (k = 0; k < num.length; k++) {
			
			f.options[k] = new Option(num[k], vnum[k]);

		}

	}

</script>
<script type="text/javascript">/* 	파일업로드 파일 타입확인, 사이즈 확인, 이미지 보기,(삭제, 수정 구현 안 함)		*/
$(function() {
    (function($) { 
    	
    	$(document).ready(function() {
    		
    		var formObj = $("form[role='form']");
    		$("a[id='save1']").on("click",function(e){
    			e.preventDefault();
    			console.log("등록<a> clicked");
    			var str ="";
    				
    				$(".uploadResult ul li").each(function(i, obj){
    					console.log("uploadResult ul li이거 실행 안되면 DB저장 안되요");
    					var jobj = $(obj);
    					console.log(jobj);
    					console.log("파일값들 보내기");
    		str += "<input type='hidden' name='fileName' value='"+jobj.data("filename")+"'>";
    		str += "<input type='hidden' name='uuid' value='"+jobj.data("uuid")+"'>";
    		str += "<input type='hidden' name='uploadPath' value='"+jobj.data("path")+"'>";
    		str += "<input type='hidden' name='fileType' value='"+jobj.data("type")+"'>";
    				});
    				$(".bb2").html(str);
    				$.save2();
//    				formObj.append(str).submit();
    		});
    		
    	}); // document redy
    	
$.save2 = function(){//#으로 id를 호출하여 jquery를 사용하였다.
		
	 	if($("#psubject").val() == ""){//이처럼 텍스트에 들어온 값을 비교하려면 .val을 사용하여야 한다. #subject만 했을시 x
		$("#sid1").html("<b>제목을 입력해주세요</b>");
		$("#sid1").show();
		$("#sid1").hide(5000);//하이드를사용하여서 출력한 문구를 지웠는데 다시눌렀을때 출력이되지않아 show를 이용하였다.
		} 
	 	else if($("#SDIV").val() == ""){
			$("#sid2").html("<b>종류를 정해주세요</b>");
			$("#sid2").show();
			$("#sid2").hide(5000);
			}
	 	else if($("#pmoney").val() == ""){
		
		$("#sid3").html("<b>금액을 입력해주세요</b>");
		$("#sid3").show();
		$("#sid3").hide(5000);
		}
		else if($("#pfee").val() == ""){
			$("#sid3").html("<b>배송비를 입력해주세요</b>");
			$("#sid3").show();
			$("#sid3").hide(5000);
			}
		else if($("#pcontent").val() == ""){
		$("#sid4").html("<b>내용을 입력해주세요</b>");
		$("#sid4").show();
		$("#sid4").hide(5000);
		}else if($("#pcontent").val() != ""){// else if를 한 이유는 textarea를 이용했을때 비교가 안되고 값이 null로 들어가
			//db에 입력이 되어버려서 조건을 추가해서 막아놓았다.
			
				document.getElementById('frm55').submit();
				
				return;
		}
			};	
			
    	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
    	var maxSize = 5242880; //5MB

    	function checkExtension(fileName, fileSize){
    		if(fileSize >= maxSize){
    				alert("파일 사이즈 초과.");
    			return false;
    		}
    		if(regex.test(fileName)){
    				alert("해당 종류의 파일은 업로드할 수 없습니다.");
    			return false;
    		}
    		return true;
    	}
			
			$("input[type='file']").change(function(e){
				console.log("이거 작동되는거 맞니?");
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				
				var files =inputFile[0].files;
			console.log(files);
				
				
					if(!checkExtension(files[0].name,files[0].size)){
						return false;
					}
					formData.append("uploadFile",files[0]);
					
				$.ajax({
					url: '${myContextPath}/uploadAjaxAction.dobby',
					processData: false,
					contentType: false,
					data: formData,
					type: 'POST',
					dataType:'json',
					success: function(result){ 
						console.log(result);
						console.log("끝났니?");
						showUploadResult(result); //업로드 결과 처리 함수
						
					}
				}); // $.ajax 
			}); //input[type='file']
			
			function showUploadResult(result){
				console.log("showUploadResult t;lwkr");
					if(!result||result.length==0){return;}
					var uploadUL = $(".uploadResult ul");
					console.log(uploadUL);
					var str="";
					$(result).each(function(i, obj){
//						console.log(obj);
						 //image type
						if(obj.image){
				var fileCallPath = encodeURIComponent ( obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
				console.log(fileCallPath);	console.log("콜패스");		
							str += "<li data-path='"+obj.uploadPath+"'";
							str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
							str += "><div>";
							str	+= "<span> "+obj.fileName+"</span>";
							str	+= "<button type='button' data-file=\'"+fileCallPath+"\' "
							str	+= "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str	+= "<img src='${myContextPath}/display.dobby?fileName="+fileCallPath+"'>";
							str	+= "</div>";
							str	+="</li>";
						}
					});
					uploadUL.html(str);
				}
			
    } (jQuery))
})	
</script>
<div class="container">

	<div class="row">
	
	<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Sale Write</h2>
          <h3 class="section-subheading text-muted">판매글 작성</h3>
        </div>
      </div>
	
		<div class="col-lg-9 my-5">

			<div class="row my-5">
				<form role='form' class="" id="frm55" name="frm55" 
				action="${myContextPath}/Product/ProductSaleWriteAction.dobby" method="post" enctype="multipart/form-data">
					<fieldset>

						<div class="form-group">
							<div class="col-md-8">
							
								<label for="filter"></label> 
								<input id="psubject" name="psubject"
									type="text" placeholder="제목을 입력해주세요." class="form-control"
									size="120" value="">	<span id="sid1"></span>
									
							</div>
						</div>
						
						<div class="input-group col-md-8 my-4">
							<div class="input-group-prepend">	
								<span class="input-group-text" id="">카테고리</span>
							</div>

								<select name="BDIV" id="BDIV" class="custom-select"
									onchange="fnCngList(this.value);">
									<option selected>대분류</option>
									<option value="패션의류">패션의류</option>
									<option value="가구">가구</option>
									<option value="도서">도서</option>
									<option value="스포츠">스포츠</option>
									<option value="컴퓨터">컴퓨터</option>
									<option value="뷰티잡화">뷰티잡화</option>
									<option value="취미">취미</option>
									<option value="생활가전">생활가전</option>
									<option value="디지털">디지털</option>
								</select>
								
								 <select name="caidx" id="SDIV" class="custom-select">
									<option value="">소분류</option>
								</select>
						</div>
						<span id="sid2"></span>
						

				<div class="input-group  col-md-8 my-4">
					<div class="input-group-prepend">
						<span class="input-group-text" >상품정보</span>
					</div>
					<input type="text" class="form-control" name="pmoney" id="pmoney" value="" placeholder="상품금액">
					<div class="input-group-prepend">
						<span class="input-group-text" id="">원</span>
					</div>
					<input type="text" class="form-control" name="pfee" id="pfee" value="" placeholder="배송비">
					<div class="input-group-prepend">
						<span class="input-group-text" >원</span>
					</div>
				</div>	
				<span id="sid3"></span>

				<div class="form-group my-3">
					<span class="col-md-1 offset-md-2 text-xs-center"><i
						class="fa fa-pencil-square-o bigicon"></i></span>
					<div class="col-md-8">
						<label for="filter">판매내용</label>
						<span id="sid4"></span>
						<textarea class="form-control" name="pcontent" id="pcontent"
						placeholder="판매내용을 상세하게 입력해주세요" rows="15"></textarea>
					</div>
				</div>

				<div class="form-group">
					<span class="col-md-1 offset-md-2 text-xs-center"><i
						class="fa fa-pencil-square-o bigicon"></i></span>
					<div class="col-md-8 uploadDiv">
						<label for="filter">첨부파일 : </label> <input type="file" id="pimage"
							name='uploadFile'/>
						<p style="text-align: right; margin-top: 20px;"></p>
					</div>
				</div>
				<!--파일 업로드 파일 첨부 결과불 보기  -->
						<div class='uploadResult'>
							<ul>
						
							</ul>
						</div>
						<div class='bigPictureWrapper'>
							<div class='bigPicture'>
							</div>
						</div>
				
				<div class="form-group">
					<div class="col-md-8">
						<div class="col align-self-end">
							<a class="float-right btn btn-outline-danger" onclick="location.href='${myContextPath}/index2.jsp'">취소</a> 
							<a id="save1" class="float-right btn btn-outline-primary mr-3">등록</a>
								<div class='bb2'>
								</div>
						</div>
					</div>
				</div>
				</fieldset>
				</form>
			</div>
		</div>
	  </div>
	 </section>
	</div>
<div class="uploadedList"></div>
</div>
<link rel="stylesheet" type="text/css"
	href="${myContextPath}/resources/css/all.min.css" />
<script type="text/javascript"
	src="${myContextPath}/resources/js/shieldui-all.min.js"></script>

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