package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstm;
	public ResultSet rs;
	
	public JDBConnect() {
		
		try {
			// JDBC 드라이버를 로딩
			Class.forName("org.mariadb.Driver");
			
			//DB에 연결
			String url = "jdbc:mariadb://localhost:3306/fullstack7";
			String id = "roor";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("==================================");
			System.out.println("==================================");
			System.out.println("==================================");
			
		} catch(Exception e) {
			
			
		}
		
	}

}
