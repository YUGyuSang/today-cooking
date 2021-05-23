<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>오늘의 요리: 마이페이지</title>
<link rel="stylesheet" href="./css/myPage.css" type="text/css">
</head>
<body>
	<form action="updateUser.do" method="post"
		enctype="multipart/form-data">
		<header>
			<div id="header">
				<div>
					<a href="#"><img src="./img/logo.png" alt="로고"></a>
				</div>
			</div>
		</header>

		<div id="container">
			<div id="mypagetext">
				<h1>마이페이지</h1>
			</div>
			<div id="imgs">
				<div id="myimg">
					<img src="profileView.do">
				</div>
				<label class="input-file-button" for="input-file"> 프로필 수정 </label> <input
					type="file" id="input-file" name="profile" style="display: none;"
					accept="image/*,.pdf" onchange="setThumbnail(event);"/>
				<script>
					function setThumbnail(event) {
						var reader = new FileReader();
						reader.onload = function(event) {
							var img = document.createElement("img");
							img.setAttribute("src", event.target.result);
							document.querySelector("div#myimg")
									.appendChild(img);
						};
						reader.readAsDataURL(event.target.files[0]);
					}
				</script>


			</div>
			<div class="inputs">
				<input type="text" name="password" value="${user.id }">
			</div>
			<div class="inputs">
				<input type="password" name="password" value="${user.password }">
			</div>
			<div class="inputs">
				<input type="email" name="password" value="${user.email }">
			</div>
			<div class="inputs">
				<input type="text" name="name" value="${user.nickname }">
			</div>
			<div id="button">
				<button id="change">수정</button>
				<button id="end">탈퇴</button>
			</div>
		</div>
	</form>
</body>
</html>