<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img2/logo.png"> <!-- 탭에 로고 박기 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음 우편번호 검색 -->

<script type="text/javascript">

function formCheck() {
	var user_id = document.getElementById("user_id");
	var password = document.getElementById("password");
	var password2 = document.getElementById("password2");
	var name = document.getElementById("name");
	var ssn = document.getElementById("ssn");
	var post_code = document.getElementById("post_code");
	var address = document.getElementById("address");
	var detail_address = document.getElementById("detail_address");
	var phone = document.getElementById("phone");
	var phone2 = document.getElementById("phone2");
	var email = document.getElementById("email");
	var clause = document.getElementById("clause");
	
	console.log(user_id);
	console.log(password);

	if (user_id.value.length < 4 || user_id.value.length > 16) {
		alert("ID는 4~16자 사이로 입력해주세요");
		return false;
	} else if (password.value.length < 8 || password.value.length > 16) {
		alert("Password는 8~16자 사이로 입력해주세요.");
		return false;
	} else if (password.value !== password2.value) {
		alert("비밀번호가 서로 다릅니다.");
		return false;
	} else if (name.value == "") {
		alert("성함을 입력해주세요.");
		return false;
	} else if (ssn.value.length != 14) {
		alert("주민번호를 확인해주세요.");
		return false;
	}  else if (postcode.value == "") {
		alert("우편번호를 입력해주세요.");
		return false;
	} else if (address.value == "") {
		alert("주소를 입력해주세요.");
		return false;
	} else if (detail_address.value == "") {
		alert("상세주소를 입력해주세요.");
		return false;
	}  else if (phone.value.length != 4 || phone2.value.length != 4) {
		alert("전화번호을 확인해주세요.");
		return false;
	}

	return true;
}	

var flag = false;

	//alert("${pwVO}");
	function idcheck() {	
			var user_id = document.getElementById("user_id").value
			//alert(user_id); 잘 받아옴
			
			$.ajax({
				url : "idcheck",
				type : "post",
				data : {
					"id" : user_id
					},
					success : function(newId) {
						//alert(newId);
						if(newId == ""){
							flag = false;
							alert("이미 존재하는 아이디입니다.");
							//alert(flag);
						} else {
							flag = true;
							alert("사용가능한 아이디입니다.");
							//alert(flag);
						}
						$(":input[name=user_id]").val(newId);
					}, error(request, status, error) {
						alert("실패");
						console.log(request);
					}
			});	
	}

	function checkIdFlag() {
		if (flag == true) {
			return true;
		} else {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
	}

	
	/** 우편번호 찾기 */
function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=post_code]').val(data.zonecode); // 우편번호 (5자리)
			$('[name=address]').val(data.address);
			$('[name=detail_address]').val(data.buildingName);
		}
	}).open();
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

.centerdiv {
	margin: auto;
	text-align: center
}

h1{
	font-size:50px;
}

a#top{
	font-size:20px;
	position: relative; right: 375px;
}

a.font {
	color: #bab7ac;
	font-size:8px;
	margin:0px 0px 0px 10px;
}

a.link {
	color: #000000;
	text-decoration: none
}

a.visited {
	color: #000000;
	text-decoration: none;
}

a.hover {
	color: #ff0000;
	text-decoration: underline;	
}

/* 이미지 */
img {
	vertical-align: middle;
}

/* 게시판 관련 */
table {
	margin: auto;
	border-collapse: collapse;
	font-family: "Gowun+Dodum";
	}

tr.hover {
	background-color: #cccccc;
}

th, td {
	border-bottom: 1px solid #c9c4b5;
	border-left: 1px solid #c9c4b5;
	border-top: 1px solid #444444;
	padding: 10px;
}

th {
	width: 200px;
	height: 60px;
	background-color: white;/* 배경색 + 투명도 지정 */
	font-weight: bold;
}

td {
	width: 600px;
	padding: 3px;
	text-align: left;
}


 th:first-child, td:first-child {
    border-left: none;
  } /* 테이블 왼쪽 선 제거 */

input#button {
	height: 35px;
	width: 100px;
	background-color: black;
	color: #FFF;
	border-radius: 5px;
	margin: 5px;
	border: 0px;
	cursor: pointer;
}

