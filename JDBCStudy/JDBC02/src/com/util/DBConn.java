/*===================================
 *    DBConn.java
 *===================================*/

// 예외 처리 변경
// try ~ catch -> throws

package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{	
	private static Connection dbconn;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		if(dbconn == null)
		{
			String url = "jdbc:oracle:thin:@211.238.142.159:1521:xe";
			String id = "scott";
			String pw = "tiger";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbconn = DriverManager.getConnection(url, id, pw);
		}
		
		return dbconn;
	}
	
	public static Connection getConnection(String url, String id, String pw) throws ClassNotFoundException, SQLException
	{
		if(dbconn == null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbconn = DriverManager.getConnection(url, id, pw);
		}
		
		return dbconn;
	}
	
	public static void close() throws SQLException
	{
		if(dbconn != null)
		{
			if(!dbconn.isClosed())
				dbconn.close();
		}
		
		dbconn = null;
	}
}
