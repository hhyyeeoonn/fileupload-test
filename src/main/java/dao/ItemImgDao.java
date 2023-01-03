package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import vo.ItemImg;

public class ItemImgDao {
	public int insertItem(Connection conn, ItemImg itemImg) throws Exception {
		int row = 0;
		String sql = "INSERT item_img(item_no, filename) VALUES(?, ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, itemImg.getItemNo());
		stmt.setString(2, itemImg.getFilename());
		row = stmt.executeUpdate();
		return row;
	}
}
