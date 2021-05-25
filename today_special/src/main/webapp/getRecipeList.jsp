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
<link rel="stylesheet" href="./css/getRecipeList.css" type="text/css">
<title>레시피 검색 결과</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="<%=header_file%>" />
		</div>
	</div>
	<form action="">
		<div id="continer">
			<div id="search_list">
				<h1>"${searchKeyword }" 검색 결과</h1>
				<table id="search_table">
					<tr>
						<c:forEach items="${recipeList}" var="recipe">
							<img src="/today_img/${recipe.recipeThumbnail }" style="width:150px">
							<form action="" method="post">
								<td>
									<p class="search_p">

										<span class="getspan">${recipe.recipeTitle}</span> <br> <b>작성자: </b> <span class="getspan">${recipe.userId}</span>
									</p>
								</td>
							</form>
						</c:forEach>
					</tr>
				</table>
			</div>
			<div id="Youtube_list">
				<h1 id="you">
					<img class="youtubeico" src="./img/youtube1.png" alt="유튜브">YouTube 검색 결과
				</h1>

				<hr>

				<table id="youtube_table">

					<c:forEach items="${YoutubeList }" var="youtube">
						<form action="" method="post">
							<tr>
								<td><a href=${youtube.url }><img class="youico" src="${youtube.thumbnailUrl }" alt=""></a></td>
								<td class="t2"><a href=${youtube.url }><p class="youtube_p">${youtube.title }</a>
									</p></td>
								<td><div class="bookmark">
										<button>
											<img src="./img/bookmark.png" alt="">
										</button>
									</div></td>
								<!-- <div class="bookmark"><a href=""><img src="./img/bookmark.png" alt=""></a></div> -->
							</tr>
						</form>
					</c:forEach>
				</table>
			</div>
			<div id="Naver_list">
				<h1 id="naver">
					<img class="navericos" src="./img/naver1.png" alt="네이버">네이버 검색 결과
				</h1>

				<hr>
				<table id="naver_table">
					<c:forEach items="${NaverList }" var="naver">
						<form action="" method="post">
							<tr>
								<td class="t1"><a href=${naver.url }><img class="naverico" src="${naver.thumbnailUrl }" alt=""></a></td>
								<td class="t2"><a href=${naver.url }><p class="naver_p">${naver.title }</a>
									</p></td>
								<td class="t3"><button>
										<img src="./img/bookmark.png" alt="">
									</button></td>
								<!-- <div class="bookmark"><a href=""><img src="./img/bookmark.png" alt=""></a></div> -->
							</tr>
						</form>
					</c:forEach>
				</table>
			</div>
		</div>
	</form>
	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>