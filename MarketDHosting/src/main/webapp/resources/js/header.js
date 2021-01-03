/**
 * 2019-02-21
 * 참고 : http://www.blueb.co.kr/?c=1/4&where=subject%7Ctag&keyword=%EB%93%9C%EB%A1%AD+%EA%B0%80%EB%A1%9C&uid=3901
 * header
 * 상단 바
 * <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
 */
	$(function(){

		$("ul.dropdown li").onclick(function(){
		
			$(this).addClass("onclick");
			$('ul:first',this).css('visibility', 'visible');
		
		}, function(){
		
			$(this).removeClass("hover");
			$('ul:first',this).css('visibility', 'hidden');
		
		});
		
		$("ul.dropdown li ul li:has(ul)").find("a:first").append(" » ");

	});	
/**
 * TOP버튼
 */
	/*Add class when scroll down*/
	$(window).scroll(function(event){
	  	var scroll = $(window).scrollTop();
	    if (scroll >= 50) {
	        $(".go-top").addClass("show");
	    } else {
	        $(".go-top").removeClass("show");
	    }
	});
	/*Animation anchor*/
	$('a').click(function(){
	    $('html, body').animate({
	        scrollTop: $( $(this).attr('href') ).offset().top
	    }, 1000);
	});
	
/*
 * 풀 스크린 슬라이드 쇼
 */
        $(function(){
            $('.jquery-reslider').reSlider({
                speed:1000,  //페이드속도
                delay:5000,  //자동전환 속도
                imgCount:4,  //이미지갯수
                dots:true,   //하단 페이지 버튼
                autoPlay:true//자동재생
            })
        })
