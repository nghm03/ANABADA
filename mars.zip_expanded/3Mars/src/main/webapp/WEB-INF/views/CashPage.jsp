<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CashPage</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img2/logo.png"> <!-- 탭에 로고 박기 -->
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 -->
<script type="text/javascript">

function checkCash(num) {
	var value = num;
	
	console.log(value);

	if(confirm(value + "₩ 충전 하시겠습니까?")) {
		location.href = "cashUpdate?cash=" + value;
		}
}

$(document).ready(function(){
	 var user_id = '<%=(String)session.getAttribute("user_id")%>';
	 $.ajax({
	    	url : "userInfo",
	    	type : "post",
	    	data : {"user_id" : user_id},
	    	success : function(data) {

			$("#user_cash").append(" ANA (" + data.userinfo.cash + ")");
				
	    	}, error(request, status, error) {
	    		alert("false");
	    		console.log(request, status, error);
	    	}
	    });
})

/* 양쪽 체크박스 중복 방지 */ 

//햄버거
function leftcheck() {
	var leftChecked = document.getElementsByName("menuicon");
	var rightChecked = document.getElementsByName("sicon"); 

	/* 장바구니 자동 꺼짐 */
	if(leftChecked[0].checked == true) {
		rightChecked[0].checked = false;
	}
}

//장바구니
function rightcheck() {
	var leftChecked = document.getElementsByName("menuicon");
	var rightChecked = document.getElementsByName("sicon");

	/* 왼쪽 메뉴 자동꺼짐*/
	if(rightChecked[0].checked == true) {
		leftChecked[0].checked = false;
		
	// NewFile에 있는거 가져오기
	$.ajax({
		url : "NewFile",
		type : "GET",
		dataType : "text",
		success : function(result) {

			$("#list_smol").html(result);
					
			}, error(request, status, error) {
				alert("false");
				console.log(request, status, error);
			}
	});
		
	}				

}

/* 장바구니바 펼쳤을때 */
function unfold() {
	var target = document.getElementById("unfold");
	var target2 = document.getElementById("wait");
	var basket = document.getElementById("width");
	var icon = document.getElementById("change");
	var botan = document.getElementById("back");
	var hidebutton = document.getElementById("hidebutton");

	$.ajax({
		url : "payment",
		type : "GET",
		dataType : "text",
		success : function(result) {

			$("#list").html(result);
			list_smol.innerHTML = "";

			/* 장바구니바 넓이 */
			target.style.width = "100%";

			/* 장바구니 칸 */
			basket.style.width = "90%";
			
			/* 햄버거바 임시 숨김 */
			target2.style.opacity = 0;
			target2.style.transition = "all 0.7s";
			target2.style.cursor = "default";

			/* 아이콘 숨기기 */
			icon.style.opacity = 0;

			/* botan */
			botan.style.transition = "all 1.3s";
			botan.style.opacity = 100;
			botan.style.cursor = "pointer";

			/* 장바구니바 구매버튼 숨기기 */
			hidebutton.style.opacity = 0;
			hidebutton.style.cursor = "default";

		}, error(request, status, error) {
			alert("false");
			console.log(request, status, error);
		}
	});	
}

/* 장바구니 돌아갈때 */
function homeback() {
	var target = document.getElementById("unfold");
	var target2 = document.getElementById("wait");
	var basket = document.getElementById("width");
	var icon = document.getElementById("change");
	var botan = document.getElementById("back");
	var hidebutton = document.getElementById("hidebutton");
	var list = document.getElementById("list");

	list.innerHTML = "";
	
	target.style.width = "300px";
	basket.style.width = "250px";
	target2.style.opacity = 100;
	target2.style.transition = "all 0s";
	target2.style.cursor = "pointer";
	icon.style.opacity = 100;
	botan.style.transition = "all 0.3s";
	botan.style.opacity = 0;
	hidebutton.style.opacity = 100;
	hidebutton.style.cursor = "pointer";

	rightcheck();
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
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}

#wrapper {
	height: auto;
	min-height: 100%;
	padding-bottom: 150px;
}

.container {
 height: 2300px;
}

footer {
	height: 150px;
	background-color: white;
	color: #343434;
	text-align: center;
	line-height: 30px;
	border-top: 1.5px solid;
	border-color: #F08300;
}

/* 장바구니 바 설정 */

.hidden_menu {
	position:absolute;
	top: 10px;
	width: 100%;
	z-index: 1;
}

