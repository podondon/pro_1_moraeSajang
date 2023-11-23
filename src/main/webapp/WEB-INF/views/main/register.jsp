<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
     #registerjoin{position:relative; margin-top:100px;}
     #registerjoin .register{width:80%; height:500px; margin: 0 auto; padding-top:50px;}
     #registerjoin .register h2{text-align: center; font-size:38px; margin-bottom: 10px;}
     #registerjoin .register .regist{width:330px; margin:0 auto;}
     #registerjoin .register .regist .textBox{margin-bottom: 15px;}
     #registerjoin .register .regist .textBox p{font-size:18px; margin-bottom: 5px; letter-spacing: 1px;}
     #registerjoin .register .regist .textBox .pw{font-family: 'Malgun Gothic';}
     #registerjoin .register .regist .textBox input{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
     #registerjoin .register .regist .gender{font-size:18px; margin-bottom:18px;}
     #registerjoin .register .regist .gender p{font-size:18px; margin-bottom: 10px; letter-spacing: 1px;}
     #registerjoin .register .regist .gender input{border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
     #registerjoin .register .regist .textBox input:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
     #registerjoin .register .regist .textBox input:focus::placeholder{color:transparent}
     #registerjoin .register .regist .textBox select{width:100%; height:60px; border-radius: 8px; border: 1px solid #b7b7b7; box-sizing: border-box; padding:0 15px;}
     #registerjoin .register .regist .textBox select:focus{border:2px solid #FFBC38; outline: none; box-shadow: 0 0 2px #FFBC38;}
     #registerjoin .register .regist .btnBox{width:330px; margin-bottom: 5px;}
     #registerjoin .register .regist .btnBox input{width:100%; height:50px; margin:10px 0 15px 0; line-height: 50px; letter-spacing: 2px; font-size:20px; background-color: #FFBC38; color:#fff; border: none; border-radius: 5px; cursor: pointer;}
     #registerjoin .register .regist .btnBox input:hover{border:1px solid #FFBC38; background: none; color:#FFBC38; transition:0.5s;}
</style>
</head>
<body>        

   <%@ include file="/WEB-INF/views/common/header.jsp" %>   
<section id="registerjoin">
        <div class="register">
            <h2>회원가입</h2>
            <div class="regist">
                <div class="textBox">
                    <p>아이디</p>
                    <input type="text" placeholder="아이디를 입력해주세요." name="id" value=""/>
                    <input type="button" id="overlay" value="ID 중복 체크" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white"/>
                	<font id="label1" size ="2"></font>
                </div>
               <div class="textBox">
                    <p>비밀번호</p>
                    <input input type="password" name="pw" class="pw" id="password_1" placeholder="비밀번호를 입력해주세요" value="" maxlength='20'/>
                </div>
                <div class="textBox">
                    <p>비밀번호 재확인</p>
                    <input type="password" name="pwer" class="pw" id="password_2" placeholder="비밀번호를 재입력해주세요"  value="" maxlength='20'/>
                     <font id="checkPw" size ="2"></font>
                </div> 
                 <div class="textBox">
                    <p>닉네임</p>
                    <input type="text" name="nickname" placeholder="닉네임을 입력해주세요"/>
                 <input type="button" id="overnickname" value="nickname 중복 체크" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white"/>                 
                <font id="label2" size ="2"></font>
                </div>
                <div class="textBox">
                    <p>이름</p>
                    <input type="text" name="name" placeholder="이름을 입력해주세요" value=""/>
                </div>
                 <div class="textBox">
                    <p>나이</p>
                    <input type="text" name="age" placeholder="나이를 입력해주세요" value=""/>
                </div>               
                <div class="textBox">
                    <p>이메일</p>
                    <input type="text" name="email" placeholder="ex)abc@naver.com" value=""/>
                    <input type="button" id="overemail" value="email 중복 체크" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white"/>                    
                	<font id="label3" size ="2"></font>
                </div>
                
                <div class="gender">
                    <p>성별</p>
                    <input type="radio" name="gender" value="남"/>남자&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="gender" value="여"/>여자
               </div> 
                <div class="textBox">
                    <p>비밀번호 힌트</p>
                    <select id="hint" name="hint">
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
                    <input type="text" name="pwanswer" placeholder="정답을 입력해주세요" value=""/>
                </div>               
                <div class="textBox">
                    <p>도로명 주소</p>
                    <input class="form-control" "id="streetAddr" placeholder="도로 주소" name="addr1" type="text" readonly="readonly" />
                 <input type="button" class="btn btn-default" onclick="execPostCode()" style="background-color:#FFBC38 ; border-color:#F9DCA3; color:white" value="주소 찾기">  
                </div>
                <div class="textBox">
                    <p>읍/면/동</p>
                     <input class="form-control" id="userDetailAddr" placeholder="읍/면/동" name="addr2" type="text" readonly="readonly">
                </div>
                <div class="textBox">
                    <p>상세 주소</p>
                    <input class="form-control" placeholder="상세주소" name="addr3" id="detailAddr" type="text" />
                </div>
               
                <div class="btnBox">
                    <input type="button" id="register" name="register" value="회원가입" onclick="return check()"/>
                </div>
            </div>
        </div>
    </section>
   

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


              
            


var overlayChk = false;
var overemailChk = false;
var overnicknameChk = false;


