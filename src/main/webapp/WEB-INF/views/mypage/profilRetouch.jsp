<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
body {
	margin-top: 130px;
}

#lnb {
	position: fixed;
	left: 0;
	top: 100px;
	width: 300px;
	height: 100%;
	background-color: #f9f9f9;
	z-index: 99;
}

#lnb ul {
	margin-top: 20px;
}

#lnb ul li {
	width: 280px;
	height: 60px;
	line-height: 60px;
	box-sizing: border-box;
	border-radius: 10px;
	margin: 10px auto;
	padding-left: 40px;
	font-family: 'KorailRoundGothicBold';
}

#lnb ul li.on {
	background-color: #fcdfa0;
	color: #fff;
}

#lnb ul a:hover{text-decoration:none;}
        #lnb .logout{position:absolute; margin-left:50px; bottom:200px;}
        #lnb .logout a span{font-size:20px; line-height:25px; position:relative; top:-7px; color:#FFBC38;}

#reTable {
	width: 100%;
	height: 100%;
}

.pw{
font-family: 'Malgun Gothic';
}
#profil {
	border: 3px solid #F9DCA3;
	border-collapse: collapse;
	padding: 5px 10px;
	width: 500px;
	height: 600px;
	margin-left: 550px;
	border-radius: 10px;
}

#reTable th, td {
	text-align: start;
	padding-left: 15px;
}

#profil button {
	font-family: 'KorailRoundGothicMedium', sans-serif;
	font-size: 16px;
	color: #212732;
	border: 1px solid #FFBC38;
	background-color: #FFBC38;
	width: 75px;
	height: 25px;
	border-radius: 5px;
	color: white;
	cursor: pointer;
	font-size: 14px;
}

#overnickname {
	border: 1px solid #FFBC38;
	background-color: #FFBC38;
	width: 75px;
	height: 25px;
	border-radius: 5px;
	color: white;
	cursor: pointer;
	font-size: 14px;
}

#checkpw{
 	margin-top:7%;
    margin-right: 25px;
    margin-bottom: 30px;
    margin-left: 20%;
    padding-left:100px;
}

#profil [type='text'] {
	width: 250px;
	height: 25px;
	margin-left: 15px;
}

#profil [type='password'] {
	width: 250px;
	height: 25px;
	margin-left: 15px;
}

#update {
	width: 80px;
	height: 30px;
	margin-left: 160px;
	border: 1px solid #FFBC38;
	width: 150px;
	height: 40px;
	background-color: #FFBC38;
	border-radius: 5px;
	color: white;
	cursor: pointer;
	font-size: 18px;
}

#label{
	padding-left:100px;
	margin-top:7%;
    margin-right: 25px;
    margin-bottom: 30px;
    margin-left: -20%;
}
#pwtitle{
	width: 112px;
}
#pwCh{
	height: 14px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<div id="lnb">
		<ul>
			<a href="<c:url value="/mypage"/>"><li class="on">내 프로필</li></a>
			<a href="<c:url value="/mypage/groupBuy/gbList"/>"><li>내
					공구 현황</li></a>
			<a href="<c:url value="/mypage/point/history"/>"><li>포인트 내역</li></a>
			<a href="<c:url value="/mypage/point/charge"/>"><li>포인트 충전</li></a>
		</ul>
		<div class=logout>
			<a href="<c:url value='/user/logout'/>"><svg width="26" height="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M8.8999 7.55999C9.2099 3.95999 11.0599 2.48999 15.1099 2.48999H15.2399C19.7099 2.48999 21.4999 4.27999 21.4999 8.74999V15.27C21.4999 19.74 19.7099 21.53 15.2399 21.53H15.1099C11.0899 21.53 9.2399 20.08 8.9099 16.54" stroke="#FFBC38" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M15.0001 12H3.62012" stroke="#FFBC38" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M5.85 8.6499L2.5 11.9999L5.85 15.3499" stroke="#FFBC38" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
