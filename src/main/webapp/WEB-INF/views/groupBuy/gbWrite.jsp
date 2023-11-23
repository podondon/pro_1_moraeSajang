<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0fa79b1a90030a2d342b180b86295241&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/resources/css/gbWrite.css'/>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<style>
.gbForm{
margin-top: 144px;
}
</style>
</head>

<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="gbForm center">
        <span id="h3">글쓰기</span>
        <span class="validation h3Validation">*필수 정보</span>
        <hr>
        <div id="productImg" class="smallInfo">
            <div id="image-container">

            </div>
            <div>
            	<label for="image-input" class="comm-btn file">첨부파일</label> 
                <input type="file" id="image-input" accept="image/*">
            </div>
        </div>
        <hr>
        <div 카테고리 class="smallInfo">
            <div class="label-div"><label for="category">카테고리</label><span class="validation">*</span></div>
            <span class="input-content">
                <select type="text" id="categoryType" class="input-value">
                    <option value="" selected disabled hidden>카테고리를 선택해주세요.</option>
                    <option value="가공 식품">가공 식품</option>
                    <option value="신선 식품">신선 식품</option>
                    <option value="식재료">식재료</option>
                    <option value="생필품">생필품</option>
                    <option value="뷰티/미용">뷰티/미용</option>
                    <option value="반려동물 용품">반려동물 용품</option>
                    <option value="기타">기타</option>
                </select>
            </span>
        </div>
        <div 모집인원 class="smallInfo">
            <div class="label-div"><label for="recruitPeople">모집인원</label><span class="validation">*</span></div>
            <span class="input-content">
                <input type="text" id="recruitPeople" class="input-value"/>
            </span>
            <span class="validation" id="recruitValid">

            </span>
        </div>
        <div 금액 class="smallInfo">
            <div class="label-div"><label for="joinPrice">금액</label><span class="validation">*</span></div>
            <span class="input-content2">
                <input type="text" id="joinPrice" class="input-value"/>
            </span>
            <span class="validation" id="joinPriceValid">

            </span>
        </div>
        <div 모집기간 class="smallInfo">
            <div class="label-div"><label>모집기간</label><span class="validation">*</span></div>
            <span class="input-content">
                <input type="text" id="startDate" class="input-value"/>
                ~
                <input type="text" id="finishDate" class="input-value"/>
            </span>
        </div>
        <div id="recruitDiv" class="smallInfo">
        	<div class="label-div"><label for="recruitLocation">모집장소</label><span class="validation">*</span></div>
            <span class="input-content" >
                <textarea id="recruitLocation" class="input-value" readonly></textarea>
                
            </span>
            <button class="btnClear" id="locationClear">x</button>
        </div>
        
        <div id="locationBtn">
            <ul class="tabs">
                <li class="tab-link current" data-tab="recommDiv">추천장소</li>
                <li class="tab-link" data-tab="map_wrap">장소검색</li>
            </ul>
            <button id="selectBtn" class="comm-btn">선택하기</button>
        </div>
        <div id="recommDiv" class=" kakaoApiPosition tab-content current" >
            <div id="kakaoMapApi" class="map-position">

            </div>
            <div class="recommend place-ul-div">
                <p>추천 장소 목록</p>
                <div class="placeListDiv">
                    <ul id="recommendList" class="ul-list">
                        
                    </ul>
                </div>
            </div>
        </div>
        <div id="map_wrap" class="kakaoApiPosition tab-content">
            <div id="locationSearch" class="map-position">
            </div>
            <div class="recommend place-ul-div">
                <div class="option">
                    <form onsubmit="searchPlaces(); return false;">
                            <div id="info__id">
                            	<input type="text" value="" id="keyword" size="12" placeholder="장소를 입력해주세요"> 
                            <button type="submit"><i class="bi bi-search"></i></button> 
                            </div>
                        </form>
                </div>
                <div class="placeListDiv">
                    <ul id="placesList" class="ul-list"></ul>
                </div>
            </div>
        </div>
        <div id="titleDiv" class="detail-info">
        	<div class="label-div">
	            <span class="big-info-span">제목</span><span class="validation detail-valid">*</span>        	
        	</div>
            <input type="search" id="title" class="input-value"/>
        </div>
        <div id="contentDiv" class="detail-info">
            <div class="label-div">
            	<span class="big-info-span">내용</span><span class="validation detail-valid">*</span>
            </div>
            <textarea id="gbContent" class="input-value"></textarea>
        </div>
    </div>
    <div class="center bottom-btn-div">
        <button id="submit" class="comm-btn">글쓰기</button><button id="goList" class="comm-btn">목록으로</button>
    </div>
