<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="1"><!-- content에 설정한 초마다 refresh -->
<title>도비를 찾을 수 없습니다</title>
<style>
/*  .bgimg {  화면에 이미지 full
 background: url('/resources/img/errordobby404.jpg') no-repeat center center fixed;
  -webkit-background-size: contain;
  -moz-background-size: contain;
  -o-background-size: contain;
  background-size: contain;
} */

@media screen and (max-width: 1024px) { /* Specific to this particular image */
  .bgimg {
    left: 50%;
    margin-left: -512px;   /* 50% */
  }
} 
.bgimg {
  min-height: 100%;
  min-width: 512px;
	
  /* Set up proportionate scaling */
  width: 100%;
  height: 100%;
	
  /* Set up positioning */
  position: fixed;
  top: 0;
  left: 0;
}
</style>
<script type="text/javascript">
var imageURLs = [	
"/resources/img/errordobby404.jpg"
, "/resources/img/error404dobby2.jpg"
, "/resources/img/dobby404.jpg"
];
function getImageTag() {
var img = '<img class=\"bgimg\" src=\"';
var randomIndex = Math.floor(Math.random() * imageURLs.length);
img += imageURLs[randomIndex];
img += '\" alt=\"Some alt text\"/>';
return img;
}
</script>
<script type="text/javascript">
document.write(getImageTag());
</script>
</head>
<body>
<!-- 
<div class="allimg">
	<img alt="" src="/resources/img/dobby404.jpg">
</div>
 -->

</body>
</html>