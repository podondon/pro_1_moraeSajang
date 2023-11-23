<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 포인트 충전</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
        #pointCharge{position:relative; margin-top:120px; margin-left:300px;}
        #lnb{position: fixed; left:0; top:100px; width:300px; height:100%; background-color: #f9f9f9; z-index: 99;}
        #lnb ul{margin-top:20px;}
        #lnb ul li{width:280px; height:60px; line-height: 60px; box-sizing: border-box; border-radius: 10px; margin:10px auto; padding-left:40px; font-family: 'KorailRoundGothicBold';}
        #lnb ul li.on{background-color: #fcdfa0; color:#fff;}
        #lnb ul a:hover{text-decoration:none;}
        #lnb .logout{position:absolute; margin-left:50px; bottom:200px;}
        #lnb .logout a span{font-size:20px; line-height:25px; position:relative; top:-7px; color:#FFBC38;}
        #pointCharge .correctPwInner{width:80%; height:500px; margin: 0 auto; padding-top:50px;}
        #pointCharge .correctPwInner h2{text-align: center; font-size:38px; margin-bottom: 10px;}
        #pointCharge .correctPwInner>p{text-align: center; color:#888; margin-bottom: 50px;}
        #pointCharge .correctPwInner .correctPwBox{width:330px; margin:0 auto;}
        #pointCharge .correctPwInner .correctPwBox .textBox{position: relative; margin-bottom: 15px;}
        #pointCharge .correctPwInner .correctPwBox .textBox p{font-size:18px; margin-bottom: 5px; letter-spacing: 1px;}
        #pointCharge .correctPwInner .correctPwBox .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #pointCharge .correctPwInner .correctPwBox .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #pointCharge .correctPwInner .correctPwBox .textBox input:focus::placeholder{color:transparent}
        #pointCharge .correctPwInner .correctPwBox .textBox select{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
        #pointCharge .correctPwInner .correctPwBox .textBox select:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
        #pointCharge .correctPwInner .correctPwBox .textBox div p{font-size:22px; padding:5px 0; letter-spacing: 0; color:#000; text-decoration: underline;}
        #pointCharge .correctPwInner .correctPwBox .textBox div span{font-size:12px; color: #888;}
        #pointCharge .correctPwInner .correctPwBox .pointBox{height:110px;}
        #pointCharge .correctPwInner .correctPwBox .pointBox .myPoint{position:absolute; right:0; bottom: 0;}
        #pointCharge .correctPwInner .correctPwBox .pointBox .myPoint span{font-size:14px; font-family: 'KorailRoundGothicBold'; color: #212732; letter-spacing: 0;}
        #pointCharge .correctPwInner .correctPwBox .btnBox{width:330px; margin-bottom: 5px;}
        #pointCharge .correctPwInner .correctPwBox .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
        #pointCharge .correctPwInner .correctPwBox .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="lnb">
        <ul>
			<a href="<c:url value="/mypage"/>"><li>내 프로필</li></a>
			<a href="<c:url value="/mypage/groupBuy/gbList"/>"><li>내 공구 현황</li></a>
			<a href="<c:url value="/mypage/point/history"/>"><li>포인트 내역</li></a>
			<a href="<c:url value="/mypage/point/charge"/>"><li class="on">포인트 충전</li></a>
		</ul>
		<div class=logout>
			<a href="<c:url value='/user/logout'/>"><svg width="26" height="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M8.8999 7.55999C9.2099 3.95999 11.0599 2.48999 15.1099 2.48999H15.2399C19.7099 2.48999 21.4999 4.27999 21.4999 8.74999V15.27C21.4999 19.74 19.7099 21.53 15.2399 21.53H15.1099C11.0899 21.53 9.2399 20.08 8.9099 16.54" stroke="#FFBC38" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M15.0001 12H3.62012" stroke="#FFBC38" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M5.85 8.6499L2.5 11.9999L5.85 15.3499" stroke="#FFBC38" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
</svg><span> Log Out</span></a>
		</div>
    </div>
    <section id="pointCharge">
    	<form action="chargeGo" method="post" name="chargeForm">
        <div class="correctPwInner">
            <h2>포인트 충전</h2>
            <p>미리 충전하고 더욱 편리하게!</p>
            <div class="correctPwBox">
                <div class="textBox pointBox">
                    <p>충전할 금액</p>
                    <select name = "chargePrice">
                        <option value="0">충전할 금액을 선택해주세요.</option>
                        <option value="10000">10,000원</option>
                        <option value="20000">20,000원</option>
                        <option value="30000">30,000원</option>
                        <option value="40000">40,000원</option>
                        <option value="50000">50,000원</option>
                    </select>
                    <div class="myPoint">
                        <span id = "point"></span>
                    </div>
                </div>
                <div class="textBox">
                    <p>결제방법</p>
                    <select name = "payWay">
                        <option value="0">결제방법을 선택해주세요.</option>
                        <option value="1">무통장 입금</option>
                    </select>
                </div>
                <div class="textBox">
                    <p>입금자명</p>
                    <input type="text" placeholder="입금자명을 입력해주세요." value="" name="name"/>
                </div>
                <div class="textBox">
                    <p>입금계좌</p>
                    <div>
                        <p>신한은행 123 - 456 - 78910</p>
                        <span>* 위 계좌로 충전금액을 입금해주세요.</span>
                    </div>
                </div>
                <div class="btnBox">
                    <input type="submit" value="충전하기" onclick="return check()"/>
                </div>
            </div>
        </div>
       </form>
    </section>
</body>
<script>

$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: 'myPoint.ajax',
		dataType: 'json',
		success:function(data){
			var point = data.point;
			$('#point').html("보유금액 : "+point+"원");
		},
		error:function(e){
			console.log(e);
		}
	});
});


var msg = '${msg}';
if(msg != ''){
	alert(msg);
}

function check(){
	if(chargeForm.chargePrice.value == 0){
		alert("충전금액을 선택해주세요.");
		chargeForm.chargePrice.focus(); //
		return false;
	}
	
	if(chargeForm.payWay.value == 0){
		alert("결제방법을 선택해주세요.");
		chargeForm.payWay.focus();
		return false;
	}
	
	if(chargeForm.name.value == 0){
		alert("입금자명을 입력해주세요.");
		chargeForm.name.focus(); 
		return false;
	}
}
</script>
</html>