.hidden_menu input {
	border: 0;
	outline: 0;
	display: block;
	margin: auto;
	font-size: 25px;
	padding: 3px;
	background-color: #FFF;
	color: #F08300;
	opacity: 0;
	font-weight: bold;
}

.back {
	
}

/* 장바구니바 클릭시 */
input[id="sicon"] {
	display: none;
}

input[id="sicon"] + label {
	display: block;
	cursor: pointer;
	color: black;
	font-weight: bold;
	font-size: 17px;
	position: relative;
	width: 43px;
	height: 33px;
}

input[id="sicon"] + label span {
	display: block;
	position: absolute;
	width: 100%;
	height: 5px;
	border-radius: 1px;
}

input[id="sicon"] + label span:nth-child(1) {
	top:0;
}

input[id="sicon"] + label span:nth-child(2) {
	bottom:0;
}

input[id="sicon"]:checked + label span:nth-child(1) {
	top: 7px;
	left: -50px;
	transform: rotate(45deg);
	background-color: #F08300;
	position: relative;
	height: 2px;
	width: 20px;
	transition:all 0.3s;
}

input[id="sicon"]:checked + label span:nth-child(2) {
	bottom: 10px;
	left: -50px;
	transform: rotate(-45deg);
	background-color: #F08300;
	height: 2px;
	width: 20px;
	transition:all 0.3s;
}

input[id="sicon"]:checked + label a {
	position: absolute;
	color: #F08300;
	transition:all 0.5s;
}

input[id="sicon"]:checked + label {
	z-index: 3;
}

/* 장바구니 바 확장 */

div[class="shopping_bar"] {
	display: block;
	width: 300px;
	height: 100%;
	background: #FFF;
	position: fixed;
	top: 0;
	right: -300px;
	z-index:2;
	transition:all .35s;
	border-left: 1.5px solid;
	border-color: #F08300;
}

input[id="sicon"]:checked + label + div {
	right: 0;
}

/* 장바구니 바 작게했을 때 */

.shopping_bar div[class="shopping_menu"] {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%,-50%);
	width: 250px;
	height: 80%;
	color: #F08300;
	/* border: 1px solid; */
	text-align: center;
	overflow-y: scroll;
	overflow-x: hidden;
	-ms-overflow-style: none;
}

.shopping_bar div[class="shopping_menu"]::-webkit-scrollbar{ display:none; }

.shopping_bar #hidebutton {
	position: absolute;
	bottom: 3%;
	left: 150px;
	font-size: 15px;
	font-weight: bold;
    width: 120px;
    padding: 10px;
    color: #F08300;
    background-color: #FFF;
   	border: 0px;
	transform: translate(-50%);
	cursor: pointer;
}

/* 장바구니 길게 했을 때 */

.maincart {
	text-align: justify;
    display: flex;
    padding-top: 2%;
    padding-left: 15%;
    padding-right: 15%;
    padding-bottom: 2%;
}

.item {
    flex-grow: 900;
}

.checkout {
    flex: 0 0 300px;
    margin-left: 100px;
}

.total {
    position: relative;
}

.check {
    margin-top: 30px;
}

.check input {
    width: 250px;
    font-size: 20px;
    padding-top: 5px;
    padding-bottom: 5px;
    background-color: #F08300;
    border: 0px;
    color: #FFF;
    cursor: pointer;
}

/* 상품들 */


.bundle {
    display: flex;
    color: #343434;
}

.item ul {
    list-style: none;
}

hr {
	background-color: #F08300;
	border-color: #F08300;
	opacity: 40%;
}

.item_img {
    width: 100px;
    height: 100px;
    border: 1px solid;
    flex: 1;
    max-width: 100px;
}

.item_img img {
    width: 100px;
    height: 100px;
}

.item_text {
    flex: 1;
    margin-left: 20px;
    max-width: 80%;
}

.item_amount {
    flex: 1;
    max-width: 90px;
    margin-left: 50px;
    
}

.item_price {
    flex: 1;
    max-width: 50px;
    margin-left: 20px;
    margin-right: 20px;
}

.close-button { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         color: #F08300; 
}

/* 햄버거햄버거햄버거햄버거햄버거햄버거햄버거햄버거 바 설정 */

input[id="menuicon"] {
	display:none;	
}

input[id="menuicon"] + label {
	display:block;
	width: 40px;
	height: 30px;
	position: relative;
	cursor:pointer;
	position: fixed;
	margin: 10px;
	z-index: 2;
	top: 5px;
	left: 20px;
}

