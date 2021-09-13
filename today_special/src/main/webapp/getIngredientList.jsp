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
<link rel="stylesheet" href="./css/material.css?ver=2" type="text/css">
<title>재료별 레시피</title>
<script>
	function fn_paging(curPage) {
		location.href = "getSituationRecipe.do?key=전체&curPage=" + curPage;
	}
</script>
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
					<legend>재료별 분류</legend>
					<ul class="recipes">
						<li class="gli"><a href="getIngredientRecipe.do?key=정육"><img src="./img/meat.png" alt="">
								<p>정육</p></a></li>
						<li class="gli"><a href="getIngredientRecipe.do?key=수산"><img src="./img/fish.png" alt="">
								<p>수산</p></a></li>
						<li class="gli"><a href="getIngredientRecipe.do?key=채소"><img src="./img/vegetable.png" alt="">
								<p>채소</p></a></li>
						<li class="gli"><a href="getIngredientRecipe.do?key=계란"><img src="./img/egg.png" alt="">
								<p>계란</p></a></li>
						<li class="gli"><a href="getIngredientRecipe.do?key=과일"><img src="./img/fruit.png" alt="">
								<p>과일</p></a></li>
						<li class="gli"><a href="getIngredientRecipe.do?key=면"><img src="./img/noodle.png" alt="">
								<p>면</p></a></li>
						<li class="gli"><a href="getIngredientRecipe.do?key=떡"><img src="./img/tteok.png" alt="">
								<p>떡</p></a></li>
						<li class="gli"><a href="getIngredientRecipe.do?key=기타"><img src="./img/Various.png" alt="">
								<p>기타</p></a></li>
					</ul>
				</fieldset>
			</div>
			<div id="contents">
				<h1>"${ingredient }" 레시피 결과</h1>
				<hr>
				<div id="te">
					<c:forEach items="${recipeList}" var="recipe">
						<div class="recipebox">
							<div class="boxs">
								<a href="getRecipe.do?recipeId=${recipe.recipeId }"> <img src="/dev/${recipe.recipeThumbnail }" alt="">
								</a>
								<p>
									${recipe.recipeTitle}<br> <span class="sitspan">${recipe.userVO.nickname}</span>
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="sit">
			<c:if test="${pagination.curRange ne 1 }">
				<a href="#" onClick="fn_paging(1)">[처음]</a>
			</c:if>
			<c:if test="${pagination.curPage ne 1}">
				<a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a>
			</c:if>
			<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
				<c:choose>
					<c:when test="${pageNum eq  pagination.curPage}">
						<span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
					</c:when>
					<c:otherwise>
						<a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
				<a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a>
			</c:if>
			<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
				<a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a>
			</c:if>
		</div>
	</form>
	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>