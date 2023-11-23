<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모래사장 | 포인트 충전</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="<c:url value='/resources/js/paging.js'/>" type="text/javascript"></script>
<link href="<c:url value='/resources/css/paging.css'/>" rel="stylesheet">
<style type="text/css">
	.current{
		background-color: #FFBC38;
		
	}
	button.list-btn{
	width: 100px;
	height: 50px;
	border-style: none;
	padding:0px;
	margin:0;
	border-radius:10px;
}
.container{
	margin-left: 370px;
}
th, tr{
	border-bottom: 1px solid black;
	text-align: center;	
}
th{
	background-color: #F9DCA3;
}
body{
     margin-top: 130px;
}

        #pointHistory{position:relative; margin-top:150px; overflow: hidden;}
        #lnb{position: fixed; left:0; top:100px; width:300px; height:100%; background-color: #f9f9f9; z-index: 99;}
        #lnb ul{margin-top:20px;}
        #lnb ul li{width:280px; height:60px; line-height: 60px; box-sizing: border-box; border-radius: 10px; margin:10px auto; padding-left:40px; font-family: 'KorailRoundGothicBold';}
        #lnb ul li.on{background-color: #fcdfa0; color:#fff;}
        #lnb a:hover{text-decoration:none;}
        #lnb .logout{position:absolute; margin-left:50px; bottom:200px;}
        #lnb .logout a span{font-size:20px; line-height:25px; position:relative; top:-7px; color:#FFBC38;}
        
        #gbTable{
        margin-left: 450px;
        width: 850px;
    	height: 500px;
    	margin-top: 20px;
        }
        #gbToggle{
        margin-left: 450px;
        }
        #gbTable table{
        width: 100%;
        text-align: center;
        }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerPg.jsp" %>
	<div id="lnb">
		<ul>
			<a href="<c:url value="/mypage"/>"><li>내 프로필</li></a>
			<a href="<c:url value="/mypage/groupBuy/gbList"/>"><li class="on">내 공구 현황</li></a>
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
	<div id="gbToggle">
		<button class="list-btn current" value="recruit">모집</button>
		<button class="list-btn" value="join">참여</button>
	</div>
	<div id="gbTable">
		<table>
			<thead>
			</thead>
			<tbody>
			
			</tbody>
		</table>
	</div>
	<div class="container">
                <nav aria-label="Page navigation" style="text-align:center">
                <ul class="pagination" id="pagination"></ul>
                </nav>
        </div> 
