<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도비에게 문제가 생겼습니다</title>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200" rel="stylesheet">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
 body{
      background-image: url('https://source.unsplash.com/category/nature/1600x900');
      background-size: cover;
      min-height:100vh;
      margin:0;
      display: flex;
      justify-content: center;
      align-items: center;
    }
.box{
  position: absolute;
  background-color:rgba(255,255,255,0.5);
  width: 40%;
  height: 40%;
  top:10%;
  left: 30%;
  text-align: center;
}
.link-1{
  position: absolute;
  background-color:#7171f8;
  border-radius:15px;
  -moz-border-radius: 15px;
  -webkit-border-radius: 15px;
  bottom: 0;
  left: 35%;
}
.link-1:hover{
  position: absolute;
  background-color:rgb(30,30,30);
   border-radius:15px;
  -moz-border-radius: 15px;
  -webkit-border-radius: 15px;
  bottom: 0;
  left: 25%;
  font-size: 54px;
}
.box, .link-1{
	font-family: 'Nanum Brush Script', serif;
	font-size: 32px;
}
.link-2{
text-decoration:none;
color: rgba(200,130,35,0.8);
}
.link-2:hover{
	text-decoration:none;
	cursor: pointer;
}
.box2{
  position: absolute;
  top: 60%;
  left: 40%;
}
.box2in{
	height: 32px;
}
</style>
</head>
<body>
<div class="box">
		<p class="box-p">해당 페이지에 문제가 발생했습니다.<br>
		자세한 원인을 찾고 있습니다.<br>
		불편하시겠지만 뒤로가기를 눌러주세요.</p>
      <div class="link-1">
         <a class="link-2" href="http://myin.or.kr/ver2/html/index.html">Dobby Market</a>
      </div>
</div>

<div class="box2">
	<form method=get action="http://www.google.co.kr/search" target="_blank" >
	      <input class="box2in" type=text name=q size=45 maxlength=255 value="" />
	      <input class="box2in" type=submit name=btnG value="검색" />
	</form>
</div>
</body>
</html>