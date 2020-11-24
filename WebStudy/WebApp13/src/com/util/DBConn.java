package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	// 싱글턴 패턴을 이용해 전역으로 쓰게될 커넥션 변수
	private static Connection conn;
	
	// jdbc 커넥션을 드라이버로 부터 가지고 온다.
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		if(conn == null)
		{
			String url = "jdbc:oracle:thin:@211.238.142.168:1521:xe";
			String user = "scott";
			String pwd = "tiger";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
		}
		
		return conn;
	}
	
	public static Connection getConnection(String url, String user, String pwd) throws ClassNotFoundException, SQLException
	{
		if(conn == null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
		}
		
		return conn;
	}
	
	// jdbc 커넥션을 해제한다.
	public static void close() throws SQLException
	{
		if(conn != null)
		{
			if(!conn.isClosed())
			{
				conn.close();
			}
		}
		
		conn = null;
	}
}
