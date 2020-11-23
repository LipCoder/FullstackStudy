package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private Connection conn;

	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}

	// 데이터베이스에 데이터 삽입
	public int add(ScoreDTO dto) throws SQLException
	{
		int result = 0;

		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES" + 
		            " (SCORESEQ.NEXTVAL, ?, ?, ?, ?)";

		// PreparedStatement 사용
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 받은 데이터를 넘김
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());

		// sql 실행
		result = pstmt.executeUpdate();
		pstmt.close();

		return result;
	}

	// 데이터베이스에 있는 데이터를 전부
	// ScoreDTO를 담는 컨테이너 형식으로 반환
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();

		String sql = "SELECT NAME, KOR, ENG, MAT"
				+ ", (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG"
				+ ", RANK() OVER (ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				+ " FROM TBL_SCORE";

		// PreparedStatement 사용
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// 받은 데이터들을 ResultSet 형식으로 받아옴
		ResultSet rs = pstmt.executeQuery();
		
		// 데이터를 분류하고 DTO 객체로 저장해
		// 컨테이너에 담는다.
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();

			dto.setRank(rs.getInt("RANK"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getFloat("AVG"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();

		return result;
	}

	public void close() throws SQLException
	{
		DBConn.close();
	}
}
