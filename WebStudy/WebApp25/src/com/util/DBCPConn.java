package com.util;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn
{
	private static Connection conn = null;
	
	public static Connection getConnection()
	{
		if(conn==null)
		{
			try
			{
				// �� �̸��� ��ü�� ���ε�
				//-- ���ؽ�Ʈ(Context)�� ���� ���� ���� �����
				//   ��javax.naming.InitialContext�� Ŭ������
				//   �ν��Ͻ��� �����ϴ� ���̴�.
				//   �� ��new InitialContext()��
				Context ctx = new InitialContext();
				
				// �� ��javax.naming.InitialContext�� �޼ҵ�
				//     - bind(String str, Object obj)
				//       : ������ ��ü�� Ư�� �̸����� ����Ѵ�.
				//     - rebind(String str, Object obj)
				//       : ������ ��ü�� Ư�� �̸����� �ٽ� ����Ѵ�. (����)
				//     - list(String str)
				//       : Ư�� �̸����� �����ϴ� ��ü ������ ��ȯ�Ѵ�.
				//     - unbinding(String str)
				//       : ��ϵ� ��ü�� �޸𸮿��� �����Ѵ�.
				//     - Object lookup(String str)
				//       : �������� ��ü ������ ���´�.
				
				// xml ���Ϸκ��� ȯ�� ������ ã�ƿ��ڴٴ� �ڵ� ����
				//-- �ٸ� ���·� ���� �Ұ�
				Context evt = (Context)ctx.lookup("java:/comp/env");
				
				// ȯ�� ���� �������κ��� ���� ��ü�� ��
				// ��jdbc/myOracle�� �̶�� �ĺ��ڷ� ������ ���ҽ��� �������� �ڵ� ����
				DataSource ds = (DataSource)evt.lookup("jdbc/myOracle");
				
				conn = ds.getConnection();
				
				
			} catch(Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return conn;
	}
	
	public static void close()
	{
		if(conn!=null)
		{
			try
			{
				if(!conn.isClosed())
					conn.close();
				
			} catch(Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		conn = null;
	}
	
}
