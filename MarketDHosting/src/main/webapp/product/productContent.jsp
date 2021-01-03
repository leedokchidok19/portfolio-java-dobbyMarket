<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

	<c:import url="/include/indexHeader.jsp" />
	
	<c:set var="myContextPath" value="${pageContext.request.contextPath}" />


<c:set var="cv" value="${cv}" />
<c:set var="pv" value="${pv}" />


<script src="${myContextPath}/resources/js/jquery.min.js"></script>
<script src="${myContextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">


	$(function() {
		(function($) {

			$(document).ready(function() {
				
								  var $ = jQuery;
								$.boardCommentList(); //페이지 댓글 리스트

								$.productSimilarList();

						$('#save').click(function() {
								

						var pidx = ${pv.pidx};
						var cwriter = $("#cwriter").val();
						var ccontent = $("#ccontent").val();
						var midx = $("#midx").val();
						$.ajax({
						type : "POST",
						url : "${myContextPath}/Needlogin/product/commentWriteAction.dobby",
						headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
						},
						datatype : "text",
						data : JSON
						.stringify({
						"pidx" : pidx,
						"cwriter" : cwriter,
						"ccontent" : ccontent,
						"midx" : midx
						}),
						cache : false,
						error : function() {
						},
						success : function(data) {
							
						$.boardCommentList();
						$('#cwriter').val("");
						$('#ccontent').val("");
						$('#nextPage').val("2");
						$('#page').val("1");
						}
							});
								});//save펑션	

					 $('#more').click(function() {

					var npage = $("#nextPage2").val(); //Criteria를 사용하지않고 Hidden속성의 inputbox를 이용(리스트를 전부 로드했을때 인설트시 1페이지로 돌아가는 문제때문)

					$.ajax({
						type : "GET",
						url : "${myContextPath}/Product/"+ npage + "/${pv.caidx}/0/0/empty/ProductSerchList.dobby",
						datatype : "json",
						cache : false,
						error : function() {
							alert("리스트 error");},
						success : function(data) {

						$("#page2").val(npage);
						nextPage = (npage * 1) + 1;
						$("#nextPage2").val(nextPage);
						var oblength = Object.keys(data).length;
						$('#moreTotalCount').val(oblength);
						$.moerCount();
						$.SerchList(data);
					}
						});
						}); //more 

							});// 도큐먼트 끝

			 $.boardCommentList = function() {

				var page = $("#page").val();
				$.ajax({
					type : "GET", //숫자 2 = {midx}고정 값 로그인 기능 구현시 교체, 1은 페이지 첫페이지 불러오기 위한 값
					url : "${myContextPath}/product/${pv.pidx}/" + page + "/commentlist.dobby",
					datatype : "json",
					cache : false,
					error : function() {
						alert("boardCommentList에러발생");
					},
					success : function(data) {

						commentList(data);
					}
				});
			}//boardCommentList끝

			 $.del = function(cidx) {//삭제 기능

				var cidx = cidx;
				alert("값cidx:" + cidx);

				$.ajax({
					type : "DELETE",
					url : "${myContextPath}/Comment/" + cidx + "/deleteComment.dobby",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					datatype : "text",
					cache : false,
					error : function() {
					},
					success : function(data) {

						if (data == null) {
							alert("data값은 없음");
						}
						$.boardCommentList();
					}
				});
			}

			 function commentList(data) {

				var str = '';
				var midx = 2;//로그인 기능 구현시 변수처리

				$(data).each(function(index) {

									if (midx == this.midx) {//본인만 삭제 가능
										delinput = "<button class='btn btn-danger' onclick='$.del("
												+ this.cidx + ")'>삭제</button>";
									}
									if (midx != 0) {//로그인 한 모든 사람에게 권한
										replyput = "<button class='btn has' onclick='$.replyinput("
												+ this.cidx + ")'>답글</button>";
									}
									str += "<tr>" + "<th scope='row'>"
											+ (index + 1) + "</th>" + "<td>"
											+ this.cwriter + "</td>" + "<td>"
											+ this.ccontent + "</td>" + "<td>"
											+ delinput + "</td>" + "<td>"
											+ replyput + "</td>" + "</tr>";
								});
				$('#tbl').html(
						"<tr>" + "<th scope='row'>번호</th>" + "<td>작성자</td>"
								+ "<td>내용</td>" + "<td>삭제여부</td>" + "</tr>"
								+ str + "");

			}

			 $.replyinput = function(cidx) {//답글 작성칸 기능

				var cidx = cidx;
				alert(cidx + "cidx값");
				replygo = "<button class='btn relpybtn' onclick='$.selectCommentOne("
						+ cidx + ")'>대댓글저장</button>";

				$('#tblreply')
						.html(
								"<div id='commenttbl' class='box-body'>"
										+ "<div class='form-group'>"
										+ "<label for='examInputEmail1'>작성자</label>"
										+ "<input type='text'class='form-control' name='cwriterre' id='cwriterre' placeholder='이름입력하세요' maxlength='7'/>"
										+ "<label for='examInputContent'>댓글내용</label>"
										+ "<textarea class='form-control' name='ccontentre' id='ccontentre' rows='3' style='width:100%;height:100;' placeholder='대댓글내용' maxlength='150'></textarea>"
										+ "</div>" + "<div class='form-group'>"
										+ replygo + "</div>" + "</div>");

			}
			 $.selectCommentOne = function(cidx) {
				var cidx = cidx
				$.ajax({
					type : "GET",
					url : "${myContextPath}/comment/" + cidx + "/commentOne.dobby",
					datatype : "json",
					cache : false,
					error : function() {
						alert("selectCommentOne에러발생리");
					},
					success : function(data) {

						$.reply(data);

					}
				});
			}//selectcommentone끝

			$.reply = function(data) {//답글 저장 기능
				var pidx = ${pv.pidx};//pidx,midx는 하단에 상수값있음 나중에 변경하기
				var midx = $("#midx").val();
				var cwriter = $("#cwriterre").val();
				var ccontent = $("#ccontentre").val();
				var corigincidx = data["corigincidx"];
				var cleftright = data["cleftright"];
				var cupdown = data["cupdown"];
				$.ajax({
					type : "POST",
					url : "${myContextPath}/comment/commentReplyWrite.dobby",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					datatype : "json",
					data : JSON.stringify({
						"pidx" : pidx,
						"midx" : midx,
						"cwriter" : cwriter,
						"ccontent" : ccontent,
						"corigincidx" : corigincidx,
						"cleftright" : cleftright,
						"cupdown" : cupdown
					}),
					cache : false,
					error : function() {
					},
					success : function(data) {

						if (data == null) {
							alert("data값은 없음");
						}
						$.boardCommentList();
						$('#cwriterre').val("");
						$('#ccontentre').val("");
					}
				});
			}//reply끝	

			$(document).ready(function() {
				$('.has').click(function() {//기존 입력창 안 보이게 하기/ 댓글 입력창도 나와서 구분이 안가서
					$('.hideme').hide();
				});
			});
			////////////////////////////댓글 밑으로 비슷한 상품리스트

			$.moerCount = function() { //전체리스트와 로드된 리스트를 비교하는 함수

				var page = $('#page2').val();

				$.ajax({
					type : "GET",
					url : "${myContextPath}/Product/" + page+ "/${pv.caidx}/0/0/empty/ProductListTotal.dobby",
					//위의 url에 0을 사용함으로 전체를 로드한다.(쿼리문에서 if문을 사용하여 where조건을 걸렀다.)
					datatype : "json",
					cache : false,
					error : function() {
						alert("more error");
					},
					success : function(data) {

						if (data == $('#moreTotalCount').val()) { //more에서 불러온 리스트와 갯수를 비교하여 같다면 more버튼을 사라지게 처리함
							$('#more').hide(2000);
						} else {
							$('#more').show(2000); //같지 않다면 more버튼 활성화(show를 해주지않는다면 같지않더라도 사라진후에 나타나지않음)
						}
					}
				})
			}; //moercount  

			$.productSimilarList = function() { //input에 저장해놓은 페이지로 select(criteria와 같은 기능,default값은 1이다.)

				var page = $('#page2').val();

				$.ajax({
					type : "GET",
					url : "${myContextPath}/Product/"+page+"/${pv.caidx}/0/0/empty/ProductSerchList.dobby",
					datatype : "json",
					cache : false,
					error : function() {
						alert("리스트 error");
					},
					success : function(data) {
						$.SerchList(data);
						var oblength = Object.keys(data).length;
						$('#moreTotalCount').val(oblength);
						$.moerCount();
					}
				});
			}; //$.productSerchList

			$.SerchList = function(data) {

				var str = '';

				$(data).each(function(index) {

									var writedate = this.pwridate.substr(0, 10);
									var fileCallPath = "http://thdkow.cafe24.com/upload/"+this.uploadPath+"/"+this.uuid+"_"+this.fileName;

									str += "<div class='col-lg-4 col-md-6 mb-4'><div class='card h-auto'>"
											+ "<a href='${myContextPath}/Product/ProductContent.dobby?pidx="
											+ this.pidx
											+ "'><img src='"+fileCallPath+"'height='145' width='253' alt=''></a>"
											+ "<div class='card-body'><h4 class='card-title'>"
											+ "<a href='${myContextPath}/Product/ProductContent.dobby?pidx="
											+ this.pidx + "'>" + this.psubject + "</a></h4>" + "<h5>" + this.pmoney
											+ "원</h5>" + "<p class='card-text'>판매자 : " + this.mname
											+ "</p><p class='card-text'>등록일 : " + writedate + "</p></div></div></div>"

								});

				$('#tbr').html(str);

			}; //SerchList       
			 
				

		}(jQuery))
	})
	
