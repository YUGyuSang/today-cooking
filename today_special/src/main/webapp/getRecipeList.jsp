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

<h1>Youtube결과</h1>
	<table border="1" cellpadding="0" cellspacing="0" width="700">
		<c:forEach items="${YoutubeList }" var="youtube">
			<form action="" method="post">
				<tr>
					<td><img src="${youtube.thumbnailUrl }"></td>
					<td><a href=${youtube.url }>${youtube.title }</a></td>
				</tr>
			</form>
		</c:forEach>
	</table>
<h1>Naver결과</h1>
	<table border="1" cellpadding="0" cellspacing="0" width="700">
		<c:forEach items="${NaverList }" var="naver">
			<form action="" method="post">
				<tr>
					<td><img src="${naver.thumbnailUrl }"></td>
					<td><a href=${naver.url }>${naver.title }</a></td>
				</tr>
			</form>
		</c:forEach>
	</table>
</body>
</html>