package movieproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
public class DB_Conn {
	private Statement stmt;
	private Connection conn;
	public DB_Conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection( 
					"jdbc:oracle:thin:@127.0.0.1:1521:XE", 
					"hr", "hr");
			stmt = conn.createStatement();
			//System.out.println("연결성공");
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
 
	}
	public ResultSet executeQuery(String sql) // 다른 클래스에서 문장을 쓸 수 있게 함수로 구현함
	{ ResultSet rs = null; //예외처리에서 rs에 문제가 생기면 안되니까 null을 기본값으로 넣어줌
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public void executeUpdate(String sql)
	{
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
