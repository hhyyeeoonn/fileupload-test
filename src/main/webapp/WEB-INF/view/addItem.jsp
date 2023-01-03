<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileuploadForm.jsp</title>
</head>
<body>
	<h1>상품등록</h1>
	<form method = "post" action = "${pageContext.request.contextPath}/addItem" enctype = "multipart/form-data">
		<div>
			상품이름 : <input type = "text" name = "itemName">
		</div>
		<div>
			상품이미지 : <input type = "file" name = "itemImg">
		</div>
		<div>
			<button type = "submit">상품등록</button>
		</div>
	</form>
</body>
</html>