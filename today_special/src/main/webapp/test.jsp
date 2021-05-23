<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
</head>
<body>
<p v-for="item in myArray">{{item}}</p>
<script>
    new Vue({
        el: '#app',
        data: {
            myArray: [2,3,4,5,6,7,8,9]
        }
    })
</body>
</html>