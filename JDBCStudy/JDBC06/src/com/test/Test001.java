package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.Statement;

import com.util.DBConn;

public class Test001
{
	public static void main(String[] args)
	{
		try
		{
			Connection conn = DBConn.getConnection();
			
			if(conn != null)
			{
				System.out.println("DB연결 성공");
				
				
				try
				{
					// 기존 JDBC 쿼리문 실행 코드
					/*
					Statement stmt = conn.createStatement();
					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
							+ " VALUES(MEMBERSEQ.NEXTVAL, '허수민', '010-5555-5555')";
					int result = stmt.executeUpdate(sql);
					if(result > 0)
						System.out.println("데이터 입력 성공~!!!");
					stmt.close();
					*/
					
					/*
					
					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
							+ " VALUES(MEMBERSEQ.NEXTVAL, '진영은', '010-6666-6666')";
					Statement stmt = conn.createStatement();
					int result = stmt.executeUpdate(sql);
					if(result > 0)
						System.out.println("데이터 입력 성공~!!!");
					stmt.close();
					*/
					
					/*
					// preparedStatement 사용
					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
							+ " VALUES(MEMBERSEQ.NEXTVAL, '안혜지', '010-5252-6666')";
					//Statement stmt = conn.createStatement();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					
					// int result = stmt.executeUpdate(sql);
					int result = pstmt.executeUpdate();
					if(result > 0)
						System.out.println("데이터 입력 성공~!!!");
					pstmt.close();
					*/
					
					/*
					// ? 로 sql에 정보를 넘겨주는 방법
					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
							+ " VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "주재완");
					pstmt.setString(2, "010-7777-7777");
					
					int result = pstmt.executeUpdate();
					if(result > 0)
						System.out.println("데이터 입력 성공~!!!");
					pstmt.close();
					*/
					
					/*
					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
							+ " VALUES(?, ?, ?)";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, 9);
					pstmt.setString(2, "주재완");
					pstmt.setString(3, "010-7777-7777");
					
					int result = pstmt.executeUpdate();
					if(result > 0)
						System.out.println("데이터 입력 성공~!!!");
					pstmt.close();
					*/
					
					String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
							+ " VALUES(?, ?, ?)";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, 10);
					pstmt.setString(2, "조인경");
					pstmt.setString(3, "010-9999-9999");
					
					// check
					System.out.println(sql);
					
					int result = pstmt.executeUpdate();
					if(result > 0)
						System.out.println("데이터 입력 성공~!!!");
					pstmt.close();
					
				} catch (Exception e)
				{
					// TODO: handle exception
				}
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}
