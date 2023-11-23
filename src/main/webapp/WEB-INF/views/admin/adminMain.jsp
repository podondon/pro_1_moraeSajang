<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<link href="<c:url value='/resources/css/gbList.css'/>" rel="stylesheet"/>
<script src="<c:url value='/resources/js/jquery.twbsPagination.js'/>" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">


<!-- 그래프 차트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<style>
div.lab{
	font-size: 25px;
	color: #F9DCA3;
	font-weight: bold;
}
table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 5px 10px;
        }.centered-cell {
        text-align: center;
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
<body>
<%@ include file="/WEB-INF/views/common/adminHeader.jsp" %>

<div class="sideber">
		<ul>
	  <li><h3 class="page">관리자 페이지</h3></li>
	  <li><a href="analysis" style="background: #F9DCA3;color: white;" >통계</a></li>
	  <li><a href="adminUser">회원 관리</a></li>
	  <li><a href="adminReport">신고 관리</a></li>
	  <li><a href="point">포인트 관리</a></li>
	  <li><a href="groupBuy">게시판 관리</a></li>
		</ul>
	</div>	
	
<div id="donutChartContainer" style="float: left; margin-left: 19%; margin-top: 2%;">
	<div class="lab">거래량 TOP6</div>
	<label for="date">
        <input type="date" id="dfirstsearchdate" value="" />
        ~
        <input type="date" id="dlastsearchdate" value="" />
        <input type="button" id="dsearchButton" class="comm-btn" value="검색" />
    </label>
  <canvas id="donutchart" height="470" width="470"></canvas>
  <div id="centerText" class="lab" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; font-size: 20px;">Your Text</div>
</div>



<div id="graphChartContainer" style="float: left; margin-left:6%; margin-top: 2%;">
	<div class="lab">카테고리별 거래량</div>
	<label for="date">
        <input type="date" id="cfirstsearchdate" value="" />
        ~
        <input type="date" id="clastsearchdate" value="" />
        <input type="button" id="csearchButton" class="comm-btn" value="검색" />
    </label>
<canvas id="myChart" width="470" height="470"></canvas>
</div>

<div id="topJoinUserContainer" style="float: left; margin-left: 17%; margin-top: 5%; margin-bottom: 40px;">
	<div class="lab">거래 성공 사용자</div>
	<label for="date">
        <input type="date" id="ufirstsearchdate" value="" />
        ~
        <input type="date" id="ulastsearchdate" value="" />
        <input type="button" id="usearchButton" class="comm-btn" value="검색" />
    </label>
	<table>
		<thead>
        	<tr>
            	<th>순위</th>
            	<th>사용자</th>
            	<th>모집 글</th>
            	<th>성공 글</th>
            	<th>성공 률</th>
        	</tr>
		</thead>
    	<tbody id="topJoinUserList">
    	</tbody>
	</table>
</div>
<div id="topPointContainer" style="float: left; margin-left:2%; margin-top: 5%; margin-bottom: 40px;">
	<div class="lab">포인트 충전 합계</div>
	<label for="date">
        <input type="date" id="pfirstsearchdate" value="" />
        ~
        <input type="date" id="plastsearchdate" value="" />
        <input type="button" id="psearchButton" class="comm-btn" value="검색" />
    </label>
	<table>
		<thead>
        	<tr>
        		<th>순위</th>
            	<th>날짜</th>
            	<th>포인트</th>
        	</tr>
		</thead>
    	<tbody id="topPointList">
    	</tbody>
	</table>
</div>
<div id="gbStateContainer" style="float: left; margin-left:2%; margin-top: 5%; margin-bottom: 40px;">
	<div class="lab">거래 건수</div>
	<button class="region current" id="ssearchButton" value="완료" style=" width: 50px;; height: auto; font-size: medium;">완료</button>
	<button class="region" id="isearchButton" value="진행" style=" width: 50px;; height: auto; font-size: medium;">진행</button>
	<button class="region" id="fsearchButton" value="취소" style=" width: 50px;; height: auto; font-size: medium;">취소</button>
	<label for="date">
        <input type="date" id="bfirstsearchdate" value="" />
        ~
        <input type="date" id="blastsearchdate" value="" />
        <input type="button" id="bsearchButton" class="comm-btn" value="검색" />
    </label>
	<table>
		<thead>
        	<tr>
        		<th>순위</th>
        		<th>날짜</th>
            	<th>전체 건수</th>
            	<th id="state">완료</th>
            	<th>비율</th>
        	</tr>
		</thead>
    	<tbody id="gbStateList">
    	</tbody>
	</table>
</div>
</body>
<script>
const today = new Date();
const yesterday = new Date(today);
yesterday.setDate(today.getDate() - 1);

const year = today.getFullYear();
const month = (today.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 해주고 두 자리로 포맷
const firstDayOfMonth = year + '-' + month + '-01';

// 어제 날짜를 "yyyy-mm-dd" 형식으로 포맷
const formattedYesterday = yesterday.getFullYear() + '-' + (yesterday.getMonth() + 1).toString().padStart(2, '0') + '-' + yesterday.getDate().toString().padStart(2, '0');

function formatDateFromTimestamp(timestamp) {
    var date = new Date(timestamp);
    var year = date.getFullYear(); // 연도를 4자리로 가져옵니다.
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}
// ------------------------------------------도넛차트--------------------------------------
const donutChartContainer = document.getElementById('donutChartContainer');
const centerText = document.getElementById('centerText');

// 도넛 차트 설정
const donutChartOptions = {
  responsive: false,
  plugins: {
    legend: {
      display: true,
      position: 'bottom', 
    },
  },
};

// 도넛 차트 데이터
const donutChartData = {
  labels: ['거래지역1', '거래지역2', '거래지역3', '거래지역4', '거래지역5', '거래지역6'],
  datasets: [
    {
      label: '최다 거래지역 TOP6',
      data: [1, 2, 3, 4, 5, 6],
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)',
      ],
      borderColor: [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)',
      ],
      borderWidth: 1,
    },
  ],
};

