package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

// JDBC 싱글턴 객체
public class JDBCManager
{
	private static Connection conn;
	
	// JDBC 커넥션을 받아온다.
	// 만약 커넥션이 없다면 할당 받는다.
	public static Connection getConnection()
	{
		if(conn == null)
		{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "BOARD";
			String pwd = "PASSWORD";
			
			try
			{
				// JDBC 드라이버의 기능을 사용하기 전에
				// 드라이버가 있는지 확인부터 한다.
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, pwd);
			} 
			catch (Exception e)
			{
				e.printStackTrace();
			}	
		}
		
		return conn;
	}
	
	// JDBC 커넥션을 해제한다.
	// 만약 커넥션이 할당 중이라면 해제한다.
	public static void close() 
	{
		try
		{
			if(conn != null && !conn.isClosed())
			{
				conn.close();
			}
		} 
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		conn = null;
	}
}
