<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 쪽지 보내기</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
        #msgWrite{position:relative; margin-top:100px; overflow: hidden;}
        #lnb{position: fixed; left:0; top:100px; width:300px; height:100%; background-color: #f9f9f9; z-index: 99;}
        #lnb ul{margin-top:20px;}
        #lnb ul li{width:280px; height:60px; line-height: 60px; box-sizing: border-box; border-radius: 10px; margin:10px auto; padding-left:40px; font-family: 'KorailRoundGothicBold';}
        #lnb ul li.on{background-color: #fcdfa0; color:#fff;}
        #msgWrite .msgWriteInner{position:relative; left:300px; height:800px;}
        #msgWrite .msgWriteInner .msgWriteInnerBox{position:relative; width:500px; top:10%; margin:0 30%;}
        #msgWrite .msgWriteInner .msgWriteInnerBox h2{text-align: center; font-size:38px; margin-bottom: 10px;}
        #msgWrite .msgWriteInner .msgWriteInnerBox>p{text-align: center; color:#888; margin-bottom: 50px;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox{width:330px; margin:0 auto;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .textBox{margin-bottom: 15px;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .textBox p{font-size:18px; margin-bottom: 5px; letter-spacing: 1px;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .textBox input:focus::placeholder{color:transparent}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .textBox textarea{width:100%; height:200px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:15px; resize: none;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .textBox textarea:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .textBox textarea:focus::placeholder{color:transparent}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .checkTextBox{position:relative; width:100%; height:20px; margin-bottom: 10px;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .checkTextBox .checkText{position:absolute;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .checkTextBox .checkText span{font-size:12px; position:relative; top:-2px;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .checkTextBox .checkText{display: none;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .checkTextBox .checkText.match span{color:green;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .checkTextBox .checkText.noMatch span{color:red;}
        #msgWrite .msgWriteInner .msgWriteInnerBox .msgWriteBox .checkTextBox .checkText.myMatch span{color:orange;}
    </style>
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div id="lnb">
        <ul>
            <a href="rcvList"><li>받은 쪽지</li></a>
            <a href="sendList"><li>보낸 쪽지</li></a>
            <a href="write"><li class="on">쪽지 보내기</li></a>
        </ul>
    </div>
    <section id="msgWrite">
      <form action="send" method="post" name="msgWriteForm">
        <div class="msgWriteInner">
            <div class="msgWriteInnerBox">
                <h2>쪽지 보내기</h2>
                <p>다른 회원에게 쪽지를 보내보세요!</p>
                <div class="msgWriteBox">
                    <div class="textBox">
                        <p>쪽지 받을 닉네임</p>
                        <input type="text" placeholder="받을 회원의 닉네임을 입력해주세요." value="" name="nickName" id="nameCheck"/>
                    </div>
                    <div class="checkTextBox">
                        <div class="checkText match">
                            <span>&nbsp;&nbsp;* 해당 회원이 확인되었습니다. </span><svg width="13" height="13" viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg">
                                <path fill="currentColor" color="green" d="m10.6 16.6l7.05-7.05l-1.4-1.4l-5.65 5.65l-2.85-2.85l-1.4 1.4l4.25 4.25ZM12 22q-2.075 0-3.9-.788t-3.175-2.137q-1.35-1.35-2.137-3.175T2 12q0-2.075.788-3.9t2.137-3.175q1.35-1.35 3.175-2.137T12 2q2.075 0 3.9.788t3.175 2.137q1.35 1.35 2.138 3.175T22 12q0 2.075-.788 3.9t-2.137 3.175q-1.35 1.35-3.175 2.138T12 22Zm0-2q3.35 0 5.675-2.325T20 12q0-3.35-2.325-5.675T12 4Q8.65 4 6.325 6.325T4 12q0 3.35 2.325 5.675T12 20Zm0-8Z"/>
                            </svg>
                        </div>
                        <div class="checkText noMatch">
                            <span>&nbsp;&nbsp;* 닉네임을 다시 확인해주세요. </span><svg width="13" height="13" viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg">
                                <path fill="none" color="red" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 21a9 9 0 0 0 9-9a9 9 0 0 0-9-9a9 9 0 0 0-9 9a9 9 0 0 0 9 9zM9 8l6 8m0-8l-6 8"/>
                            </svg>
                        </div>
                        <div class="checkText myMatch">
                            <span>&nbsp;&nbsp;* 자신에게 쪽지를 전달할 수 없습니다. </span><svg width="13" height="13" viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg">
                                <path fill="none" color="orange" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 21a9 9 0 0 0 9-9a9 9 0 0 0-9-9a9 9 0 0 0-9 9a9 9 0 0 0 9 9zM9 8l6 8m0-8l-6 8"/>
                            </svg>
                        </div>
                    </div>
                    <div class="textBox">
                        <p>쪽지 내용</p>
                        <textarea placeholder="쪽지 내용을 입력해주세요." name="content"></textarea>
                    </div>
                    
                    <div class="btnBox">
                        <input type="submit" value="보내기" id="send" onclick="return check()"/>
                    </div>
                </div>
            </div>
        </div>
      </form>
    </section>
</body>
<script>
var senerNickName = '${senerNickName}';
if(senerNickName != ''){
	$('#nameCheck').val(senerNickName);
	$('#nameCheck').focus();
}

var msg = '${msg}';
if(msg != ''){
	alert(msg);
}
	
function check(){
	if(msgWriteForm.nickName.value.length == 0){
		alert("받을 회원의 닉네임을 입력해주세요.");
		msgWriteForm.nickName.focus();
		return false;
	}
	
	if(msgWriteForm.content.value.length == 0){
		alert("쪽지 내용을 입력해주세요.");
		msgWriteForm.content.focus();
		return false;
	}
	
	if ($('.noMatch').css('display') === 'block'){
		alert("닉네임을 다시 확인해주세요.");
		msgWriteForm.nickName.focus();
		return false;
	}
}

$('#nameCheck').on('focusout',function(){
	
	var nickName = $('input[name = "nickName"]').val();
	
	if($(this).val()==0){
	      $('.checkText').css('display','none');
	   }else{
	      $.ajax({
	         type: 'post',
	         url: 'nameCheck.ajax',
	         data: {"nickName":nickName},
	         dataType: 'json',
	         success:function(data){
	            if(data.check==1){
	               $('.myMatch').css('display','block');
	               $('.myMatch').siblings().css('display', 'none');
	            }else if(data.check==2){
	               $('.noMatch').css('display','block');
	               $('.noMatch').siblings().css('display', 'none');
	            }else if(data.check==3){
	            	$('.match').css('display','block');
	            	$('.match').siblings().css('display', 'none');
	            }
	         },
	         error:function(e){
	            console.log(e);
	         }
	      });
	   }
});
</script>
</html>