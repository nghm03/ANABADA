<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Info</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img2/logo.png"> <!-- 탭에 로고 박기 -->
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음 우편번호 검색 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 -->
<script type="text/javascript">

function formCheck() {
	var password = document.getElementById("password");
	var name = document.getElementById("name");
	var post_code = document.getElementById("post_code");
	var address = document.getElementById("address");
	var detail_address = document.getElementById("detail_address");
	var phone = document.getElementById("phone");
	var email = document.getElementById("email");

	if (password.value.length < 8 || password.value.length > 16) {
		alert("수정할 Password는 8~16자 사이로 입력해주세요.");
		return false;
	} else if (name.value == "") {
		alert("수정할 name을 입력해주세요.");
		return false;
	} else if (postcode.value == "") {
		alert("수정할 우편번호를 입력해주세요.");
		return false;
	} else if (address.value == "") {
		alert("수정할 주소를 입력해주세요.");
		return false;
	} else if (detail_address.value == "") {
		alert("수정할 상세주소를 입력해주세요.");
		return false;
	}
	return true;
}

function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			$('[name=post_code]').val(data.zonecode); // 우편번호 (5자리)
			$('[name=address]').val(data.address);
			$('[name=detail_address]').val(data.buildingName);
		}
	}).open();
}

$(document).ready(function(){
	OrdersForm();
})

// 컨텍트 버튼
function ContactForm() {
	var user_id = '<%=(String)session.getAttribute("user_id")%>';
    var values = [];

    
    $.ajax({
    	url : "userContact",
    	type : "post",
    	data : {
    		"user_id" : user_id
    		},
    	success : function(result) {

    		values = result.userContact;

    	    var MyInfo = document.getElementById("MyInfo");
    	    var MyOrder = document.getElementById("MyOrder");
    	    var src = '<div class="Headline">'
    	    	src+= 	'<div class="Headname">My Contact</div>'
    	    	src+= '</div>'
    	        src+= '<p>Check the context message you sent.</p>';
    	        src+= '<hr>';

    		$.each(values, function( index, value ) {

				src+= '<div class="Contact">'
				src+= '<div class="ContactUserInfo">'
				src+= '<div class="ContactId">'
				src+= 'user : ' + value.user_id + ''
				src+= '</div>'
				src+= '<div class="Contactemail">'
				src+= 'Email : ' + value.email + ''
				src+= '</div>'
				src+= '</div>'
				src+= '<div class="Contactproduct_title">'
				src+= '<b>' + value.product_title + '</b>'
				src+= '</div>'
				src+= '<div class="Contactproduct_info">'
				src+= '' + value.product_info + ''
				src+= '</div>'
				src+= '<div class="Contactuser_comment">'
				src+= '' + value.user_comment + ''
				src+= '</div>'
				src+= '</div>'
				src+= '<div style="margin-bottom:20px;">'
				src+= '<b style="color:red;">*</b><b> We will send you the answer by e-mail.</b>'
				src+= '</div>'
				src+= '<hr>'
             });

		    MyInfo.innerHTML = "";
		    MyOrder.innerHTML = src;


    	}, error(request, status, error) {
    		alert("false");
    		console.log(request, status, error);
    	}
    });
}

// 오더 버튼
function OrdersForm() {

        var user_id = '<%=(String)session.getAttribute("user_id")%>';
        var values = [];

        
        $.ajax({
        	url : "userOrderInfo",
        	type : "post",
        	data : {
        		"user_id" : user_id
        		},
        	success : function(result) {

        		values = result.userOrderInfo;

        	    var MyInfo = document.getElementById("MyInfo");
        	    var MyOrder = document.getElementById("MyOrder");
        	    var src = '<div class="Headline">'
        	    	src+= 	'<div class="Headname">My Orders</div>'
        	    	src+= '</div>'
        	        src+= '<p>View your order history or check the status of a recent order.</p>';
        	        src+= '<hr>';

        		$.each(values, function( index, value ) {

                    src+= '<div class="order_info">'
                    src+= 	'<div class="order_day">' + value.buy_time + ' </div>'
                    src+=   '<div class="order_image"><img src="' + value.product_image + '"></div>'
                    src+= 	'<div class="order_name">' + value.product_name + ' </div>'
                    src+= 	'<div class="order_price">' +  value.product_price +' ANA </div>'
                    src+= 	'<div class="order_check">' + value.buyInfo_stock + '</div>'
                    src+= '</div>'
                    src+= '<hr>'
                 });
                

			    MyInfo.innerHTML = "";
			    MyOrder.innerHTML = src;


        	}, error(request, status, error) {
        		alert("false");
        		console.log(request, status, error);
        	}
        });

}

