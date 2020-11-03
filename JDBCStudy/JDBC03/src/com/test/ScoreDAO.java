package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private Connection conn;

	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		this.conn = DBConn.getConnection();
	}
	
	public int insert(ScoreDTO dto) throws SQLException
	{	
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) "
				                 + " VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)"
				                 , dto.getName(), dto.getKor(), dto.getEng(), dto.getMat());
		
		stmt.executeUpdate(sql);
				
		stmt.close();		
				
		return result;
	}
	
	public int count() throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		rs.close();
		stmt.close();		
				
		return result;
	}
	
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> arrScoreDTO = new ArrayList<ScoreDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT FROM TBL_SCORE ORDER BY SID";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getInt("SID"));
			dto.setName(rs.getString("NAME")); 
			dto.setKor(rs.getInt("KOR")); 
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT")); 
			
			arrScoreDTO.add(dto);
		}
		
		rs.close();
		stmt.close();	
		
		return arrScoreDTO;
	}
}
