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
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="utf-8">
<title>오늘의 요리</title>
<link rel="stylesheet" href="./css/index.css?ver=2" type="text/css">
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
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
            <div id="menu1"><a class="maina" href="#">오늘 베스트 요리</a></div>
            <div id="menu2"><a class="maina" href="#">인기 레시피</a></div>
            <div id="menu3"><a class="maina" href="#">오늘 신상 요리</a></div>
            <div id="menu4"><a class="maina" href="#">주간 베스트 요리</a></div>
        </section>
</div>
	<!-- quick list -->
    <div class="quick_area">
        <ul class="quick_list">
            <li><a href="tel:02-1111-1111"><h3>전화 문의</h3><p>02-1111-1111</p></a></li>
            <li><a href="https://open.kakao.com/o/slfSLFEd"><h3>카카오톡</h3><p>1:1상담</p></a></li>
            <li><a href="#"><h3 class="to_content">마이 레시피</h3></a></li>
        </ul>
        <p class="to_top"><a href="#">TOP</a></p>
    </div>
    <!-- quick list 끝 -->
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
</body>
</html>