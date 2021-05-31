<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
request.setCharacterEncoding("utf-8");
String header_file;
String login_check = (String) session.getAttribute("loginId");
if (login_check != null) {
	header_file = "afterHeader.jsp";
} else {
	header_file = "header.jsp";
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/getsituation.css?ver=2" type="text/css">
<title>상황별 레시피</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="<%=header_file%>" />
		</div>
	</div>
	<form action="">
		<div id="continer">
			<div id="legend">
				<fieldset>
					<legend>상황별 분류</legend>
					<ul class="recipes">
						<li class="gli"><a href="getSituationRecipe.do?key=파티"><img src="./img/party.png" alt="">
							<p>파티</p></a></li>
						<li class="gli"><a href="getSituationRecipe.do?key=캠핑"><img src="./img/camping.png" alt="">
							<p>캠핑</p></a></li>
						<li class="gli"><a href="getSituationRecipe.do?key=술안주"><img src="./img/vodka.png" alt="">
							<p>술 안주</p></a></li>
						<li class="gli"><a href="getSituationRecipe.do?key=야식"><img src="./img/Midnight meal.png" alt="">
							<p>야식</p></a></li>
						<li class="gli"><a href="getSituationRecipe.do?key=간식"><img src="./img/Snack.png" alt="">
							<p>간식</p></a></li>
						<li class="gli"><a href="getSituationRecipe.do?key=집들이"><img src="./img/home.png" alt="">
							<p>집들이</p></a></li>
						<li class="gli"><a href="getSituationRecipe.do?key=스피드"><img src="./img/speed.png" alt="">
							<p>스피드</p></a></li>
						<li class="gli"><a href="getSituationRecipe.do?key=기타"><img src="./img/Various.png" alt="">
							<p>기타</p></a></li>
					</ul>
				</fieldset>
			</div>
			<div id="contents">
				<h1>"${situation }" 레시피 결과</h1>
				<hr>
				<div id="te">
					<c:forEach items="${recipeList}" var="recipe">
						<div class="recipebox">
							<div class="boxs">
								<img src="/today_img/${recipe.recipeThumbnail }" alt="" style="width: 150px">
								<p>${recipe.recipeTitle}
									<br><span class="sitspan">${recipe.userVO.nickname}</span>
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</form>
	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>