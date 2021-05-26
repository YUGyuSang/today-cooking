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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/ranking.css" type="text/css">
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
            <div class="recipebox">
                <div class="boxs"><a href=""><img src="./img/naver.png" alt=""><p>명: 까르보나 떡볶이 <br>조회수:100 </p></a></div>
            </div>
            <div class="recipebox">
                <div class="boxs"><a href=""><img src="./img/naver.png" alt=""><p>명: 까르보나 떡볶이 <br>조회수:100 </p></a></div>
            </div>
        </div>
        </section>
        <section id="rank02">
        <h1 id="WEEKLY">WEEKLY BEST</h1>
        <hr>
        <div class="te">
            <div class="recipebox">
                <div class="boxs"><a href=""><img src="./img/naver.png" alt=""><p>명: 까르보나 떡볶이 <br>조회수:100 </p></a></div>
            </div>
            <div class="recipebox">
                <div class="boxs"><a href=""><img src="./img/naver.png" alt=""><p>명: 까르보나 떡볶이 <br>조회수:100 </p></a></div>
            </div>
            <div class="recipebox">
                <div class="boxs"><a href=""><img src="./img/naver.png" alt=""><p>명: 까르보나 떡볶이 <br>조회수:100 </p></a></div>
            </div>
            <div class="recipebox">
                <div class="boxs"><a href=""><img src="./img/naver.png" alt=""><p>명: 까르보나 떡볶이 <br>조회수:100 </p></a></div>
            </div>
            <div class="recipebox">
                <div class="boxs"><a href=""><img src="./img/naver.png" alt=""><p>명: 까르보나 떡볶이 <br>조회수:100 </p></a></div>
            </div>
            <div class="recipebox">
                <div class="boxs"><a href=""><img src="./img/naver.png" alt=""><p>명: 까르보나 떡볶이 <br>조회수:100 </p></a></div>
            </div>
            <div class="recipebox">
                <div class="boxs"><a href=""><img src="./img/naver.png" alt=""><p>명: 까르보나 떡볶이 <br>조회수:100 </p></a></div>
            </div>
        </div>
        </section>
    </div>
    </form>
    <div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
</body>
</html>