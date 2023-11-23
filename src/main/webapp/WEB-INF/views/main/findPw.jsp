<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 비밀번호찾기</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
        #findPw{position:relative; margin-top:100px;}
        #findPw .findPwInner{width:80%; height:500px; margin: 0 auto; padding-top:50px;}
        #findPw .findPwInner h2{text-align: center; font-size:38px; margin-bottom: 10px;}
        #findPw .findPwInner>p{text-align: center; color:#888; margin-bottom: 50px;}
        #findPw .findPwInner .findPwBox{width:330px; margin:0 auto;}
        #findPw .findPwInner .findPwBox .textBox{margin-bottom: 15px;}
        #findPw .findPwInner .findPwBox .textBox p{font-size:18px; margin-bottom: 5px; letter-spacing: 1px;}
        #findPw .findPwInner .findPwBox .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #findPw .findPwInner .findPwBox .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #findPw .findPwInner .findPwBox .textBox input:focus::placeholder{color:transparent}
        #findPw .findPwInner .findPwBox .textBox select{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #findPw .findPwInner .findPwBox .textBox select:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #findPw .findPwInner .findPwBox .btnBox{width:330px; margin-bottom: 5px;}
        #findPw .findPwInner .findPwBox .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
        #findPw .findPwInner .findPwBox .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
        #findPw .findPwInner .findPwBox .idFind{width:267px; margin:0 auto;}
        #findPw .findPwInner .findPwBox .idFind span{font-size:14px; color:#888;}
        #findPw .findPwInner .findPwBox .idFind a{color:#FFBC38;}
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<section id="findPw">
	<form action="findPw" method="post" name="findPwForm">
        <div class="findPwInner">
            <h2>비밀번호 찾기</h2>
            <p>비밀번호 가입 시 입력하신 힌트로 찾으실 수 있습니다.</p>
            <div class="findPwBox">
                <div class="textBox">
                    <p>아이디</p>
                    <input type="text" placeholder="아이디를 입력해주세요." name="id" value=""/>
                </div>
                <div class="textBox">
                    <p>이름</p>
                    <input type="text" placeholder="이름을 입력해주세요." name="name" value=""/>
                </div>
                <div class="textBox">
                    <p>이메일</p>
                    <input type="text" placeholder="이메일을 입력해주세요." name="email" value=""/>
                </div>
                <div class="textBox">
                    <p>비밀번호 힌트</p>
                    <select id="selector" name="hintNo">
                        <option value="0">선택해 주세요.</option>
                        <option value="1">나의 출신 초등학교는?</option>
                        <option value="2">내가 좋아하는 캐릭터는?</option>
                        <option value="3">다시 태어나면 되고 싶은 것은?</option>
                        <option value="4">가장 좋아하는 색깔은?</option>
                        <option value="5">나의 출신 고향은?</option>
                    </select>
                </div>
                <div class="textBox">
                    <p>비밀번호 정답</p>
                    <input type="text" placeholder="정답을 입력해주세요." name="hintAnswer" value=""/>
                </div>
                <div class="btnBox">
                    <input type="submit" id="findPwBtn" value="확인" onclick="return check()"/>
                </div>
                <div class="idFind">
                    <span>아이디가 기억나지 않는다면? &nbsp;&nbsp;</span><a href="findId">아이디 찾기</a>
                </div>
            </div>
        </div>
       </form>
    </section>
</body>
<script>
function check(){
	/* 아이디 유효성 검사 */
	if(findPwForm.id.value.length == 0){ // myform.id.value == "" 이것도 가능
		alert("아이디를 입력해주세요.");
		findPwForm.id.focus(); // 포커스를 이동시켜 바로 아이디를 입력할 수 있게
		return false;
	}
	
	if(findPwForm.name.value.length == 0){
		alert("이름을 입력해주세요.");
		findPwForm.name.focus(); // 포커스를 이동시켜 바로 이름을 입력할 수 있게
		return false;
	}
	
	if(findPwForm.email.value.length == 0){
		alert("이메일을 입력해주세요.");
		findPwForm.email.focus(); 
		return false;
	}else{
		var regex = new RegExp('^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$');
		var match = regex.test(findPwForm.email.value);
		if(!match){
			alert("이메일 형식으로 입력해주세요.");
			findPwForm.email.focus();
			return false;
			}
		}
	
	if(findPwForm.hintNo.value == "0"){
		alert("비밀번호 힌트를 선택해주세요.");
		findPwForm.hintNo.focus(); 
		return false;
	}
	
	if(findPwForm.hintAnswer.value == 0){
		alert("비밀번호 정답을 입력해주세요.");
		findPwForm.hintAnswer.focus(); 
		return false;
	}
}

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>