const ctx = document.getElementById('donutchart').getContext('2d');

// 도넛 차트 생성
const myDonutChart = new Chart(ctx, {
  type: 'doughnut',
  data: donutChartData,
  options: donutChartOptions,
});

// 중앙 텍스트 업데이트
centerText.textContent = '거래량 합계';

// 중앙 텍스트 위치 조정
const chartWidth = donutChartContainer.offsetWidth;
const chartHeight = donutChartContainer.offsetHeight;

centerText.style.top = chartHeight / 2 + 'px';
centerText.style.left = chartWidth / 2 + 'px';
centerText.style.transform = 'translate(390%, 190%)';
// 왼쪽 : 숫자가 커질수록 오른쪽으로 이동
// 오른쪽 : 숫자가 커질수록 아래쪽으로 이동





// -------------------------도넛 차트 ajax---------------------------

// 두 개의 input 요소에 formattedYesterday 값을 설정
const dfirstSearchDateInput = document.getElementById('dfirstsearchdate');
const dlastSearchDateInput = document.getElementById('dlastsearchdate');

dfirstSearchDateInput.value = firstDayOfMonth;
dlastSearchDateInput.value = formattedYesterday;


drawChartAdress(dfirstSearchDateInput.value,dlastSearchDateInput.value);

// 도넛차트 날짜 검색 버튼 클릭 
document.getElementById('dsearchButton').addEventListener('click', function () {
	  const dfirstSearchDate = dfirstSearchDateInput.value;
	  const dlastSearchDate = dlastSearchDateInput.value;
	  drawChartAdress(dfirstSearchDate, dlastSearchDate);
	});


