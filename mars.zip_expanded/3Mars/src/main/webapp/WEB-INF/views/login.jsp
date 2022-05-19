<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img2/logo.png"> <!-- 탭에 로고 박기 -->
<script type="text/javascript">

	var lg = '${lg }';
	if(lg == 1) {
		//alert("아이디와 비밀번호를 확인해주세요.")
	}

	function formCheck() {
		var id = document.getElementById("id");
		var password = document.getElementById("password");
		console.log(id);
		console.log(password);
		//debugger;
		if (id.value == "" || password.value == "") {
			alert("ID와 Password를 입력해 주세요");
			return false;
		}
		return true;
}	

	function gosignUp() {
		location.href = "signUp";
	}	
	
	function goidFind() {
		location.href = "userFind";
	}	

	function goorderInquiry() {
		
		var title  = "popup";
		var status = "toolbar=no,scrollbars=no,resizable=no,status=no,menubar=no,width=260, height=120, top=0,left=0"; 
		window.open('orderInquiry',popup,status);
		
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
	background-image: url("${pageContext.request.contextPath}/resources/img2/images.jpg");
	background-size: cover;				 /* 배경에 여백없게*/
	background-repeat: no-repeat; 		/* 배경 페이지 반복 설정 여부 X*/
	text-align: center;					/* 센터로*/
	font-family: "Gowun+Dodum";			/* 폰트 */
	font-size: 12px;					/* 폰트 사이즈 */
	 margin-top:5%;
	}

form{
	font-family: "Gowun+Batang";
	display: inline-flex;
}


.member {
 font-size: 50px;
 text-shadow: 0 0 10px #666;	/* 그림자 생성 */
 color: #fff; /* 폰트 색 지정 */
 font-family:  'Gugi';
}

.form {
 background-color: aliceblue; /* 배경색 */
 width: 580px;
 height: 350px;
 border-radius: 25px; /* 박스 모서리 둥글게 */
 border: 3px solid #7acbe2; /* 선 굵기 5, 양선, 색-999 */
 margin: 30px auto;
  text-align: center;
}

.form2 {
 background-color: aliceblue;
 width: 380px;
 min-width: 320px;
 margin: 60px auto; /* 윗 마진 */
 text-align: center;
}

.form3 {
 background-color: aliceblue;
 float: left; /* 폰트 정렬 */
 margin-top: 6%;
 text-align: center;					/* 센터로*/
 /*   background:#f00;  */
}

.form3 label {
 width: 40px;
 height: 20px;
 /*  display: block; */
 float: left;
 font-family:  'Gowun+Dodum', sans-serif;
}

.form4 {
	margin-top: 5%;
}

#wrap {
 width: 600px;
 height: 500px;
 margin: 0 auto;
}

.clear {
 clear: both;
}

input[type="submit"] {
 float: left;
 color: #fff;
 /*  display:block; */
 height: 50px;
 background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
 border-radius: 5px;
 border: none;
 font-family:  'Gugi', sans-serif;
}
input[type="button"] {
 margin-top:35px;
}
input[type="checkbox"] {
 margin-top:10px;
 font-family: 'Gowun+Dodum', sans-serif;
}
input[type="text"] {
 width: 200px;
 height: 25px;
}
input[type="password"] {
 width: 200px;
 height: 25px;
}



.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 16px 25px;
    margin: 3%;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn:active {
    transform: scale(1.2);
}

.w-btn-gra1 {
    background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    color: white;
}

</style>
</head>
<body>

	<form id="loginForm" action="login" method="post" onsubmit="return formCheck()">
		<div id="wrap">
			<h1 class="member">로그인</h1>
			<div class="form">
				<div class="form2">
					<div class="form3">
						<label for="user"></label><input type="text" id="id" name="id" placeholder="아이디">　　
					<div class="clear"></div>
						<label for="user"></label><input type="password" id="password" name="password" placeholder="비밀번호">　　
					</div>
						<input style="margin-top: 6%;  width: 80px; height: 64px; cursor: pointer;"type="submit" value="로그인하기">
					<div class="clear"></div>
					<div class="form4">
					<c:if test="${success == 1}">
							<h5 style="color: #f75c4d; font-size:12px; font-family: "Gowun+Dodum";">축하드립니다! 회원가입에 성공하셨습니다.</h5>
						</c:if>
					<c:if test="${lg == 1}">
							<h5 style="color: #f75c4d; font-size:12px; font-family: "Gowun+Dodum";">아이디와 비밀번호를 확인해주세요.</h5>
					</c:if>
					<div class="clear"></div>
						<label><input class="w-btn w-btn-gra1" style="cursor: pointer;" type="button" value="회원가입" onclick="gosignUp()"></label> <label>
						<input class="w-btn w-btn-gra1" style="cursor: pointer;" type="button" value="아이디/비밀번호 찾기" onclick="goidFind()"></label><br><br>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	 <!--    <hr class="separator"/> -->
	<div style="margin-top: 6%">
		<h2>㈜ 3secons_of_Mars</h2>
		<p>©2021 All Rights Reserved.<br>
		우리는 자연을 지키고 환경보호에 앞장서는 국제적 기업이 되고싶다.</p>
	</div>
  
</body>
</html>