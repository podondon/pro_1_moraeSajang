<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        #reportContent{
            width: 550px;
            height: 300px;
            resize: none;
        }
        .nums{
        	visibility : hidden;
        }
        form{
        	margin-top:144px;
        }
        .h3{
        	text-align:center;
        	font-size: 1.5em;
        	width: 550px; 
        	height: 30px;
        	margin-bottom: 16px;
        }
        .report-info{
        	width: 550px;
        	margin: 0 auto;
        }
        .report-btn{
        	margin-top: 15px;
        	margin-left: 190px;
        }
        .comm-btn{
			background-color:#F9DCA3; 
			border-style: none;
			border-radius: 5px;
			padding: 5px 5px 5px 5px;
		}
		#report{
			margin-right: 40px;
		}
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <form action="report" method="post">
    <div>
    	<div class="report-info">
        <div class="h3"> 신고 글쓰기 <span  style="border-color: none;"></span></div>         
        <div id="productImg" class="smallInfo" >
            <textarea id="reportContent" name="reportContent" class="inputValid"></textarea>
            <div class="validation">
            0/250
        	</div>
        </div>
        
        <div class="report-btn"><button type="button" id="report" class="comm-btn">신고하기</button><button type="button" id="goGb" class="comm-btn">되돌아 가기</button></div>
    </div>
    </div>
    </form>
    
</body>
<script>
let param = '${param}';
console.log(param);

$('#report').on('click', function(){
	if($('#reportContent').val() == ''){
		alert('신고 내용은 비워둘 수 없습니다.');
		return false;
	}
	$('form').submit();
});

$('#goGb').on('click', function(){
	let gbNo = get_cookie('gbNo')
	console.log(gbNo);
	location.href = 'gbDetail?gbNo='+'${param.gbNo}';
});

function get_cookie(name) {
    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value? value[2] : null;
}
$('.inputValid').on('keydown', function(){
    let len = $(this).val().length;
    console.log($(this));
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
</script>

</html>