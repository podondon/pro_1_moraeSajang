<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 로그인</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
        #login{position:relative; margin-top:100px;}
        #login .loginInner{width:80%; height:500px; margin:0 auto; padding-top:100px;}
        #login .loginInner h2{text-align: center; font-size:38px; margin-bottom: 50px;}
        #login .loginInner .loginBox{width:330px; margin:0 auto;}
        #login .loginInner .loginBox .textBox{margin-bottom: 15px;}
        #login .loginInner .loginBox .textBox p{font-size:18px; margin-bottom: 5px;}
        #login .loginInner .loginBox .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #login .loginInner .loginBox .textBox .pw{font-family: 'Malgun Gothic';}
        #login .loginInner .loginBox .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #login .loginInner .loginBox .textBox input:focus::placeholder{color: transparent;}
        #login .loginInner .loginBox .btnBox{width:330px;}
        #login .loginInner .loginBox .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
        #login .loginInner .loginBox .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
        #login .loginInner .loginBox .btnBox .detailBtn{width:231px; height:15px; margin: 0 auto;}
        #login .loginInner .loginBox .btnBox .detailBtn li{float:left; color:#888; font-size:14px;}
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <section id="login">
    	<form action="loginGo" method="post">
        <div class="loginInner">
            <h2>로그인</h2>
            <div class="loginBox">
                <div class="textBox">
                    <p>아이디</p>
                    <input type="text" placeholder="아이디를 입력하세요." value="" class="id" name="id"/>
                </div>
                <div class="textBox">
                    <p>비밀번호</p>
                    <input type="password" placeholder="비밀번호를 입력하세요." value="" class="pw" name="pw"/>
                </div>
                <div class="btnBox">
                    <input type="submit" value="로그인"/>
                    <ul class="detailBtn">
                        <a href="findId"><li>아이디 찾기 |</li></a>
                        <a href="findPw"><li>&nbsp;비밀번호 찾기 |</li></a>
                        <a href="register"><li>&nbsp;회원가입</li></a>
                    </ul>
                </div>
            </div>
        </div>
        </form>
    </section>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
</script>
</html>