package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO
{
	private Connection conn;
	
	// 데이터베이스 연결
	public void connect() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터베이스 연결 해제
	public void disConnect() throws SQLException
	{
		conn = null;
		DBConn.close();
	}
	
	// 멤버 리스트 조회
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT ID, NAME, TEL, EMAIL"
				  + " FROM TBL_MEMBERLIST"
			  	  + " ORDER BY ID";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberDTO member = new MemberDTO();
			
			member.setId(rs.getString("ID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));
			member.setEmail(rs.getString("EMAIL"));
			
			result.add(member);
		}
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 멤버 리스트 등록
	public int insertQuery(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)"
				+ " VALUES(?, CRYPTPACK.ENCRYPT(?, ?), ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPw());
		pstmt.setString(3, dto.getPw());
		pstmt.setString(4, dto.getName());
		pstmt.setString(5, dto.getTel());
		pstmt.setString(6, dto.getEmail());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
}
