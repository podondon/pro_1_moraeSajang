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
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value='/resources/css/paging.css'/>" rel="stylesheet">
<script src="<c:url value='/resources/js/paging.js'/>" type="text/javascript"></script>
<style>
div.container{
	margin-left: -18%;
	width: 100%;
}

#back {
   	margin-left: 47%;
}
	tr.f1{
	background-color: #F9DCA3; 
	}

	div.sideber ul {
	  list-style-type: none;
	  padding: 10px;
	  margin: 0px 20px 0px 20px;
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
	
</style>
</head>
<body style="margin-top: 8%;">
<%@ include file="/WEB-INF/views/common/adminHeader.jsp" %>


	<div class="elem-container">
    <div id="productsInfo" class="section">
        <div id="productImgBox" class="products">
        	<div class="slider-2">
			     <div class="side-btns">
			        <div><span><i class="fas fa-caret-left"></i><</i></span></div>
			        <div><span><i class="fas fa-caret-right"></i>></span></div>
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
	                <span id="recruitPeople">
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
			<div class="smallInfo">
	                <label class="info-label">글 번호</label>
	                <span id="gbNo">
	                    ${gbNo}
	                </span>
	            </div>
	            <div class="smallInfo">
	                <label class="info-label">글 상태</label>
	                <span id="block">
	                    <select type="text" id="blocks" >
			                <option value="N">정상</option>
			                <option value="Y">블라인드</option>
            			</select>
			                <input type ="button" id="blockbut" class="comm-btn" value="저장"/>
	                </span>
	            </div>
	            
            <div 모집기간 class="smallInfo">
	                <label class="info-label">모집기간</label>
	                <span id="startDate">
	                    ${GroupBuyDto.startDate}
	                    ~
	                    ${GroupBuyDto.startDate}
	                </span>
	            </div>
            <div class = "smallInfo">
	                <label class="info-label">지역</label>
	                <span id="recruitRegion">
	                    ${GroupBuyDto.gbDetailAddress}
	                </span>
	            </div>
            <div class="smallInfo">
	                <label class="info-label">모집장소</label>
	                <span id="recruitLocation">
	                    ${GroupBuyDto.place}
	                </span>
	            </div>
	            <div class="smallInfo">
	                <label class="info-label">아이디</label>
	                <span id="userId">
						${GroupBuyDto.userId}
	                </span>
	            </div>
	            <div class="smallInfo">
	                <label class="info-label">작성자</label>
	                <span id="nickname">
						${GroupBuyDto.nickname}
	                </span>
	            </div>
				<div class="smallInfo">
	                <label class="info-label">사용자 평가</label>
	                <div>
	                <span id="tradeAgainNum">
	                    별로에요 : ${GroupBuyDto.tradeAgainNum}
	                </span>
	                <span id="justOkayNum">
	                    그냥 그래요 : ${GroupBuyDto.justOkayNum}
	                </span>
	                <span id="notInterestedNum">
	                    또 거래하고싶어요 : ${GroupBuyDto.notInterestedNum}
	                </span>
	                </div>
	            </div>
	            <div class="smallInfo">
	                <label class="info-label">금액</label>
	                <span  id="joinPrice">
	                	<fmt:formatNumber var="sm" value="${GroupBuyDto.joinPrice}" pattern="#,###" />
	                    ${sm}원
	                </span>
	            </div>
	            <div class="smallInfo">
	                <label class="info-label">카테고리</label>
	                <span id="category">
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

    <div id="comments">
	            
        </div>
        </div>
        <div id="pp">

		</div>
    	<button id="back" class="comm-btn">목록으로</button>
    	</div>
    	</br>
    	</br>
</body>
<script>
function formatDateFromTimestamp(timestamp) {
    var date = new Date(timestamp);
    var year = date.getFullYear(); // 연도를 4자리로 가져옵니다.
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}
var gbNo = ${gbNo};
admingbdetail()
function admingbdetail(){
    console.log(gbNo);
    $.ajax({
        type: 'get',
        url: 'Board/detail.ajax',
        data: {'gbNo':gbNo},
        dataType: 'json',
        success: function (data) {
            console.log(data);
            $('#title').val(data.GroupBuyDto.title);
            $('#gbContent').val(data.GroupBuyDto.gbContent);
            // 모집인원
            var joinPeople = data.GroupBuyDto.joinPeople;
            var recruitPeople = data.GroupBuyDto.recruitPeople;
            $('#recruitPeople').text(joinPeople + '/' + recruitPeople);
            // 모집 기간
            var startDate=formatDateFromTimestamp(data.GroupBuyDto.startDate);
            var finishDate=formatDateFromTimestamp(data.GroupBuyDto.finishDate)
            $('#startDate').text(startDate+' ~ '+finishDate);
            // 모집 지역
         	var adress = data.GroupBuyDto.gbDetailAddress;
            $('#recruitRegion').text(adress);
            // 모집 장소
            var place = data.GroupBuyDto.place;
            $('#recruitLocation').text(place);
            // 닉네임
            var nickname = data.GroupBuyDto.nickname;
            $('#nickname').text(nickname);
            // 금액
           	var joinPrice = data.GroupBuyDto.joinPrice;
			var formattedJoinPrice = new Intl.NumberFormat('ko-KR', { style: 'decimal', currency: 'KRW' }).format(joinPrice);
			$('#joinPrice').text(formattedJoinPrice + '원');
			// 카테고리
			var category = data.GroupBuyDto.categoryType;
            $('#category').text(category);
            // 유저 아이디
            var userId=data.GroupBuyDto.userId;
            $('#userId').text(userId);
            // 유저 평가
            var tradeAgainNum= data.GroupBuyDto.tradeAgainNum;
            $('#tradeAgainNum').text('또 거래하고 싶어요 : '+tradeAgainNum);
            var justOkayNum =data.GroupBuyDto.justOkayNum
            $('#justOkayNum').text('그냥 그래요 : '+justOkayNum);
            var notInterestedNum = data.GroupBuyDto.notInterestedNum
            $('#notInterestedNum').text('별로에요 : '+notInterestedNum);
            //------------------------
            var blockStateValue = data.GroupBuyDto.blockState; 
            if (blockStateValue === 'N') {
                // '정상'을 선택하도록 업데이트
                $('#blocks').val('N');
            } else if (blockStateValue === 'Y') {
                // '블라인드'를 선택하도록 업데이트
                $('#blocks').val('Y');
            }
            
            // PhotoNames 데이터 업데이트
            var photoNames = data.PhotoNames;
            var slides = $('.slides');
            slides.empty();

            if (photoNames.length === 0) {
                // 기본 이미지 표시
                slides.append('<div class="active slide-img" style="background-image:url(/photo/default/default.png?auto=compress,format);"></div>');
            } else {
                // 각 이미지 표시
                for (var i = 0; i < photoNames.length; i++) {
                    var imageClass = i === 0 ? 'active' : '';
                    var imageUrl = '/photo/gbImg/' + photoNames[i] + '?auto=compress,format';
                    slides.append('<div class="slide-img ' + imageClass + '" style="background-image:url(' + imageUrl + ');"></div>');
                }
            }

            // 사용자 평가 데이터 업데이트
            $('.detail-joinicon').attr('src', function (index) {
                var oc = data.GroupBuyDto.joinPeople / data.GroupBuyDto.recruitPeople * 100;
                if (oc >= 0 && oc <= 25) {
                    return '/photo/icon/1.png';
                } else if (oc >= 26 && oc <= 50) {
                    return '/photo/icon/2.png';
                } else if (oc >= 51 && oc <= 75) {
                    return '/photo/icon/3.png';
                } else if (oc >= 76 && oc <= 99) {
                    return '/photo/icon/4.png';
                } else if (oc === 100) {
                    return '/photo/icon/5.png';
                } else {
                    return ''; // 다른 경우
                }
            });
        },
        error: function (e) {
            console.log(e);
        }
    });    
}
var showPage = 1;
commentListCall(showPage,gbNo)
function commentListCall(page,gbNo){
	$.ajax({
        type: 'get',
        url: 'Board/detail/comment.ajax',
        data: { 'page': page,'gbNo':gbNo},
        dataType: 'json',
        success: function (data) {
            console.log(data);
            if(data.comments.length==0){
            	var comments ='';
            	comments += '<p>댓글이 없습니다.</p>';
            	$('#comments').empty();
            	$('#comments').append(comments);
            }else{                    	
            drawList(data);
            }
        },
        error: function (e) {
            console.log(e);
        }
    });
}
function drawList(obj){
	var comments ='';
	var pp ='';
	obj.comments.forEach(function(item, idx){
		comments += '<div class="comment-box">';
		comments += '<p style="display:none">'+item.commNo+'</p>';
		comments += '<div class="commentHead">';
		comments +=	'<span id="commentWriter">'+item.userId+'</span>';
    	comments += '</div>';
		comments += '<div class="commentBody">'
		comments +='<div class="content"><textarea class="commentContent inputValid" readonly>'+item.comment+'</textarea><div class="validation" style="display:none">0/250</div></div>'
        comments += '<div class="date"></div></div>'
        	let milliseconds = parseInt(item.commRegDate,10)
	        const date = new Date(milliseconds);
	        const year = date.getFullYear();
	        const month = date.getMonth() + 1;
	        const day = date.getDate();
	        const formattedDate = year+'-'+month+'-'+day;
	    	comments += '<span >작성 날짜 '+formattedDate+' </span>'
        comments += '<span><button class="delete" data-commno="${item.commNo}"> 삭제 </button>';	
		
	});
	pp += '<div class="container">';
    pp += '<nav aria-label="Page navigation" style="text-align:center">';
    pp += '<ul class="pagination" id="pagination"></ul>';
    pp += '</nav>';
    pp += '</div>';
    $('#comments').empty();
    $('#pp').empty();
	$('#comments').append(comments);
	$('#pp').append(pp);
	$('#pagination').twbsPagination({
		startPage:showPage, // 보여줄 페이지
		totalPages:obj.totalPage,// 총 페이지 수(총갯수/페이지당보여줄게시물수) : 서버에서 계산해서 가져와야함
		visiblePages:5,//[1][2][3][4][5]
		onPageClick:function(e,page){ // 번호 클릭시 실행할 내용
			//console.log(e);
			if(showPage != page){
				console.log(page);
				showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
	            commentListCall(showPage, gbNo);
			}
		}
	});
	deleteBtn();
}
// 댓글 삭제 기능 만들기, 블라인드 상태 변경 버튼
function deleteBtn(){
	$('.delete').on('click', function(){
		let commNo= $(this).closest('.comment-box').find('p').eq(0).text();
		console.log(commNo);
		console.log(gbNo); 
		$.ajax({
			type:'GET',
			url:'Board/comment/del.ajax',
			data: {'commNo':commNo,'gbNo':gbNo},
			dataType :'json',
			success:function(data){
				if(data.msg == "success"){
					showPage=1;
					commentListCall(showPage,gbNo);
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

$('#blockbut').on('click',function(){
	 var blockState = $('#blocks').val();
	 console.log("선택한 블록 상태: " + blockState);
	 $.ajax({
			type:'GET',
			url:'Board/blockState.ajax',
			data: {'blockState':blockState,'gbNo':gbNo},
			dataType :'json',
			success:function(data){
				if(data.msg == "success"){
					admingbdetail()
					alert("상태변경에 성공했습니다.");
				}else{
					alert("상태변경에 실패했습니다.")
				}
			},
			error:function(error){
				console.error(error)
			}
					
		});
});
	
$('#back').on('click', function(){
	location.href='groupBuy';
})

</script>
</html>