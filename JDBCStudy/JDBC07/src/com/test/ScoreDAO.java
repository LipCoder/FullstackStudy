package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private Connection dbConn;
	
	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		dbConn = DBConn.getConnection();
	}
	
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");		
		}
		
		pstmt.close();
		
		return result;
	}
	
	public int insertScore(ScoreDTO dto) throws ClassNotFoundException, SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
				+ " VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	public ArrayList<ScoreDTO> lists() throws ClassNotFoundException, SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ", (KOR + ENG + MAT) AS TOT"
				+ ", (KOR + ENG + MAT) / 3 AS AVG"
				+ ", RANK() OVER (ORDER BY (KOR + ENG + MAT)) AS RANK"
				+ " FROM TBL_SCORE"
				+ " ORDER BY SID";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			ScoreDTO obj = new ScoreDTO();
			
			obj.setSid(rs.getInt("SID"));
			obj.setName(rs.getString("NAME"));
			obj.setKor(rs.getInt("KOR"));
			obj.setEng(rs.getInt("ENG"));
			obj.setMat(rs.getInt("MAT"));
			obj.setTot(rs.getInt("TOT"));
			obj.setAvg(rs.getInt("AVG"));
			obj.setRank(rs.getInt("RANK"));
			
			result.add(obj);
		}
		
		pstmt.close();
		
		return result;
	}
	
	public ArrayList<ScoreDTO> lists(String name) throws ClassNotFoundException, SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ", (KOR + ENG + MAT) AS TOT"
				+ ", (KOR + ENG + MAT) / 3 AS AVG"
				+ ", RANK() OVER (ORDER BY (KOR + ENG + MAT)) AS RANK"
				+ " FROM TBL_SCORE"
				+ " WHERE NAME = ?"
				+ " ORDER BY SID";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			ScoreDTO obj = new ScoreDTO();
			
			obj.setSid(rs.getInt("SID"));
			obj.setName(rs.getString("NAME"));
			obj.setKor(rs.getInt("KOR"));
			obj.setEng(rs.getInt("ENG"));
			obj.setMat(rs.getInt("MAT"));
			obj.setTot(rs.getInt("TOT"));
			obj.setAvg(rs.getInt("AVG"));
			obj.setRank(rs.getInt("RANK"));
			
			result.add(obj);
		}
		
		pstmt.close();
		
		return result;
	}
	
	public int modifyScore(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE TBL_SCORE"
				   + "SET NAME = ?, KOR = ?, ENG = ?, MAT = ?"
				   + "WHERE SID = ?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		pstmt.setInt(5, dto.getSid());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	public int deleteScore(int sid) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE FROM TBL_SCORE"
				   + "WHERE SID = ?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		
		pstmt.setInt(1, sid);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
}