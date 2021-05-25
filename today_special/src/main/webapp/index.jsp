<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<html>
<head>
<meta charset="utf-8">
<title>오늘의 요리</title>
<link rel="stylesheet" href="./css/index.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="<%=header_file %>" />
		</div>
	</div>
<div id="continer">
        <div class="slider">
            <input type="radio" name="slide" id="slide1" checked>
            <input type="radio" name="slide" id="slide2">
            <input type="radio" name="slide" id="slide3">
            <input type="radio" name="slide" id="slide4">
            <ul id="imgholder" class="imgs">
                <li class="mainli"><img class="mainimgs" src="./img/cook5.jpg"></li>
                <li class="mainli"><img class="mainimgs" src="./img/cook6.jpg"></li>
                <li class="mainli"><img class="mainimgs" src="./img/cook7.jpg"></li>
                <li class="mainli"><img class="mainimgs" src="./img/cook4.jpg"></li>
            </ul>
            <div class="bullets">
                <label for="slide1">&nbsp;</label>
                <label for="slide2">&nbsp;</label>
                <label for="slide3">&nbsp;</label>
                <label for="slide4">&nbsp;</label>
            </div>
        </div>

        <section id="menus">
            <div id="menu1" style="background: url(thumbnailView.do?recipeId='getNewRecipe.do') no-repeat center;"><a class="maina" href="#">오늘 베스트 요리</a></div>
            <div id="menu2"><a class="maina" href="#">인기 레시피</a></div>
            <div id="menu3"><a class="maina" href="#">오늘 신상 요리</a></div>
            <div id="menu4"><a class="maina" href="#">주간 베스트 요리</a></div>
        </section>
</div>
	

		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
	
</body>
</html>