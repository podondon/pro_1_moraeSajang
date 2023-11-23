<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        @font-face {
            font-family: 'KorailRoundGothicBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicBold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }
        @font-face {
            font-family: 'KorailRoundGothicMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicMedium.woff2') format('woff2');
            font-weight: 500;
            font-style: normal;
        }
        @font-face {
            font-family: 'KorailRoundGothicLight';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/KorailRoundGothicLight.woff2') format('woff2');
            font-weight: 300;
            font-style: normal;
        }
        
        *{margin:0; padding:0;}
        li{list-style: none;}
        a{text-decoration: none;}
        img{border:none;}
        h1, h2, h3, h4, h5, h6{font-family: 'KorailRoundGothicBold', sans-serif; font-size:16px; color:#212732;}
        body, header, section, footer, div, ul, li, p, a, input{font-family: 'KorailRoundGothicMedium', sans-serif; font-size:16px; color:#212732;}

        #header{position:fixed; left:0; top:0; width:100%; height:100px; border-bottom: 1px solid #dedede; background-color:#fff; z-index:9999;}
        #header .headerInner{position:relative; width:80%; height:100px; margin:0 auto;}
        #header .headerInner .logo{position:absolute; width:180px; left:0; top:26px;}
        #header .headerInner .logo img{width:100%;}
        #header .headerInner .utilBefore{position:absolute; width:160px; right:0; top:40px; padding:0;}
        #header .headerInner .utilAfter{position:absolute; width:142px; right:0; top:28px; padding:0;}
        #header .headerInner .utilBefore>li{position:relative; float:left; width:49%; margin-left: 2%;}
        #header .headerInner .utilAfter>li{position:relative; float:left; width:44px; margin-left: 5px;}
        #header .headerInner .util li:first-child{margin-left:0px;}
        #header .headerInner .utilBefore>li a{font-size:18px; font-family: 'KorailRoundGothicBold'; color:#222;}
        #header .headerInner .util li a img{width:100%;}
        
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
#list p{
	font-size: 13px;
}

#header .alarmList table {
	width: 200px;
	margin: 3px;
	font-size: 14px;
}
##header .alarmList p{
font-size: 13px;
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
	<%!
	    HttpSession session;
	%>
	<%
	    // 세션에 userInfo 속성이 있는지 확인
	    session = request.getSession();
	    Object userInfo = session.getAttribute("userInfo");
	%>
	<%
	    // 세션에 userInfo가 있는지 여부에 따라 다른 헤더 출력
	    if (userInfo != null) {
	%>
	
    <header id="header">
        <div class="headerInner">
            <h1 class="logo"><a href="<c:url value='/groupBuy/gbList'/>"><img src="<c:url value='/resources/img/logo.png'/>" alt="모래사장"></a></h1>
            <ul class="util utilAfter">
                <li id="alarm"><a href="javascript:"><img src="<c:url value='/resources/img/Notification.png'/>" alt="알림" id="alarmIcon"></a></li>
                <li><a href="<c:url value='/message/rcvList'/>"><img src="<c:url value='/resources/img/msg.png'/>" alt="메세지 알림"  id="msgAlram"></a></li>
                <li><a href="<c:url value='/mypage'/>"><img src="<c:url value='/resources/img/my.png'/>" alt="마이페이지"></a></li>
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
    
    <script>
 		// userInfo가 있을 때만 실행되는 스크립트
		msgAlram();
		
		var setMsgAlram = setInterval(function() {
			msgAlram();
			}, 10000);
			
		function msgAlram(){
			$.ajax({
				type: 'post',
				url: '<c:url value="/message/alram.ajax"/>',
				dataType: 'json',
				success:function(data){
					// console.log("cnt값");
					if(data.cnt>0){
						$('#msgAlram').attr('src','<c:url value="/resources/img/msg_on.png"/>');
					}else{
						$('#msgAlram').attr('src','<c:url value="/resources/img/msg.png"/>');
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
		/**********************************************************************/
		
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
					url : '<c:url value="/alarm/call.ajax"/>',
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
												"<c:url value='/resources/img/NotificationOn.png'/>"); // 확인할 알림이 있으면 배지 붙은 아이콘 표시
								alarmDrawList(data);
							} else {
								alarmDrawList(data);
								$('#alarmIcon').attr('src',"<c:url value='/resources/img/Notification.png'/>"); // 확인할 알림이 없으면 기본 아이콘 표시
								$('#alarmChkAll').css('display', 'none');
								var alarmNull = '<p>'
										+ '<br>'
										+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;새로운 알림이 없습니다."
										+ '<p>';
								$('#list').append(alarmNull);
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
									"<c:url value='/resources/img/Notification.png'/>");
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
		if (content != "") { // 보여줄 알림이 없다면 새로운 알림 없음 문구 출력, 알림창 내 버튼 숨김
			$('#alarmChkAll').css('display', 'block');
		} 
	}

	function alarmRemove() { // 7일 이상 경과된 알림 히스토리 삭제
		console.log("누적 알림 제거");
		$.ajax({
			type : 'get',
			url : '<c:url value="/alarm/remove.ajax"/>',
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
			url : '<c:url value="/alarm/update.ajax"/>',
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
		var alarmChk = alarmUrl.substring(54); // 끊을 글자 수 수정
		console.log(alarmChk);
		alarmRead(alarmChk);
	});

	function alarmRead(alarmChk) { // 개별 버튼 알림 읽음 처리(가져온 글 번호 대상)
		console.log(alarmChk);
		$.ajax({
			type : 'get',
			url : '<c:url value="/alarm/read.ajax"/>',
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
			url : '<c:url value="/alarm/readAll.ajax"/>',
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

    <%
	    } else {
	%>
    <header id="header">
        <div class="headerInner">
            <h1 class="logo"><a href="<c:url value='/main'/>"><img src="<c:url value='/resources/img/logo.png'/>" alt="모래사장"></a></h1>
            <ul class="util utilBefore">
                <li><a href="<c:url value='/user/login'/>">로그인</a></li>
                <li><a href="<c:url value='/user/register'/>">회원가입</a></li>
            </ul>
        </div>
    </header>
    <%
	    }
	%>
</body>
</html>