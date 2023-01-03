<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formEnctype</title>
</head>
<body>
	<!-- action으로 문자열을 넘김 -->
	<form action = "./action.jsp"
		enctype = "application/x-www-form-urlencoded"> <!--get/post 둘 다 사용 가능 --><!-- 웹표준url인코더 : 주소창으로 갈 수 있는 인코딩-->
		<input type = "text" name ="urlId">
		<input type = "file" name = "urlFile">
		<button type = "submit">application/x-www-form-urlencoded</button> <!-- 파일을 넘길 수 없다 보내는 양이 적고 보내는 데이터가 노출된다-->
	</form>
	<br>
	<!-- action으로 스트림(기계어, 이진수)을 넘김 -->
	<form action = "./action.jsp"
		enctype = "multipart/form-data" method = "post"> <!-- 바이너리데이터를 보낸다 이진수로 바뀌어서 넘어감 request.getParameter는 url에 특화되어 있음--> <!-- 한묶음으로 보내서 양이 많음 그래서 body에서 보내야하며 post만 사용 --><!-- form을 통해 데이터를 보내겠다 메소드 방식은 반드시 post -->
		<input type = "text" name = "multiId">
		<input type = "file" name ="multiFile">
		<button type = "submit">multipart/form-data</button> <!-- 파일을 넘길 수 있으나 스트림으로 넘겨서 뭉탱이로 넘어가 문자열을 분해해서 다시 재조립해야한다 구분자(-----WebKit~)가 정해져 있으므로 구분자로 끊으면 된다 구분자 아래에는 파일의 정보가 나온다-->
	</form>
</body>
</html>