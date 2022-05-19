<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img2/logo.png"> <!-- 탭에 로고 박기 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 -->
<script type="text/javascript">
function deleteCart(num) {
    var value = num;
    console.log(value);

    $.ajax({
        url : "deleteCart",
        type : "post",
        data : { "value" : value },
        success : function(result) {
            rightcheck();
        }, error(request, status, error) {
            alert("삭제실패");
            console.log(request);
        }
    });
}
</script>


</head>
<body>


<c:forEach items="${cartList}" var="result">
    <ul class="simple_ul">
        <li>
            <div class="simple">
                <img class="ig" src="${result.product_image }">
                <div class="simple_info">
                    <div class="simple_name"><strong style="font-size: 13px;">${result.product_name}</strong></div>
                    <div class="simple_price">${result.product_price}Point</div>
                </div>
            </div>
            <span class="close-button" onclick="deleteCart(${result.product_num})">&times;</span>
        </li>
    </ul>
</c:forEach>

</body>
</html>