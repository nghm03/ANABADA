<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img2/logo.png"> <!-- 탭에 로고 박기 -->
<script type="text/javascript">
function deleteCart2(num) {
	var value = num;
	console.log(value);
	
 	$.ajax({
		url : "deleteCart2",
		type : "post",
		data : { "value" : value },
		success : function(result) {
			unfold();
		}, error(request, status, error) {
			alert("삭제실패");
			console.log(request);
		}
	}); 
}

function CashPage() {
	if(!confirm("충전 페이지로 가시겠습니까?")) {
		
	} else {
		location.href = "CashPage";
	}
}

$(document).ready(function(){
	$.ajax({
		url : "priceInfo",
		type : "post",
		success : function(result) {
			$("#userCash").prepend(result.Cash);
			$("#Total").prepend(result.Total);
		}, error(request, status, error) {
			alert("값 불러오기 실패");
			console.log(request);
		}
	});
})

function BuyItem() {
	if(!confirm("구매하시겠습니까?")) {
		// 아니오
	} else {
		// 예
		var userCash = $("#userCash").html();
		var Total = $("#Total").html()
		
		if(Number(userCash) < Number(Total)) {
			if(!confirm("캐시부족 캐시 충전 페이지로 가시겠습니까?")) {
				
			} else {
				location.href = "CashPage";
			}
		} else {
			location.href = "checkOut";
		} 
	}
}

</script>
</head>
<body>
<div class="opencart">
	<div class="maincart">
		<section class="item">
			<h2>MY CART</h2>
			<hr>
			<ul>
				<c:forEach items="${cartList}" var="result">
				
				<li>
					<div class="bundle">
						<div class="item_img"><img src="${result.product_image }"></div>
						<div class="item_text">
							<strong>${result.product_name}</strong>
							<p>${result.product_content}</p>
						</div>
						<div class="item_amount">${result.product_price} ANA</div>
						<div class="item_price">&nbsp</div>
						<span class="close-button" onclick="deleteCart2(${result.product_num})">&times;</span>
					</div>
					<hr>
				</li>
				</c:forEach>
			</ul>
		</section>
		<div class="checkout">
			<div class="total">
				<h2>ORDER SUMMARY</h2>
				<hr>
				<p style="font-size: 20px;">Your ANA<div id="userCash"></div></p>
				<p style="font-size: 20px;">Total<div id="Total"></div></p>
			</div>
			<div class="check">
				<p><input type="button" value="CheckOut" onclick="BuyItem()"></p>
				<p><input type="button" value="Charge" onclick="CashPage()"></p>
			</div>
		</div>
	</div>
</div>

</body>
</html>
