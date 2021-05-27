<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
	String header_file;
    String login_check=(String)session.getAttribute("loginId");
    if(login_check!=null){
        header_file="afterHeader.jsp";
     }else{
    	 header_file="header.jsp";
     }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/getBookmark.css" type="text/css">
<title>북마크</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="<%=header_file %>" />
		</div>
	</div>
	<div id="continer">
		<h1 class="book_h1">
			북마크<img src="./img/bookmark.png" alt="">
		</h1>
		<hr>
		<table id="book_table">
			<tr>
				<c:forEach items="${recipeList}" var="recipe">
					<form action="deleteBookmarkInner2.do">
						<input type="hidden" name="recipeId" value=${recipe.recipeId }>
						<td><a href="getRecipe.do?recipeId=${recipe.recipeId }"><img src="/today_img/${recipe.recipeThumbnail }" alt=""></a>
							<p>${recipe.recipeTitle }</p>
							<button>삭제</button></td>
					</form>
				</c:forEach>
				<c:forEach items="${outerList}" var="outer">
					<form action="deleteBookmarkOuter.do">
						<input type="hidden" name="outerId" value=${outer.outerId }>
						<td><a href="${outer.outerUrl }" target="_blank"><img src="${outer.outerThumbnail }" alt=""></a>
							<p>${outer.outerTitle }</p>
							<button>삭제</button></td>
					</form>
				</c:forEach>

			</tr>
		</table>
	</div>
	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>