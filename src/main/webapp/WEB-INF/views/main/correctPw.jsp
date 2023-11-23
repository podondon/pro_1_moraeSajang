<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 비밀번호 재설정</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<style>
        #correctPw{position:relative; margin-top:100px;}
        #correctPw .correctPwInner{width:80%; height:500px; margin: 0 auto; padding-top:100px;}
        #correctPw .correctPwInner h2{text-align: center; font-size:38px; margin-bottom: 10px;}
        #correctPw .correctPwInner>p{text-align: center; color:#888; margin-bottom: 50px;}
        #correctPw .correctPwInner .correctPwBox{width:330px; margin:0 auto;}
        #correctPw .correctPwInner .correctPwBox .textBox{margin-bottom: 15px;}
        #correctPw .correctPwInner .correctPwBox .textBox p{font-size:18px; margin-bottom: 5px; letter-spacing: 1px;}
        #correctPw .correctPwInner .correctPwBox .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #correctPw .correctPwInner .correctPwBox .textBox input.pass{font-family : 'Malgun Gothic';}
        #correctPw .correctPwInner .correctPwBox .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #correctPw .correctPwInner .correctPwBox .textBox input:focus::placeholder{color:transparent}
        #correctPw .correctPwInner .correctPwBox .btnBox{width:330px;}
        #correctPw .correctPwInner .correctPwBox .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
        #correctPw .correctPwInner .correctPwBox .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox{position:relative; width:100%; height:20px;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox .checkText{position:absolute;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox .checkText span{font-size:12px; position:relative; top:-2px;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox .checkText{display: none;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox .checkText.match span{color:green;}
        #correctPw .correctPwInner .correctPwBox .checkTextBox .checkText.noMatch span{color:red;}
</style>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <section id="correctPw">
   	 	<form action="newPw" method="post">
        <div class="correctPwInner">
            <h2>비밀번호 재설정</h2>
            <p>새로운 비밀번호를 입력해주세요.</p>
            <div class="correctPwBox">
                <div class="textBox">
                    <p>새로운 비밀번호</p>
                    <input type="password" class="pass"placeholder="새로운 비밀번호를 입력해주세요." value="" id="newPw"/>
                </div>
                <div class="textBox">
                    <p>새로운 비밀번호 확인</p>
                    <input type="password" class="pass" placeholder="새로운 비밀번호를 입력해주세요." value="" id="checkPw" name="newPw"/>
                </div>
                <div class="checkTextBox">
                    <div class="checkText match">
                        <span>&nbsp;&nbsp;* 비밀번호가 일치합니다. </span><svg width="13" height="13" viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg">
                            <path fill="currentColor" color="green" d="m10.6 16.6l7.05-7.05l-1.4-1.4l-5.65 5.65l-2.85-2.85l-1.4 1.4l4.25 4.25ZM12 22q-2.075 0-3.9-.788t-3.175-2.137q-1.35-1.35-2.137-3.175T2 12q0-2.075.788-3.9t2.137-3.175q1.35-1.35 3.175-2.137T12 2q2.075 0 3.9.788t3.175 2.137q1.35 1.35 2.138 3.175T22 12q0 2.075-.788 3.9t-2.137 3.175q-1.35 1.35-3.175 2.138T12 22Zm0-2q3.35 0 5.675-2.325T20 12q0-3.35-2.325-5.675T12 4Q8.65 4 6.325 6.325T4 12q0 3.35 2.325 5.675T12 20Zm0-8Z"/>
                        </svg>
                    </div>
                    <div class="checkText noMatch">
                        <span>&nbsp;&nbsp;* 비밀번호가 일치하지 않습니다. </span><svg width="13" height="13" viewBox="0 0 22 22" xmlns="http://www.w3.org/2000/svg">
                            <path fill="none" color="red" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 21a9 9 0 0 0 9-9a9 9 0 0 0-9-9a9 9 0 0 0-9 9a9 9 0 0 0 9 9zM9 8l6 8m0-8l-6 8"/>
                        </svg>
                    </div>
                </div>
                <div class="btnBox">
                    <input type="submit" value="확인" onclick="return check()"/>
                </div>
            </div>
        </div>
      </form>
    </section>
</body>
<script>
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	}
	
	$('#checkPw').on('keyup',function(){
		if($(this).val() == ""){
			$('.checkText').css('display','none');
		}else if($(this).val() == $('#newPw').val()){
			$('.match').css('display','block');
			$('.noMatch').css('display','none');
		}else if($(this).val() != $('#newPw').val()){
			$('.noMatch').css('display','block');
			$('.match').css('display','none');
		}
	});
	
	function check(){
		if($('#checkPw').val() != $('#newPw').val()){
			alert("비밀번호를 다시 확인해주세요.");
			$('#checkPw').focus();
			return false;
		}
	}
	
	
</script>
</html>