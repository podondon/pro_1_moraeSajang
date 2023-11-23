<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 마이페이지</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style>
a:-webkit-any-link {
	color: black;
}

@font-face {
	font-family: 'KorailRoundGothicBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicBold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

@font-face {
	font-family: 'KorailRoundGothicMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicMedium.woff2')
		format('woff2');
	font-weight: 500;
	font-style: normal;
}

@font-face {
	font-family: 'KorailRoundGothicLight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicLight.woff2')
		format('woff2');
	font-weight: 300;
	font-style: normal;
}

* {
	margin: 0;
	padding: 0;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}

img {
	border: none;
	display: block;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'KorailRoundGothicBold', sans-serif;
	font-size: 16px;
	color: #212732;
}

body, header, section, footer, div, ul, li, p, a, span, input {
	font-family: 'KorailRoundGothicMedium', sans-serif;
	font-size: 13px;
	color: #212732;
}

#header {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100px;
	border-bottom: 1px solid #dedede;
	z-index: 9999;
}


#header .headerInner {
	position: relative;
	width: 80%;
	height: 100px;
	margin: 0 auto;
}

#header .headerInner .logo {
	position: absolute;
	width: 180px;
	left: 0;
	top: 26px;
}

#header .headerInner .logo img {
	width: 100%;
}

#header .headerInner .util {
	position: absolute;
	width: 142px;
	right: 0;
	top: 28px;
}

#header .headerInner .util li {
	position: relative;
	float: left;
	width: 44px;
	margin-left: 5px;
}

#header .headerInner .util li:first-child {
	margin-left: 0px;
}

#header .headerInner .util li a img {
	width: 100%;
}

#header .alarmList {
	position: absolute;
	right: 210px;
	top: 80px;
	display: none;
	overflow: auto;
	height: 300px;
	width: 235px;
	border: 1px solid #F9DCA3;
	border-radius: 3%;
	background-color: white;
}

#header .alarmList table {
	width: 200px;
	margin: 3px 3px 5px 10px;
	background-color: white;
	border: none;
}

.alarmList button:hover {
	color: white;
	background-color: #FFBC38;
}

#alarmChkAll:hover {
	color: white;
	background-color: #FFBC38;
}

.alarmChk {
	border-radius: 5px;
	border: 1px solid #FFBC38;
	color: #FFBC38;
	background-color: white;
	width: 30px;
	height: 20px;
	font-size: 10px;
	margin-bottom: 3px;
	float: right;
	display: block;
}

#alarmChkAll {
	border-radius: 5px;
	border: 1px solid #FFBC38;
	color: #FFBC38;
	background-color: rgb(255, 255, 255);
	margin-bottom: 7px;
	height: 22px;
	width: 210px;
}

#userImg {
	margin-left: 30%;
	width: 250px;
	height: 250px;
	margin-top: 7%;
	float: left;
}

#userImg img {
	width: 100%;
	height: 100%;
}

#mypage {
	width: 445px;
	height: 250px;
	margin-top: 7%;
	float: left;
	margin-left: 50px;
	padding-left: 10px;
}

#mypage td {
	padding: 20px 13px 0px 5px;
}

#btn_on {
	margin-right: -2px;
	margin-left: 15px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
}

#btn_off {
	margin-left: -2px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

#btn_group button {
	border: 1px solid #FFBC38;
	background-color: rgba(0, 0, 0, 0);
	color: #FFBC38;
	padding: 5px;
	width: 38px;
	height: 27px;
}

#btn_group button:hover {
	color: white;
	background-color: #FFBC38;
	cursor: pointer;
}

#usermody {
	width: 241px;
	height: 50px;
	cursor: pointer;
	text-align: center;
	display: inline-block;
	margin-top: 70px;
	line-height: 50px;
	background-color: #FFBC38;
	border-radius: 5px;
	color: white;
	font-size: 18px;
	margin-left: 600px;
}

#review {
	margin-left: 430px;
	margin-top: 50px;
	text-align: center;
}