function drawChartAdress(dfirstSearchDate,dlastSearchDate){
	$.ajax({
		type:'GET',
		url:'analysis/Adress.ajax',
		data:{'dfirstSearchDate':dfirstSearchDate,'dlastSearchDate':dlastSearchDate},
		dataType :'json',
		success:function(data){
			const labels = data.chartAdress.map(function (item) {
		        return item.gbDetailAddress;
		    });

		    const topAddresses = data.chartAdress.map(function (item) {
		        return item.topAddress;
		    });

		    // 도넛 차트 데이터 업데이트
		    myDonutChart.data.labels = labels;
		    myDonutChart.data.datasets[0].data = topAddresses;
		    myDonutChart.update(); // 차트 업데이트
		   
		    const totalTopAddress = topAddresses.reduce(function (total, current) {
		        return total + current;
		    }, 0);

		    // 합계를 centerText에 표시
		   centerText.innerHTML = '총 거래량<br>' + totalTopAddress+'건';
		    console.log(data);
			
		},
		error:function(error){
			console.error(error)
		}
				
	});
}


// ----------------------------------카테고리 차트 --------------------------------------
const barChartData = {
    labels: ['카테고리1', '카테고리2', '카테고리3', '카테고리4', '카테고리5', '카테고리6','카테고리7'],
    datasets: [
        {
            label: '완료',
            data: [1,2,3,4,5,6,7],
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1,
        },
        {
            label: '진행',
            data: [1,2,3,4,5,6,7],
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1,
        },
        {
        	label: '취소',
        	  data: [1,2,3,4,5,6,7],
        	  backgroundColor: 'rgba(255, 206, 86, 0.2)',
        	  borderColor: 'rgba(255, 206, 86, 1)',
        	  borderWidth: 1,
        },
    ],
};
const gctx = document.getElementById('myChart');
const myChart = new Chart(gctx, {
    type: 'bar',
    data: barChartData,
    options: {
        responsive: false,
        scales: {
            y: {
                beginAtZero: true,
            },
        },
    },
});
// --------------------------------------카테고리 차트 ajax--------------------------------
/* 카테고리 그리기
const categorySelect = document.getElementById('category');
drawcategory();
function drawcategory(){
	$.ajax({
		type:'GET',
		url:'analysis/drawcategory.ajax',
		dataType :'json',
		success:function(data){
		    console.log(data);
		 // 카테고리 정보를 받아온 후, <select> 요소에 옵션을 추가
            data.category.forEach(function (item) {
                const option = document.createElement('option');
                option.value = item.categoryType;
                option.text = item.categoryType;
                categorySelect.appendChild(option);
            });
		},
		error:function(error){
			console.error(error)
		}	
	});
}
*/

const cfirstSearchDateInput = document.getElementById('cfirstsearchdate');
const clastSearchDateInput = document.getElementById('clastsearchdate');

cfirstSearchDateInput.value = firstDayOfMonth;
clastSearchDateInput.value = formattedYesterday;

drawChartCategory(cfirstSearchDateInput.value,clastSearchDateInput.value)
function drawChartCategory(cfirstSearchDate,clastSearchDate){
	$.ajax({
		type:'GET',
		url:'analysis/drawChartCategory.ajax',
		data:{'cfirstSearchDate':cfirstSearchDate,'clastSearchDate':clastSearchDate},
		dataType :'json',
		success:function(data){
		    console.log(data);
		    const labels = data.chartCategory.map(function (item) {
	            return item.categoryType;
	        });
		    const sucCate = data.chartCategory.map(function (item) {
		    	return item.sucCate;
	        });
		    const ingCate = data.chartCategory.map(function (item) {
		    	return item.ingCate;
	        });
		    const falCate = data.chartCategory.map(function (item) {
		    	return item.falCate;
	        });

	        myChart.data.labels = labels;
	        myChart.data.datasets[0].data = sucCate;
	        myChart.data.datasets[1].data = ingCate;
	        myChart.data.datasets[2].data = falCate;
	        myChart.update(); // 데이터를 받은 후에 차트 업데이트를 호출합니다.
		    /*

		    const topAddresses = data.chartAdress.map(function (item) {
		        return item.topAddress;
		    });

		    // 도넛 차트 데이터 업데이트
		    myDonutChart.data.datasets[0].data = topAddresses;
		    */
		},
		error:function(error){
			console.error(error)
		}	
	});
}
//카테고리 그래프 날짜 검색 버튼 클릭 
document.getElementById('csearchButton').addEventListener('click', function () {
	  const cfirstSearchDate = cfirstSearchDateInput.value;
	  const clastSearchDate = clastSearchDateInput.value;
	  drawChartCategory(cfirstSearchDate, clastSearchDate);
	});
	
