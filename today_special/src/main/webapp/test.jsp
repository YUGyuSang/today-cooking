<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insertIngredient.do">
	<section id="t2">
		<h3>재료</h3>
		<div class="material1">
			<input class="mater_input" type="text" placeholder="예)고기" name="ingredientName"> <input class="mater_input"
				type="text" placeholder="예)100g" name="ingredientAmount"> <input class="mater_input" type="text"
				placeholder="예)고기" name="ingredientName"> <input class="mater_input" type="text" placeholder="예)100g"
				name="ingredientAmount">
		</div>
	</section>
	<input type="submit">
</body>
</html>