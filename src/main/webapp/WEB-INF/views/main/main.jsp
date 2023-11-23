<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.18.0/TweenMax.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lettering.js/0.7.0/jquery.lettering.min.js"></script>
<style>

body{
	background-color:#FFF4DD;
}

#container {
	transform: translate(-50%, -50%);
	top: 50%;
	left: 50%;
	display: block;
	position: absolute;
	max-width: 400px;
}

#container .titleAni {
	color: #fff;
	text-transform: uppercase;
	font-size: 80px;
	margin: 0;
	line-height: 110px;
	letter-spacing: -3px;
}

#container .titleAni .title {
	transform: translateX(-50%) rotate(-10deg);
	display: block;
	float: left;
	left: 50%;
	position: relative;
}

#container .titleAni .title span {
	transform: skew(-10deg);
	display: block;
	float: left;
	text-shadow: #533d4a 1px 1px, #533d4a 2px 2px, #533d4a 3px 3px, #533d4a
		4px 4px, #533d4a 5px 5px, #533d4a 6px 6px;
	min-width: 10px;
	min-height: 10px;
	position: relative;
}

#container .titleAni .title:nth-child(1) {
	color: #e55643;
}

#container .titleAni .title:nth-child(2) {
	color: #2b9f5e;
}

#container .titleAni .title:nth-child(3) {
	color: #f1c83c;
}

.rotate{position:relative;}
.rotate .rotateInner{position:absolute; animation: rotate 5s linear infinite;}
.rotate .rotateInner img{width:100%;}
.rotate .roImg1{left:-350px; top:-100px; width:200px;}
.rotate .roImg2{left:150px; top:-150px; width:100px;}
.rotate .roImg3{left:-220px; top:330px; width:120px;}
.rotate .roImg4{left:700px; top: 250px; width:150px;}
.rotate .roImg5{left:300px; top:400px; width:130px;}
.rotate .roImg6{left:600px; top:-80px; width:200px;}

@keyframes rotate {
  0% {
            transform: rotate(0deg)
  }
  100% {
            transform: rotate(360deg)
  }
}

/* #main{position:relative; margin-top:100px;}
#main .mainInner{width:80%; height:500px; margin:0 auto; padding-top:200px;}
#main .mainInner .innerText{text-align: center; margin-bottom: 50px;}
#main .mainInner .innerText span{font-family: 'KorailRoundGothicBold'; font-size:28px; color: #486284;}
#main .mainInner .innerText h2{font-size:60px; color: #486284; margin:10px 0 20px 0;}
#main .mainInner .innerText p{font-size:20px; color: #8CA2C0; line-height: 32px;}
#main .mainInner .innerBtn{width:300px; height:50px; margin:0 auto;}
#main .mainInner .innerBtn a li{font-family: 'KorailRoundGothicBold'; width:45%; height:50px; background-color: #FFBC38; color:#fff; float:left; border-radius: 5px; text-align: center; line-height: 50px; letter-spacing: 1px; border:1px solid #FFBC38; box-sizing: border-box;}
#main .mainInner .innerBtn a:first-child li{margin-right: 10%;}
#main .mainInner .innerBtn a li:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;} */

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<section id="container">
		<h1 class="titleAni">
			<span class="title">오늘 모여서</span>
			<span class="title">내일 정하고</span> 
			<span class="title">모레 사자!</span>
		</h1>
		<div class="rotate">
	        <div class="rotateInner roImg1"><img src="<c:url value='/resources/img/rotate1.png'/>" alt=""></div>
	        <div class="rotateInner roImg2"><img src="<c:url value='/resources/img/rotate2.png'/>" alt=""></div>
	        <div class="rotateInner roImg3"><img src="<c:url value='/resources/img/rotate3.png'/>" alt=""></div>
	        <div class="rotateInner roImg4"><img src="<c:url value='/resources/img/rotate4.png'/>" alt=""></div>
	        <div class="rotateInner roImg5"><img src="<c:url value='/resources/img/rotate5.png'/>" alt=""></div>
	        <div class="rotateInner roImg6"><img src="<c:url value='/resources/img/rotate6.png'/>" alt=""></div>
	    </div>
		
	</section>
	<!-- <section id="main">
		<div class="mainInner">
			<ul class="innerBtn">
				<a href="user/login"><li>로그인</li></a>
				<a href="user/register"><li>회원가입</li></a>
			</ul>
		</div>
	</section> -->
</body>
<script>
$(document).ready(function() {
	  $(".title").lettering();
	  $(".button").lettering();
	});

	$(document).ready(function() {
	  animation();
	}, 1000);

	$('.container [class=button]').click(function() {
	  animation();
	});

	var mainAnimation = setInterval(function() {
        animation();
        }, 7000);
	
	
	function animation() {
	  var title1 = new TimelineMax();
	  title1.staggerFromTo(".title span", 1, 
	  {ease: Back.easeOut.config(1.7), opacity: 0, bottom: -80},
	  {ease: Back.easeOut.config(1.7), opacity: 1, bottom: 0}, 0.05);
	}
</script>
</html>