//----------------------------------최다 모집자-------------------------------------
const ufirstSearchDateInput = document.getElementById('ufirstsearchdate');
const ulastSearchDateInput = document.getElementById('ulastsearchdate');

ufirstSearchDateInput.value = firstDayOfMonth;
ulastSearchDateInput.value = formattedYesterday;

drawTopUser(ufirstSearchDateInput.value,ulastSearchDateInput.value)
function drawTopUser(ufirstSearchDate,ulastSearchDate){
	$.ajax({
		type:'GET',
		url:'analysis/drawTopUser.ajax',
		data:{'ufirstSearchDate':ufirstSearchDate,'ulastSearchDate':ulastSearchDate},
		dataType :'json',
		success:function(data){
		    console.log(data);
		    var content ='';
		    if(data.topUser.length==0){
		    	content +='<tr>';
		    	content +='<td class="centered-cell" colspan="5">"검색 결과가 없습니다"</td>';
		    	content +='</tr>';
		    }else{
		    	data.topUser.forEach(function(item, idx){
		    		idx = idx + 1;
		    		content +='<tr>';
		    		content +='<td>'+idx+'</td>';
		    		content +='<td>'+item.userId+'</td>';
		    		content +='<td>'+item.al+'</td>';
		    		content +='<td>'+item.su+'</td>';
		            content += '<td>' +item.sucrate+ '%' + '</td>'
		    		content +='</tr>';
		    	});
		    }
				$('#topJoinUserList').empty();
				$('#topJoinUserList').append(content);
		},
		error:function(error){
			console.error(error)
		}	
	});
}

// 최다 모집자 유저 날짜 검색 
document.getElementById('usearchButton').addEventListener('click', function () {
	  const ufirstSearchDate = ufirstSearchDateInput.value;
	  const ulastSearchDate = ulastSearchDateInput.value;
	  drawTopUser(ufirstSearchDate, ulastSearchDate);
	});
	
	
//--------------------------------------------충전 포인트-----------------------------------
const pfirstSearchDateInput = document.getElementById('pfirstsearchdate');
const plastSearchDateInput = document.getElementById('plastsearchdate');

pfirstSearchDateInput.value = firstDayOfMonth;
plastSearchDateInput.value = formattedYesterday;

drawTopPoint(pfirstSearchDateInput.value,plastSearchDateInput.value);
function drawTopPoint(pfirstSearchDate,plastSearchDate){
	$.ajax({
		type:'GET',
		url:'analysis/drawTopPoint.ajax',
		data:{'pfirstSearchDate':pfirstSearchDate,'plastSearchDate':plastSearchDate},
		dataType :'json',
		success:function(data){
		    console.log(data);
		    var content ='';
		    if(data.topPoint.length==0){
		    	content +='<tr>';
		    	content +='<td class="centered-cell" colspan="3">"검색 결과가 없습니다"</td>';
		    	content +='</tr>';
		    }else{
		    	data.topPoint.forEach(function(item, idx){
		    		idx += 1;
		    		content +='<tr>';
		    		content +='<td>'+idx+'</td>';
		    		content +='<td>'+formatDateFromTimestamp(item.chargeDate)+'</td>';
		    		let chargePoint = item.chargePoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		    		content +='<td>'+chargePoint+' 원</td>';
		    		content +='</tr>';
		    	});
		    }
				$('#topPointList').empty();
				$('#topPointList').append(content);
		},
		error:function(error){
			console.error(error)
		}	
	});
}

