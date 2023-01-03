package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ItemService;

@WebServlet("/ItemListController")
public class ItemListController extends HttpServlet {
	private ItemService itemService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		itemService = new ItemService();
		ArrayList<HashMap<String, Object>> list = itemService.getItemList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEP-INF/view/itemList.jsp").forward(request, response);
	}

}
