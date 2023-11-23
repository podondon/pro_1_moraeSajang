<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
div.under{
   border: 3px;
	border-style: solid none;		
	border-color : #DEDEDE;
    border-collapse: collapse;
    padding: 5px 5px 0px 5px;   
    font-size: 15px;
    border-style: none none solid none;
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
	
	input[type="button"]{
	background-color: #FFBC38;
	border-color:#DEDEDE;
	color: #212732;
	}
	
	button{
	background-color:#F9DCA3; 
	border-style: none;
	border-radius: 5px;
	padding: 0.5px 5px 0.5px 5px;
	}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/adminHeader.jsp" %>
	<div class="sideber">
		<ul>
	  <li><h3 class="page">관리자 페이지</h3></li>
	  <li><a href="analysis">통계</a></li>
	  <li><a href="adminUser">회원 관리</a></li>
	  <li><a href="adminReport" style="background: #F9DCA3;color: white;">신고 관리</a></li>
	  <li><a href="point">포인트 관리</a></li>
	  <li><a href="groupBuy">게시판 관리</a></li>
		</ul>
	</div>
	
	
	<div style="margin: 100px 0px 0px 400px;" class="reportmain"	>
	<button onclick="gotolist()" style="margin: 30px 0px 0px 850px">리스트로 돌아가기</button>
	<div style="width: 1000px; height: 20px; padding: 10px 0px 5px 0px; " >		
		<div style="width: 475px; float: left; height: 20px;"><span style="font-weight: 600;">신고 상세보기</span></div>
		<div style="width: 475px; float: right; height: 20px;"><span style="text-align: right;">신고 번호 : ${report.reportNo}</span></div>		
	</div>	
	<div style="width: 1000px; height: 30px; border: 3px; padding: 10px 0px 0px 0px; border-style: solid none;	border-color : #DEDEDE;">
		<div style="width: 970px; float: left;height: 20px;"><span>신고자 아이디 : ${report.userId}</span>  /  
		<span>피신고자 아이디 : ${report.reportuser}</span></div>
	</div>
	<div style="width: 1000px; height: 30px; padding: 10px 0px 0px 0px;">
		<div style="width: 475px; float: left;height: 20px;"><span >글/댓글 번호 : <button onclick="locationgo()">${useruniqueNo}</button></span>  /  
		<span>글/댓글 상태 : ${userstate}</span></div>
		<div style="width: 475px; float: left;height: 20px;"><span>${report.reportRegDate}</span></div>
	</div>
	<div style="width: 1000px; height: 270px; padding: 10px 0px 0px 0px;  border: 3px;	border-style: solid none;	border-color : #DEDEDE;">
		<div style="width: 970px; float: left;height: 200px;"><span>신고사유 : ${report.reportContent}</span></div>
	</div>		
	
	<!-- 신고 히스토리 // insert -->
	<div style=" display: flex;"><h5 style="padding: 10px 0px 0px 0px;">신고 히스토리</h5><span style="margin: 40px 0px 3px 580px;"> 신고 처리 상태 : ${report.processState}</span></div>	
    <div style="width: 1000px; height: 80px;">
        <textarea style="height:70px; width:850px; resize: none; float: left;" placeholder="히스토리를 입력 해 주세요." value="" name="content"></textarea>        
        <!-- <input type="text" id = "reporthistory" value="" placeholder="내용을 입력 해 주세요"></div> -->
     <div style="width: 100px; height:25px; float:right;"><input type="checkbox" value="처리완료" name="hisstate" id="checkbox">처리완료</div>
     <div style="width: 100px; height:25px; float:right;"><button onclick="historyput()">저장</button></div>	
    </div>
    <div style="width: 1000px; float: left;" id="historylist">
        
    </div>	 
	</div>
</body>
<script>
    
    //var showpage =1;
   
    var uniquenum = ${uniqueNo};
    var idx = ${report.reportNo};
    var type ="${type}";
    console.log(type);
    console.log(idx);
    console.log(uniquenum);
    
    histroycall();
    console.log("히스토리 콜 시작");
    
    
    function histroycall(){
    	console.log("히스토리 콜 진입");
    	var $reportNo = ${report.reportNo};    
    	
    	
    	$.ajax({
			type:'post',
			url:'ReportDetail.ajax/hislist',
			data:{'reportNo':$reportNo},
			dataType:'JSON',
			success:function(obj){			
				console.log(obj);
				drawlist(obj);
			},
			error:function(e){
				console.log(e);
			}	
		});//		
    	// drawlist();
    	// $("textarea[name = content]").val('');    	
    }//
    
    function drawlist(obj){
    	console.log("리스트 그려주기중");
    	$('#historylist').empty();
    	console.log(obj);
    	// '+obj.list[i].+'  '+obj.list[i].reportProcessNo+'
    	for (var i = 0; i < obj.size; i++) {
    	var content ='';
    		content += '<div style="width: 990px; background-color:#DEDEDE; margin: 0px 0px 5px 0px; padding: 10px;">';
    		content += '<div style="width: 970px; height: 35px;">';
    		content += '<div style="width: 150px; float: left; height: 20px;"><span>처리번호 : '+obj.list[i].reportProcessNo+'</span></div>';
    		content += '<div style="width: 150px; float: left; height: 20px;"><span>처리자 : '+obj.list[i].processorId+'</span></div>';
    		content += '</div>';	 
    		content += '<div style="width: 970px; height: 70px;">';
    		var date = new Date(obj.list[i].processDate);
			 var dateStr = date.toLocaleDateString("ko-KR");
    		content += '<span>'+obj.list[i].reportHistory+'</span>/<span>'+dateStr+'</span>';
    		content += '</div>';	 
    		content += '<div style="width: 970px; height: 30px;">';
    		//content += '<div style="width: 150px; float: right; height: 15px;"><span>미처리</span></div>';
    		content += '</div>';	
    		content += '</div>';
    		$('#historylist').append(content);
		}
    	console.log("리스트 그려주기 완료");    	
    }//
    
    
    function locationgo(){
    	console.log ("locationgo 시작한다");    	
    	var uniquenum = ${uniqueNo};
        var idx = ${report.reportNo};
        var type ="${type}";
    	if(type == "글"){
    		console.log (uniquenum+"글의 디테일로 간다");
    		location.href='gbdetail?gbNo='+uniquenum;    		
    	}else {
    		
    		$.ajax({
    			type:'post',
    			url:'ReportDetail.ajax/uninum',
    			data:{'uniquenum':uniquenum},
    			dataType:'JSON',
    			success:function(obj){			
    				console.log(obj);
    				location.href='gbdetail?gbNo='+obj.gbNo;    	
    				
    				
    			},
    			error:function(e){
    				console.log(e);
    			}	
    		});//		
    		
    		
    		
    		
			
		}
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    }
    
	function gotolist(){
		location.href='./adminReport';		
	}//historycall
	
	
	
	$("#checkbox").change(function(){
        if($("#checkbox").is(":checked")){
        	alert("처리완료가 선택되어있습니다. 처리내용에 처리완료를 기입해 주세요");
        }else{
        	alert("처리완료가 해제 되었습니다.");
        }	
				
	});	
	
	
	/*  신고 히스토리 인서트 */
	function historyput(){		
		
		if ($("textarea[name = content]").val() == "") {
			alert("신고 히스토리를 입력 해주세요");
			
		}else {
		var $state = $("input[type=checkbox][name=hisstate]:checked").val();
		var $content = $("textarea[name = content]").val();
		var $reportNo = ${report.reportNo};
		 //if($state == "처리완료"){}
		 //if (confirm("처리완료가 선택 되어 있습니다.") == true) {}
				console.log($state);
				console.log($content);
				console.log($reportNo);
				if ($state != "처리완료") {
					$state = "미처리";			
					console.log("미처리 :"+$state);
				}				
				
				$.ajax({
					type:'post',
					url:'ReportDetail.ajax/historyput',
					data:{'hisstate':$state,'content':$content,'reportNo':$reportNo},
					dataType:'JSON',
					success:function(obj){			
						console.log(obj);	
						
					},
					error:function(e){
						console.log(e);
					}	
				});//
				$("textarea[name = content]").val('');
				
				
				
				
				//histroycall();
				alert("신고 히스토리가 저장 되었습니다.");
				location.href='adminReportDetail?idx='+idx+'&&type='+type;
				
			//}else {
				//location.href='./adminReport';	}
			// alert("처리완료가 선택되어있습니다.")
			}
		}
		
		
		
		
		
		
		
		
		
		
	














</script>
</html>