</script>

		<c:set var="fileCallPath" value="http://thdkow.cafe24.com/upload/${pv.uploadPath }/${pv.uuid }_${pv.fileName}"></c:set>

<!-- Page Content -->
<div class="container">

<!-- Portfolio Grid -->
  <section class="bg-light" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">PaymentHistory</h2>
          <h3 class="section-subheading text-muted">구매한 상품들 입니다.</h3>
        </div>
      </div>

	<div class="row">
	

      
		<div class="col-lg-9 my-5">
			<div class="row" style="text-align: center;">
				<div class="col-md-6">
				<img class="img-fluid2" style="position:absoulte;width:100%;"
				 src='${fileCallPath}'>
				
				<br />
					</div>
				
				<div class="col-md-6">
					<h2>${pv.psubject}</h2>
					<p>
					<div id="rating1">판매자 : ${pv.mname}</div>
					</p>
					<p class="text-xs-right">등록일 : ${pv.pwridate}</p>
					<br>
					<h4 class="text-xs-right">
						판매 가격 : <span style="color: #197BB5; font-size: 35px;">${pv.pmoney}
							원</span>
					</h4>
					<p class="text-xs-right">배송비 : ${pv.pfee}원</p>
					<br />
					
				<form action="${myContextPath}/Needlogin/Product/ProductPayment.dobby?pidx=${pv.pidx}" method="post">
					
					<div class="col-md-8" style="margin:center;">
					</div>
					<!-- <Center> -->
						<button type="button" class="btn btn-outline-primary" 
						onclick="location.href='${myContextPath}/Needlogin/Product/ProductPlusShoppingCart.dobby?pidx=${pv.pidx}'"
							style="width: 150px;">
							<i class="">장바구니 추가</i> 
						</button>
						<button type="submit" class="btn btn-outline-primary"
							style="width: 150px;">
							<i class="">구매하기</i> 
						</button>
					<!-- </Center> -->
						</form>
				</div>
				
				</div><!-- row -->
			</div>
		</div>
		


		<div class="col-lg-9">
			<div class="card ">
				<div class="card-header">
					<div class="row">
						<div class="col-md-6">
							<h4 style="color: #153293;">상세설명</h4>
						</div>
					</div>
				</div>
				<div class="row" style="margin: 10px;">
					<div class="col-md-12">
						<p class="text-justify" style="color: #808080;">${pv.pcontent}</p>
					</div>
				</div>
				<div class="card-footer">
					<div class="row">
						<div class="col-md-6">
							<h4 style="color: #153293;">댓글</h4>
						</div>
					</div>
				</div>

				<div class="row" style="margin: 10px;">
					<div class="col-md-12">
						<div id="tbl">
							<table class="table table-sm">
								<tbody>

									<div id="tbl"></div>

								</tbody>
							</table>
						</div>
						<p id="tblreply"></p>
						<!-- 코멘트답글 -->
						<form name='form1'>
							<div id="commenttbl" class="box-body hideme">
								<div class="form-group">
									<label for="examInputEmail1">작성자</label> <input type="text"
										class="form-control" name="cwriter" id="cwriter"
										placeholder="이름입력하세요" maxlength="7" /> <label
										for="examInputEmail1">내용</label> <input type="hidden"
										name="midx" id="midx" value="2" />

									<textarea class="form-control" name="ccontent" id="ccontent"
										rows="3" placeholder="내용입력하세요" maxlength="150"></textarea>
								</div>

								<div class="form-group">
									<input type="button" name="save" id="save" value="저장"
										class="float-right btn btn-outline-primary mr-3" />
								</div>
							</div>
							

						</form>



						<div class="form-group">
							<input type="hidden" name="corigincidx" id="corigincidx"
								value="${cv.corigincidx}" /> <input type="hidden"
								name="cleftright" id="cleftright" value="${cv.cleftright}" /> <input
								type="hidden" name="cupdown" id="cupdown" value="${cv.cupdown}" />
							<input id='page' type='hidden' value='1' /> <input id='tcc'
								type='hidden' value='0' /> <input id='nextPage' type="hidden"
								value='2' /> <input id='totalCount' type='hidden' value='0' />

						</div>

					</div>

				</div>
				<div class="card-footer">
					<div class="row">
						<div class="col-md-6">
							<h4 style="color: #153293;">비슷한 제품</h4>
						</div>

					</div>
				</div>
				<div class="row" id="tbr"></div>
				<!-- 비슷한 제품 상품리스트 -->

				<center>
					<button id='more' class="btn btn-outline-primary">더보기</button>
				</center>
			</div>


		</div>




</div><!-- contaner -->
			</section>

	</div>


<div class="form-group">

	<input id='nextPage2' type='hidden' value='2' /> <input
		id='moreTotalCount' type='hidden' value='' /> <input id='page2'
		type='hidden' value='1' />
</div>

<style>

.colors {
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
}

.color {
	display: inline-block;
	vertical-align: middle;
	margin-right: 10px;
	height: 2em;
	width: 2em;
	border-radius: 0;
}

.color:first-of-type {
	margin-left: 20px;
}

.black {
	background: #000000;
}

.gray {
	background: #808080;
}

.gold {
	background: #D3AF37;
}

.has, .relpybtn {
	background: rgb(38, 177, 200);
	color: gold;
	border-radius: 3;
}

#ccwriterre, #ccontentre {
	height: 100px;
	width: 70px;
}
</style>

	<c:import url="/include/indexFooter.jsp" />