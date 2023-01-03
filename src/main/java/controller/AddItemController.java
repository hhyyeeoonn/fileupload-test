package controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

import vo.Item;
import vo.ItemImg;
import service.ItemService;

@WebServlet("/addItem")
public class AddItemController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// view
		request.getRequestDispatcher("/WEB-INF/view/addItem.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dir = request.getServletContext().getRealPath("/upload"); // 업로드폴더
		int maxFileSize = 1024 * 1024 * 100; // 최대파일사이즈

		DefaultFileRenamePolicy fp = new DefaultFileRenamePolicy(); // 중복이름정책
		MultipartRequest mreq = new MultipartRequest(request, dir, maxFileSize, "utf-8", fp); // (원본request, 업로드폴더, 최대파일사이즈, 인코딩, 중복이름정책)	
		
		// 이미지 파일 검사
		String contentType = mreq.getContentType("itemImg"); // input type = file
		if(contentType.equals("image/jpeg") || contentType.equals("image/png")) {
			
			request.setCharacterEncoding("utf-8");
			String itemName = mreq.getParameter("itemName");
			String fileName = mreq.getFilesystemName("itemImg"); // 저장된 파일 이름
			
			Item item = new Item();
			item.setItemName(itemName);
			
			ItemImg itemImg = new ItemImg();
			itemImg.setFilename(fileName);
			
			ItemService itemService = new ItemService();
			itemService.addItem(item, itemImg, dir);
		} else {
			System.out.println("*.jpeg, *.png 파일만 업로드 가능");
			File f = new File(dir + "\\" + mreq.getFilesystemName("itemImg"));
			if(f.exists()) { // 이미지 파일이 아닌 파일이 업로드되었기 때문에 삭제
				f.delete();
			}
		}
		response.sendRedirect(request.getContextPath() + "");
		System.out.println("AddItemController:업로드성공");
	}
}
