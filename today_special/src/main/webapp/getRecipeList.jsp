<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String search = request.getParameter("recipe_name");
%>
<body>
	<form action="getYoutubeList.do?recipe_name=<%= search %>" method="post">
		<button>유튜브 결과</button>
	</form>
	<table border="1" cellpadding="0" cellspacing="0" width="700">
		<tr>
			<th bgcolor="orange" width="100">번호</th>
			<th bgcolor="orange" width="200">제목</th>
			<th bgcolor="orange" width="150">작성자</th>
			<th bgcolor="orange" width="150">등록일</th>
			<th bgcolor="orange" width="100">조회수</th>
		</tr>
		<c:forEach items="${YoutubeList }" var="youtube">
			<tr>
				<td>${youtube.videoId }</td>
				<td>${youtube.title }</td>
				<td>${youtube.thumbnailUrl }</td>
				<td>${youtube.url }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>