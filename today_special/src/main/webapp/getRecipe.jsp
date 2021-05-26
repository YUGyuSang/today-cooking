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
    <link rel="stylesheet" href="./css/getRecipe.css" type="text/css">
    <title>"" | 소개</title>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="<%=header_file %>" />
		</div>
	</div>
    <form action="">
        <div id="continer">
            <div id="title">
                <img src="./img/cook1.jpg" alt="소개 이미지">
                <div class="title_h">
                    <h1>레시피: 까르보나나 떡볶이</h1>
                </div>
                <div class="btn">
                <button><img src="./img/bookmark.png" alt=""></button><p>50</p>
                </div>
                <div class="mat_sit">
                    <p>재료별: 떡 <br>상황별: 파티 </p> 
                </div>
            </div>
            <hr>
            <div id="title_2">
                
                <h3>재료</h3>
                <table>
                    <tr>
                        <td><div class="menu">소고기 100개 넣기</div></td>
                        <td><div class="menu">소고기 100개 넣기</div></td>
                    </tr>
                    
                    <tr>
                        <td><div class="menu">소고기 100개 넣기</div></td>
                        <td><div class="menu">소고기 100개 넣기</div></td>
                    </tr>
                    <tr>
                        <td><div class="menu">소고기 100개 넣기</div></td>
                        <td><div class="menu">소고기 100개 넣기</div></td>
                    </tr>
                    <tr>
                        <td><div class="menu">소고기 100개 넣기</div></td>
                        <td><div class="menu">소고기 100개 넣기</div></td>
                    </tr>
                </table>
            </div>
            <div id="title_3">
                <h3>요리 순서</h3>
                <div class="order">
                <span>Step1</span>
                <div class="order_menu">
                    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam accusantium, molestiae voluptas odio sed quas a eum nobis corporis laudantium id soluta repellendus adipisci doloribus facilis impedit explicabo odit ipsam?
                </div>
                </div>
                <div class="order">
                <span>Step2</span>
                <div class="order_menu">
                    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam accusantium, molestiae voluptas odio sed quas a eum nobis corporis laudantium id soluta repellendus adipisci doloribus facilis impedit explicabo odit ipsam?
                </div>
                </div> 
                <div class="order">
                <span>Step3</span>
                <div class="order_menu">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aperiam accusantium, molestiae voluptas odio sed quas a eum nobis corporis laudantium id soluta repellendus adipisci doloribus facilis impedit explicabo odit ipsam?
                </div>
                </div> 
            </div>
        </div>
    </form>
    <div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
</body>
</html>