</svg><span> Log Out</span></a>
		</div>
	</div>
	
	<div id="profil">
	<table id="reTable">
    	 <tr>
           <th>아이디</th>
             <th>
          <input type="text" name="id" class="id" id="id" value="${sessionScope.userInfo.userId}" readonly />
          </th>
          
        </tr> 
        
        <tr>
           <th>비밀번호</th>
             <th>
          <input type="password" name="pw" class="pw" id="password_1" placeholder="비밀번호를 입력해 주세요."/>          
          </th>
          
        </tr> 
       <tr>
          <th id="pwtitle">비밀번호 재확인</th>
          <th>
          <input type="password" name="pwer" class="pw" id="password_2" placeholder="비밀번호를 재입력해 주세요."  />            
          </th>        
       </tr>
       
       <tr>
       	<th colspan="2" id="pwCh">
           <font id="checkPw" size ="2"></font>          
       </th>
       </tr>
       
         <tr>
             <!--공백문자-->
             <th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
             <th>
                 <input type="text" name="name" placeholder="이름을 입력해 주세요." value="${sessionScope.userInfo.name}" readonly/>
             </th>
         </tr>
  
         <tr>
             <th>닉네임</th>
             <th>
                 <input type="text" name="nickname" placeholder="닉네임을 입력해 주세요." value="${sessionScope.userInfo.nickname}"/>
                 <input type="button" id="overnickname" value="중복 확인"/>
             	 <font id="label" size ="2"></font>
             </th>
         </tr>   

      <tr class="form-group">
      <th>도로명</th>
      <th>
       <input class="form-control" "id="streetAddr" placeholder="도로 주소" name="addr1" type="text" readonly="readonly" value="${sessionScope.userInfo.streetAddress}"/>
      <button type="button" class="btn btn-default" onclick="execPostCode()"><i class="fa fa-search"></i> 주소 찾기</button>  
      </th>
      </tr>

      <tr class="form-group">
      <th>상세 주소</th>
      <th>
      <input class="form-control" placeholder="상세 주소" name="addr2" id="detailAddr" type="text" value="${sessionScope.userInfo.detailAddress}" />
      </th>      
      </tr> 
         <tr>
             <th colspan="2">
                 <input type="button" id="update" name="update" value="수정하기"/>
             </th>
         </tr>
     </table>
     </div>    
</body>
<script>




$('.pw').keyup(function(){
   let pass1 =$("#password_1").val();
   let pass2 =$("#password_2").val();
   
   if(pass1 != "" || pass2 !=""){
      if(pass1 == pass2){
         $("#checkPw").html("비밀번호가 일치합니다.");
         $("#checkPw").attr("color","green");
      }else{
         $("#checkPw").html("비밀번호가 불일치합니다.");
         $("#checkPw").attr("color","red");
      }
   }
})

                       
var overnicknameChk = false;



$('#update').on('click',function(){
   var $id = $('input[name="id"]');
   var $pw = $('input[name="pw"]');   
   var $pwer = $('input[name="pwer"]');
   var $name = $('input[name="name"]');
   var $nickname = $('input[name="nickname"]');
   var $addr1 = $('input[name="addr1"]');
   var $addr2 = $('input[name="addr2"]');
  
  
   
   if(overnicknameChk==0){
         
      if($pw.val() == ''){
         alert('비밀번호를 입력해 주세요');
         $pw.focus();
      }else if($pwer.val()==''){
         alert('비밀번호를 재확인해 주세요');
         $pwer.focus();      
      }else if($nickname.val()==''){
         alert('닉네임을 입력해 주세요');
         $nickname.focus();
      }else if($addr1.val()==''){
    	  alert('도로명 주소를 입력해 주세요');
          $addr1.focus(); 
      }else if($addr2.val()==''){
         alert('상세 주소를 입력해 주세요');
         $addr2.focus();
      } else{     	  
         var param = {};   
       	 param.id = $id.val();
         param.pw = $pw.val();
         param.pwer = $pwer.val();
         param.nickname = $nickname.val();
         param.addr1 = $addr1.val();
         param.addr2 = $addr2.val();                                  
         console.log(param);
         
            
            $.ajax({
            type:'post',
            url:'update', 
            data:param,
            dataType:'JSON',
            success:function(data){
               console.log(data.success);
               if(data.success>0){
                  alert('수정하기에 성공 했습니다.');
                  location.href='/morae/mypage';
               }else{
                  alert('수정하기에 실패 했습니다.');
               }               
            },
            error:function(e){
               console.log(e);
            }
         });      
   
      }
   }else {
      alert('중복 체크를 해 주세요!');
      
   }
   
});




//닉네임 중복체크
$('#overnickname').on('click',function(){
   var nickname = $('input[name="nickname"]').val();
   console.log('nickname='+nickname);
   
   if(nickname == '' || nickname.length == 0) {
		$("#label").css("color", "red").text("공백은 nickname으로 사용할 수 없습니다.");
		return false;
	}
   
   $.ajax({
      type:'get', 
      url:'overnickname', 
      data:{'nickname':nickname}, 
      dataType:'JSON', 
      success:function(data){
         console.log(data);
         overnicknameChk = data;
         if(data==0){
            alert('사용 가능한 닉네임 입니다.');
         }else{
            alert('이미 사용중인 닉네임 입니다.');
            $('input[name="nickname"]').val('');
         }      
         
      },
      error:function(error){
         console.log(error);
      }, 
   });
   
   
});








//api
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
        
           var fullRoadAddr = data.roadAddress; 
           var extraRoadAddr = ''; 

           
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
          
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
          
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }


           $("[name=addr1]").val(fullRoadAddr); 
           $("[name=addr2]").val(data.bname);
           
       }
    }).open();
}






   


</script>
</html>











   
   

