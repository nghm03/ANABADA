<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 페이지</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img2/logo.png"> <!-- 탭에 로고 박기 -->
<script type="text/javascript">

</script>
<style type="text/css">
/* 폰트 */

.centerdiv {
	margin: auto;
	text-align: center;
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
	text-decoration: none;
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
	background-color: rgba(240, 239, 232, 0.4 );/* 배경색 + 투명도 지정 */
	font-weight: bold;
}

td {
	width: 600px;
	padding: 3px;
	text-align: left;
}

text {

}

 th:first-child, td:first-child {
    border-left: none;
  } /* 테이블 왼쪽 선 제거 */

input#button {
	height: 35px;
	width: 100px;
	background-color: rgba(240, 238, 236, 0.7);/* 배경색 + 투명도 지정 */
	border-color: f7c147;/* 버튼 테두리색 */
	border-radius: 4px;
	margin: 5px;
}

input[type="text"] {
	height: 30px;
	width: 300px;
	margin:10px 0px 0px 10px;
}

input[type="select"] {
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
    text-align: center;
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
    text-align: center;
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

/* 이미지 변환 */

    #converter {
      padding: 20px 20px;
      border-radius: 5px;
      background-color: #f8f8f8;
      width: 100%;
      padding: 15px 15px;
    }

    #converter textarea {
      display: block;
      white-space: wrap;
      border: 1px solid #888;
      border-radius: 5px;
      margin-bottom: 10px;
      padding: 5px 5px;
      width: 100%;
      height: 60px;
    }

    #converter label {
      font-weight: bold;
      color: #333;
    }

    #converter button {
      font-weight: bold;
    }

    #btn-convert {
      width: 100%;
    }

    #convert-result {
      margin-top: 20px;
    }

/* 햄버거 */

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
	display: flex;
	justify-content: center;
	width:300px;
	height: 100%;
	background: #222;
	position: fixed;
	top: 0;
	left: -300px;
	z-index:2;
	transition:all .35s;
}

input[id="menuicon"]:checked + label + div {
	left: 0;
}