</body>

<script>
	let map;
	let recommList = [];
	let userCoordination = {};
	let marker;
	let markers = [];
	let fileList = [];
	let values = [];
	let placeValue;
	let searchPs;
	let searchMap;
	let infowindow;
	let searchList = [];
	let formData;
	
	$(document).ready(function(){
	    getCalender();
	    getUserLocation();
	    fileDeleteClick();
	    changeOrder();
	});
	
	//숫자-문자 검증
	$('#recruitPeople').on('keyup', function(){
	    console.log('recruPress');
	    let num = $(this).val();
	    if(num.match(/[^0-9]/)){
	        $('#recruitValid').html('숫자만 입력 가능합니다.');
	    }else{
	        $('#recruitValid').html('');
	    }
	});

	$('#joinPrice').on('keyup', function(){
	    console.log('joinPress');
	    let num = $(this).val();
	    if(num.match(/[^0-9]/)){
	        $('#joinPriceValid').html('숫자만 입력 가능합니다.');
	    }else{
	        $('#joinPriceValid').html('');
	    }
	});

	//장소 검색 중복 검증 함수
	$('#selectBtn').on('click', function(){
	    let recruitLocation = $('#recruitLocation');
	    if(recruitLocation.html()){
	        alert('이미 장소가 선택되어있습니다.');
	        return false;
	    }
	    $('#recruitLocation').html(placeValue);
	});

	//선택 장소 취소
	$('#locationClear').on('click', function(){
	    $('#recruitLocation').html('');
	});

	//장소 탭 클릭
	$('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	    makeLocationSearchMap(userCoordination);
	});

	//파일 첨부시 발생하는 함수
	$('#image-input').change(function() {
	    if(fileList.length == 4){
	        alert('파일첨부는 4개까지 가능합니다');
	        return false;
	    }
	    var files = this.files;
	    for (var i = 0; i < files.length; i++) {
	        var file = files[i];
	        fileList.push(file);
	        if (file.type.match('image.*')) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	            var thumbnail = '<div class="image-thumbnail"><img src="' + e.target.result + '"><span class="delete-button" data-index="'
	                thumbnail += i + '">x</span><label style="visibility:hidden">'
	                thumbnail += fileList.length-1+'</label></div>';
	            $('#image-container').append(thumbnail);
	        };
	        reader.readAsDataURL(file);
	      }
	    }
	    this.value = ''; 
	});

