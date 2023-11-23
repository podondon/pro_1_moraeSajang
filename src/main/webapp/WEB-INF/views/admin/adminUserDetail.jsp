<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	div.usermain{	    	   
	    padding: 2px 2px 0px 2px;
	    margin: 2px;
	    font-size: 15px;
	}
	
	div.sideber ul {
	  list-style-type: none;
	  padding: 10px;
	  margin: 0px 0px 0px 20px;
	  width: 200px;
	  background: white;	  
	  height: 100%;
	  overflow: auto;
	  position: fixed;
	  float: left;
	  border: 3px ;
	 border-style: none solid none none;
	  border-color: #F9DCA3; 
	}
	
	li a {
	  text-decoration: none;
	  padding: 10px;
	  display: block;
	  background: white;
	  color: gray;
	  border: 0px solid ;
	  border-color: #F9DCA3;
	  font-weight: bold;
	  margin: 10px 0px;
	  border-radius: 15px;
	}
	
	li a:hover {
	  background: #F9DCA3;
	  color: white;
	  border-radius: 15px;
	}
		
	li h3.page {
	  background : white;
	  color: gray;
	}
	
	.main {
	  margin-left: 220px;
	  
	}
	span{
		list-style-type: disc;
		
	}
	input[type="button"]{
	background-color:#F9DCA3; 
	border-style: none;
	border-radius: 5px;
	padding: 0.5px 5px 0.5px 5px;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/adminHeader.jsp" %>
<div>
	<div class="sideber" style="margin-top: 6%;	">
	<ul>
	   <li><h3 class="page" style="margin: 50px 0px;">관리자 페이지</h3></li>
	  <li><a href="analysis">통계</a></li>
	  <li><a href="adminUser" style="background: #F9DCA3;color: white;" >회원 관리</a></li>
	  <li><a href="adminReport">신고 관리</a></li>
	  <li><a href="point">포인트 관리</a></li>
	  <li><a href="groupBuy">게시판 관리</a></li>
	</ul>
	</div>

	<div style="width: 900px; float: left; margin: 60px 0px 8px 400px;" class="usermain">
		<div class="profil" style="float: left; overflow: auto; width: 350px; height: 320px;margin: 0px 0px 0px 50px">
			<img src="/morae/resources/img/profil.png" width="300px" height="300px">	
		</div>
		<div class="info" style="float: right; overflow: auto; width: 400px; height: 320px;margin: 0px 50px 0px 10px" >
			<p style="font-weight: 600;  margin: 9px;" >회원 상세 정보</p>
			<p style="list-style-type: disc; margin: 9px;" >아이디 : ${info.userId}</p>
			<p style="list-style-type: disc; margin: 9px;" >닉네임 : ${info.nickname}</p>
			<p style="list-style-type: disc; margin: 9px;" >이름 : ${info.name}</p>
			<p style="list-style-type: disc; margin: 9px;" >나이 : ${info.age}  /  성별 : ${info.gender}</p>
			<p style="list-style-type: disc; margin: 9px;" >이메일 : ${info.email}</p>
			<p style="list-style-type: disc;margin: 9px;" >가입날짜 : ${info.reg_date}</p>
			<p style="list-style-type: disc; margin: 9px;" >주소 : ${info.addr}</p>
			<p style="list-style-type: disc; margin: 9px;" >상태 : ${state}</p>
			<p style="list-style-type: disc; margin: 9px;" >회원권한 : ${auth}</p>
		</div>
	</div>
	<div class="auth" style="width: 900px; float: left; margin: 0px 0px 0px 300px;" id="auth">
		
	</div>
	<div class="history" style="width: 500px; float: left; margin: 0px 0px 0px 680px;" id="history">
		
	</div>
		
</div>
</body>
<script>
	
var userauth="";
var userstate="";
	
	
	
	
// var $userId = ${info.userId};
histroycall();
console.log("권한 콜 시작");
drawhislist();
console.log("히스토리 콜 시작");
function histroycall($userId){
	
	var userId = "${info.userId}";    		
	$.ajax({
		type:'post',
		url:'userDetail.ajax/detail',
		data:{'userId':userId},
		dataType:'JSON',
		success:function(obj){			
			console.log(obj);
			drawlist(obj);
			// 차단 히스토리 뿌려주는 기능
		},
		error:function(e){
			console.log(e);
		}	
	});//		
	// drawlist();
	// $("textarea[name = content]").val('');
	
}//

// 차단 히스토리 뿌려주는 기능
function drawhislist(obj){
	var userId = "${info.userId}"; 
	
	$.ajax({
		type:'post',
		url:'userDetail.ajax/UBhis',
		data:{'userId':userId},
		dataType:'JSON',
		success:function(obj){			
			console.log(obj);			
			// 차단 히스토리 뿌려주는 기능
			$('#history').empty();
			for (var i = 0; i < obj.size; i++) {			
			var content = '';
			//  차단 히스토리  
			//content += '<div class="rehis" style="float: right; overflow: auto; width: 400px; height:200px; margin: 0px 50px 0px 10px">';		
			content += '<div style="float: right; overflow: auto; width: 380px;padding: 10px;margin: 10px 50px 0px 10px; background-color:#DEDEDE;" >';
			content += '<div style="width: 380px; height: 35px; background-color:#DEDEDE; ">';
			content += '<div style="width: 150px; float: left; height: 20px;"><span>처리번호 : '+obj.list[i].blockNo+'</span></div>';
			content += '<div style="width: 150px; float: left; height: 20px;"><span>처리자 : '+obj.list[i].blockerId+'</span></div>';
			content += '</div>';	 
			content += '<div style="width: 380px; height: 70px;">';			
			 var date = new Date(obj.list[i].blockDate);
			 var dateStr = date.toLocaleDateString("ko-KR");			
			content += '<span>'+obj.list[i].blockReason+'</span>/<span>'+dateStr+'</span>';
			content += '</div>';	 
			content += '</div>';
			//content += '</div>';
			$('#history').append(content);
				
			}			
		},
		error:function(e){
			console.log(e);
		}	
	});//	
}//
	
function drawlist(obj){		
	var $state = "${state}"; // 차단 미차단
	var $auth = "${auth}"; //회원 상태
	var gardid = "obj.gardid";
	var logstate = obj.logstate;
	console.log(obj);
	console.log(gardid);
	console.log(logstate);	
	if(logstate == 1){	
		console.log("최고 관리자");		}
	var content ='';
	// '+obj.list[i].+'  '+obj.list[i].reportProcessNo+'
	// for (var i = 0; i < obj.size; i++) {
		/* content += '<div style="width: 990px;">'; */
		/* $('+''input[type=radio][name=flexRadioDefault]:checked  ').val() // $('input[type=radio][name=flexRadioDefault]:checked').val()*/
		/* 최고 관리자 여부 확인 = session 으로 확인 */		
		if(logstate == 1){	
			console.log("최고 관리자");			
		content += '<div class="profil" style="float: right; overflow: auto; width: 400px; height:80px; margin: 0px 50px 0px 10px; ">';
		content += '<p style="font-weight: bold;margin: 5px;" >회원 권한 수정</p>';		
		content += '<input class="form-check-input" type="radio" name="Radioauth" id="flexRadioDefault1" style="margin: 0px 0px 0px 10px" value="관리자"/>';
		content += '<label class="form-check-label" for="flexRadioDefault1"> 관리자 </label>	';	  
		content += '<input class="form-check-input" type="radio" name="Radioauth" id="flexRadioDefault2" style="margin: 0px 0px 0px 30px" value="일반회원" checked/>';
		content += '<label class="form-check-label" for="flexRadioDefault2"> 일반 회원 </label>';
		content += '<input type="button" value="권한 저장" style="margin: 0px 0px 0px 30px" onclick="authsave()"/>';			
		content += '</div>';					
		}		
		/* 회원 상태 수정 */
		
		content += '<div class="profil" style="float: right; overflow: auto; width: 400px; height:175px; margin: 3px 50px 0px 10px">';		
		content += '<p style="font-weight: bold;margin: 10px;" >회원 상태 수정</p>';
		content += '<input class="form-check-input" type="radio" name="Stateradio" id="flexRadioDefault1" style="margin: 0px 0px 0px 10px;" value="차단"/>';
		content += '<label class="form-check-label" for="flexRadioDefault1"> 차단 </label>';		  
		content += '<input class="form-check-input" type="radio" name="Stateradio" id="flexRadioDefault2" style="margin: 0px 0px 0px 10px;" value="미차단" checked/>';
		content += '<label class="form-check-label" for="flexRadioDefault2"> 미차단 </label>';
		content += '<textarea type="text" id = "reporthistory" value="" placeholder="회원상태변경의 이유을 입력해주세요" style="height: 100px; width: 270px; resize: none;margin: 5px 0px 0px 0px;"></textarea>';
		content += '<input type="button" value="상태 저장" style="margin: 0px 0px 0px 10px;" onclick="statesave()"/>';		
		content += '</div>';
		$('#auth').append(content);
	// }	
}//

	function authsave(){
	
	console.log("회원권한 수정");
	var auth = $('input[type=radio][name=Radioauth]:checked').val();
	var userId = "${info.userId}"; 
	var $state = "${state}"; // 차단 미차단
	var $auth = "${auth}"; //회원 상태
	var saveauth = "";
	if ($auth == "관리자") {
		saveauth = $('input[type=radio][name=Radioauth]:checked').val();
	}else {
		saveauth = $('input[type=radio][name=Radioauth]:checked').val();
	}
	console.log(auth);	
	
	$.ajax({
		type:'post',
		url:'userDetail.ajax/authsave',
		data:{'auth':auth,'userId':userId},
		dataType:'JSON',
		success:function(obj){			
			console.log(obj);
		},
		error:function(e){
			console.log(e);
		}	
	});//		
	
	alert('회원 권한 이 변경 되었습니다 ');
	location.href='adminUserDetail?userid='+userId+'&&state='+$state+'&&auth='+saveauth;
	}	
	
	
	function statesave(){
		console.log("회원상태 수정");		
		
		if ($('textarea[type=text][id=reporthistory]').val() == "") {
			alert("차단 사유를 입력 해주세요");
			
		}else {
			
		
		var state = $('input[type=radio][name=Stateradio]:checked').val();	
		var statehis= $('textarea[type=text][id=reporthistory]').val();
		var userId = "${info.userId}"; 
		console.log(state);	
		console.log(statehis);
		
		var $state = "${state}"; // 차단 미차단
		var $auth = "${auth}"; //회원 상태
		var savestate = "";
		if ($state == "차단") {
			savestate = $('input[type=radio][name=Stateradio]:checked').val();
		}else {
			savestate = $('input[type=radio][name=Stateradio]:checked').val();
		}
		
		$.ajax({
			type:'post',
			url:'userDetail.ajax/statesave',
			data:{'state':state,'userId':userId,'statehis':statehis},
			dataType:'JSON',
			success:function(obj){			
				console.log(obj);
			},
			error:function(e){
				console.log(e);
			}	
		});//		
		
		alert('회원 상태가 변경 되었습니다 ');
		location.href='adminUserDetail?userid='+userId+'&&state='+savestate+'&&auth='+$auth;		
			}
		}



















</script>
</html>