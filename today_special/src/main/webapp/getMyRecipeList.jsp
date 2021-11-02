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
<link rel="stylesheet" href="./css/getMyRecipe.css" type="text/css">
<title>내 레시피</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="<%=header_file %>" />
		</div>
	</div>

	<div id="continer">
		<h1 class="my_h1">
			<img src="./img/cookman.png">내 레시피<img src="./img/cookgirl.png">
		</h1>
		<hr>
		<table id="my_table">
			<tr>
				<c:forEach items="${recipeList}" var="recipe">
					<form action="deleteRecipe.do">
					<input type="hidden" name="recipeId" value="${recipe.recipeId}">
					<td><a href="getRecipe.do?recipeId=${recipe.recipeId }"><img src="/dev/${recipe.recipeThumbnail }" alt=""></a>
						<p>${recipe.recipeTitle }</p>
						<button>삭제</button></td>
					</form>
				</c:forEach>
			</tr>
		</table>
	</div>
	<!-- quick list -->
    <div class="quick_area">
        <ul class="quick_list">
            <li><a href="tel:02-1111-1111"><h3>전화 문의</h3><p>02-1111-1111</p></a></li>
            <li><a href="https://open.kakao.com/o/slfSLFEd"><h3>카카오톡</h3><p>1:1상담</p></a></li>
            <li><a href="#"><h3 class="to_content">오시는 길</h3></a></li>
        </ul>
        <p class="to_top"><a href="#">TOP</a></p>
    </div>
    <!-- quick list 끝 -->
	<div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>