#review .reviewCount {
	float: left;
	text-align: center;
	margin: 5px;
	border: 1px solid #FFBC38;
	border-radius: 5px;
	width: 180px;
	height: 50px;
	padding: 10px;
}

.reviewCount div {
	padding-top: 20px;
}

body {
	padding-top: 100px;
	height: 100%;
	/* 생략 */
}

#myPoint {
	margin-top: 30px;
	margin-right: 120px;
	float: right;
}

#myPoint #sumPoint {
	float: right;
	padding-left: 10px;
}
        #pointHistory{position:relative; margin-top:150px; overflow: hidden;}
        #lnb{position: fixed; left:0; top:100px; width:300px; height:100%; background-color: #f9f9f9; z-index: 99;}
        #lnb ul{margin-top:20px;}
        #lnb ul li{width:280px; height:60px; line-height: 60px; box-sizing: border-box; border-radius: 10px; margin:10px auto; padding-left:40px; font-family: 'KorailRoundGothicBold'; font-size:16px;}
        #lnb ul li.on{background-color: #fcdfa0; color:#fff;}
        #lnb ul a:hover{text-decoration:none;}
        #lnb .logout{position:absolute; margin-left:50px; bottom:200px;}
        #lnb .logout a span{font-size:20px; line-height:25px; position:relative; top:-7px; color:#FFBC38;}
</style>
</head>
<body>
	<header id="header">
		<div class="headerInner">
			<h1 class="logo">
				<a href="<c:url value='/groupBuy/gbList'/>"><img src="./resources/img/logo.png"
					alt="모래사장"></a>
			</h1>
			<ul class="util">
				<li id="alarm"><a href="javascript:"><img
						src="<c:url value='/resources/img/Notification.png'/>" alt="알림" id="alarmIcon"></a></li>
				<li><a href="<c:url value='/message/rcvList'/>"><img
						src="./resources/img/msg.png" alt="메세지 알림"></a></li>
				<li><a href="<c:url value='/mypage'/>"><img src="./resources/img/my.png"
						alt="마이페이지"></a></li>
			</ul>
		</div>
		<div class="alarmList">
			<table>
				<thead>
					<tr>
						<td><button id="alarmChkAll" type="button">전체 읽음</button></td>
					</tr>
				</thead>
				<tbody id='list'>
				</tbody>
			</table>
		</div>
	</header>

	<div id="lnb">
        <ul>
			<a href="<c:url value="/mypage"/>"><li class="on">내 프로필</li></a>
			<a href="<c:url value="/mypage/groupBuy/gbList"/>"><li>내 공구 현황</li></a>
			<a href="<c:url value="/mypage/point/history"/>"><li>포인트 내역</li></a>
			<a href="<c:url value="/mypage/point/charge"/>"><li>포인트 충전</li></a>
		</ul>
		<div class=logout>
			<a href="<c:url value='/user/logout'/>"><svg width="26" height="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M8.8999 7.55999C9.2099 3.95999 11.0599 2.48999 15.1099 2.48999H15.2399C19.7099 2.48999 21.4999 4.27999 21.4999 8.74999V15.27C21.4999 19.74 19.7099 21.53 15.2399 21.53H15.1099C11.0899 21.53 9.2399 20.08 8.9099 16.54" stroke="#FFBC38" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M15.0001 12H3.62012" stroke="#FFBC38" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M5.85 8.6499L2.5 11.9999L5.85 15.3499" stroke="#FFBC38" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
</svg><span> Log Out</span></a>
		</div>
    </div>


	<main>
		<div id="myPoint">
			보유 포인트
			<div id="sumPoint"></div>
		</div>

		<div id="userImg">
			<img src="<c:url value='/resources/img/mypageimg.png'/>" alr="유저이미지" />
		</div>

		<div id="mypage">
			<table>
				<tr>
					<td>아이디</td>
					<td id="userId"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td id="nickName"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td id="name"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td id="email"></td>
				</tr>
				<tr>
					<td>가입 날짜</td>
					<td id="reg_date"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td id="addr"></td>
				</tr>
				<tr id="alarmAuth">
					<td>알림 설정</td>
					<td>
						<div id="btn_group">
							<button id="btn_on" value="1" disabled>ON</button>
							<button id="btn_off" value="0" disabled>OFF</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div id="usermody" OnClick="location.href ='mypage/profilRetouch'">수정</div>

		<div id="review">
			<div class="reviewCount">
				또 거래하고 싶어요
				<div id="count_1"></div>
			</div>

			<div class="reviewCount">
				그냥 그래요
				<div id="count_2"></div>
			</div>

			<div class="reviewCount">
				별로예요
				<div id="count_3"></div>
			</div>
		</div>
	</main>
