package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Dao {
	
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	ResultSet rs2;
	ResultSet rs3;
	
	public void getCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/lupang?serverTimezone=UTC";
			String user="root";
			String password="1111";
			conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
