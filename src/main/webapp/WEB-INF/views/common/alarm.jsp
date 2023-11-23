<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>모래사장</title>
<style>
a:-webkit-any-link {
	color: black;
	}
@font-face {
	font-family: 'KorailRoundGothicBold';
	src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicBold.woff2') format('woff2');
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
/******************************************************************************************/
#header .alarmList {
	position: absolute;
	right: 210px;
	top: 80px;
	display: none;
	overflow:auto;
	height: 300px;
	width: 235px;
	border: 1px solid #F9DCA3;
	border-radius: 3%;
	background-color: white;
}

#header .alarmList table {
	width: 200px;
	margin: 3px;
}

.alarmList button:hover{
	color: white;
	background-color: #FFBC38;
}
#alarmChkAll:hover{
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
#alarmChkAll{
	border-radius: 5px;
	border: 1px solid #FFBC38;
	color: #FFBC38;
	background-color: rgb(255,255,255);
	margin-bottom: 7px;
	height: 22px;
	width: 210px;
	
}



</style>
</head>
<body>
	<header id="header">
		<div class="headerInner">
			<h1 class="logo">
				<a href="main.html"><img src="./resources/img/logo.png"
					alt="모래사장"></a>
			</h1>
			<ul class="util">
				<li id="alarm"><a href="javascript:"><img
						src="./resources/img/Notification.png" alt="알림" id="alarmIcon"></a></li>
				<li><a href="javascript:"><img
						src="./resources/img/msg.png" alt="메세지 알림"></a></li>
				<li><a href="mypage"><img src="./resources/img/my.png"
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
</body>
<script>

	
	var alarmError = '<p>'
			+ '<br>'
			+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;알림을 읽어올 수 없습니다."
			+ '<p>';
	var no = '${sessionScope.userInfo.authNo}';
	if (no == "") {
		no = 0;
	}
	console.log(no);

	alarmCall(); // 페이지 로드 시 알림 리스트 호출

	function alarmCall() { // 알림 리스트 호출
		alarmRemove() // 7일 이상 경과된 히스토리 삭제
		alarmUpdate(); // 히스토리 최신 알림 업데이트
		$
				.ajax({
					type : 'get',
					url : 'alarm/call.ajax',
					data : {
						"no" : no
					},
					dataType : 'json',
					success : function(data) {
						console.log(data.alarmState);
						if (data.alarmState == "activate") { // 사용자 알림 활성화 여부 확인
							if (data.alarmList.length != 0) { // 알림 리스트 개수 확인
								$('#alarmIcon')
										.attr('src',
												'<c:url value=/resources/img/NotificationOn.png/>'); // 확인할 알림이 있으면 배지 붙은 아이콘 표시
								alarmDrawList(data);
							} else {
								$('#alarmIcon')
										.attr('src',
												'<c:url value=/resources/img/Notification.png/>'); // 확인할 알림이 없으면 기본 아이콘 표시
								alarmDrawList(data);
							}
						} else { // 알림 비활성화 상태일 경우 알림창 내 버튼 숨김, 알림 비활성화 상태 문구 출력
							console.log("알림 차단");
							$('#alarmChkAll').css('display', 'none');
							var alarmDisabled = '<p>'
									+ '<br>'
									+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;알림 비활성화 상태 입니다."
									+ '<p>';
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

	function alarmDrawList(obj) { // 가져온 알림 히스토리 리스트 출력
		var content = '';
		obj.alarmList
				.forEach(function(item, idx) {
					content += '<tr>';
					content += '<td>'
							+ '<a href=';
					content += ""+item.alarmAddr+item.gbNo+' style="text-decoration:none">';
					content += item.title.substr(0, 13) + '</a>'; // 제목 열 세 글자만 끊어서 보여주기
					content += '<button class="alarmChk"'+'>읽음</button></td>';
				});

		$('#list').empty();
		$('#list').append(content);
		if (content == "") { // 보여줄 알림이 없다면 새로운 알림 없음 문구 출력, 알림창 내 버튼 숨김
			$('#alarmChkAll').css('display', 'none');
			var alarmNull = '<p>'
					+ '<br>'
					+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;새로운 알림이 없습니다."
					+ '<p>';
			$('#list').append(alarmNull);
		} else {
			$('#alarmChkAll').css('display', 'block');
		}
	}

	function alarmRemove() { // 7일 이상 경과된 알림 히스토리 삭제
		console.log("누적 알림 제거");
		$.ajax({
			type : 'get',
			url : 'alarm/remove.ajax',
			data : {},
			dataType : 'json',
			success : function(data) {
				console.log(data.row);
			},
			error : function(e) {
				console.log("오래된 알림 없음");
			}
		});
	}

	function alarmUpdate() { // 알림 히스토리에 추가될 내용 업데이트
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
				}
			},
			error : function(e) {
				console.log("이미 최신 상태 입니다.");
			}
		});
	}

	$('tbody').on('click', '[class=alarmChk]', function(e) { // 개별 버튼 알림 읽음 처리 요청
		var alarmUrl = $(this).siblings().prop('href');
		var alarmChk = alarmUrl.substring(54);
		console.log(alarmChk);
		alarmRead(alarmChk);
	});

	function alarmRead(alarmChk) { // 개별 버튼 알림 읽음 처리(가져온 글 번호 대상)
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
				alarmCall();
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	$('#alarmChkAll').click(function() { // 알림 리스트 내 모든 알림 읽음 처리
		console.log("전체 읽음");
		$.ajax({
			type : 'get',
			url : 'alarm/readAll.ajax',
			data : {},
			dataType : 'json',
			success : function(data) {
				console.log("전체 읽음 완료" + data.row);
				if (data.low != 0) {
					alarmCall();
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	});

	var clickNum = 0;
	$('#alarm').on('click', function() { // 알림 아이콘 클릭 시 리스트 표시 토글
		clickNum++;
		if (clickNum % 2 == 1) {
			$('.alarmList').css('display', 'block');
		} else {
			$('.alarmList').css('display', 'none');
		}
	});
</script>
</html>