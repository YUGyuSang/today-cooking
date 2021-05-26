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
<link rel="stylesheet" href="./css/getRecipe.css" type="text/css">
<title>"" | 소개</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="<%=header_file %>" />
		</div>
	</div>
	<form action="">
		<div id="continer">
			<div id="title">
				<img src="/today_img/${recipe.recipeThumbnail }" alt="소개 이미지">
				<div class="title_h">
					<h1>${recipe.recipeTitle }</h1>
				</div>
				<div class="btn">
					<button>
						<img src="./img/bookmark.png" alt="">
					</button>
					<p>${recipe.bookmarkCount }</p>
				</div>
				<div class="mat_sit">
					<p>
						상황 분류: ${recipe.recipeSituation } <br>재료 분류: ${recipe.recipeIngredient }
					</p>
				</div>
			</div>
			<hr>
			<div id="title_2">

				<h3>재료</h3>
				<table>
					<c:forEach items="${ingredientList}" var="ingredient">
						<tr>
							<td><div class="menu">${ingredient.ingredientName}</div></td>
							<td><div class="menu">${ingredient.ingredientAmount}</div></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="title_3">
				<h3>요리 순서</h3>
				<c:forEach items="${orderList}" var="order">
				<div class="order">
					<span>Step${order.orderNum }</span>
					<div class="order_menu">${order.orderContent }</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</form>
	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>