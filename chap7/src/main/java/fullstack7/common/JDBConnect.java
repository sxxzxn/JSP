package fullstack7.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstm;
	public ResultSet rs;
	
	public JDBConnect() {
		
		try {
			// 1. JDBC 드라이버를 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			
			// 2. DB에 연결
			// 2.1 주소URL 설정
			// 2.2 데이터베이스 접속 아이디
			// 2.3 비밀번호 
			String url = "jdbc:mariadb://localhost:3306/fullstack7";
			String id = "root";
			String pwd = "1234";
			
			// 2.4 (DriverManager로 getConnection)드라이버 매니저를 이용해서 접속
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("==================================================");
			System.out.println("1. DB 접속 성공(기본생성자) ");
			System.out.println("con1 String : " +con);
			System.out.println("==================================================");
			
		} catch(Exception e) {
			System.out.println("==================================================");
			System.out.println("1. DB 접속 에러(기본생성자) ");
			System.out.println(e.getMessage());
			System.out.println("==================================================");
			
		}
	}
		//두번째 생성자
		public JDBConnect(String driver, String url, String id, String pwd) {
			
			try {
				// JDBC 드라이버를 로딩
				Class.forName("org.mariadb.jdbc.Driver");
				
				//DB에 연결
				con = DriverManager.getConnection(url, id, pwd);
				
				System.out.println("==================================================");
				System.out.println("2. DB 접속 성공(매개 변수 생성자) ");
				System.out.println("con2 String : " +con);
				System.out.println("==================================================");
				
			} catch(Exception e) {
				System.out.println("==================================================");
				System.out.println("2. DB 접속 에러(매개 변수 생성자) ");
				System.out.println(e.getMessage());
				System.out.println("==================================================");
				
			}
		
	}
		//세번째 생성자
				public JDBConnect(ServletContext application) {
					
					try {
						Class.forName("org.mariadb.jdbc.Driver");
						
						String driver = application.getInitParameter("MariaDriver");
						String url = application.getInitParameter("MariaURL");
						String id = application.getInitParameter("dbId");
						String pwd = application.getInitParameter("dbPwd");
						
						con = DriverManager.getConnection(url, id, pwd);
						
						System.out.println("==================================================");
						System.out.println("3. DB 접속 성공(application 생성자) ");
						System.out.println("con3 String : " +con);
						System.out.println("==================================================");
						
					} catch(Exception e) {
						System.out.println("==================================================");
						System.out.println("3. DB 접속 에러(application 생성자) ");
						System.out.println(e.getMessage());
						System.out.println("==================================================");
						
					}
				
			}
				
		// 연결 해제
				public void close() {
					try {
						if( rs != null) rs.close();
						if( pstm != null) pstm.close();
						if( stmt != null) stmt.close();
						if( con != null) con.close();
						
						System.out.println("==================================================");
						System.out.println("JDBC 자원해제 ");
						System.out.println("==================================================");
					
					}catch(Exception e) {
						System.out.println("==================================================");
						System.out.println("JDBC 오류 : "+e.getMessage());
						System.out.println("==================================================");
					}
				}
				
					
				

}
