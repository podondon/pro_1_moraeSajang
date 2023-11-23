<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/error.css'/>">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="error-div" style="background-image:url(/photo/default/500_error.png);">
		<div class="text-div">
			<div class="error-code" style="margin-top: 100px;">500</div>
			<div class="error-msg">앗! 뭔가 문제가 생겼어요!</div>
			<button class="back-btn comm-btn">홈으로</button>
		</div>
	</div>
</body>
<script type="text/javascript">
$('.back-btn').on('click', function(){
	 
	location.href='/morae/groupBuy/gbList'
})
</script>
</html>