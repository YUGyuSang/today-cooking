<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="./css/myPage.css" type="text/css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var sel_file;
	$(document).ready(function() {
		$(".file").on("change", handleImgFileSelect3);
	});
	console.log('file의 값 = ', $(".file").val());
	function handleImgFileSelect3(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$(".thumb").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
</head>

<body>
	<form action="updateUser.do" method="post"
		enctype="multipart/form-data">
		<header>
			<div id="header">
				<div>
					<a href="index.jsp"><img src="./img/logo.png" alt="로고"></a>
				</div>
			</div>
		</header>
		<div id="container">
			<div id="mypagetext">
				<h1>마이페이지</h1>
			</div>
			<div id="imgs">
				<div id="myimg">
					<img class="thumb" src="profileView.do">
				</div>
				<label class="input-file-button" for="input-file"> 프로필 수정 </label> <input
					type="file" id="input-file" name="bf_profile" style="display: none;"
					accept="image/*,.pdf" class="file" value="${user.profile }"/>
			</div>
			<div class="inputs">
				<input type="text" name="id" value="${user.id }">
			</div>
			<div class="inputs">
				<input type="password" name="password" value="${user.password }">
			</div>
			<div class="inputs">
				<input type="email" name="email" value="${user.email }">
			</div>
			<div class="inputs">
				<input type="text" name="nickname" value="${user.nickname }">
			</div>
			<div id="button">
				<button id="change">수정</button>
				<button id="end" onclick="javascript: form.action='deleteUser.do';">탈퇴</button>
			</div>
		</div>
	</form>
</body>
</html>