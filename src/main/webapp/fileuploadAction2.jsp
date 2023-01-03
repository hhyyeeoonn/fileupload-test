<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*"%>
<%
	// 원본 request 객체를 cos api로 랩핑
	// 생성자 매개변수 new MultipartRequest(원본request, 업로드폴더, 최대파일사이즈, 인코딩, 중복이름정책) 중복이름정책<-절대 중복되지 않게.. 직접만들지 않고 cos정책을 따르면 된다
	// D:\work-web\fileupload-test\src\main\webapp\upload       
	
	String dir = request.getServletcontext().getRealPath("/upload");
	long maxFileSize = 1024 * 1024 * 100; // 100Mbyte 파일사이즈는 byte로 표시 
	
	// 폴더 내에 동일한 이름이 있으면 이름 뒤에 숫자를 붙임
	DefaultFileRenamePolicy fp = new DefaultFileRenamePolicy();
	MultipartRequest mreq = new MultipartRequest(request, "", 0, "utf-8", null);
	
	// MultipartRequest로 원본 request를 랩핑 후에는 스트림을 받을 필요없이 MultipartRequest의 api를 사용하면 된다
	
	// input type = text
	mreq.getParameter("itemName"); // MultipartRequest.getParameter, 파일은 upload에 저장

	// input type = file 바이너리파일은 마임타임 형태의 파일로 변환되어 upload폴더에 자동으로 저장
	String contentType = mreq.getContentType("itemImg");
	String contentType = mreq.getOriginalFileName("itemImg"); // 원본파일이름
	String contentType = mreq.getFilesystemName("itemImg"); // 저장된 파일 이름(DefaultFileRenamePolicy에 의해서...)
	
	System.out.println();
%>