input[id="menuicon"]:checked + label {
	z-index:3;
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
</style>

</head>
<body>

	<!-- 햄버거 바 -->
	<div>
		<input type="checkbox" id="menuicon" name="menuicon" onclick="leftcheck()">
		<label id="wait" for="menuicon">
			<span></span>
			<span></span>
			<span></span>
		</label>
		<div class="sidebar">
			<div class="sidemenu">
				<p><a href="addProduct">상품 등록</a></p>
				<p><a href="managerTable?num=1">유저 관리</a></p>
				<p><a href="managerTable?num=2">게시글 관리</a></p>
				<p><a href="managerTable?num=3">주문 목록</a></p>
				<p><a href="managerTable?num=4">판매완료</a></p>
				<p><a href="/mars/logout">관리자 종료</a></p>
			</div>
		</div>
	</div>
	<!-- 햄버억 -->



	<c:if test="${num == 0 }">
		<h1 style="text-align: center"> 상품추가 </h1>
		<div class="centerdiv">
			<form id="joinForm" action="addProduct" method="post">
				<a id = "top">추가정보</a>
					<table>
						<tr>
							<th>제품명<a style="color: red">*</a></th>
							<td>
								<input type="text" name="product_name" id="product_name" placeholder="ID 제품명">
							</td>
						</tr>
						<tr>
							<th>제품 가격<a style="color: red">*</a></th>
							<td>
								<input type="text" name="product_price" id="product_price" placeholder="제품 가격"><br>
							</td>
						</tr>
						<tr>
							<th>제품 종류<a style="color: red">*</a></th>
							<td>
								<input type="hidden" name="product_category" id="product_category">
								<select id="product_category" name="product_category" style="height: 30px; width: 300px; margin:10px 0px 0px 10px;">
				                    <option value="" disabled selected>선택해주세요</option>
				                    <option value="1">의류</option>
				                    <option value="2">장신구</option>
				                    <option value="3">전자기기</option>
				                    <option value="4">식품</option>
				                   	<option value="5">기타</option>
				                </select>
							</td>
						</tr>
						<tr>
							<th>제품 내용<a style="color: red">*</a></th>
							<td>
							    <textarea name="product_content" id="product_content"
							     style="margin:10px 0px 0px 10px; width: 500px; height: 250px; resize: none;" placeholder="제품 내용"></textarea>
							</td>
						</tr>
						<tr>
							<th>제품 사진<a style="color: red">*</a></th>
							<td>
								<input type="text" name="product_image" id="product_image" placeholder="이미지 경로">
							</td>
						</tr>
					</table>
					<details>
						<summary>글을 등록 하시겠습니까? 다시 한번 확인 해주세요</summary>
						<table>
							<tr>
								<td style="width: 830px; text-align: center;"><br>
				   					<a>네 제대로 확인하였습니다.</a>
				   					<input type="checkbox" name="product_stock" id="product_stock" value="1" required><br>
				   					
								</td>
							</tr>
						</table>
					</details><br>
					<input class="w-btn w-btn-gra1" type="submit" value="등록하기">
				</form>
			</div>
		
	</c:if>
	
	<c:if test="${num > 0 }">
		<h1 style="text-align: center"> 상품수정 </h1>
			<div class="centerdiv">
				<form id="joinForm" action="updateProduct" method="post">
					<a id = "top">수정정보</a>
						<table>
							<tr>
								<th>제품명<a style="color: red">*</a></th>
								<td>
									<input type="text" name="product_name" id="product_name" value="${pv.product_name }">
								</td>
							</tr>
							<tr>
								<th>제품 가격<a style="color: red">*</a></th>
								<td>
									<input type="text" name="product_price" id="product_price" value="${pv.product_price }"><br>
								</td>
							</tr>
							<tr>
								<th>제품 종류<a style="color: red">*</a></th>
								<td>
									<input type="hidden" name="product_category" id="product_category">
									<select id="product_category" name="product_category"
									style="height: 30px; width: 300px; margin:10px 0px 0px 10px;">
										<c:choose>
											<c:when test="${pv.product_category == 1}">
												<option value="1" selected>의류</option>
												<option value="2">장신구</option>
												<option value="3">전자기기</option>
												<option value="4">식품</option>
												<option value="5">기타</option>
											</c:when>
											<c:when test="${pv.product_category == 2}">
												<option value="1">의류</option>
												<option value="2" selected>장신구</option>
												<option value="3">전자기기</option>
												<option value="4">식품</option>
												<option value="5">기타</option>
											</c:when>
											<c:when test="${pv.product_category == 3}">
												<option value="1">의류</option>
												<option value="2">장신구</option>
												<option value="3" selected>전자기기</option>
												<option value="4">식품</option>
												<option value="5">기타</option>
											</c:when>
											<c:when test="${pv.product_category == 4}">
												<option value="1">의류</option>
												<option value="2">장신구</option>
												<option value="3">전자기기</option>
												<option value="4" selected>식품</option>
												<option value="5">기타</option>
											</c:when>
											<c:when test="${pv.product_category == 5}">
												<option value="1">의류</option>
												<option value="2">장신구</option>
												<option value="3">전자기기</option>
												<option value="4">식품</option>
												<option value="5" selected>기타</option>
											</c:when>
										</c:choose>
									</select>
								</td>
							</tr>
							<tr>
								<th>제품 내용<a style="color: red">*</a></th>
								<td>
								    <textarea name="product_content" id="product_content"
								     style="margin:10px 0px 0px 10px; width: 500px; height: 250px; resize: none;">${pv.product_content }</textarea>
								</td>
							</tr>
							<tr>
								<th>제품 사진<a style="color: red">*</a></th>
								<td>
									<input type="text" name="product_image" id="product_image" value="${pv.product_image }">
								</td>
							</tr>
						</table>
						<details>
							<summary>글을 수정 하시겠습니까? 다시 한번 확인 해주세요</summary>
							<table>
								<tr>
									<td style="width: 830px; text-align: center;"><br>
						   				<a>네 수정하겠습니다.</a>
						   				<input type="checkbox" name="product_stock" id="product_stock" value="1" required><br>
						   				<input type="hidden" name="product_num" id="product_num" value="${pv.product_num }">
									</td>
								</tr>
							</table>
						</details><br>
						<input class="w-btn w-btn-gra1" type="submit" value="수정하기">
					</form>
				</div>
	</c:if>


 <div id="converter">
    <label>Google Drive path</label>
    <textarea id="gd-url" placeholder="Input Google Drive Url"></textarea>
    <button id="btn-convert" class="btn btn-primary">Make Google Drive Path Linkable</button>
    <div id="convert-result">
      <label for="result">Linkable Image path</label>
      <textarea id="result" name="result" readonly></textarea>
      <button id="btn-save-result-cb" class="btn btn-success pull-right" data-clipboard-target="#result">
        <span class="glyphicon glyphicon-copy" aria-hidden="true"></span>
        Save to Clipboard
      </button>
      <br><br>
      <label for="result-img-tag">Image Tag</label>
      <textarea id="result-img-tag" name="result" readonly></textarea>
      <button id="btn-save-result-img-tag-cb" class="btn btn-success pull-right" data-clipboard-target="#result-img-tag">
        <span class="glyphicon glyphicon-copy" aria-hidden="true"></span>
        Save to Clipboard
      </button>
    </div>
    <br><br><br>
      <p align="center">
      <b>Preview image</b>
      </p>
    <p align="center">
      <img id="preview" alt="image preview" src='https://www.google.com/drive/static/images/drive/logo-drive.png' class="img-thumbnail" style="max-width: 200px"/><br>
    </p>

  </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>
  <script>
    var gdUrl = $("#gd-url");
    $("#btn-convert").on("click", function(event) {

      if (!isValidUrl(gdUrl.val())) {
        alert("You have inputted invalid path.");
        gdUrl.val("");
        return;
      }

      var gdId = extractFileId(gdUrl.val());
      var prefix = "http://drive.google.com/uc?export=view&id=";
      $("#result").val(prefix + gdId);
      $("#result-img-tag").val(
        "<img src='" +
        prefix + gdId +
        "' /><br>");
      $("#preview").attr("src", prefix + gdId);
    });

    var clipboard = new Clipboard('.btn');

    clipboard.on('success', function(e) {
      console.info('Action:', e.action);
      console.info('Text:', e.text);
      console.info('Trigger:', e.trigger);

      e.clearSelection();
    });

    clipboard.on('error', function(e) {
      console.error('Action:', e.action);
      console.error('Trigger:', e.trigger);
    });

    // validity check. ref: https://gist.github.com/jlong/2428561
    function isValidUrl(url) {
      // to be impl...
      var parser = document.createElement('a');
      parser.href = url;

      if(url === '' || parser.hostname !== "drive.google.com" || !parser.pathname.includes("/file/d/"))
        return false;

      return true;
    }

    function extractFileId(url) {
      if (!url) 
        url = window.location.href;

      var strip = url.replace(/https:\/\/drive.google.com\/file\/d\//gi, "")
      .replace(/\/view\?[a-zA-Z=\/]+/gi, "");
      
      return strip;
    }
  </script>

</body>
</html>