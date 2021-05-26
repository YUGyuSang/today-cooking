<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
String header_file;
String login_check = (String) session.getAttribute("loginId");
if (login_check != null) {
	header_file = "afterHeader.jsp";
} else {
	header_file = "header.jsp";
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레시피</title>
<link rel="stylesheet" href="./css/insertRecipe.css?ver=1" type="text/css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
<script>
        const add_ingredient = () => {
            const box = document.getElementById("t2");
            const newP = document.createElement('p');
            newP.innerHTML = "<div class='material1'><input class='mater_input' type='text' name='ingredientName'><input class='mater_input' type='text' name='ingredientAmount'> <button type='button' onclick='remove_ingredient(this)'> 삭제</button></div> ";
            box.appendChild(newP);
        }
        const remove_ingredient = (obj) => {
            document.getElementById('t2').removeChild(obj.parentNode.parentNode);
        }
        const add_order = () => {
            const box = document.getElementById("t3");
            const newP = document.createElement('p');
            const num=document.getElementById("t3").childElementCount;
            newP.innerHTML = "<div class='foodlist'><span>step"+num+"</span><textarea id='orderContent' cols='30' rows='10' name='orderContent'></textarea><button type='button' onclick='remove_order(this)'> 삭제</button></div>";
            box.appendChild(newP);
        }
        const remove_order = (obj) => {
            document.getElementById('t3').removeChild(obj.parentNode.parentNode);
        }
    </script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="<%=header_file%>" />
		</div>
	</div>
	<form action="insertRecipe.do" method="post" enctype="multipart/form-data">
		<div id="continer">
			<h1>레시피 등록</h1>
			<section id="t1">
				<div id="meun1">
					<input type=hidden name="recipeId" value="${recipeId} "> <input type=hidden name="userId"
						value="${loginId} ">
					<h3>레시피 제목</h3>
					<input class="meun1_input" type="text" placeholder="예)얼큰한 순대국 만들기" name="recipeTitle">
				</div>
				<div id="meun2">
					<h3>요리소개</h3>
					<p>
						<textarea id="" cols="50" rows="3" placeholder="내용을 입력하세요." name="recipeContent"></textarea>
					</p>
				</div>
				<div id="meun3">
					<img class="thumb" style="width: 200px; height: 200px;">
				</div>
				<label class="input-file-button" for="input-file"> 업로드 </label> <input type="file" id="input-file" class="file"
					style="display: none;" accept="image/*,.pdf" name="recipeThumb" />
				<!-- name 일부러 다르게 해야 vo에 자동으로 들어가지 않음 -->
				<div id="meun4">
					<h3>카테고리</h3>
					<select name="recipeSituation" id="">
						<option value="상황별">상황별</option>
						<option value="캠핑">캠핑</option>
						<option value="술_안주">술 안주</option>
						<option value="야식">야식</option>
						<option value="간식">간식</option>
						<option value="집들이">집들이</option>
						<option value="스피드">스피드</option>
						<option value="기타">기타</option>
					</select> <select name="recipeIngredient" id="">
						<option value="재료별">재료별</option>
						<option value="정육">정육</option>
						<option value="수산">수산</option>
						<option value="채소">채소</option>
						<option value="계란">계란</option>
						<option value="과일">과일</option>
						<option value="면">면</option>
						<option value="떡">떡</option>
						<option value="기타">기타</option>
					</select>
				</div>

			</section>
				<section id="t2">
					<h3>재료</h3>
					<div class="material1">
						<input class="mater_input" type="text" placeholder="예)고기" name="ingredientName"> <input
							class="mater_input" type="text" placeholder="예)100g" name="ingredientAmount">
<!-- 						<button type="button" onclick='remove_ingredient(this)'>삭제</button> -->
					</div>
				</section>
			<div id="material1plus">
				<button type="button" onclick="add_ingredient()">
					<i class="fas fa-plus"></i>
				</button>
			</div>


			<section id="t3">
				<h3>요리순서</h3>
				<div class="foodlist">
					<span>step1</span> <input type=hidden name="orderNum" value="1">
					<textarea cols="30" rows="10" placeholder="예)소고기는 기름기 때어내고 적당한 크기로 썰어주세요." name="orderContent"></textarea>
<!-- 					<button type="button" onclick="remove_order(this)">삭제</button> -->
				</div>
			</section>
			<div id="material1plus">
				<button type="button" onclick="add_order()">
					<i class="fas fa-plus"></i>
				</button>
			</div>
			<div id="ok">
				<button>등록</button>
			</div>

		</div>
	</form>
	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>