input[id="menuicon"] + label span {
	display: block;
	position: absolute;
	width: 100%;
	height: 3px;
	border-radius: 30px;
	background: #F08300;
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
	display: flex;
	justify-content: center;
	width:300px;
	height: 100%;
	background: #FFF;
	position: fixed;
	top: 0;
	left: -300px;
	z-index:2;
	transition:all .35s;
	border-right: 1.5px solid;
	border-color: #F08300;
}

input[id="menuicon"]:checked + label + div {
	left: 0;
}

input[id="menuicon"]:checked + label {
	z-index:3;
}

input[id="menuicon"]:checked + label span {
    background: #F08300;
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
	color: #F08300;
	font-size: 40px;
	font-style: bold;
}

.leftline {
	border-bottom: 1.5px solid;
	position: absolute;
	top: -1%;
	color: #F08300;
	width: 100%;
	height: 71px;
}

.rightline {
	border-bottom: 1.5px solid;
	position: absolute;
	top: -1%;
	color: #F08300;
	width: 100%;
	height: 71px;
	float: left;
}

/* 네비 바와 로고 */

.nav {
	border: 1.5px solid;
	width: 100%;
	position:absolute;
	top: -1%;
	left: -2px;
	height: 70px;
	z-index: 1;
	position: fixed;
	background-color: #fff;
	border-color: #F08300;
}

.logo {
    position: absolute;
    top: 20px;
    left: 120px;
    font-size: 25px;
}

.logolink {
    text-decoration: none;
    color: #F08300;
    font-family: "abster";
}

/* 네비바 오른쪽 메뉴들 */

.smol .smol_ul {
	position: relative;
	top: 10px;
	background-color: #FFF;
	float: right;
}

.smol .smol_li {
	list-style-type: none;
	float:left;
	margin-right: 30px;
}

.smol a {
	text-decoration: none;
	color: #F08300;
	font-weight: bold;
	font-size: 17px;
}

/* 작은 장바구니 */


.simple {
	max-width: 250px;
	display: inline-block;
	vertical-align: top;
	text-align: left;
}

.simple_ul {
	list-style-type: none;
	margin: 0px;
	padding: 0;
}

.simple_ul li {
	position: relative;
	padding-top: 0;
	padding-bottom: 20px;
	margin-top: 0;
	margin-bottom: 20px;
	border-bottom-width: 1px;
	border-bottom-style: solid;
}

.simple .ig {
	width: 80px;
	height: 80px;
	margin-right: 10px;
}

.simple .simple_info {
	display: inline-block;
	vertical-align: top;
	width: 130px;
	text-align: left;
	font-size: 14px;
	color: #343434;
}

.simple .simple_name {
}

.simple .simple_price {
	margin-top: 10px;
	margin-bottom: 10px;
}

    /* 캐시 관련 */

    .cash {
        position: relative;
        display: block;
        top: 100px;
        /* border: 1px solid; */
        width: 1000px;
        margin: auto;
    }

    .cash .cash_category {
        /* border: 1px solid; */
        margin-top: 20px;
        width: 100%;
        height: 80px;
        display: flex;
    	align-items: center;
    }

    .cash .cash_category .cash_category_ul {
        list-style-type: none;
    }

    .cash .cash_category .cash_category_ul li {
        float: left;
        margin-right: 100px;
        font-size: 30px;
        font-weight: bold;
    }
    
    .user_cash {
    	margin-left: auto;
    	font-weight: bold;
    	position: relative;
    	top: 5px;
    	margin-right: 40px;
    }

    .cash .cash_intro {
        /* border: 1px solid; */
        margin-top: 5px;
        margin-left: 40px;
        font-size: 18px;
        margin-bottom: 25px;
    }
    
    .cash .cash_main {
        /* border: 1px solid; */
        display: flex;
    }

    .cash .cash_main p {
        margin : 60px 40px;
        font-weight: bold;
        font-size: 20px;
    }
    .cash .cash_main ul{
        list-style-type: none;
    }

    .cash .cash_list {
        /* border: 1px solid; */
        margin: 40px 110px;
        line-height: 65px;
    }

    .cash .cash_list ul {
        margin: 0;
        padding: 0;
    }
    
    .cash .cash_list ul li {
        font-weight: bold;
    }

    .cash .cash_button {
        position: relative;
        top: 25px;
        left: 100px;
        /* border: 1px solid; */
        line-height: 65px;
        margin-left: 100px;
    }
    
    .cash .cash_button input[type=button] {
    	border: 0px;
    	width: 150px;
    	text-align: center;
    	background-color: #F08300;
    	color : white;
    	height: 30px;
    	cursor: pointer;
    	font-size: 15px;
    	border-radius: 5px;
    }
    
    .cash .cash_button input[type=button]:hover {
    	color : #343434;
    }
