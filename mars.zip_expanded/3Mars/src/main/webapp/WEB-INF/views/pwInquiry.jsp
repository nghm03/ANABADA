<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img2/logo.png">
<!-- 탭에 로고 박기 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	function gologin(){
			location.href = "mars/goloogin";
		}
	
	//alert("${pwVO}");
	function changePw() {	
			var id = '<%=(String)session.getAttribute("id")%>';
			//alert(id);
			
			$.ajax({
				url : "changePw",
				type : "post",
				data : {
					"id" : id
					},
				success : function(pw2) {
						var pw = pw2
						$(":input[name=pincode2]").val(pw);
					}, error(request, status, error) {
						alert("실패");
						console.log(request);
					}
			});
	}
	
</script>

<style type="text/css">
@font-face {
    src: url("${pageContext.request.contextPath}/resources/font/OpenSans-VariableFont_wdth,wght.ttf");
    font-family: "dream";
}

@font-face {
    src: url("${pageContext.request.contextPath}/resources/font/abster-webfont.woff");
    font-family: "abster";
}

* {
    font-family: "dream";
}

body {
	text-align: center;
	display: block;
	margin: 0 auto;
	font-size: 16px;
	color: #999;
}

h1 {
	font-family: 'Oswald', sans-serif;
	font-size: 30px;
	color: #216182;
}

label {
	display: block;
	margin-top: 20px;
	letter-spacing: 2px;
}

form {
	margin: 0 auto;
	width: 75%;
	height: 75%
}

input[type="text"] {
	width: 439px;
	height: 27px;
	background-color: #efefef;
	border-radius: 6px;
	border: 1px solid #dedede;
	padding: 10px;
	margin-top: 3px;
	font-size: 0.9em;
	color: #3a3a3a;
}

input:focus, textarea:focus {
	border: 1px solid #97d6eb;
}

textarea {
	height: 60px;
	background-color: #efefef;
}

#submit {
	width: 127px;
	height: 48px;
	text-align: center;
	border: none;
	margin-top: 20px;
	cursor: pointer;
}

#submit:hover {
	color: #fff;
	background-color: #216282;
	opacity: 0.9;
}

#cancel {
	width: 127px;
	height: 48px;
	text-align: center;
	border: none;
	margin-top: 20px;
	cursor: pointer;
}

#cancel:hover {
	color: #fff;
	background-color: #216282;
	opacity: 0.9;
}

.modal {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform
		0.25s;
}

.modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 1rem 1.5rem;
	width: 500px;
	height: 350px;
	border-radius: 0.5rem;
}

.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}

.w-btn {
	position: relative;
	border: none;
	display: inline-block;
	padding: 15px 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-outline {
	position: relative;
	padding: 15px 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn:active {
	transform: scale(1.5);
}

.w-btn-gra1 {
	background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
	color: white;
}
</style>
<head>
<meta charset="utf-8">
<title>Popup Demo</title>
</head>


<body>
	<!-- 팝업 될 레이어 -->
	<div class="modal">
		<div class="modal-content">
			<h1 class="title">비밀번호 변경</h1>
			<form id="pinCheck" action="pinCheck" method="post"
				onsubmit="return formCheck()">
				<label for="email">비밀번호 변경 페이지입니다.</label>
				<c:if test="${flag != true}">
					<input
						style="text-align: center; margin-top: 10%; height: 15%; width: 100%"
						type="text" id="pincode" name="pincode" required="required"
						placeholder="인증번호를 입력해주세요">
					<label></label>
					<input style="margin-top: 5%;" class="w-btn w-btn-gra1"
						type="submit" value="인증번호 입력">
				</c:if>
				<c:if test="${flag == true}">
					<input
						style="text-align: center; margin-top: 10%; height: 15%; width: 100%"
						type="text" id="id" name="pincode2" required="required"
						readonly="readonly" placeholder="비밀번호 변경을 눌러주세요">
					<label></label>
					<input style="margin-top: 5%;" class="w-btn w-btn-gra1"
						type="button" onclick="changePw();" value="비밀번호 변경">
					<input style="margin-top: 5%; margin-left: 5%;"
						class="w-btn w-btn-gra1" type="button" onclick="gologin();"
						value="로그인으로">
				</c:if>
			</form>
		</div>
	</div>



</body>
</html>