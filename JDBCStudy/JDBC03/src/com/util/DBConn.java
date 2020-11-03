package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	// 커넥션 멤버변수
	private static Connection dbConn;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		if(dbConn == null)
		{
			// url, id, pw 생성
			String url = "jdbc:oracle:thin:@211.238.142.159:1521:xe";
			String id = "scott";
			String pw = "tiger";
			
			// Class 확인
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbConn = DriverManager.getConnection(url, id, pw);
		}
		
		return dbConn;
	}
	
	static void close() throws SQLException
	{
		if(dbConn != null)
		{
			if(!dbConn.isClosed())
				dbConn.close();
		}
	}
}