</body>
<script>
let showPage = 1;
let listType = 'recruit'
$(document).ready(function(){
	console.log("firstListcall");
	myGbListCall(showPage);

});
function myGbListCall(page){
	console.log('firstUrl'+'myGbList.ajax?page='+page+'&&listType='+listType);
	$.ajax({
		type: 'get',
		url: 'gbList.ajax?page='+page+'&&listType='+listType,
		dataType: 'json',
		success:function(data){
			if(data.listType == 'recruit'){
				console.log(data);
				drawRecruitGbList(data);
			}else{
				drawJoinGbList(data);
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}
function drawRecruitGbList(data){
	let list = data.myGbList;
	console.log(list);
	$('thead').empty();
	let tbody = '';
	let thead = '<tr>'
		thead += '<th>카테고리 종류</th>'
		thead += '<th>제목</th>'
		thead += '<th>모집기간</th>'
		thead += '<th>인원수</th>'
		thead += '<th>거래 가격</th>'
		thead += '<th>공구상태</th></tr>'
		$('thead').append(thead);
		$('tbody').empty();
	if(list.length == 0){
		tbody = '<tr><td colspan="6">모집한 공구가 없습니다.</td></tr>'
		$('tbody').append(tbody);
	}else{
		console.log(list);
		for(let gb of list){
			tbody += '<tr>'
				tbody += '<td>'+gb.categoryType+'</td>'
				tbody += '<td>'+gb.title+'</td>'
				let startDate = formatDateFromTimestamp(gb.startDate);
				let finishDate = formatDateFromTimestamp(gb.finishDate);
				tbody += '<td>'+ startDate +' ~ '+ finishDate+'</td>'
				tbody += '<td>'+gb.joinPeople +'/'+ gb.recruitPeople+'</td>'
				tbody += '<td>'+gb.joinPrice+'</td>'
				tbody += '<td>'+gb.gbState+'</td></tr>'
		}
		$('tbody').append(tbody);
	}
	pagnation(data.currPage, data.totalPage);
}

function drawJoinGbList(data){
	let list = data.myGbList;
	console.log(list);
	let showPage=1;
	$('thead').empty();
	let tbody = '';
	let thead = '<tr>'
		thead += '<th>모집자</th>'
		thead += '<th>카테고리 종류</th>'
		thead += '<th>제목</th>'
		thead += '<th>모집기간</th>'
		thead += '<th>인원수</th>'
		thead += '<th>거래 가격</th>'
		thead += '<th>공구상태</th>'
		thead += '<th>완료/평가</th></tr>'
		$('thead').append(thead);
		$('tbody').empty();
		
	if(list.length == 0){
		tbody = '<tr><td colspan="7">참여한 공구가 없습니다.</td></tr>'
		$('tbody').append(tbody);
	}else{
		console.log(list);
		for(let gb of list){
			tbody += '<tr>'
			tbody += '<td>'+gb.nickname+'</td>'
			tbody += '<td>'+gb.categoryType+'</td>'
			tbody += '<td>'+gb.title+'</td>'
			let startDate = formatDateFromTimestamp(gb.startDate);
			let finishDate = formatDateFromTimestamp(gb.finishDate);
			tbody += '<td>'+ startDate +' ~ '+ finishDate+'</td>'
			tbody += '<td>'+gb.joinPeople +'/'+ gb.recruitPeople+'</td>'
			tbody += '<td>'+gb.joinPrice+'</td>'
			tbody += '<td>'+gb.gbState+'</td>'
			if(gb.gbState == '완료' && gb.isReview == 0){
				tbody += '<td><button class="complete" disabled>완료</button><button class="review current" value="'+gb.gbNo+'">평가</button></td></tr>'
			}else if(gb.gbState == '진행' && gb.joinState == 'N'){
				tbody += '<td><button class="complete current" value="'+gb.gbNo+'">완료</button><button class="review" disabled>평가</button></td></tr>'
			}else if(gb.gbState == '진행' && gb.joinState == 'Y' && gb.isReview == 0){
				tbody += '<td><button class="complete" disabled>완료</button><button class="review current" value="'+gb.gbNo+'">평가</button></td></tr>'	
			}else if(gb.isReview >0){
				tbody += '<td><button class="complete" disabled >완료</button><button class="review" disabled >평가</button></td></tr>'
			}else{
				tbody += '<td><button class="complete" disabled >완료</button><button class="review" disabled >평가</button></td></tr>'
			}
		}
		$('tbody').append(tbody);
	}
	pagnation(data.currPage, data.totalPage);
	completeClick();
	reviewClick()
}

function pagnation(currPage, totalPage){
$('#pagination').twbsPagination({
	startPage:showPage, // 보여줄 페이지
	totalPages:totalPage,// 총 페이지 수(총갯수/페이지당보여줄게시물수) : 서버에서 계산해서 가져와야함
	visiblePages:5,//[1][2][3][4][5]
	onPageClick:function(e,page){
		if(showPage != page){
			console.log(page);
			showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
			console.log("showPage : "+showPage)
			console.log("Page : "+page)
			myGbListCall(page);
		}
	}
});	
}

function formatDateFromTimestamp(timestamp) {
    var date = new Date(timestamp);
    var year = date.getFullYear(); // 연도를 4자리로 가져옵니다.
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}

$(".list-btn").on('click', function(){
	listType = $(this).val();
	$('#pagination').twbsPagination('destroy');
	showPage = 1;
	$(this).addClass("current");
	$(this).next().removeClass("current");
	$(this).prev().removeClass("current");
	myGbListCall(1);
})

function completeClick(){
	$(".complete").on('click', function(){
		let gbNo = $(this).val();
		console.log("gbNo:"+$(this).val());
		$.ajax({
			type: 'get',
			url: 'gbComplete.ajax?gbNo='+gbNo,
			dataType: 'json',
			success:function(data){
				if(data.isComplete == 'success'){
					alert('공구완료에 성공했습니다.');
					$(this).removeClass("current");
					$(this).next().addClass("current");
					 myGbListCall(showPage);
				}else{
					alert('공구완료에 실패했습니다.');
				}
				
			},
			error:function(e){
				console.log(e);
				alert('공구완료에 실패했습니다.');
			}
		});	
	});
}

function reviewClick(){
	$(".review").on('click', function(){
		console.log($(this).val());
		let gbNo = $(this).val();
		location.href = 'review?gbNo='+gbNo+'&&listType='+listType+'&&page='+showPage;
		
	});
	
	$(this).removeClass("current");
	
}
</script>
</html>