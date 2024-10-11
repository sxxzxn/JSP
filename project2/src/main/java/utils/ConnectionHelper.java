package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import project.dto.Member;


/*
 JDBC 작업 (5가지 : 전체 , 조건 , 삽입  , 삭제 , 수정 : class EmpDao{ 5개 함수  }) 
 5개의 함수 공통적으로
 1. 드라이버 로딩
 2. 연결객체 생성 ,명령 , 자원해제
 3. 반복적인 코드 제거 .,... 
  
 반복적인 코드를 가지고 있는 별도의 클래스
  >> ConnectionHelper
  
  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KOSA","1004");
  
  ConnectionHelper 설계
  함수 ..... 자주사용 > static 설계 > 함수 종류 ....>> overloading  >> 다형성 ....
 
  
  현업에서는  성능 개선을 위해서 connection 객체 미리 생성해서 사용하고 반환하는
  pool 방식을 선택한다
  https://hudi.blog/dbcp-and-hikaricp/
  spring 프로젝트 진행시 당근 connection pool 방식 사용 .... 
 */

public class ConnectionHelper {

	public static Connection getConnection(String dsn) { //oracle , mysql 도 연결
//		try {
//			Class.forName("oracle.jdbc.OracleDriver");
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		Connection conn = null;
		
		try {
			 if(dsn.equals("oracle")) {
				
				 conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","USER1","1004");
				 
			 }else if(dsn.equals("mysql")) {
				
				 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true","KOSA","1004");
				 
			 }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
	
	public static Connection getConnection(String dsn, String id, String pwd) { //oracle , mysql 도 연결
		
		Connection conn = null;
		
		try {
			 if(dsn.equals("oracle")) {
				
				 conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",id,pwd);
				 
			 }else if(dsn.equals("mysql")) {
				
				 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sampledb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=true",id,pwd);
				 
			 }
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
	
	public static void close(Connection conn) {
		if(conn!= null) {
			try {
				
				conn.close();
				
			} catch (Exception e) {
				  System.out.println(e.getMessage());
			}
			
		}
	}
	
	public static void close(Statement stmt) {
		if(stmt!= null) {
			try {
				
				  stmt.close();
				
			} catch (Exception e) {
				  System.out.println(e.getMessage());
			}
			
		}
	}
		public static void close(PreparedStatement pstmt) {
			if(pstmt!= null) {
				try {
					
					pstmt.close();
					
				} catch (Exception e) {
					  System.out.println(e.getMessage());
				}
				
			}	
		
		
	}
	public static void close(ResultSet rs) {
		if(rs!= null) {
			try {
				
				  rs.close();
				
			} catch (Exception e) {
				  System.out.println(e.getMessage());
			}
			
		}
	}
	
	
}