//파일첨부 지우기 버튼 클릭 시
	function fileDeleteClick(){
		$('#image-container').on('click', '.delete-button', function() {
	        var index = $(this).next().html();
	        console.log(index);
	        fileList.splice(index, 1);
	        var reIndex = $(this).closest('.image-thumbnail').nextAll();
	        if(reIndex.length > 0){
	            for(var elem of reIndex){
	                console.log(elem);
	                let index = elem.lastChild.innerHTML;
	                elem.lastChild.innerHTML = index-1;
	            }
	        }
	        
	        $(this).closest('.image-thumbnail').remove();
	        console.log(fileList);
	      });
	}
 

	function changeOrder(){
	  // 이미지 순서 변경 함수
	  $('#image-container').sortable({
	    update: function(event, ui) {
	        var newOrder = [];
	        let i=0;
	        $('#image-container .image-thumbnail').each(function() {
	            var index = $(this).children('label').text();
	            console.log(index);
	            newOrder.push(fileList[index]);
	            $(this).children('label').text(i);
	            i++;
	        });

	        fileList = newOrder; // 이미지 순서 변경
	        console.log(fileList);
	        }
	  });
	}
	var dictObject = {};
	function inputValues(){
		dictObject['카테고리를 선택해주세요'] = $('#categoryType option:selected');
		dictObject['모집인원을 입력해주세요'] = $('#recruitPeople');
		dictObject['모집 가격을 입력해주세요'] = $('#joinPrice');
		dictObject['시작일을 입력해주세요'] = $('#startDate');
		dictObject['종료일을 입력해주세요'] = $('#finishDate');
		dictObject['모집장소를 입력해주세요'] = $('#recruitLocation');
		dictObject['제목을 입력해주세요'] = $('#title');
		dictObject['내용을 입력해주세요'] = $('#gbContent');
		
	    /*values.push($('#recruitPeople'));
	    values.push($('#joinPrice'));
	    values.push($('#startDate'));
	    values.push($('#finishDate'));
	    values.push($('#recruitLocation'));
	    values.push($('#title'));
	    values.push($('#gbContent'));
	    values.push($('#categoryType option:selected'));*/
	}
	//글쓰기 버튼 클릭
	$('#submit').on('click', function(){
		if(!isValid()){
			return false;
		}
		setSendData();
		for (let key of formData.keys()) {
			  console.log(key);
			}

			// FormData의 value 확인
			for (let value of formData.values()) {
			  console.log(value);
			}
		
        $.ajax({
            type: 'POST',
            url: 'gbWrite/register.ajax',
            data: formData,
            dataType:'json',
            processData: false,
            contentType: false,
            success: function(response) {
            	if(response.success !=''){
            		alert(response.success);
                	location.href = 'gbDetail?gbNo='+response.gbNo;
            	}
                console.log('데이터 업로드 성공:', response);
            },
            error: function(error) {
                console.error('데이터 업로드 실패:', error);
                location.href = 'gbWrite';
            }
        });
		console.log('form submit!!!!');
	});

	function setSendData(){
		formData = new FormData()
        for(let key in dictObject){
            if(dictObject[key].attr('name') == 'recruitLocation'){
            	
        		let totalAddr = String(dictObject[key].html()).split('\n');
        		
        		let parcelAddress = totalAddr[1];
                formData.append('parcelAddress', parcelAddress);
                
                let detailAddr  = String(totalAddr[1]).split(' ');
                
                let gbDetailAddress;
                for(var i of detailAddr){
                    if(i.match(/(읍|면|동)/g)){
                    	gbDetailAddress = i
                    }
                }
                formData.append('gbDetailAddress', gbDetailAddress);
                
        		let place = totalAddr[0];
                formData.append('place', place);
        	}else{
        		formData.append(dictObject[key].attr('id'), dictObject[key].val());	
        	}
        }
        formData.append('categoryType', $('#categoryType option:selected').val());
        for (var i = 0; i < fileList.length; i++) {
            formData.append('images', fileList[i], (i+1)+fileList[i].name); // 이미지 파일 추가
        }
		console.log(formData)
	}

	function isValid(){
		inputValues();
		for(let key in dictObject){
			if(dictObject[key].attr('id') == 'recruitLocation'){
				if(!dictObject[key].html()){
	    			alert(key);
	    			dictObject[key].focus();
	    			return false;
				}
			}
	        if(!dictObject[key].val()||dictObject[key].val()==''){
	            alert(key);
	            dictObject[key].focus();
	            return false; 
	        }
	        console.log(dictObject[key]);
	    }
	    if($('#recruitPeople').val().match(/[^0-9]/)){
	        alert('숫자만 입력 가능합니다.');
	        $('#recruitValid').html('숫자만 입력 가능합니다.');
	        return false; 
	    }
	    if($('#joinPrice').val().match(/[^0-9]/)){
	        alert('숫자만 입력 가능합니다.');
	        $('#joinPriceValid').html('숫자만 입력 가능합니다.');
	        return false; 
	    }
	    return true;
	}
	//달력 생성함수
	function getCalender(){
	    $("#startDate,#finishDate").datepicker({
	       dateFormat: 'yy-mm-dd' 
	       ,showOtherMonths: true 
	       ,showMonthAfterYear:true
	       ,changeYear: true 
	       ,changeMonth: true              
	       ,showOn: "both" 
	       ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
	       ,buttonImageOnly: true 
	       ,buttonText: "선택"            
	       ,yearSuffix: "년" 
	       ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
	       ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
	       ,dayNamesMin: ['일','월','화','수','목','금','토'] 
	       ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] 
	       ,minDate: "0D" 
	       ,maxDate: "+1M"   
	    });
	
	    $('#datepicker').datepicker('setDate', 'today');
	}

	$('#image-input').change(function() {
	    var files = this.files;
	    for (var i = 0; i < files.length; i++) {
	      var file = files[i];
	      if (file.type.match('image.*')) {
	    	  files.push()
	        var reader = new FileReader();
	        reader.onload = function(e) {
	          var thumbnail = '<div class="image-thumbnail"><img src="' + e.target.result + '"><span class="delete-button" data-index="' + i + '">x</span></div>';
	          $('#image-container').append(thumbnail);
	        };
	        reader.readAsDataURL(file);
	      }
	    }
	    this.value = ''; 
	 });


	//지도 생성 전 사용자의 위치를 좌표로 바꾼다
    function getUserLocation(){
        var ps = new kakao.maps.services.Places();
        var userLoc = '${sessionScope.userInfo.streetAddress}'
        ps.keywordSearch(userLoc, getLocation);                                                                                                              
    }
    //사용자 좌표 반환 함수
    function getLocation(date, status, pageination){
        if(status === kakao.maps.services.Status.OK){
            userCoordination.x = date[0].x;
            userCoordination.y = date[0].y;
            localStorage.setItem('userCoordination',JSON.stringify(userCoordination));

            console.log(userCoordination);
            makeRecommMap(userCoordination);
        }else if(status === kakao.maps.services.Status.ZERO_RESULT){

        } 
    }

	//지도 생성
	function makeRecommMap(userCoordination){
	    var mapContainer = document.getElementById('kakaoMapApi'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(userCoordination.y, userCoordination.x), // 지도의 중심좌표
	        level: 4 // 지도의 확대 레벨
	    };
	    map = new kakao.maps.Map(mapContainer, mapOption); 
	    getRecommList();
	}

	let userDeatilAddr
	//추천 목록을 가져오는 함수입니다.
	function getRecommList(){
	    //사용자 세션에서 동 가져오기
	    var ps = new kakao.maps.services.Places();
	    var searchType ='공원';
	    let userPlace = '${sessionScope.userInfo.userDetailAddress}';
	    userDeatilAddr = userPlace.slice(0, userPlace.length-1)
	    userPlace = userPlace+searchType;
	    ps.keywordSearch(userPlace, placesSerchCB);
	}
	//y = 위도, x = 경도
	// 함수(위도, 경도)
	//추천장소의 이름, 주소, 위도,경도 리스트 반환함수
	function placesSerchCB(date, status, pageination){
	    if(status === kakao.maps.services.Status.OK){
	        for(var i=0; i<date.length; i++){
	            let recommAddr = date[i].address_name;
	            if(recommAddr.includes(userDeatilAddr)){
	                var locationInfo = {};
	                locationInfo.placeName = date[i].place_name;
	                locationInfo.addressName = recommAddr;
	                locationInfo.x = date[i].x;
	                locationInfo.y = date[i].y;
	                locationInfo.distance = 0;
	                recommList.push(locationInfo);
	            }
	        }
	        if(recommList.length < 1){
	            recommList.push('검색결과가 없습니다.')
	            return false;
	        }
	        sortLocation();
	    }else if(status === kakao.maps.services.Status.ZERO_RESULT){
	        //검색 결과가 없을 시 ul도 지워진다
	        recommList.push('검색결과가 없습니다.');
	    }
	}

	//추천 장소 거리순으로 정렬 + 상위 5개만 추출하는 함수
	function sortLocation(){
	    console.log('before sorting');
	    for(let i = 0; i<recommList.length; i++){
	        let dLat = toRadians(userCoordination.y - recommList[i].y);
	        let dLon = toRadians(userCoordination.x - recommList[i].x);
	
	        let a = Math.sin(dLat/2)* Math.sin(dLat/2)+ Math.cos(toRadians(userCoordination.y))* Math.cos(toRadians(recommList[i].y))* Math.sin(dLon/2)* Math.sin(dLon/2);
	        let c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	        let d =6371* c * 1000;
	        recommList[i].distance = d;
	    }
	    recommList.sort((a, b) => {
	        return a.distance - b.distance;
	    });
	    //after sorting
	    if(recommList.length>5){
	        recommList = recommList.slice(0,5);
	    }
	    
	    writeRecommLi(recommList, $('#recommendList'))
	    
	}

	function toRadians(deg){
	    return deg  * (Math.PI / 180.0);
	}

	//추천된 검색 장소리스트 그리는 함수
	function writeRecommLi(list, $ulElem){
	    console.log('write')
	    console.log(list);
	    $ulElem.empty();
	    for(let recommElem of list){
	    	let str = recommElem.placeName +'|'+ recommElem.addressName;
	        var content = '<li class="placeElem" value="'+str+'">';
	            content += recommElem.placeName;
	            content += '<br/>';
	            content += recommElem.addressName;
	            content += '</li>';
	            $ulElem.append(content);
	    }
	    placeElemClick();
	}

	//추천 장소 클릭 시 마커로 표시하고 장소 input에 넣기
	function placeElemClick(){
	    $('.placeElem').on('click',function(e){
	        let y ;
	        let x ;
	        placeValue = $(this).html()
	        placeValue = placeValue.replace(/<br>/g, '\n');
	        let index = $(this).index();
	        console.log('elem click event');
	        if($(this).closest('ul').prop("id") == 'recommendList'){
	            y = recommList[index].y;
	            x = recommList[index].x;
	            displayMarker(y, x);
	        }else{
	            y = searchList[index].y;
	            x = searchList[index].x;
	            searchMarker(y, x);
	        }
	        
	    });
	}  

	//마커 제거 함수
	function removeMarker() {
	    if(marker != null){
	        marker.setMap(null);
	    }
	}
	
	//마커 생성 함수
	function searchMarker(y,x) {
	    removeMarker();
	    // 마커를 생성하고 지도에 표시합니다
	    console.log(searchMap);
	    marker = new kakao.maps.Marker({
	        map: searchMap,
	        position: new kakao.maps.LatLng(y, x) 
	    });
	
	    reBounds(y,x, 'searchMap')
	}
	
	function displayMarker(y,x) {
	    removeMarker();
	    // 마커를 생성하고 지도에 표시합니다
	    marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(y, x) 
	    });
	
	    reBounds(y,x, 'map')
	}
