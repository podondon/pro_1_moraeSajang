<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="<c:url value='/resources/css/img_slider.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/gbDetail.css'/>">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="<c:url value='/resources/js/paging.js'/>" type="text/javascript"></script>
<link href="<c:url value='/resources/css/paging.css'/>" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerPg.jsp" %>
<p id ="gbNo" style="visibility: hidden">"${GroupBuyDto.gbNo}"</p>
    <div class="elem-container">
	    <div class="gb-report-div"><button id='reportBtn' class="report"><img class="report" src="/photo/icon/siren.png"/></button>
	    
	    </div>
	    <div id="productsInfo" class="section">
	        <div id="productImgBox" class="products">
	        	<div class="slider-2">
				     <div class="side-btns">
				        <div><span><i class="fas fa-caret-left">◀</i></span></div>
				        <div><span><i class="fas fa-caret-right">▶</i></span></div>
				    </div>
	    
				    <div class="slides">
				    	<c:choose>
				    		<c:when test="${fn:length(PhotoNames)==0}">
				    		<div class="active slide-img" style="background-image:url(/photo/default/default.png?auto=compress,format);"></div>
				    		</c:when>
				    		<c:otherwise>
				    		<c:forEach items="${PhotoNames}" var="newName" varStatus="status">
						    <c:if test="${status.index eq 0}">
						    <div class="active slide-img" style="background-image:url(/photo/gbImg/${newName}?auto=compress,format);"></div>
						    </c:if>
						    <c:if test="${status.index ne 0}">
						    <div class="slide-img" style="background-image:url(/photo/gbImg/${newName}?auto=compress,format);"></div>
						    </c:if>
						    </c:forEach>
				    		</c:otherwise>
				    	</c:choose>
					    
				    </div>
	            </div>
	        </div>
	        <div class="products">
	            <div 모집인원 class="smallInfo">
	                <label for="recruitPeople" class="info-label">인원수</label>
	                <span>
	                ${GroupBuyDto.joinPeople}/${GroupBuyDto.recruitPeople}
	                </span>
	                <span class="joinicon-span">
	                <c:if test="${GroupBuyDto.joinPeople ne 0}">
	                <fmt:formatNumber var="oc" type="number" maxFractionDigits="0"  value="${GroupBuyDto.joinPeople/GroupBuyDto.recruitPeople*100}" />
	                </c:if>
	                <c:choose>
	                	<c:when test="${GroupBuyDto.joinPeople eq 0}">
	                	<img class="detail-joinicon" src="/photo/icon/1.png"/>
	                	</c:when>
	                	<c:when test="${oc ge 0 && oc le 25}">
	                	<img class="detail-joinicon" src="/photo/icon/1.png" />
	                	</c:when>
	                	<c:when test="${oc ge 26 && oc le 50}">
	                	<img class="detail-joinicon" src="/photo/icon/2.png" />
	                	</c:when>
	                	<c:when test="${oc ge 51 && oc le 75}">
	                	<img class="detail-joinicon" src="/photo/icon/3.png" />
	                	</c:when>
	                	<c:when test="${oc ge 76 && oc le 99}">
	                	<img class="detail-joinicon" src="/photo/icon/4.png" />
	                	</c:when>
	                	<c:when test="${oc eq 100}">
	                	<img class="detail-joinicon" src="/photo/icon/5.png" />
	                	</c:when>
	                </c:choose>
	                </span>
	            </div>
	            <div 모집기간 class="smallInfo">
	                <label class="info-label">모집기간</label>
	                <span>
	                    ${GroupBuyDto.startDate}
	                    ~
	                    ${GroupBuyDto.startDate}
	                </span>
	            </div>
	            <div class = "smallInfo">
	                <label class="info-label">지역</label>
	                <span>
	                    ${GroupBuyDto.gbDetailAddress}
	                </span>
	            </div>
	            <div class="smallInfo">
	                <label class="info-label">모집장소</label>
	                <span>
	                    ${GroupBuyDto.place}
	                </span>
	            </div>
	            <div class="smallInfo">
	                <label class="info-label">작성자</label>
	                <span>
						${GroupBuyDto.nickname}
	                </span>
	            </div>
	            <div class="smallInfo">
	                <label class="info-label">사용자 평가</label>
	                <div>
	                <span class="review">
	                   	또 거래하고싶어요 : ${GroupBuyDto.tradeAgainNum}
	                </span>
	                <span class="review">
	                    그냥 그래요 : ${GroupBuyDto.justOkayNum}
	                </span>
	                <span class="review">
	                    별로에요 : ${GroupBuyDto.notInterestedNum}
	                </span>
	                </div>
	            </div>
	            <div class="smallInfo">
	                <label class="info-label">금액</label>
	                <span>
	                	<fmt:formatNumber var="sm" value="${GroupBuyDto.joinPrice}" pattern="#,###" />
	                    ${sm}원
	                </span>
	            </div>
	            <div class="smallInfo">
	                <label class="info-label">카테고리</label>
	                <span>
	                    ${GroupBuyDto.categoryType}
	                </span>
	            </div>
	        </div>
	        
	    </div>
	    
	    <div class="gbContent section">
	        <div class="subContent">
	            <input type="text" id="title" class="big-info" value="${GroupBuyDto.title}" readonly/>
	        </div>
	        <div class="subContent">
	            <textarea id="gbContent" class="big-info" readonly>${GroupBuyDto.gbContent}</textarea>
	        </div>
	    </div>
	    <hr>
	    <h3 class="comment-h3">댓글</h3>
	    <div class="comment-div">
	        <div id="commentWriteBox">
	            <div class="comment-elem-div">
		            <textarea id="comment" class="inputValid comment-content"></textarea>
		            <div class="validation">0/250</div>
		            <div class="write-div">
		            	<button id="commentWrite" class="comm-wirte-btn comm-btn">댓글 작성</button>
		            </div>
	            </div>
	        </div>
	        <hr>
	        <div id="comments">
		            
	        </div>
	        
	
	    </div>
	    <div class="container">									
				<nav aria-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>					
		</div>
	    <hr>
	    <div class="bottom-btn">
	    
			<div>
			<c:set var="userId" value="${sessionScop.userinfo.userid}" />
	    <c:choose>
	    	<c:when test="${GroupBuyDto.joinPeople eq GroupBuyDto.recruitPeople || GroupBuyDto.gbState eq '완료'}">
	    		<button disabled class="btn-disabled">모집완료</button>
	    	</c:when>
	    	<c:when test="${GroupBuyDto.isGbWriter eq true || GroupBuyDto.isJoining eq 1}">
	    		<button disabled class="btn-disabled">참여중</button>
	    	</c:when>
	    	<c:when test="${GroupBuyDto.isJoining eq 0}">
	    		<button id="gbJoin" class="comm-btn">참여하기</button>
	    	</c:when>
	    </c:choose>
	    <button id="back" class="comm-btn">목록으로</button>
			</div>
	    </div>
    </div>