$('#register').on('click',function(){
   var $id = $('input[name="id"]');
   var $pw = $('input[name="pw"]');
   var $name = $('input[name="name"]');
   var $age = $('input[name="age"]');
   var $gender = $('input[name="gender"]:checked');
   var $email = $('input[name="email"]');
   var $pwer = $('input[name="pwer"]');
   var $nickname = $('input[name="nickname"]');
   var $hint = $('select[name="hint"]');
   var $pwanswer = $('input[name="pwanswer"]');
   var $addr1 = $('input[name="addr1"]');
   var $addr2 = $('input[name="addr2"]');
   var $addr3 = $('input[name="addr3"]');
  
   
   if(overlayChk&&overemailChk&&overnicknameChk){
         
      if($id.val() == ''){
         alert('아이디를 입력해 주세요!');
         $id.focus();
      }else if($pw.val() == ''){
         alert('비밀번호를 입력해 주세요');
         $pw.focus();
      }else if($pwer.val()==''){
         alert('비밀번호를 재확인해 주세요');
         $pwer.focus();      
      }else if($name.val()==''){
         alert('이름을 입력해 주세요');
         $name.focus();
      }else if($age.val()==''){
         alert('나이를 입력해 주세요');
         $age.focus();
      }else if($email.val()==''){
         alert('이메일을 입력해 주세요');
         $email.focus();
      }else if($gender.val() == null){
         alert('성별을 입력해 주세요');
         $gender.focus();
      }else if($hint.val()== ''){
         alert('질문을 선택해 주세요');
         $hint.focus();
      }else if($pwanswer.val()==''){
         alert('정답을 입력해 주세요');
         $pwanswer.focus();
      }else if($nickname.val()==''){
         alert('닉네임을 입력해 주세요');
         $nickname.focus();
      }else if($addr1.val()==''){
    	  alert('도로명주소를 입력해 주세요');
          $addr1.focus(); 
      }else if($addr2.val()==''){
         alert('지번주소를 입력해 주세요');
         $addr2.focus();
      }else if($addr3.val()==''){
         alert('상세주소를 입력해 주세요');
         $addr3.focus();
      } else{         
         var param = {};
         param.id = $id.val();
         param.pw = $pw.val();
         param.name = $name.val();
         param.pwer = $pwer.val();
         param.nickname = $nickname.val();
         param.hint = $hint.val();
         param.pwanswer = $pwanswer.val();
         param.addr1 = $addr1.val();
         param.addr2 = $addr2.val();
         param.addr3 = $addr3.val(); 
         param.age = $age.val();         
         param.gender = $gender.val();
         param.email = $email.val();                           
         console.log(param);
         
         
         
         var regex = new RegExp('[a-zA-Zㄱ-ㅎ가-힣]');
         var match = regex.test($age.val()); 
         console.log("match : "+match);
         if(match){
            alert('나이에는 숫자만 넣어 주세요');
            return false;
         }
                  
         
         var regex = new RegExp('^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$');
            var match = regex.test($email.val());
            if(!match){
               alert("이메일 형식으로 입력해주세요.")
               return false;
            }
            
            $.ajax({
            type:'post',
            url:'register',
            data:param,
            dataType:'JSON',
            success:function(data){
               console.log(data);
               if(data.success>0){
                  alert('회원가입에 성공 했습니다.');
                  location.href='login'; 
               }else{
                  alert('회원가입에 실패 했습니다.');
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

//아이디 중복체크
$('#overlay').on('click',function(){
   var id = $('input[name="id"]').val();
   console.log('id='+id);
   
   if(id == '' || id.length == 0) {
		$("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
		return false;
	}
	
   
   $.ajax({
      type:'get', 
      url:'overlay', 
      data:{'id':id}, 
      dataType:'JSON', 
      success:function(data){
         console.log(data);
         overlayChk = data.use;
         if(data.use){
            alert('사용 가능한 아이디 입니다.');
         }else{
            alert('이미 사용중인 아이디 입니다.');
            $('input[name="id"]').val('');
         }      
         
      },
      error:function(error){
         console.log(error);
      }, 
   });
   
   
});



//닉네임 중복체크
$('#overnickname').on('click',function(){
   var nickname = $('input[name="nickname"]').val();
   console.log('nickname='+nickname);
   
   if(nickname == '' || nickname.length == 0) {
		$("#label2").css("color", "red").text("공백은 nickname으로 사용할 수 없습니다.");
		return false;
	}
	
   
   $.ajax({
      type:'get', 
      url:'overnickname', 
      data:{'nickname':nickname}, 
      dataType:'JSON', 
      success:function(data){
         console.log(data);
         overnicknameChk = data.use2;
         if(data.use2){
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


//이메일 중복체크
$('#overemail').on('click',function(){
   var email = $('input[name="email"]').val();
   console.log('email='+email);
   
   if(email == '' || email.length == 0) {
		$("#label3").css("color", "red").text("공백은 email로 사용할 수 없습니다.");
		return false;
	}
   
   $.ajax({
      type:'get', 
      url:'overemail', 
      data:{'email':email}, 
      dataType:'JSON', 
      success:function(data){
         console.log(data);
         overemailChk = data.use1;
         console.log(data.use1);
         if(data.use1){
            alert('사용 가능한 이메일 입니다.');
         }else{
            alert('이미 사용중인 이메일 입니다.');
            $('input[name="email"]').val('');
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
