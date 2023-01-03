<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<c:forEach var = "m" items = "${list}" varStatus = "s">			
				<c:if test = "${s.index != 0 || s.index % 5 == 0}">
					</tr><tr> <!-- 기존 <tr>을 닫고 새로운 <tr>추가하기 -->
				</c:if>
				
				<td>
					<div><img src = "${pageContext.request.contextPath}/upload/${m.filename}" width = "200" height = "200"></div>
					<div>${m.itemName}</div>
					<div>수정/삭제</div>
				</td>
			</c:forEach>
		</tr>
	</table>
</body>
</html>