// 인포 버튼
function InfoForm() {
    var MyInfo = document.getElementById("MyInfo");
    var MyOrder = document.getElementById("MyOrder");

    var user_id = '<%=(String)session.getAttribute("user_id")%>';
    $.ajax({
    	url : "userInfo",
    	type : "post",
    	data : {"user_id" : user_id},
    	success : function(data) {
			console.log(data);
			console.log(data.userinfo.user_id);
			console.log(data.userinfo.password);
			
		    var src = '<div class="Headline">'
		        src+= '<div class="Headname">My Info</div>'
		        src+= '<div class="MyCash">My Cash  ' + data.userinfo.cash + '.00</div>'
		        src+= '<div class="CashButton"><a href="CashPage"><input type="button" value="Charge"></a></div>'
		        src+= '</div>'
		        src+= '<p>View and edit your personal info below.</p>'
		        src+= '<hr>'
			    src+= '<form id="updateform" action="userUpdate" method="post" onsubmit="return formCheck()">'
		        src+= '<div class="info_list">'
		        src+= '<ul>'
		        src+= '<li>'
		        src+= '<b>PASSWORD</b><br>'
		        src+= '<input type="password" id="password" name="password" value="' + data.userinfo.password + '">'
		        src+= '</li>'
		        src+= '<li>'
		        src+= '<b>NAME</b><br>'
		        src+= '<input type="text" id="name" name="name" value="' + data.userinfo.name + '">'
		        src+= '</li>'
		        src+= '<li>'
		        src+= '<b>PHONE</b><br>'
		        src+= '<input type="text" id="phone" name="phone" value="' + data.userinfo.phone + '">'
		        src+= '</li>'
		        src+= '<li>'
		        src+= '<b>E-MAIL</b><br>'
		        src+= '<input type="text" id="email" name="email" value="' + data.userinfo.email + '">'
		        src+= '</li>'
		        src+= '<li>'
		        src+= '<input type="button" value="PostCode" onclick="openZipSearch()" style="height: 30px;padding-left: 5px;padding-right: 5px;margin-right: 10px;margin-bottom: 10px;border-radius: 5px;background-color: #F08300; color: white;border: 0px;cursor: pointer;"><b>ADDRESS</b><br>'
				src+= '<div style="display:flex;">'
			    src+= '<input type="text" value="' + data.userinfo.post_code + '" id="post_code" name="post_code" readonly="readonly" style="width: 80px; margin-right: 10px;">'
			    src+= '<input type="text" value="' + data.userinfo.address + '" id="address" name="address" readonly="readonly" style="width: 335px;">'
				src+= '</div>'
		        src+= '</li>'
		        src+= '<li>'
		        src+= '<b>DETAIL ADDRESS</b><br>'
		        src+= '<input type="text" id="detail_address" name="detail_address" style="width: 435px;" value="' + data.userinfo.detail_address + '">'
		        src+= '</li>'
		        src+= '</ul>'
		        src+= '<div class="editbox" style="text-align: right;">'
		        src+= '<input type="submit" value="Update Info" style="background-color: #F08300; color: white;border: 0;border-radius: 5px;width: 130px;height: 40px;font-size: 16px;cursor: pointer;">'
			    src+= '<input type="hidden" name="user_id" value="' + data.userinfo.user_id + '">'
		        src+= '</div>'
		        src+= '</form>'
		        src+= '</div>'
		        src+= '</details>'
		        
		    MyInfo.innerHTML = src;
		    MyOrder.innerHTML = "";
    	}, error(request, status, error) {
    		alert("false");
    		console.log(request, status, error);
    	}
    });
   
}

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

    /* 컨테이너 */

    .MYPAGE_CONTAINER {
        position: relative;
        display: flex;
        top: 100px;
        /* border: 1px solid; */
        width: 1000px;
        margin: auto;
        padding: 50px;
        margin-bottom: 100px;
        min-height: 500px;
    }

    .MYPAGE_CONTAINER .user_name {
        /* border: 1px solid; */
        width: 230px;
        height: 50px;
        font-size: 20px;
        text-align: center;
        padding-top: 30px;
    }

    .MYPAGE_CONTAINER .user_menu {
        /* border: 1px solid; */
        width: 230px;
        height: 400px;
    }

    .MYPAGE_CONTAINER .user_info {
    	padding-top: 20px;
        padding-left: 20px;
        padding-right: 20px;
        margin-left: 100px;
        /* border: 1px solid; */
        height: auto;
        width: 800px;
        color: #343434;
    }

    .MYPAGE_CONTAINER .user_menu ul {
        padding: 0;
        margin-top: 20px;
        line-height: 70px;
        list-style-type: none;
        text-align: center;
    }

    .MYPAGE_CONTAINER .user_menu input[type=button] {
        width: 170px;
        height: 50px;
        font-size: 24px;
        background-color: #F08300;
        color: #FFF;
        border: 0px;
        border-radius:5px;
        cursor: pointer;
    }
    
    .MYPAGE_CONTAINER .user_menu input[type=button]:hover {
        color: #343434;
    }
   
    .info_list ul{
        list-style-type: none;
        display: inline-block;
        margin-left: 50px;
        margin-top: 50px;
        margin-bottom: 25px;
    }

    .info_list li {
        float: left;
        margin-right: 90px;
        margin-bottom: 40px;
    }

    .info_list li input {
        height: 30px;
    }
    
    #MyOrder {
    	display: block;
    }

    #MyOrder .MyCash {
        position: absolute;
        /* border: 1px solid; */
        width: 200px;
        height: 30px;
        right: 13%;
        font-size: 18px;
        line-height: 39px;
        font-weight: bold;
    }
    
    .MyCash a[href=CashPage]{
    	position: absolute;
    }
    
    .user_info .MyCash {
        /* border: 1px solid; */
        width: auto;
        height: 30px;
        font-size: 18px;
        font-weight: bold;
        position: relative;
        top: 3px;
    }

    .user_info .Headname {
        /* border: 1px solid; */
        width: 60%;
        font-size: 30px;
        font-weight: bold;
    }

    .Headline {
        display: flex;
    }

    .user_info .CashButton input[type=button] {
        font-size: 18px;
        border: 0px;
        background-color: #F08300;
        color: white;
        padding: 5px;
        cursor: pointer;
        width: 80px;
        border-radius:5px;
    }

    .user_info .CashButton {
    	position: relative;
        margin-left: auto;
        top: 5px;
    }

    .user_info .CashButton input[type=button]:hover {
        color: #343434;
    }

	#MyOrder .order_info {
        /* border: 1px solid; */
        width: 100%;
        display: flex;
        height: 110px;
        align-items: center;
        
    }

    #MyOrder .order_info .order_day {
        /* border: 1px solid; */
        width: 100px;
        text-align: center;
    }

    #MyOrder .order_info .order_image {
        /* border: 1px solid; */
        width: 80px;
        height: 80px;
        margin-left: 20px;
    }
    
    #MyOrder .order_info .order_image img {
        width: 80px;
        height: 80px;
    }

    #MyOrder .order_info .order_name {
        /* border: 1px solid; */
        width: 150px;
        margin-left: 20px;
    }

    #MyOrder .order_info .order_price {
        /* border: 1px solid; */
        width: 100px;
        margin-left: 30px;
        text-align: center;
    }

    #MyOrder .order_info .order_check {
        /* border: 1px solid; */
        width: 100px;
        margin-left: 30px;
        text-align: center;
    }
    
    .Contact {
        height: 400px;
    }

    .Contact .ContactUserInfo {
    	margin-top: 30px;
        display: flex;
        height: 40px;
        margin-bottom: 20px;
        justify-content: space-evenly;
    }

    .Contact .ContactId {
        font-weight: 600;
        
    }

    .Contact .Contactemail {
        font-weight: 600;
    }

    .Contact .Contactproduct_title {
        height: 20px;
        margin-bottom: 5px;
    }

    .Contact .Contactproduct_info {
        border: 1px solid;
        height: 120px;
        margin-bottom: 20px;
        border-color: #F08300;
        overflow: auto;
        -ms-overflow-style: none;
    }
    
	.Contact .Contactproduct_info::-webkit-scrollbar{ display:none; }

    .Contact .Contactuser_comment {
        border: 1px solid;
        height: 120px;
        border-color: #F08300;
        overflow: auto;
        -ms-overflow-style: none;
    }
    
	.Contact .Contactuser_comment::-webkit-scrollbar{ display:none; }
    
    /* 약관 */
