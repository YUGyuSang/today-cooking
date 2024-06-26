<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <link href="./css/header.css?ver=3" rel="stylesheet" type="text/css" />
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
    <form action="getSearchResult.do" method="get">
        <div id="container" class="warp">
            <div id="imger">
                <img id="headerimg" src="./img/logo.png" alt="이미지">
            </div>
            <div id="srarch">
                <input type="search" name="keyword">
                <button class="srarch"><i class="fas fa-search"></i></button>
            </div>
          
            <span class="headerspan"><a href="login.jsp"><i class="fas fa-user"></i></a></span>
            <span class="headerspan"><a href="login.jsp"><i class="fas fa-pen"></i></a></span>
            
        </div>
        
            
                <div id="menu_var" class="wap">
                <nav>
                    <ul>
                        <li class="menu"><a href="index.jsp">메인</a></li>
                        <li class="menu"><a href="getRankingList.do">랭킹</a></li>
                        <li class="menu"><a href="getSituationRecipe.do?key=전체">상황별</a></li>
                        <li class="menu"><a href="getIngredientRecipe.do?key=전체">재료별</a></li>
                    </ul>
                </nav>
                </div>
            
           
    </form>
</body>
</html>