<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>application/x-www-form-urlencoded</h1>
	<div>urlId : <%=request.getParameter("urlId")%></div>
	<div>urlFile : <%=request.getParameter("urlFile")%></div>
	
	<h1>multipart/form-data</h1>
	<div>multiId : <%=request.getInputStream() %></div> <!-- 2진수 기계어를 받음 -->
	<div>multiFile : <%=request.getInputStream()%></div>
	<%
		InputStream is = request.getInputStream();
		int i = 0;
		while((i = is.read()) != -1) {
			System.out.println((char)i);
		}
	%>
</body>
</html>