</body>
<script>
console.log('${GroupBuyDto.joinPeople}')
console.log('${GroupBuyDto.recruitPeople}')
let joinSuccess = '${joinSuccess}';
let joinFail = '${joinSuccess}';
let showPage = 1;

let comment='';
$(document).ready(function(){
	showPage = 1
	commentListCall(1);
	gbJoin();
	slider();
	report();
	inputValid();
});

function commentListCall(pageNum){
	$.ajax({
		type:'GET',
		url:'comment/commList.ajax?gbNo='+'${GroupBuyDto.gbNo}&&pageNum='+pageNum,
		data:JSON,
		dataType : 'json',
		success:function(data){
			drawComment(data)
		},
		error:function(error){
			console.error(error)
		}
				
	});
}

function drawComment(obj){
	let comments = '';
	$('#comments').empty();
	if(obj.comments.length > 0){
		for(let comDto of obj.comments){
			comments += '<div class="comment-box">';
			comments += '<p style="display:none">'+comDto.commNo+'</p>';
			comments += '<div class="commentHead">';
			comments +=	'<span class="commentWriter">'+comDto.nickname+'</span>';
	    	comments += '<span class="report2"><button class="report" value="댓글"><img src="/photo/icon/siren.png"/></button></span>'
	    	comments += '</div>'
			comments += '<div class="commentBody">'
			comments += '<div class="content"><textarea class="commentContent inputValid" readonly>'+comDto.comment+'</textarea><div class="validation" style="display:none">0/250</div></div>'
	        comments += '<div class="date">'
	        let milliseconds = parseInt(comDto.commRegDate,10)
	        const date = new Date(milliseconds);
	        const year = date.getFullYear();
	        const month = date.getMonth() + 1;
	        const day = date.getDate();
	        const formattedDate = year+'-'+month+'-'+day;
	    	comments += '<span >작성 날짜 '+formattedDate+'</span>'
			if(comDto.isCommentWriter == true){
				comments += '<span class="witer-olny"><button class="delete comm-btn">삭제</button><button class="modify comm-btn" value="modify">수정</button><button class="modifyCancel" value="modify" style="visibility:hidden">수정취소</button></span></div></div>'
			}
			comments += '</div></div>';
		} 
		console.log(obj.currPage);
		$('#comments').append(comments);
		$('#pagination').twbsPagination({
			startPage:showPage, // 보여줄 페이지
			totalPages:obj.totalPage,// 총 페이지 수(총갯수/페이지당보여줄게시물수) : 서버에서 계산해서 가져와야함
			visiblePages:5,//[1][2][3][4][5]
			onPageClick:function(e,page){ // 번호 클릭시 실행할 내용
				//console.log(e);
				if(showPage != page){
					console.log(page);
					showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
					commentListCall(page);
				}
			}
		});
		modifyBtn();
		deleteBtn();
		modifyCancel();
		report();
		inputValid();
	}
}
//댓글 작성
$('#commentWrite').on('click', function(){
	$('#pagination').twbsPagination('destroy');
	let comment = $('#comment').val();
	if(comment == ''){
		alert("댓글을 작성해 주세요");
		return false;
	}
	$('#comment').val('');
	$.ajax({
		type:'Post',
		url:'comment/register.ajax',
		data : {
			comment : comment,
			gbNo : '${GroupBuyDto.gbNo}'
		},
		dataType :'json',
		success:function(data){
			if(data.msg == "success"){
				alert("댓글작성을 성공했습니다.");
				console.log(data.pageNum);
				commentListCall(data.pageNum)
				
			}else{
				alert("댓글작성에 실패했습니다.")
			}
		},
		error:function(error){
			console.error(error)
		}
				
	});
});

