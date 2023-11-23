<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 받은 쪽지함</title>
<!-- bootstrap : 디자인을 위한 프레임워크 -->
<link href="<c:url value='/resources/css/paging.css'/>" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="<c:url value='/resources/js/paging.js'/>" type="text/javascript"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<style>
        #msgList{position:relative; margin-top:130px; overflow: hidden;}
        #lnb{position: fixed; left:0; top:100px; width:300px; height:100%; background-color: #f9f9f9; z-index: 99;}
        #lnb ul{margin-top:20px;}
        #lnb ul li{width:280px; height:60px; line-height: 60px; box-sizing: border-box; border-radius: 10px; margin:10px auto; padding-left:40px; font-family: 'KorailRoundGothicBold';}
        #lnb ul li.on{background-color: #fcdfa0; color:#fff;}
        #lnb a:hover{text-decoration:none;}
        #msgList .msgListInner{position:relative; left:300px;}
        #msgList .msgListInner .pagingArea{position: relative; width:400px; height: 36px; border: 1px solid #b7b7b7; margin:0 32%;}
        #msgList .msgListInner .msgListInnerBox{position:relative; width:700px; height:670px; margin:0 25%;}
        #msgList .msgListInner .msgListInnerBox h2{text-align: center; font-size:38px; margin-bottom: 20px;}
        #msgList .msgListInner .msgListInnerBox p{font-size:30px;}
        #msgList .msgListInner .msgListInnerBox .allDel{position:relative; left:585px; color:#FFBC38; font-family: 'KorailRoundGothicBold';}
        #msgList .msgListInner .msgListInnerBox .allDel:hover{text-decoration: underline;}
        #msgList .msgListInner .msgListInnerBox .msgListBox{position: relative; width:700px; height:600px; margin:10px auto;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg{position:relative; height:110px; border-bottom: 1px solid #ccc; background-color: #fff7e7;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg:nth-child(5n+1){border-top: 1px solid #ccc; border-bottom: 1px solid #ccc;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm{position:relative; width: 600px; height:110px; margin:0 auto;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm>div{position:relative; float:left;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .leftArea{width:20%;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .centerArea{width:50%; cursor: pointer;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .centerArea:hover a{text-decoration: underline;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .rightArea{width:30%;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .leftArea .profileImg{position:relative; top:15px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .centerArea .nickName{position:relative; top:20px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .centerArea .msgContent{position:relative; top:18px; font-size:16px; color:#888;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .rightArea .msgDate{position:absolute; top:15px; right:0; font-size:16px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .rightArea .read{position:absolute; top:70px; right:40px; font-size:14px; font-family: 'KorailRoundGothicBold';}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .rightArea .notRead{position:absolute; top:70px; right:40px; font-size:16px; font-family: 'KorailRoundGothicBold'; color:#FFBC38; animation: blinking 1.5s linear infinite;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .rightArea .delImg{position: absolute; top:67px; right:0; color:#999;}
        #msgList .msgListInner .msgListInnerBox .msgListBox>.msg .msgForm .rightArea .delImg:hover{color:#212732;}
        #msgList .msgListInner .msgListInnerBox .noMsg{text-align: center; display:none;}
        #msgList .msgListInner .msgListInnerBox .noMsg p{font-size:22px; color:#888; margin-top: 150px;}
        .container {padding-right: 280px;}

        @keyframes blinking {
            0% { color: #FFBC38; }
            50% { color: #FFFFFF; }
            100% { color: #FFBC38; }
        }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerPg.jsp" %>
    <div id="lnb">
        <ul>
            <a href="rcvList"><li class="on">받은 쪽지</li></a>
            <a href="sendList"><li>보낸 쪽지</li></a>
            <a href="write"><li>쪽지 보내기</li></a>
        </ul>
    </div>
    <section id="msgList">
        <div class="msgListInner">
            <div class="msgListInnerBox">
                <h2>받은 쪽지</h2>
                <a href="rcvAllDel" class="allDel" onclick="return del()">전체삭제</a>
                	<div class="noMsg">
                    <p>받은 쪽지가 없습니다.</p>
                    <svg width="200" height="200" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path fill="none" stroke="currentColor" color="#fad996" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 9h8m-8 4h6m-.5 6.5L12 21l-3-3H6a3 3 0 0 1-3-3V7a3 3 0 0 1 3-3h12a3 3 0 0 1 3 3v6m1 9l-5-5m0 5l5-5"/>
                    </svg>
                </div>
                <ul class="msgListBox">
                	
                </ul>
            </div>
            	<div class="container">
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
            </div>
    </section>
</body>
<script>
var showPage = 1;
msgListCall(showPage);

var msgRcvListCall = setInterval(function() {
	  msgListCall(showPage);
	}, 3000);
	
	function del(){
		if (confirm("한번 삭제한 자료는 복구할 방법이 없습니다. \n\n정말 삭제하시겠습니까?")) {
			  return true;
			}else{
				return false;
			}
	}
	

	function msgListCall(page){
		console.log(page);
		$.ajax({
			type: 'post',
			url: 'rcvListCall.ajax',
			data: {'page':page},
			dataType: 'json',
			success:function(data){
				if(data.pages==0){
					$('.noMsg').css('display','block');
					$('.allDel').css('display','none');
				}else{
					$('.noMsg').css('display','none');
					$('.allDel').css('display','block');
				}
				drawMsgRcvList(data);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function drawMsgRcvList(obj){
		var content = '';
		obj.rcvList.forEach(function(item, idx){
			content += '<li class="msg"><div class="msgForm">';
			content += '<div class="leftArea"><svg width="80" height="80" viewBox="0 0 66 63" fill="none" xmlns="http://www.w3.org/2000/svg" class="profileImg"><path d="M66 31C66 48.1208 51.2254 62 33 62C14.7746 62 0 48.1208 0 31C0 13.8792 14.7746 0 33 0C51.2254 0 66 13.8792 66 31Z" fill="#EDEDED"/><path d="M33.491 33.625C35.836 33.625 38.0851 32.6965 39.7433 31.0439C41.4015 29.3912 42.3331 27.1497 42.3331 24.8125C42.3331 22.4753 41.4015 20.2338 39.7433 18.5811C38.0851 16.9285 35.836 16 33.491 16C31.1459 16 28.8969 16.9285 27.2386 18.5811C25.5804 20.2338 24.6488 22.4753 24.6488 24.8125C24.6488 27.1497 25.5804 29.3912 27.2386 31.0439C28.8969 32.6965 31.1459 33.625 33.491 33.625ZM14.2299 52.6982C13.9563 53.427 13.9261 54.2245 14.1438 54.9718C14.3615 55.7191 14.8156 56.3764 15.4383 56.8459C20.6001 60.844 26.9536 63.0098 33.491 63C40.2994 63 46.5714 60.697 51.5613 56.8312C52.8287 55.853 53.3415 54.1787 52.7638 52.6893C51.2673 48.806 48.6244 45.4663 45.1841 43.1108C41.7438 40.7554 37.6677 39.4949 33.4938 39.4959C29.3199 39.4969 25.2444 40.7591 21.8052 43.1162C18.366 45.4732 15.7247 48.8142 14.2299 52.6982Z" fill="#DCBB7C"/></svg></div>';
			if(item.messageContent.length === 20){
				content += '<div class="centerArea"><a href="rcvDetail?messagesNo='+item.messagesNo+'"><p class="nickName">'+item.senerNickName+'</p><p class="msgContent">'+item.messageContent+'...</p></a></div>';
			}else{
				content += '<div class="centerArea"><a href="rcvDetail?messagesNo='+item.messagesNo+'"><p class="nickName">'+item.senerNickName+'</p><p class="msgContent">'+item.messageContent+'</p></a></div>';
			}
			var date = new Date(item.sentDate);
			var dateStr = date.toLocaleDateString("ko-KR");
			content += '<div class="rightArea"><p class="msgDate">'+dateStr+'</p>';
			if(item.messageRead == 'N'){
				content += '<p class="notRead">안읽음</p>';
			}else{
				content += '<p class="read">읽음</p>';
			}
			content += '<a href="rcvDel?messagesNo='+item.messagesNo+'" onclick="return del()"><svg width="22" height="22" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="delImg"><path fill="currentColor" d="M7 21q-.825 0-1.413-.588T5 19V6H4V4h5V3h6v1h5v2h-1v13q0 .825-.588 1.413T17 21H7ZM17 6H7v13h10V6ZM9 17h2V8H9v9Zm4 0h2V8h-2v9ZM7 6v13V6Z"/></svg></a>';
			content += '</div></li>';
		});
		$('.msgListBox').empty();
		$('.msgListBox').append(content);
		
		// 페이징 처리 UI 그리기(플러그인 사용)
		$('#pagination').twbsPagination({
			startPage:1, // 보여줄 페이지
			totalPages:obj.pages,// 총 페이지 수(총갯수/페이지당보여줄게시물수) : 서버에서 계산해서 가져와야함
			visiblePages:5,//[1][2][3][4][5]
			onPageClick:function(e,page){ // 번호 클릭시 실행할 내용
				//console.log(e);
				if(showPage != page){
					console.log(page);
					showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
					msgListCall(page);
				}
			}
		});
	}
</script>
</html>