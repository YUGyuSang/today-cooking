<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="./css/login.css" type="text/css">
</head>
<body>
    <header>
        <div id="header">
            <div>
                <a href="index.jsp"><img src="./img/logo.png" alt="로고"></a>
            </div>
        </div>
    </header>
	<form action="login.do" method="post">
        <div id="container">
            <div>
                <h1>로그인</h1>
            </div>
            <div class="inputs">
                <input type="text" name="id" placeholder="아이디">
            </div>
            <div>
                <a href=""><button id="log">로그인</button></a>
            </div>
            <div class="inputsd">
                <input type="password" name="password" value="" placeholder="비밀번호">
            </div>
            <div class="signup">
                <a href="signUp.jsp"><button type="button" id="signup">회원가입</button></a>
            </div>
        </div>
    </form>
</body>
</html>