//댓글 삭제
function deleteBtn(){
	$('.delete').on('click', function(){
		$('#pagination').twbsPagination('destroy');
		let commNo= $(this).closest("div").prev().parent("div").prev().prev().html();
		console.log(commNo);
		console.log(gbNo); 	
		$.ajax({
			type:'GET',
			url:'comment/delete.ajax?gbNo='+'${GroupBuyDto.gbNo}&&commNo='+commNo,
			dataType :'json',
			success:function(data){
				if(data.msg == "success"){
					commentListCall(1)
					alert("댓글삭제를 성공했습니다.");
					
				}else{
					alert("댓글삭제에 실패했습니다.")
				}
			},
			error:function(error){
				console.error(error)
			}
					
		});
	});
}

//댓글 수정
function modifyBtn(){
	$('.modify').on('click', function(){
		let commentArea = $(this).closest("div").prev().children('textarea');
		commentArea.css('border','1px solid darkgray');
		if($(this).html() == '수정'){
			$(this).next().css('visibility','visible');
			$(this).prev().css('visibility', 'hidden');
			commentArea.next().css("display","block");
			console.log($(this).val());
			commentArea.prop('readonly', false);
			$(this).html("수정완료")
			comment = commentArea.val();
			
		}else if($(this).html() =='수정완료'){
			$(this).next().css('visibility','hidden')
			$(this).prev().css('visibility', 'visible')
			commentArea.next().css("display","none");
			console.log($(this).val());
			commentArea.prop('readonly', true);
			$(this).html("수정")
			
			comment = commentArea.val();
			let commNo= $(this).closest("div").prev().parent("div").prev().prev().html();
			
			let modifyData = {}
			modifyData.pageNum = showPage;
			modifyData.commNo = commNo;
			modifyData.gbNo = '${GroupBuyDto.gbNo}';
			modifyData.comment = comment;
			$.ajax({
				type:'post',
				url:'comment/modify.ajax',
				data:modifyData,
				dataType :'json',
				success:function(data){
					commentListCall(showPage)
					alert(data.msg);
				},
				error:function(error){
					console.error(error)
				}
						
			});
		}
	});
}