//지도 범위 재설정 함수
	function reBounds(y,x,s){
	    var bounds = new kakao.maps.LatLngBounds();
	    bounds.extend(new kakao.maps.LatLng(y, x));      
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    if(s=='map'){
	        map.setBounds(bounds);
	    }else{
	        searchMap.setBounds(bounds);
	    }
	}

	function makeLocationSearchMap(userCoordination){
		console.log('makeLocationSearchMap');
		var mapContainer = document.getElementById('locationSearch'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(userCoordination.y, userCoordination.x), // 지도의 중심좌표
		    level: 4 // 지도의 확대 레벨
		};  
		
		// 지도를 생성합니다    
		searchMap = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		searchPs = new kakao.maps.services.Places();  
	}

//키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
		var keyword = document.getElementById('keyword').value;
		searchList = [];
		
		if (!keyword.replace(/^\s+|\s+$/g, '')) {
		    return false;
		}
		searchPs.keywordSearch( keyword, placesSearchCB); 
	}

	//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {
		    for(var i=0; i<data.length; i++){
		       let recommAddr = data[i].address_name;
		       var locationInfo = {};
		       locationInfo.placeName = data[i].place_name;
		       locationInfo.addressName = recommAddr;
		       locationInfo.x = data[i].x;
		       locationInfo.y = data[i].y;
		       locationInfo.distance = 0;
		       searchList.push(locationInfo);       
		    }
		    writeRecommLi(searchList, $('#placesList'));
		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		    alert('검색 결과가 존재하지 않습니다.');
		    return;
		} else if (status === kakao.maps.services.Status.ERROR) {
		    alert('검색 결과 중 오류가 발생했습니다.');
		    return;
		}
	}
	
	$('#goList').on("click", function(){
		history.back();
	})
</script>
</html>