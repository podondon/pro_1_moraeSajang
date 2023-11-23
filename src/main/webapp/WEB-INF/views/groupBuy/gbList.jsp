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
body{
 margin: 160px;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/headerPg.jsp" %>
    <div class="elem-container">
        <div class="gb-list-container search1">
            <div id="info__id">
            	<input type="text" id="search-keyWord"/>
	            <button id="search-btn"><i class="bi bi-search"></i></button>
            </div>
            <select type="text" id="categoryType" >
                <option value="" selected disabled hidden>카테고리를 선택해주세요.</option>
                <option value="0">전체</option>
                <option value="1">가공 식품</option>
                <option value="2">신선 식품</option>
                <option value="3">식재료</option>
                <option value="4">생필품</option>
                <option value="5">뷰티/미용</option>
                <option value="6">반려동물 용품</option>
                <option value="7">기타</option>
            </select>
            
        </div>
        <div class="gb-list-container search2">
        <span><button class="region current" value="${sessionScope.userInfo.userDetailAddress}">${sessionScope.userInfo.userDetailAddress}</button></span>
        <span><button class="region" value="all">전체</button></span>
        <span class="wirte-span"><button class="wirte comm-btn" value="wirte">글쓰기</button></span>
        </div>
    
        <div class="card-row-spacing">
            
        </div>
        
        <div class="container">
                <nav aria-label="Page navigation" style="text-align:center">
                <ul class="pagination" id="pagination"></ul>
                </nav>
        </div> 
    </div>
</body>
<script>
let showPage = 1;
const optionFirstPage = 1;
let searchOption ={};
let currentSearchUrl = '';

$(document).ready(function(){
	currentSearchUrl = '&&region='+'${sessionScope.userInfo.userDetailAddress}';
    console.log("firstUrl:"+currentSearchUrl)
    listCall(optionFirstPage)
});


function listCall(page){
	let fullUrl = 'gbList.ajax?page='+page+currentSearchUrl;
    $.ajax({
        type:'get',
        dataType : 'JSON',
        url:fullUrl,
        success(data){
        	$('.no-result').remove();
            if(data.gbList.length == 0){
				let noResult = '<div class="no-result">검색결과가 없습니다.</div>'
				$('div.card-row-spacing').empty();
				
				$('.search2').after(noResult);	
				setOptionEmpty();
            }else{
            	console.log(data);
            	drawList(data.gbList, data.totalPage, data.currPage);
            	setOptionEmpty();
            }
        },error(data){
            console.log(data);
        }
    });
}

function setOptionEmpty(){
	//$('#categoryType').val('').prop('selected', true);
	$('#search-keyWord').val('');
}

function drawList(list, totalPage, currPage){
	console.log(totalPage);
    let index=0
    let content = ''
    console.log(list);
    $('div.card-row-spacing').empty();
    for(let i=0; i<2; i++){
        content += '<div class="card-row">'
        for(let j=1; j<5; j++){
            if(index>=list.length){
                content += '<div class="card" style="width: 18rem; visibility:hidden"></div>'
                continue;
            }else{
                content += '<div class="card" style="width: 18rem;">'
                
            }
            if(list[index].firstFileName == null){
                content +='<div class="card-img-top" style="background-image:url(/photo/default/default.png?auto=compress,format);">'
            	
            }else{
            	content +='<div class="card-img-top" style="background-image:url(/photo/gbImg/'+list[index].firstFileName+'?auto=compress,format);">'  	
            }
            content +='</div>'
            content +='<div class="card-body">'
            content +='<p class="gbno-hidden">'+list[index].gbNo+'</p>'
            content +='<div class="title section" style="overflow: hidden">'+list[index].title+'</div>'
            content +='<div class="writer section">'+list[index].nickname+'</div>'
            content +='<div class="date-div">모집기간</div>'
            let startDate = formatDateFromTimestamp(list[index].startDate);
			let finishDate = formatDateFromTimestamp(list[index].finishDate);
            content +='<div class-"date">'+startDate+' ~ '+finishDate+'</div>'
            content +='<div class="recruit-div section">'
            content +='<span>모집인원</span><span class="recruit-period">'+list[index].joinPeople + '/' + list[index].recruitPeople+'</sapn>'
            content += getRecruitImgTag(list[index].joinPeople, list[index].recruitPeople);
            content +='</div>'
            content +='<div class="section">'
            let joinPrice = list[index].joinPrice.toString();
            joinPrice.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            content +='<span>'+joinPrice+'원</span>'
            content +='<span class="card-category comm-btn">'+list[index].categoryType+'</span>'
            content +='</div>'
            content +='</div>'
            content +='</div>'
            index += 1;
        }
        content += '</div>'
    }
    $('div.card-row-spacing').append(content);
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
				listCall(page);
			}
		}
	});
    cardClick();
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

$('#search-btn').on('click', function(){
    currentSearchUrl = makeUrl();
    console.log('search Btn click');
    $('#pagination').twbsPagination('destroy');
    listCall(optionFirstPage);
});

$('.region').on('click', function(){
    console.log('region click');
    $('button.region').removeClass('current');
    $(this).addClass('current');
    let region = $(this).val();
    currentSearchUrl = '&&region='+region;
    $('#pagination').twbsPagination('destroy');
    $('#categoryType').val('').prop('selected', true);
    showPage = 1;
    listCall(optionFirstPage);
});
   
$('#categoryType').on('change', function(){
    currentSearchUrl = makeUrl();
    $('#pagination').twbsPagination('destroy');
    showPage = 1;
    listCall(optionFirstPage);
    
});

$('.wirte').on('click', function(){
	location.href = 'gbWrite';
})
function getSearchOption(){
    searchOption.category = $('#categoryType option:selected').val();
    searchOption.region = $('button.region.current').val();
    searchOption.keyWord = $('#search-keyWord').val();

}

function makeUrl(){
    getSearchOption();
    let url = '';
    
    for(var key in searchOption) {
    	console.log('key:'+searchOption[key]);
        if(searchOption[key] != '' || searchOption[key] != 0){
            url+='&&'+key+'='+searchOption[key];
        }
        console.log('url'+url);
    }
    return url;
}

function formatDateFromTimestamp(timestamp) {
    var date = new Date(timestamp);
    var year = date.getFullYear(); // 연도를 4자리로 가져옵니다.
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}


function cardClick(){
	$('.card').on('click', function(){
		console.log($(this));
		let gbNo = $(this).find('p:eq(0)').html();
		console.log(gbNo);
		location.href = "gbDetail?gbNo="+gbNo;
	})
}
</script>
</html>