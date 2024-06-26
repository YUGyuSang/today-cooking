<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>afterheader</title>
    <link href="css/afterheader.css?after" rel="stylesheet" type="text/css" />
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
    <form action="getSearchResult.do" method="get">
        <div id="container" class="warp">
            <div id="imger">
                <img id="logo" src="./img/logo.png" alt="이미지">
            </div>
            <div id="srarch">
                <input class="srarchinput" type="search" name="keyword">
                <button class="srarch"><i class="fas fa-search"></i></button>
            </div>
          
            <div class="dropdown">
                <button class="dropbtn" style="background: url(profileView.do); background-size: cover;">
                    <!--드롭버튼--> 
                </button>
                <div class="dropdown-content" style="z-index:2;">
                    <a href="getUser.do">마이페이지</a>
                    <a href="getMyRecipeList.do">내가 쓴 글</a>
                    <a href="getBookmarkList.do">북마크</a>
                    <a href="logout.do">로그아웃</a>
                </div>
            </div>
            <span id="headerspan"><a href="getMaxRecipeId.do"><i class="fas fa-pen"></i></a></span>
            
        </div>
        
            
                <div id="menu_var" class="wap">
                    <nav>
                        <ul>
                            <li class="after_a"><a href="index.jsp">메인</a></li>
                            <li class="after_a"><a href="getRankingList.do">랭킹</a></li>
                            <li class="after_a"><a href="getSituationRecipe.do?key=파티">상황별</a></li>
                            <li class="after_a"><a href="getIngredientRecipe.do?key=정육">재료별</a></li>
                        </ul>
                    </nav>
                </div>
            
           
    </form>
</body>
</html>