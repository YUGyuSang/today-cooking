<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="./css/material.css" type="text/css">
    <title>재료별 레시피</title>
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
                        <li class="gli"><a href="#"><img src="./img/meat.png" alt=""><p>정육</p></a></li>
                        <li class="gli"><a href="#"><img src="./img/fish.png" alt=""><p>수산</p></a></li>
                        <li class="gli"><a href="#"><img src="./img/vegetable.png" alt=""><p>채소</p></a></li>
                        <li class="gli"><a href="#"><img src="./img/egg.png" alt=""><p>계란</p></a></li>
                        <li class="gli"><a href="#"><img src="./img/fruit.png" alt=""><p>과일</p></a></li>
                        <li class="gli"><a href="#"><img src="./img/noodle.png" alt=""><p>면</p></a></li>
                        <li class="gli"><a href="#"><img src="./img/tteok.png" alt=""><p>떡</p></a></li>
                        <li class="gli"><a href="#"><img src="./img/Various.png" alt=""><p>기타</p></a></li>
                    </ul>
                </fieldset>
            </div>
            <div id="contents">
                <h1>""레시피 종류</h1>
                <hr>
                <div id="te">
                <div class="recipebox">
                    <div class="boxs"><a href="#"><img src="./img/naver.png" alt=""><p>음식명: <br>가격: </p></a></div>
                </div>
                </div>
            </div>
        </div>
    </form>
    <div id="footer">
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>