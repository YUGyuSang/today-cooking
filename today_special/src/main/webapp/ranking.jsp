<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="./css/ranking.css?ver=1" type="text/css">
    <title>랭킹</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="<%=header_file %>" />
		</div>
	</div>
    <form action="">
    <div id="continer">
        <section id="rank01">
        <h1 id="today">TODAY BEST</h1>
        <hr>
        <div class="te">
        <c:forEach items="${todayList}" var="today">
            <div class="recipebox">
                <div class="boxs"><a href="getRecipe.do?recipeId=${today.recipeId }"><img src="/dev/${today.recipeThumbnail }" alt=""><p>${today.recipeTitle } <br>북마크: ${today.bookmarkCount }  </p></a></div>
            </div>
        </c:forEach>
        </div>
        </section>
        <section id="rank02">
        <h1 id="WEEKLY">WEEKLY BEST</h1>
        <hr>
        <div class="te">
         <c:forEach items="${weeklyList}" var="weekly">
            <div class="recipebox">
                <div class="boxs"><a href="getRecipe.do?recipeId=${weekly.recipeId }"><img src="/dev/${weekly.recipeThumbnail }" alt=""><p>${weekly.recipeTitle } <br>북마크: ${weekly.bookmarkCount } </p></a></div>
            </div>
         </c:forEach>
        </div>
        </section>
    </div>
    </form>
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