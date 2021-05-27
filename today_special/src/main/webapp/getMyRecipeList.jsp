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
    <link rel="stylesheet" href="./css/getMyRecipe.css" type="text/css">
    <title>내 레시피</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="<%=header_file %>" />
		</div>
	</div>
	<form action="">
    <div id="continer">
        <h1 class="my_h1"><img src="./img/cookman.png">내 레시피<img src="./img/cookgirl.png"></h1>
        <hr>
        <table id="my_table">
            <tr>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명:까르보나나나나나나  </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
                <td><a href="#"><img src="./img/cook1.jpg" alt=""></a>
                    <p>명: </p>
                    <button>삭제</button>
                </td>
            </tr>
        </table>
    </div>
    </form>
    <div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
</body>
</html>