//최다 포인트 날짜 검색 
document.getElementById('psearchButton').addEventListener('click', function () {
	  const pfirstSearchDate = pfirstSearchDateInput.value;
	  const plastSearchDate = plastSearchDateInput.value;
	  drawTopPoint(pfirstSearchDate, plastSearchDate);
	});
	
	
//---------------------------------------------공동구매 계시글 현황----------------------------------
const bfirstSearchDateInput = document.getElementById('bfirstsearchdate');
const blastSearchDateInput = document.getElementById('blastsearchdate');

bfirstSearchDateInput.value = firstDayOfMonth;
blastSearchDateInput.value = formattedYesterday;

var stateBar = '완료';
drawgbState(stateBar,bfirstSearchDateInput.value,blastSearchDateInput.value);

function drawgbState(stateBar,bfirstSearchDate,blastSearchDate){
	$.ajax({
		type:'GET',
		url:'analysis/drawgbState.ajax',
		data:{'stateBar':stateBar,'bfirstSearchDate':bfirstSearchDate,'blastSearchDate':blastSearchDate},
		dataType :'json',
		success:function(data){
		    console.log(data);
		    var content ='';
		    if(data.gbState.length==0){
		    	content +='<tr>';
		    	content +='<td class="centered-cell" colspan="5">"검색 결과가 없습니다"</td>';
		    	content +='</tr>';
		    }else{
		    	data.gbState.forEach(function(item, idx){
		    		idx += 1;
		    		content +='<tr>';
		    		content +='<td>'+idx+'</td>';
		    		content +='<td>'+formatDateFromTimestamp(item.stateUpDate)+'</td>';
		    		content +='<td>'+item.stateall+'</td>';
		    		content +='<td>'+item.stateing+'</td>';
		    		content +='<td>'+item.stateper+'%</td>';
		    		content +='</tr>';
		    	});
		    }
				$('#gbStateList').empty();
				$('#gbStateList').append(content);
		},
		error:function(error){
			console.error(error)
		}	
	});
}

document.getElementById('bsearchButton').addEventListener('click', function () {
	  const bfirstSearchDate = bfirstSearchDateInput.value;
	  const blastSearchDate = blastSearchDateInput.value;
	  drawgbState(stateBar,bfirstSearchDate,blastSearchDate);
	});
	
$('#ssearchButton').on('click',function(){
	$('button.region').removeClass('current');
    $(this).addClass('current');
	stateBar = $(this).val();
	const bfirstSearchDate = bfirstSearchDateInput.value;
	const blastSearchDate = blastSearchDateInput.value;
	drawgbState(stateBar,bfirstSearchDate,blastSearchDate);
	$('#state').text('완료');
});
$('#isearchButton').on('click',function(){
	$('button.region').removeClass('current');
    $(this).addClass('current');
	stateBar = $(this).val();
	const bfirstSearchDate = bfirstSearchDateInput.value;
	  const blastSearchDate = blastSearchDateInput.value;
	drawgbState(stateBar,bfirstSearchDate,blastSearchDate);
	$('#state').text('진행');
});
$('#fsearchButton').on('click',function(){
	$('button.region').removeClass('current');
    $(this).addClass('current');
	stateBar = $(this).val();
	const bfirstSearchDate = bfirstSearchDateInput.value;
	  const blastSearchDate = blastSearchDateInput.value;
	drawgbState(stateBar,bfirstSearchDate,blastSearchDate);
	$('#state').text('취소');
});
</script>
</html>