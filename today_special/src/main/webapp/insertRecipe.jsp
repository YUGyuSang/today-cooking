<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레시피</title>
<link rel="stylesheet" href="./css/insertRecipe.css" type="text/css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
<script>
        const add_ingredient = () => {
            const box = document.getElementById("t2");
            const newP = document.createElement('p');
            newP.innerHTML = "<div class='material1'><input class='mater_input' type='text'><input class='mater_input' type='text'> <button type='button' onclick='remove_ingredient(this)'>삭제</button></div> ";
            box.appendChild(newP);
        }
        const remove_ingredient = (obj) => {
            document.getElementById('t2').removeChild(obj.parentNode.parentNode);
        }
        const add_order = () => {
            const box = document.getElementById("t3");
            const newP = document.createElement('p');
            const num=document.getElementById("t3").childElementCount;
            newP.innerHTML = "<div class='foodlist'><span>step"+num+"</span><input type=hidden name='orderNum' value="+num+"><textarea id='orderContent' cols='30' rows='10'></textarea><button type='button' onclick='remove_order(this)'>삭제</button></div>";

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
			<jsp:include page="afterHeader.jsp" />
		</div>
	</div>
	<form action="insertRecipe.do">
		<div id="continer">
			<h1>레시피 등록</h1>
			<section id="t1">
				<div id="meun1">
					<h3>레시피 제목</h3>
					<input class="meun1_input" type="text" placeholder="예)얼큰한 순대국 만들기">
				</div>
				<div id="meun2">
					<h3>요리소개</h3>
					<p>
						<textarea name="요리소개글" id="" cols="50" rows="3"
							placeholder="내용을 입력하세요."></textarea>
					</p>
				</div>
				<div id="meun3">
					<img src="#" alt="대표사진">
				</div>
				<label class="input-file-button" for="input-file"> 업로드 </label> <input
					type="file" id="input-file" style="display: none;"
					accept="image/*,.pdf" />
				<div id="meun4">
					<h3>카테고리</h3>
					<select name="" id="">
						<option value="상황별">상황별</option>
						<option value="조무사">조무사</option>
						<option value="무직">무직</option>
						<option value="백엔드개발자">백엔드개발자</option>
						<option value="야구선수">야구선수</option>
						<option value="주부">주부</option>
						<option value="농부">농부</option>
					</select>
					 <select name="" id="">
						<option value="상황별">재료별</option>
						<option value="조무사">조무사</option>
						<option value="무직">무직</option>
						<option value="백엔드개발자">백엔드개발자</option>
						<option value="야구선수">야구선수</option>
						<option value="주부">주부</option>
						<option value="농부">농부</option>
					</select>
				</div>

			</section>

			<section id="t2">
				<h3>재료</h3>
				<div class="material1">
					<input class="mater_input" type="text" placeholder="예)고기">
					<input class="mater_input" type="text" placeholder="예)100g">
					<button type="button" onclick='remove_ingredient(this)'>삭제</button>
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
					<span>step1</span>
					<input type=hidden name="orderNum" value="1">
					<textarea name="orderNum" cols="30" rows="10"
						placeholder="예)소고기는 기름기 때어내고 적당한 크기로 썰어주세요."></textarea>
					<button type="button" onclick="remove_order(this)">삭제</button>
				</div>
			</section>
			<div id="material1plus">
				<button type="button" onclick="add_order()">
					<i class="fas fa-plus"></i>
				</button>
			</div>

		</div>
	</form>
	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>