<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/signUp.css" type="text/css">
    <title>오늘의 요리: 회원가입</title>
</head>
<body>
    <header>
        <div id="header">
            <div>
                <a href="#"><img src="./img/logo.png" alt="로고"></a>
            </div>
        </div>
    </header> 
    <form action="insertUser.do" method="post" enctype="multipart/form-data">
	    <div id="container">
	        <div id="signtext">
	            <h1>회원가입</h1>
	        </div>
	        <div class="inputs">
	            <input type="text" name="id" placeholder="아이디">
	        </div>
	        <div class="inputs">
	            <input type="password" name="password" placeholder="비밀번호">
	        </div>
	        <div class="inputs">
	            <input type="password" placeholder="비밀번호 재확인">
	        </div>
	        <div class="inputs">
	            <input type="email" name="email" placeholder="이메일">
	        </div>
	        <div class="inputs">
	            <input type="text" name="nickname" value="" placeholder="닉네임">
	        </div>
	        <div class="inputs">
	            <input type="file" name="bf_profile">
	        </div>
	        <div id="signupbtn">
	            <button>완료</button>
	        </div>
	    </div>
    </form>
</body>
</html>