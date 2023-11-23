<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 아이디찾기</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
        #findId{position:relative; margin-top:100px;}
        #findId .findIdInner{width:80%; height:500px; margin: 0 auto; padding-top:100px;}
        #findId .findIdInner h2{text-align: center; font-size:38px; margin-bottom: 10px;}
        #findId .findIdInner>p{text-align: center; color:#888; margin-bottom: 50px;}
        #findId .findIdInner .findIdBox{width:330px; margin:0 auto;}
        #findId .findIdInner .findIdBox .textBox{margin-bottom: 15px;}
        #findId .findIdInner .findIdBox .textBox p{font-size:18px; margin-bottom: 5px; letter-spacing: 1px;}
        #findId .findIdInner .findIdBox .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #findId .findIdInner .findIdBox .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #findId .findIdInner .findIdBox .textBox input:focus::placeholder{color:transparent}
        #findId .findIdInner .findIdBox .btnBox{width:330px;}
        #findId .findIdInner .findIdBox .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
        #findId .findIdInner .findIdBox .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <section id="findId">
        <div class="findIdInner">
            <h2>아이디 찾기</h2>
            <p>아이디는 가입시 입력하신 이메일로 찾으실 수 있습니다.</p>
            <div class="findIdBox">
                <div class="textBox">
                    <p>이름</p>
                    <input type="text" placeholder="이름을 입력해주세요." name="name" value=""/>
                </div>
                <div class="textBox">
                    <p>이메일</p>
                    <input type="text" placeholder="이메일을 입력해주세요." name="email" value=""/>
                </div>
                <div class="btnBox">
                    <input type="button" id="findIdBtn" value="확인"/>
                </div>
            </div>
        </div>
    </section>
</body>
<script>
	$("#findIdBtn").on('click',function(){
		var $name = $('input[name = "name"]');
		var $email = $('input[name = "email"]');
		
		if($name.val() == ''){
			alert("이름을 입력해주세요.");
			$name.focus();
		}else if($email.val() == ''){
			alert("이메일을 입력해주세요.")
			$email.focus();
		}else{
			var param = {};
			param.name = $name.val();
			var regex = new RegExp('^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$');
			var match = regex.test($email.val());
			if(!match){
				alert("이메일 형식으로 입력해주세요.");
				$email.focus();
				return false;
			}
			param.email = $email.val();
			
			// console.log(param); 파람값 확인
			
			$.ajax({
				type: 'post',
				url: 'findId.ajax',
				data:param,
				dataType:'json',
				success:function(data){
					if(data.foundId != null){
						alert('회원가입시 사용한 아이디는 '+data.foundId+'입니다.')
					}else{
						alert('일치하는 회원정보가 없습니다. 다시 확인해주세요.')
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