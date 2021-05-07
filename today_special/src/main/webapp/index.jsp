<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contentPage=request.getParameter("contentPage");
    if(contentPage==null)
        contentPage="FirstView.jsp"; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
	</div>
	
	<div id="wrap2">
		<div id="body">
			<h2>안녕</h2>
		</div>
	</div>
	
	<div id="wrap3">
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>