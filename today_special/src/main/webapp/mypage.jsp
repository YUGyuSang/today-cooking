<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="./css/myPage.css" type="text/css">
</head>
<body>
    <form action="updateUser.do" method="post" enctype="multipart/form-data">
        <header>
            <div id="header">
                <div>
                    <a href="#"><img src="./img/logo.png" alt="로고"></a>
                </div>
            </div>
        </header>
        <div id="container">
            <div id="mypagetext">
                <h1>마이페이지</h1>
            </div>
            <div id="imgs">
                <div id="myimg">
                    img
                </div>
                    <label class="input-file-button" for="input-file">
                   	업로드
                    </label>
                    <input type="file" id="profile" style="display: none;"accept="image/*,.pdf"/> 
            </div>
            <div class="inputs">
                <input type="password" name="password" value="" placeholder="비밀번호">
            </div>
            <div class="inputs">
                <input type="text" name="name" value="" placeholder="닉네임">
            </div>
            <div id="button">
                <button id="change">변경</button>
                <button id="end">탈퇴</button>
            </div>
        </div>

        
    </form>
</body>
</html>