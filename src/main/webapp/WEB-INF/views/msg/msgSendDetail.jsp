<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 보낸 쪽지 상세</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
        #msgList{position:relative; margin-top:150px; overflow: hidden;}
        #sendmsgList{display: none;}
        #lnb{position: fixed; left:0; top:100px; width:300px; height:100%; background-color: #f9f9f9; z-index: 99;}
        #lnb ul{margin-top:20px;}
        #lnb ul li{width:280px; height:60px; line-height: 60px; box-sizing: border-box; border-radius: 10px; margin:10px auto; padding-left:40px; font-family: 'KorailRoundGothicBold';}
        #lnb ul li.on{background-color: #fcdfa0; color:#fff;}
        #msgList .msgListInner{position:relative; left:300px;}
        #msgList .msgListInner .pagingArea{position: relative; width:400px; height: 36px; border: 1px solid #b7b7b7; margin:0 32%;}
        #msgList .msgListInner .msgListInnerBox{position:relative; width:700px; height:720px; margin:0 25%;}
        #msgList .msgListInner .msgListInnerBox h2{text-align: center; font-size:38px; margin-bottom: 40px;}
        #msgList .msgListInner .msgListInnerBox p{font-size:30px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox{position: relative; width:700px; height:550px; margin:20px auto; border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; box-sizing: border-box; background-color: #fff7e7;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg{position:relative; height:110px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm{position:relative; width: 600px; height:110px; margin:0 auto; padding-top:10px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm>div{position:relative; float:left;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm .leftArea{width:20%;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm .centerArea{width:50%;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm .rightArea{width:30%;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm .leftArea .profileImg{position:relative; top:15px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm .centerArea .nickName{position:relative; top:20px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm .centerArea .sendDate{position:relative; top:40px; font-size:16px; color:#888;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm .rightArea .returnList{position:absolute; top:45px; right:40px; font-size:16px; color:#999;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm .rightArea .returnList:hover{color:#212732;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm .rightArea .delImg{position: absolute; top:45px; right:0; color:#999;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msg .msgForm .rightArea .delImg:hover{color:#212732;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msgContent{position:relative; width:600px; margin:0 auto; background-color: #fdebc4; height:360px; margin-top:30px; border-radius: 10px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msgContent .contentInner{padding:20px;}
        #msgList .msgListInner .msgListInnerBox .msgListBox .msgContent .contentInner .msgText{font-size: 22px;}
        #msgList .msgListInner .msgListInnerBox .btnBox{position:relative; width:330px; margin:0 auto; height:50px; margin-top:15px; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer; text-align: center; box-sizing: border-box;}
        #msgList .msgListInner .msgListInnerBox .btnBox:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div id="lnb">
        <ul>
            <a href="rcvList"><li>받은 쪽지</li></a>
            <a href="sendList"><li class="on">보낸 쪽지</li></a>
            <a href="write"><li>쪽지 보내기</li></a>
        </ul>
    </div>
    <section id="msgList">
        <div class="msgListInner">
            <div class="msgListInnerBox">
                <h2>보낸 쪽지</h2>
                <div class="msgListBox">
                    <div class="msg">
                        <div class="msgForm">
                            <div class="leftArea">
                                <svg width="80" height="80" viewBox="0 0 66 63" fill="none" xmlns="http://www.w3.org/2000/svg" class="profileImg">
                                <path d="M66 31C66 48.1208 51.2254 62 33 62C14.7746 62 0 48.1208 0 31C0 13.8792 14.7746 0 33 0C51.2254 0 66 13.8792 66 31Z" fill="#EDEDED"></path>
                                <path d="M33.491 33.625C35.836 33.625 38.0851 32.6965 39.7433 31.0439C41.4015 29.3912 42.3331 27.1497 42.3331 24.8125C42.3331 22.4753 41.4015 20.2338 39.7433 18.5811C38.0851 16.9285 35.836 16 33.491 16C31.1459 16 28.8969 16.9285 27.2386 18.5811C25.5804 20.2338 24.6488 22.4753 24.6488 24.8125C24.6488 27.1497 25.5804 29.3912 27.2386 31.0439C28.8969 32.6965 31.1459 33.625 33.491 33.625ZM14.2299 52.6982C13.9563 53.427 13.9261 54.2245 14.1438 54.9718C14.3615 55.7191 14.8156 56.3764 15.4383 56.8459C20.6001 60.844 26.9536 63.0098 33.491 63C40.2994 63 46.5714 60.697 51.5613 56.8312C52.8287 55.853 53.3415 54.1787 52.7638 52.6893C51.2673 48.806 48.6244 45.4663 45.1841 43.1108C41.7438 40.7554 37.6677 39.4949 33.4938 39.4959C29.3199 39.4969 25.2444 40.7591 21.8052 43.1162C18.366 45.4732 15.7247 48.8142 14.2299 52.6982Z" fill="#DCBB7C"></path>
                                </svg>
                            </div>
                            <div class="centerArea">
                                <p class="nickName">${item.senerNickName}</p>
                                <p class="sendDate">${item.sentDate}</p>
                            </div>
                            <div class="rightArea">
                                <a href="sendList"><svg width="22" height="22" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg" class="returnList">
                                    <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="48" d="M160 144h288M160 256h288M160 368h288"/>
                                    <circle cx="80" cy="144" r="16" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                                    <circle cx="80" cy="256" r="16" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                                    <circle cx="80" cy="368" r="16" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/>
                                </svg></a>
                                <a href="sendDel?messagesNo=${item.messagesNo}" onclick="return del()"><svg width="22" height="22" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" class="delImg">
                                    <path fill="currentColor" d="M7 21q-.825 0-1.413-.588T5 19V6H4V4h5V3h6v1h5v2h-1v13q0 .825-.588 1.413T17 21H7ZM17 6H7v13h10V6ZM9 17h2V8H9v9Zm4 0h2V8h-2v9ZM7 6v13V6Z"></path>
                                </svg></a>
                            </div>
                        </div>
                    </div>
                    <div class="msgContent">
                        <div class="contentInner">
                            <p class="msgText">${item.messageContent}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script>
function del(){
	if (confirm("한번 삭제한 자료는 복구할 방법이 없습니다. \n\n정말 삭제하시겠습니까?")) {
		  return true;
		}else{
			return false;
		}
}
</script>
</html>