</style>
</head>
<body>
<div id='wrapper'>
	<!-- 햄버거 바 -->
	<div>
		<input type="checkbox" id="menuicon" name="menuicon" onclick="leftcheck()">
		<label id="wait" for="menuicon">
			<span></span>
			<span></span>
			<span></span>
		</label>
		<div class="sidebar">
			<div class="leftline"></div>
			<div class="sidemenu">
				<p><a href="home">MAIN</a></p>
				<p><a href="kategorieProcess?pc=0">SHOP</a></p>
				<p><a href="OurStoryPage">OUR STORY</a></p>
				<p><a href="ContactPage">CONTACT</a></p>
			</div>
		</div>
	</div>
	<!-- 상단 바 -->
	<div>
		<div class="nav">
			<div class="logo">
				<a href="home" class="logolink">ANABADA</a>
			</div>
			<div class="smol">
				<ul class="smol_ul">
					<!-- 위대한 장바구니 선생님 -->
					<c:if test="${user_id == null }">
					<li class="smol_li"><a href="login">MYPAGE</a></li>
					</c:if>
					<c:if test="${user_id != null }">
					<li class="smol_li"><a href="UserInfoPage">MYPAGE</a></li>
					</c:if>
					
					<li class="smol_li">
						<input type="checkbox" id="sicon" name="sicon" onclick="rightcheck()">
						<label for="sicon" id="change">
							<span></span>
							<span></span>
							<a>CART</a>
						</label>
						<div id="unfold" class="shopping_bar">
							<div class="hidden_menu">
								<input id="back" type="button" value="BACK SPACE ➞" onclick="homeback()">
							</div>
							<div class="rightline"></div>
							<div id="width" class="shopping_menu">
								<!-- 장바구니 기본형 -->
								<div id="list_smol">
								
								</div>
								<!-- 장바구니 펼쳤을때 -->
								<div id="list"></div>
							</div>
							<input id="hidebutton" type="button" value="CHECKOUT" onclick="unfold();">
						</div>
					</li>
					<!-- 아이디 -->
					<c:if test="${user_id == null }">
						<li class="smol_li"><a href="login">LOGIN</a></li>
					</c:if>
					<c:if test="${user_id != null }">
						<li class="smol_li"><a href="logout">LOGOUT</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
        <div class="cash">
            <div class="cash_category">
            	<div>
                <ul class="cash_category_ul">
                    <li>CASH CHARGE</li>
                    <!-- <li>충전내역(시간남을때)</li> -->
                </ul>
                </div>
                <div class="user_cash" id="user_cash">
                	HELLO (<span style="color: #F08300;">${user_id }</span>)
                </div>
            </div>
            <div class="cash_intro">
            It's a dedicated payment method to buy Anabada's products.
            </div>
            <hr>
            <div class="cash_main">
                <p>ANA PACKAGE</p>
                <div class="cash_list">
                    <ul>
                        <li>100 ANA</li>
                        <li>1000 ANA</li>
                        <li>3000 ANA</li>
                        <li>5000 ANA</li>
                        <li>10000 ANA</li>
                        <li>50000 ANA</li>
                        <li>100000 ANA</li>
                    </ul>
                </div>
                <div class="cash_button">
                    <ul>
                        <li><input type="button" name="cash" onclick="checkCash(100)" value="100₩" ></li>
                        <li><input type="button" name="cash" onclick="checkCash(1000)" value="1000₩"></li>
                        <li><input type="button" name="cash" onclick="checkCash(3000)" value="3000₩"></li>
                        <li><input type="button" name="cash" onclick="checkCash(5000)" value="5000₩"></li>
                        <li><input type="button" name="cash" onclick="checkCash(10000)" value="10000₩"></li>
                        <li><input type="button" name="cash" onclick="checkCash(50000)" value="50000₩"></li>
                        <li><input type="button" name="cash" onclick="checkCash(100000)" value="100000₩"></li>
                    </ul>
                </div>
            </div>
        </div>
</div>
<footer><br><br>Welcome Of Our 3Secons of Mars</footer> 
</body>
</html>