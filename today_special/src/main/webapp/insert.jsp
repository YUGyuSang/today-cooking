<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레시피</title>
    <link rel="stylesheet" href="./css/register.css" type="text/css">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>

    <form action="">
    <div id="continer">
        <h1>레시피 등록</h1>
        <section id="t1">
            <div id="meun1">
           <h3>레시피 제목</h3> <input type="text" placeholder="예)얼큰한 순대국 만들기">
            </div>
            <div id="meun2">
           <h3>요리소개</h3>
           <p><textarea name="요리소개글" id="" cols="50" rows="3" placeholder="내용을 입력하세요."></textarea></p>
            </div>
            <div id="meun3">
                <img src="#" alt="대표사진">
            </div>
            <label class="input-file-button" for="input-file">
                업로드
            </label>
                <input type="file" id="input-file" style="display: none;"accept="image/*,.pdf"/> 
            <div id="meun4">
                <h3>카테고리</h3>
                <select name="" id="">
                    <option value="상황별">상황별</option>
                    <option value="조무사">조무사</option>
                    <option value="무직">무직</option>
                    <option value="백엔드개발자">백엔드개발자</option>
                    <option value="야구선수">야구선수</option>
                    <option value="주부">주부</option>
                    <option value="농부">농부</option>
                </select>
                <select name="" id="">
                    <option value="상황별">재료별</option>
                    <option value="조무사">조무사</option>
                    <option value="무직">무직</option>
                    <option value="백엔드개발자">백엔드개발자</option>
                    <option value="야구선수">야구선수</option>
                    <option value="주부">주부</option>
                    <option value="농부">농부</option>
                </select>
            </div>
            
        </section>

        <section id="t2">
            <h3>재료</h3>
            <div class="material1">
                <input type="text" placeholder="예)고기">
                <input type="text" placeholder="예)100g">
            </div>
            <div class="material1" >
                <input type="text">
                <input type="text">
            </div>
            <div class="material1" >
                <input type="text">
                <input type="text">
            </div>
            <div class="material1" >
                <input type="text">
                <input type="text">
            </div>
            <div class="material1" >
                <input type="text">
                <input type="text">
            </div>
            <div id="material1plus">
                <button><i class="fas fa-plus"></i></button>
            </div>
        </section>

        <section id="t3">
            <h3>요리순서</h3>
            <div>
                <span>step1</span>
            </div>
        </section>
    </div>
    </form>
</body>
</html>