input#button:hover {
	color: gray;
}

input[type="text"] {
	height: 30px;
	width: 300px;
	margin:10px 0px 0px 10px;
}

input[type="password"] {
	height: 30px;
	width: 300px;
	margin:10px 0px 0px 10px;
}

input[type="email"] {
	height: 30px;
	width: 300px;
	margin:10px 0px 0px 10px;
}

/* 에러 메시지 출력 */
.errorMsg {
	color: red;
	font-size: 12px;
	background-color: #ffffff;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    margin : 15px;
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
    background-color: #020202;
    color: white;
}

/* 약관 */
details { width:830px; height:50%; margin:0 auto; }
details > summary { background:#020202; color:#fff; padding:10px; outline:0; border-radius:5px; cursor:pointer; transition:background 0.5s; text-align:center; box-shadow: 1px 1px 2px gray;}
details > summary::-webkit-details-marker { background:#020202; color:#fff; background-size:contain; transform:rotate3d(0, 0, 1, 90deg); transition:transform 0.25s;}
details[open] > summary::-webkit-details-marker { transform:rotate3d(0, 0, 1, 180deg);}
details[open] > summary { background:#020202;}
details[open] > summary ~ * { animation:reveal 0.5s;}
.tpt { background:#020202; color:#fff; margin:5px 0 10px; padding:5px 10px; line-height:25px; border-radius:5px; box-shadow: 1px 1px 2px gray;}


@keyframes reveal {
    from { opacity:0; transform:translate3d(0, -30px, 0); }
    to { opacity:1; transform:translate3d(0, 0, 0); }
} 


/* 롱주형 햄버억 */
input[id="menuicon"] {
    display:none;    
}

input[id="menuicon"] + label {
    display:block;
    width: 60px;
    height: 40px;
    position: relative;
    cursor:pointer;
}

input[id="menuicon"] + label span {
    display: block;
    position: absolute;
    width: 100%;
    height: 5px;
    border-radius: 30px;
    background: #000;
    transition: all .35s;
}

input[id="menuicon"] + label span:nth-child(1) {
    top:0;
}

input[id="menuicon"] + label span:nth-child(2) {
    top:50%;
    transform:translateY(-50%);
}

input[id="menuicon"] + label span:nth-child(3) {
    bottom: 0;
}

input[id="menuicon"]:checked + label span:nth-child(1) {
    top:50%;
    transform:translateY(-50%) rotate(45deg);
}

input[id="menuicon"]:checked + label span:nth-child(2) {
    opacity: 0;
}

input[id="menuicon"]:checked + label span:nth-child(3) {
    bottom: 50%;
    transform:translateY(50%) rotate(-45deg);
}

div[class="sidebar"] {
    width:300px;
    height: 100%;
    background: #222;
    position: fixed;
    top: 0;
    left: -300px;
    z-index:1;
    transition:all .35s;
}

input[id="menuicon"]:checked + label + div {
    left: 0;
}

input[id="menuicon"]:checked + label {
    z-index:2;
}

input[id="menuicon"]:checked + label span {
    background:#fff;
}

div div[class="sidemenu"] {
    position:absolute;
    top:100px;
    left:20px;
    width: 250px;
    height: 800px;
    color: #fff;
}

.sidemenu a {
    text-decoration: none;
    color: #fff;
    font-size: 40px;
    font-style: bold;
}
/* 롱주형 햄버억 */

/* 롱주형 상단메뉴 (5252 그는 신이냐구!!) */
/* 전체적인 */

html, body {
    margin: 0;
    padding: 0;
    height: 100%;
    min-width: 992px;
    font-family: "Helvetica";
}

body h3 {
    margin-top: 20px;
    margin-left: 100px; 
    font-size: 24px;
    font-style: bold;
    color: #545454;
}

.wrapper {
    display: flex;
    flex-direction:column;
    height: 100%;
}

.main-content {
    flex:1;
}
/* 제일 윗단 */

.smol {
    position: fixed;
    top: 0;
    background-color: white;
    left: 0; width:100%;
}

.smol li {
    list-style-type: none;
    float:right;
    margin-right: 30px;
}

.smol a {
    text-decoration: none;
    color: black;
    font-style: bold;
    font-size: 13px;
}

/* 로고 */

.logo img {
    height: 120px;
    margin: 0 auto;
    display: block;
}

/* 헤드메뉴 */

.topmenu {
    text-align: center;
}

.topmenu a {
    font-size: 20px;
    color: #545454;
    font-style: bold;
    text-decoration: none;
    position: relative;
    padding: 20px 40px;
}

.topmenu a::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 0%;
    height: 4px;
    background: #2F4F4F;
    transition: all .5s ease-out;
}

.topmenu a:hover::after {
    width: 100%;
}
/* 푸터 */

footer {
    padding:30px 0;
    background: #333;
    color:#fff; 
}
/* 롱주형 상단메뉴 (5252 그는 신이냐구!!) */
</style>
</head>
<body>

    <div class="centerdiv">
	<h1> 회원가입 </h1>
	<form id="joinForm" action="signUp" method="post" onsubmit="return !!(formCheck() & checkIdFlag());">
	<a id = "top">기본정보</a>
		<table>
			<tr>
				<th>아이디<a style="color: red">*</a></th>
				<td>
					<input type="text" name="user_id" id="user_id" placeholder="ID 중복확인 이용">
					<input id="button" type="button" value="ID 중복확인" onclick="idcheck(); idcheckPop();"><br> <!-- 나중에 제이쿼리로 동적 처리할것 (완료)-->
					<a class="font">(아이디는 4~16자 이내로 입력해주세요.)</a>
				</td>
			</tr>
			<tr>
				<th>비밀번호<a style="color: red">*</a></th>
				<td>
					<input type="password" name="password" id="password" placeholder="비밀번호 입력"><br>
					<a class="font">(비밀번호는 8~16자 이내로 입력해주세요.)</a>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인<a style="color: red">*</a></th>
				<td>
					<input type="password" name="password2" id="password2" placeholder="비밀번호 확인">
				</td>
			</tr>
			<tr>
				<th>이름<a style="color: red">*</a></th>
				<td>
					<input type="text" name="name" id="name" placeholder="이름 입력">
				</td>
			</tr>
			<tr>
				<th>주민번호<a style="color: red">*</a></th>
				<td>
					<input type="text" name="ssn" id="ssn" placeholder="주민번호 입력  (예시 : 950101-1111111)">
				</td>
			</tr>
			<tr>
				<th>주소<a style="color: red">*</a></th>
				<td>
					<input type="text" name="post_code" id="post_code" placeholder="우편번호"
					readonly="readonly" style="width:150px;" required>
					<input id="button" type="button" value="우편번호 입력" onclick="openZipSearch()"><br>
					<input type="text" name="address" id="address" placeholder="도로명 주소"
					readonly="readonly" required>
					<input type="text" name="detail_address" id="detail_address" placeholder="상세 주소" style="margin: 10px">
				</td>
			</tr>
			<tr>
			<th>전화번호<a style="color: red">*</a></th>
				<td>
					<select name="phone" style="height: 35px; width:50px; margin: 10px">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>-
					<input type="text" name="phone" id="phone" placeholder="번호 입력" style="width:75px; margin: 10px">-
					<input type="text" name="phone" id="phone2" placeholder="번호 입력" style="width:75px;">
				</td>
			</tr>
			<tr>
			<th>이메일<a style="color: red">*</a></th>
				<td>
					<input type="email" name="email" id="email" placeholder="이메일 입력" required>
				</td>
			</tr>
		</table>
		<details>
			<summary>회원 약관</summary>
			<table>
				<tr>
					<td style="width: 830px; text-align: center;">
	   					<p>대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 
	   					대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용
	   					대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 
	   					대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용 대충 약관내용대충 약관내용
	   					<br>이하 위 내용에 동의 하십니까?</p><br>
	   					<a>동의 합니다</a>
	   					<input type="checkbox" name="clause" id="clause" value="1" required>
					</td>
				</tr>
			</table>
		</details><br>
		
		<input class="w-btn w-btn-gra1" style="cursor: pointer;" type="submit" value="회원가입">
		<input class="w-btn w-btn-gra1" style="cursor: pointer;" type="reset" value="다시쓰기">
	</form>

</body>
</html>