</body>
<script>


	var alarmSetNo;
	var no;
	alarmToggle();
	
	function alarmToggle(){  // 권한 체크 후 해당하는 상태의 알림 on/off 버튼 비활성화 처리
		$.ajax({
			type: 'get',
			url: 'mypage/alarmToggle.ajax',
			data: {},
			dataType: 'json',
			success: function(data){
				console.log(data);
				no = data; 
				alarmCall(no);
				if(data == 0){
					$('#btn_on').css('color', 'white');
					$('#btn_on').css('background-color', '#FFBC38');
					$('#btn_off').removeAttr('disabled');
				}else if(data == 1){
					$('#btn_off').css('color', 'white');
					$('#btn_off').css('background-color', '#FFBC38');
					$('#btn_on').removeAttr('disabled');
				}
			},
			error: function(e){
				console.log(e)
			}
		});
		
	}

	
	$('#btn_on').on('click',function(e){
		alarmSetNo = $(this).val()
		alarmSet(alarmSetNo);
	});
	$('#btn_off').on('click',function(e){
		alarmSetNo = $(this).val()
		alarmSet(alarmSetNo);
	});


	
	function alarmSet(alarmSetNo){  // 알림 수신 여부 on/off
		$.ajax({
			type: 'get',
			url: 'mypage/alarmSet.ajax',
			data: {'alarmSetNo':alarmSetNo},
			dataType: 'json',
			success: function(data){
				console.log(data);
				location.reload();
			},
			error: function(e){
				console.log(e);
			}
		});
	}
	
	myPageInfo(); // 마이 페이지 정보 호출

	
	function alarmCall(no) {  // 알림 리스트 호출
		alarmRemove()  // 7일 이상 경과된 히스토리 삭제
		alarmUpdate();  // 히스토리 최신 알림 업데이트
		$.ajax({
			type : 'get',
			url : 'alarm/call.ajax',
			data : {"no":no},
			dataType : 'json',
			success : function(data) {
				console.log(data.alarmState);
				if(data.alarmState == "activate"){  // 사용자 알림 활성화 여부 확인
					if (data.alarmList.length != 0) {  // 알림 리스트 개수 확인
						$('#alarmIcon').attr('src',"<c:url value='/resources/img/NotificationOn.png'/>");  // 확인할 알림이 있으면 배지 붙은 아이콘 표시
						alarmDrawList(data);
					} else{
						$('#alarmIcon').attr('src',"<c:url value='/resources/img/Notification.png'/>");  // 확인할 알림이 없으면 기본 아이콘 표시
						alarmDrawList(data);
					}
				}else {  // 알림 비활성화 상태일 경우 알림창 내 버튼 숨김, 알림 비활성화 상태 문구 출력
					console.log("알림 차단");
					$('#alarmChkAll').css('display', 'none');
					var alarmDisabled = '<p>'+'<br>'+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;알림 비활성화 상태 입니다."+'<p>';
					$('#list').empty();
					$('#list').append(alarmDisabled);
					$('#alarmIcon').attr('src',
					'./resources/img/Notification.png');
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	function alarmDrawList(obj) {  // 가져온 알림 히스토리 리스트 출력
		var content = '';
		obj.alarmList.forEach(function(item, idx) {
					content += '<tr>';
					content += '<td>'+'<a href=';
					content += "groupBuy/"+item.alarmAddr+item.gbNo+' style="text-decoration:none">';
					content += item.title.substr(0,13) + '</a>';
					content += '<button class="alarmChk"'+'>읽음</button></td>';
				});
		
		$('#list').empty();
		$('#list').append(content);
		if(content == ""){  // 보여줄 알림이 없다면 새로운 알림 없음 문구 출력, 알림창 내 버튼 숨김
			$('#alarmChkAll').css('display', 'none');
			var alarmNull = '<p>'+'<br>'+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;새로운 알림이 없습니다."+'<p>';
			$('#list').append(alarmNull);
		}else {
			$('#alarmChkAll').css('display', 'block');
		}
	}

	function alarmRemove() {  // 7일 이상 경과된 알림 히스토리 삭제
		console.log("누적 알림 제거");
		$.ajax({
			type : 'get',
			url : 'alarm/remove.ajax',
			data : {},
			dataType : 'json',
			success : function(e) {
				console.log("remove");
			},
			error : function(e) {
				console.log("오래된 알림 없음");
			}
		});
	}

	function alarmUpdate() {  // 알림 히스토리에 추가될 내용 업데이트
		$.ajax({
			type : 'get',
			url : 'alarm/update.ajax',
			data : {},
			dataType : 'json',
			success : function(data) {
				console.log("update");
				if (data.row != 0) {
					console.log(data.row);
					alarmCall();
				}else{
					console.log("이미 최신 상태 입니다.");
				}
			},
			error : function(e) {
				console.log("이미 최신 상태 입니다.");
			}
		});
	}

	$('tbody').on('click', '[class=alarmChk]', function(e) { // 개별 버튼 알림 읽음 처리 요청
		var alarmUrl = $(this).siblings().prop('href');
		var alarmChk = alarmUrl.substring(54); // 끊을 글자 수 수정
		alarmRead(alarmChk);
	});

	function alarmRead(alarmChk) {  // 개별 버튼 알림 읽음 처리(가져온 글 번호 대상)
		console.log(alarmChk);
		$.ajax({
			type : 'get',
			url : 'alarm/read.ajax',
			data : {
				'alarmChk' : alarmChk
			},
			dataType : 'json',
			success : function(e) {
				console.log("읽음 처리 완료");
				alarmCall(no);
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	
	$('#alarmChkAll').click(function() {  // 알림 리스트 내 모든 알림 읽음 처리
		console.log("전체 읽음");
		$.ajax({
			type : 'get',
			url : 'alarm/readAll.ajax',
			data : {},
			dataType : 'json',
			success : function(data) {
				console.log("전체 읽음 완료" + data.row);
				if (data.low != 0) {
					alarmCall(no);
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	});

	var clickNum = 0;
	$('#alarm').on('click', function() {  // 알림 아이콘 클릭 시 리스트 표시 토글
		clickNum++;
		if (clickNum % 2 == 1) {
			$('.alarmList').css('display', 'block');
		} else {
			$('.alarmList').css('display', 'none');
		}
	});
	
	/********************************************************************/
	
	var userId;
	var nickName;
	var name;
	var email;
	var reg_date;
	var addr;
	
	var point;
	var high;
	var mid;
	var low;
	
	
	function myPageInfo(){
		console.log("유저 정보 요청")
		$.ajax({
			type: 'get',
			url: 'mypage/myInfo.ajax',
			data: {},
			dataType: 'json',
			success: function(data) {
				console.log(data.myInfo);
			data.myInfo.forEach(function(item, idx) {
				userId = item.userId;
				nickName = item.nickname;
				name = item.name;
				email = item.email;
				reg_date = item.reg_date;
				addr = item.addr;
			});
				$('#userId').html(userId);	
				$('#nickName').html(nickName);	
				$('#name').html(name);	
				$('#email').html(email);	
				$('#reg_date').html(reg_date);	
				$('#addr').html(addr);
				
				point = data.point;
				$('#sumPoint').html(point);
				
				high = data.review.high;
				mid = data.review.mid;
				low = data.review.low;
				$('#count_1').html(high);
				$('#count_2').html(mid);
				$('#count_3').html(low);
				
			},
			error: function(e){
				console.log(e);
			}
		});
		
	}
	
	
</script>
</html>