details { width:630px; height:50%; margin:0 auto; }
details > summary { background:#F08300; color:#fff; padding:10px; outline:0; border-radius:5px; cursor:pointer; transition:background 0.5s; text-align:center; box-shadow: 1px 1px 2px gray;}
details > summary:hover { color:#343434;}
details > summary::-webkit-details-marker { background:#F08300; color:#fff; background-size:contain; transform:rotate3d(0, 0, 1, 90deg); transition:transform 0.25s;}
details[open] > summary::-webkit-details-marker { transform:rotate3d(0, 0, 1, 180deg);}
details[open] > summary { background:#F08300;}
details[open] > summary ~ * { animation:reveal 0.5s;}
.tpt { background:#F08300; color:#fff; margin:5px 0 10px; padding:5px 10px; line-height:25px; border-radius:5px; box-shadow: 1px 1px 2px gray;}

</style>

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
        <div class="MYPAGE_CONTAINER">
            <div>
                <div class="user_name">
                    HELLO ( <b style="color: #F08300;">${sessionScope.user_id }</b> )
                </div>
                <div class="user_menu">
                    <ul>
                        <li><input type="button" value="My Orders" onclick="OrdersForm()"></li>
                        <li><input type="button" value="My Info" onclick="InfoForm()"></li>
                        <li><input type="button" value="My Contact" onclick="ContactForm()"></li>
                    </ul>
                </div>
            </div>
            <div class="user_info">
                <div id="MyOrder"></div>
                <div id="MyInfo"></div>
                <div id="Contact"></div>
            </div>
        </div>
</div>
<footer><br><br>Welcome Of Our 3Secons of Mars</footer> 
</body>
</html>