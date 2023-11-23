<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/paging.css'/>" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<link href="<c:url value='/resources/css/gbList.css'/>" rel="stylesheet"/>
<script src="<c:url value='/resources/js/paging.js'/>" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<style>
.card:hover {
  transform: scale(1.05);
}
.card {
  box-shadow: 10px 5px 5px black;
  transition: all 0.2s linear;
  margin-left: auto;
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
	.scb{
	}




    select {
        margin: 5px 0px;
    }
    .hidden {
        display: none;
    }
    div.card-row-spacing{
    float: left;
    margin-left: 25%;
    }
    div.scb{
    display:flex;
    margin-top:-0.7%;
   	margin-left: 200px;
    }
    div.seli{
    float: left;
    margin-left:25%;
    }
    div.container{
    position: absolute;
    margin-left: 9%;
    }
	.option{
		display: flex;
	}
	.date-option{
		display: flex;
		
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
	  <li><a href="adminReport">신고 관리</a></li>
	  <li><a href="point">포인트 관리</a></li>
	  <li><a href="groupBuy" style="background: #F9DCA3;color: white;" >게시판 관리</a></li>
		</ul>
	</div>
	
	

	<div class="option">
	<div class="seli"style="margin-top: 1%;">
    <span><button class="region current" id="alladmingblist" value="전체">전체</button></span>
    <span><button class="region" id="sucadmingblist" value="완료">완료</button></span>
    <span><button class="region" id="failadmingblist" value="취소">취소</button></span>
	</div>
	<div class="scb" style="margin-top: 1%;">
		<div>
			<input type="text" id="searchadmingblist" class="sub-elem" placeholder="아이디 입력"/>
		</div>
		<div>
				<input type="button" id="searchpoingblist" class="comm-btn sub-elem" value="아이디 검색"/>	
		</div>
		<div class="date-option">
			<label for="date"> 날짜를 선택하세요 : 
	        <input type="date" id="firstsearchdate" value="" />
	        ~
	        <input type="date" id="lastsearchdate" value="" />
	        <input type="button" id="searchButton" class="comm-btn" value="검색" />
	    </label>
		</div>
	</div>
	</div>
    <div class="card-row-spacing">
        <div class="row" id="list">
            <!-- 데이터가 여기에 삽입됩니다. -->
        

</body>
    <script>
    function formatDateFromTimestamp(timestamp) {
        var date = new Date(timestamp);
        var year = date.getFullYear(); // 연도를 4자리로 가져옵니다.
        var month = ('0' + (date.getMonth() + 1)).slice(-2);
        var day = ('0' + date.getDate()).slice(-2);
        return year + '-' + month + '-' + day;
    }

    var showPage = 1;
	var searchblock ="all";
       var seruser = '';
       var searchResults = null;
       var firstpage = true;
       var serint = null;
    adminGroupBuyList(showPage,searchblock);

    function adminGroupBuyList(page,searchblock) {
        $.ajax({
            type: 'get',
            url: 'groupBuy/list.ajax',
            data: { 'page': page, 'searchblock':searchblock },
            dataType: 'json',
            success: function (data) {
            	console.log(data);
                console.log(data.list.length);
                if(data.list.length==0){
                	alert('검색결과가 없습니다.')
                }else{                    	
                drawList(data);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function drawList(obj) {
        var content = '';
		var pp = '';
        var itemPerRow = 4; // 한 행당 4개의 아이템을 표시

        obj.list.forEach(function (item, idx) {
        	content += '<div class="card-row" style="margin-top: 4%;">'; // 한 행 시작
            content += '<div class="card "style="width: 18rem; " ' + idx + '" id="' + item.gbNo + '">';
            if(item.firstFileName == null){
                content +='<div class="card-img-top" style="background-image:url(/photo/default/default.png?auto=compress,format);">'
            	
            }else{
            	content +='<div class="card-img-top" style="background-image:url(/photo/gbImg/'+item.firstFileName+'?auto=compress,format);">'  	
            }
            content += '</div>';
            content +='<div class="card-body">'
            content +='<p class="gbno-hidden">'+item.gbNo+'</p>'
            content += '<div class="title section" style="overflow: hidden">' + item.title + '</div>'
            content += '<div class="writer section">' + item.userId +'</div>'
            content += '<div class="date-div">모집기간</div>'
            var startDate = formatDateFromTimestamp(item.startDate);
            var finishDate = formatDateFromTimestamp(item.finishDate);
            content +='<div class-"date">'+ startDate + ' ~ ' + finishDate + '</div>'
            content +='<div class="recruit-div section">'
            content +='<span>모집인원</span><span class="recruit-period">'+ item.joinPeople + '/' + item.recruitPeople + '</sapn>'
            content += getRecruitImgTag(item.joinPeople, item.recruitPeople);
            content +='<div class="section">'
            content += '</div>'
            	let joinPrice = item.joinPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            content +='<span>'+joinPrice+'원</span>';
            content +='<span class="card-category comm-btn">'+item.categoryType+'</span>'
            content += '</div>'
            content += '</div>'
            content += '</div>'// 한 행 종료
            content += '</div>'
            content += '</div>'

        });
        pp += '<div class="container">';
        pp += '<nav aria-label="Page navigation" style="text-align:center">';
        pp += '<ul class="pagination" id="pagination"></ul>';
        pp += '</nav>';
        pp += '</div>';

        $('#list').empty();
        $('#list').append(content);
        $('#list').append(pp);

        	console.log(showPage);
        // 페이징 처리 UI 그리기(플러그인 사용)
        $('#pagination').twbsPagination({
        	startPage: showPage, // 현재 페이지 번호를 설정
    	    totalPages: obj.pages,
    	    visiblePages: 5,
    	    onPageClick: function (e, page) {
    	        if (showPage !== page) {
    	            showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
    	            if(serint){
    	            	if(firstpage){
    	                	adminGroupBuyIntList(showPage,searchblock,firstSearchDateValue,lastSearchDateValue);		
    	            	}else{
    	            		adminGroupBuySerUserIntList(showPage, searchblock, seruser,firstSearchDateValue,lastSearchDateValue);       		
    	            	}
    	            }else{        	            	
    	            if(searchResults){
    	        		adminGroupBuySerUserList(showPage, searchblock, seruser)		
    	        	}else{
    	        		adminGroupBuyList(showPage,searchblock);        		
    	        	}
    	            }
                }
            }
        });
    }
    function getRecruitImgTag(joinNum, recruitNum){
    	let recruitRatio = 	Math.floor(joinNum/recruitNum*100);
    	let imgTag = '';
    	if(recruitRatio>=0 && recruitRatio<= 25){
    		imgTag += '<span class="recruit-img-span"><img class="detail-joinicon" src="/photo/icon/1.png"/></span>'
    	}else if(recruitRatio>=26 && recruitRatio<= 50){
    		imgTag += '<span class="recruit-img-span"><img class="detail-joinicon" src="/photo/icon/2.png"/></span>'
    	}else if(recruitRatio>51 && recruitRatio<= 75){
    		imgTag += '<span class="recruit-img-span"><img class="detail-joinicon" src="/photo/icon/3.png"/></span>'
    	}else if(recruitRatio>=76 && recruitRatio<= 99){
    		imgTag += '<span class="recruit-img-span"><img class="detail-joinicon" src="/photo/icon/4.png"/></span>'
    	}else{
    		imgTag += '<span class="recruit-img-span"><img class="detail-joinicon" src="/photo/icon/5.png"/></span>'
    	}
    	return imgTag;
    }
    $('#alladmingblist').on('click',function(){
    	showPage = 1;
    	searchblock = "all";
    	$('button.region').removeClass('current');
        $(this).addClass('current');
    	seruser= null;
    	searchResults=null;
    	adminGroupBuyList(showPage,searchblock);
    	console.log(showPage);
    	firstpage = true;
    	 $('#searchadmingblist').val('');
    });
    $('#sucadmingblist').on('click',function(){
    	showPage= 1;
    	searchblock = "N";
    	$('button.region').removeClass('current');
        $(this).addClass('current');
    	if(serint){
        	if(firstpage){
            	adminGroupBuyIntList(showPage,searchblock,firstSearchDateValue,lastSearchDateValue);		
        	}else{
        		adminGroupBuySerUserIntList(showPage, searchblock, seruser,firstSearchDateValue,lastSearchDateValue);       		
        	}
        }else{        	            	
        if(searchResults){
    		adminGroupBuySerUserList(showPage, searchblock, seruser)		
    	}else{
    		adminGroupBuyList(showPage,searchblock);        		
    	}
        }
    	console.log(showPage);
    });
    $('#failadmingblist').on('click',function(){
    	showPage= 1;
    	searchblock = "Y";
    	$('button.region').removeClass('current');
        $(this).addClass('current');
    	if(serint){
        	if(firstpage){
            	adminGroupBuyIntList(showPage,searchblock,firstSearchDateValue,lastSearchDateValue);		
        	}else{
        		adminGroupBuySerUserIntList(showPage, searchblock, seruser,firstSearchDateValue,lastSearchDateValue);       		
        	}
        }else{        	            	
        if(searchResults){
    		adminGroupBuySerUserList(showPage, searchblock, seruser)		
    	}else{
    		adminGroupBuyList(showPage,searchblock);        		
    	}
        }
    		console.log(showPage);
    });

    $('#searchpoingblist').on('click',function(){
    	showPage=1;
    	searchblock = "all";
    	seruser= null;
    	firstpage = false;
        var inputElement = document.getElementById("searchadmingblist");
        seruser = inputElement.value;
        adminGroupBuySerUserList(showPage, searchblock, seruser);
    })
    function adminGroupBuySerUserList(page, searchblock, seruser) {
        $.ajax({
            type: 'get',
            url: 'groupBuy/ser/user/list.ajax',
            data: { 'page': page,'searchblock':searchblock , 'seruser':seruser },
            dataType: 'json',
            success: function (data) {
                console.log(data);
                searchResults = data;
                if(data.list.length==0){
                	alert('검색결과가 없습니다.')
                }else{    
                drawList(data);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
    
    $('#searchButton').on('click', function () {
    	showPage = 1;
    	$('#pagination').twbsPagination({
    	    startPage: '1'
    	});
        if($('#firstsearchdate').val() && $('#lastsearchdate').val()){
        firstSearchDateValue = $('#firstsearchdate').val();
        lastSearchDateValue = $('#lastsearchdate').val();
        console.log(firstpage);
        if(firstpage){
        	adminGroupBuyIntList(showPage,searchblock,firstSearchDateValue,lastSearchDateValue);		
    	}else{
    		adminGroupBuySerUserIntList(showPage, searchblock, seruser,firstSearchDateValue,lastSearchDateValue);       		
    	}
        }else{
        	alert('날짜를 모두 선택해 주세요.');
        }
    });
    function adminGroupBuyIntList(page, searchblock,firstSearchDateValue,lastSearchDateValue) {
        $.ajax({
            type: 'get',
            url: 'groupBuy/int/list.ajax',
            data: { 'page': page,'searchblock':searchblock ,'firstSearchDateValue':firstSearchDateValue,'lastSearchDateValue':lastSearchDateValue},
            dataType: 'json',
            success: function (data) {
                console.log(data);
                serint=data;
                if(data.list.length==0){
                	alert('검색결과가 없습니다.')
                }else{                    	
                drawList(data);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
    function adminGroupBuySerUserIntList(page, searchblock, seruser,firstSearchDateValue,lastSearchDateValue) {
        $.ajax({
            type: 'get',
            url: 'groupBuy/ser/user/int/list.ajax',
            data: { 'page': page,'searchblock':searchblock , 'seruser':seruser,'firstSearchDateValue':firstSearchDateValue,'lastSearchDateValue':lastSearchDateValue},
            dataType: 'json',
            success: function (data) {
                console.log(data);
                serint=data;
                if(data.list.length==0){
                	alert('검색결과가 없습니다.')
                }else{                    	
                drawList(data);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
    $(document).on('click', '.card', function() {
    	var gbNo = $(this).attr('id');
        console.log('클릭한 카드의 id: ' + gbNo);
        location.href= 'gbdetail?gbNo='+gbNo;
    });
    
    </script>

</html>