//수정 취소 버튼 이벤트 함수
function modifyCancel(){
	$(".modifyCancel").on('click', function(){
		let commentArea = $(this).closest("div").prev().children('textarea');
		commentArea.next().css("display","none");
		commentArea.css('border','none');
		$(this).css('visibility','hidden')
		let modifyOk = $(this).prev();
		modifyOk.html("수정")
		modifyOk.prev().css('visibility', 'visible');
		commentArea.val(comment);
		commentArea.prop('readonly', true);
	});
}

//공구 참여 함수
function gbJoin(){
	$('#gbJoin').on('click', function(){
		let gbNo = $('#gbNo').html();
		let url = '<c:url value="/pointCharge"/>';
		$.ajax({
			type:'post',
			url:'join.ajax',
			data:{
				gbNo:${GroupBuyDto.gbNo},
				gbPrice:${GroupBuyDto.joinPrice}
			},
			dataType : 'json',
			success:function(data){
				console.log(data)
				if(data.msg == 'success'){
					alert('공구 참여 성공!');
					location.href = 'gbDetail?gbNo=${GroupBuyDto.gbNo}';					
				}else if(data.msg == 'balanceIssue'){
					console.log("test")
					console.log(data.msg)
					let msg = data.msg;
					alert('잔액이 부족해여 포인트 충전 페이지로 넘어갑니다');
					location.href = url;					
				}else if(data.msg == 'fail'){
					alert('공구 참여 실패!');
					location.href = 'gbDetail?gbNo=${GroupBuyDto.gbNo}';	
				}
			},
			error:function(error){
				location.href = 'gbDetail?gbNo=${GroupBuyDto.gbNo}';
				console.error(error)
			}
					
		});
		
	});
}

$('#pagePerNum').change(function(){
	$('#pagination').twbsPagination('destroy');
	commentListCall(showPage);
});

function report(){
	$('.report').on('click', function(){
		console.log('report')
		let gbNo = '${GroupBuyDto.gbNo}';
		let url = 'report?gbNo='+gbNo;
		console.log($(this).val());
		if($(this).val() == '댓글'){
			let commNo = $(this).closest("div").prev().html();
			console.log(commNo)
			url += '&&commNo='+commNo;
		}
		location.href = url;
		
	})
}

function inputValid(){
	$('.inputValid').on('keydown', function(){
	    let len = $(this).val().length;
	    //console.log($(this));
	    if(len > 250){
	        var over = len - 250;
	        var x = $(this).val();
	        console.log(x);
	        x = x.replace(x.substr(250), "");
	        console.log($(this).next());
	        $(this).next().html('250/250 250자 까지 작성할 수 있습니다.');
	        $(this).next().css('color', 'red');
	    }else{
	        $(this).next().html(len+'/250');
	        $(this).next().css('color', 'black');
	    }
	}).on('keyup', function(){
	    var y = $(this).val();
	    if(y.length>250){
	        $(this).next().html('250/250 250자 까지 작성할 수 있습니다.');
	        $(this).next().css('color', 'red');
	    }else{
	    	$(this).next().html(y.length+'/250');
	        $(this).next().css('color', 'black');
	    }
	    $(this).val($(this).val().replace(y.substr(250), ""));
	});
}

function slider(){
	$('.slider-2 > .side-btns > div:first-child').click(function() {
	    console.log('slider click left')
		var $this = $(this);
	    console.log($this)
	    var $slider = $this.closest('.slider-2');
	    var $current = $slider.find('div.active');
	    
	    var $post = $current.prev();
	    if($post.prop('class') == 'slide-img'){
	    	console.log($post);
		    $current.removeClass('active')
		    $post.addClass("active");
	    }else{
	    	return false
	    }
	    
	    if ( $post.length == 0 ) {
	        $post = $slider.find('.page-nav > div:last-child');
	    }
	    
	    $post.click();
	});

	$('.slider-2 > .side-btns > div:last-child').click(function() {
		console.log('slider click right')
	    var $this = $(this);
	    var $slider = $this.closest('.slider-2');
	    var $current = $slider.find('div.active');
	    //console.log($current);
	    var $post = $current.next();
	    if($post.prop('class') == 'slide-img'){
	    	console.log($post);
		    $current.removeClass('active')
		    $post.addClass("active");
	    }else{
	    	return false
	    }
	    
	    $post.click();
	});
}

$('#back').on('click', function(){
	location.href='gbList';
})
</script>
</html>