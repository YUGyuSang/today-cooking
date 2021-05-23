<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/getRecipeList.css" type="text/css">
    <title>Document</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="afterHeader.jsp" />
		</div>
	</div>
    <form action="">
        <div id="continer">
            
            <div id="search_list">
                <h1>'##' 검색 결과</h1>
                <table id="search_table">
                    <tr>
                        <td><a href=""><img src="./img/logo.png" alt="돼지김치찜">
                            <p class="search_p"> <span class="getspan">돼지김치찜</span><br><b>작성자: </b><span class="getspan">유규상</span></p></a>
                        </td>
                        <td><a href=""><img src="./img/logo.png" alt="돼지김치찜">
                            <p class="search_p"> <span class="getspan">돼지김치찜</span><br><b>작성자: </b><span class="getspan">유규상</span></p></a>
                        </td>
                        <td><a href=""><img src="./img/logo.png" alt="돼지김치찜">
                            <p class="search_p"> <span class="getspan">돼지김치찜</span><br><b>작성자: </b><span class="getspan">유규상</span></p></a>
                        </td>
                        <td><a href=""><img src="./img/logo.png" alt="돼지김치찜">
                            <p class="search_p"> <span class="getspan">돼지김치찜</span><br><b>작성자: </b><span class="getspan">유규상</span></p></a>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="Youtube_list">
                <h1 id="you"><img class="youtubeico" src="./img/youtube1.png" alt="유튜브">YouTube 검색 결과</h1>

                <hr>

                <table id="youtube_table">
                    <tr>
                        <td><a href=""><img class="youico" src="./img/youtube.png" alt=""></a></td>
                        <td class="t2"><p class="youtube_p">백종원 돼지등갈비 찜 만들기~~. 야들야들 한 고기맛 최고~</p></td>
                        <td><div class="bookmark"><button><img src="./img/bookmark.png" alt=""></button></div></td>
                        <!-- <div class="bookmark"><a href=""><img src="./img/bookmark.png" alt=""></a></div> -->
                    </tr>
                </table>
            </div>
            <div id="Naver_list">
                <h1 id="naver"><img class="navericos" src="./img/naver1.png" alt="네이버">네이버 검색 결과</h1>

                <hr>

                <table id="naver_table">
                    <tr>
                        <td class="t1"><a href=""><img class="naverico" src="./img/naver.png" alt=""></a></td>
                        <td class="t2"><p class="naver_p">백종원 백종원 돼지등갈비 찜 만들기~~. 
                        </p></td>
                        <td class="t3"><button><img src="./img/bookmark.png" alt=""></button></td>
                        <!-- <div class="bookmark"><a href=""><img src="./img/bookmark.png" alt=""></a></div> -->
                    </tr>
                </table>
            </div>
        </div>
    </form>
    <div id="footer">
			<jsp:include page="footer.jsp" />
	</div>
</body>
</html>