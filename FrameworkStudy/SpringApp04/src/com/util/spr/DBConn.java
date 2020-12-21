package com.util.spr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	private static Connection conn;
	
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
