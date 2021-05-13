<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="getYoutubeList.do?recipe_name=${param.searchKeyword}"
		method="post">
		<button>유튜브 결과</button>
	</form>
	<table border="1" cellpadding="0" cellspacing="0" width="700">
		<c:forEach items="${YoutubeList }" var="youtube">
			<form action="" method="post">
				<tr>
					<td><img src="${youtube.thumbnailUrl }"></td>
					<td>${youtube.title }</td>
					<td>${youtube.url }</td>
				</tr>
			</form>
		</c:forEach>
	</table>
</body>
</html>