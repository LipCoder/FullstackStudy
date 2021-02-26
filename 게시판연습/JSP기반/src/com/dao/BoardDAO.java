package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dto.BoardDTO;

// JDBC를 사용하여 실제 쿼리문을 수행하는 객체
public class BoardDAO
{
	private Connection conn;
	
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	// 1. 게시물 번호의 최대값 얻어내기
	public int getMaxNum()
	{
		int result = 0;
		
		String sql = "SELECT NVL(MAX(NUM), 0) AS MAXNUM"
				+ " FROM TBL_BOARD";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt("MAXNUM");

			pstmt.close();
			rs.close();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 2. 게시물 작성
	public int write(BoardDTO info)
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_BOARD"
				+ " (NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)"
				+ " VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, info.getNum());
			pstmt.setString(2, info.getName());
			pstmt.setString(3, info.getPassword());
			pstmt.setString(4, info.getEmail());
			pstmt.setString(5, info.getSubject());
			pstmt.setString(6, info.getContent());
			pstmt.setString(7, info.getIp());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		System.out.println(result);
		
		return result;
	}
	
	// 3. 게시물 수 얻어오기
	public int getBoardCount(String searchKey, String searchValue)
	{
		// searchKey	→ subject	/ name	 	/  content
		// searchValue  → "%취미%"	/ "%길동%" 	/  "%날씨%"
		
		
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT"
			      + " FROM TBL_BOARD"
			      + " WHERE "+ searchKey + " LIKE ?";
		
		try
		{
			searchValue = "%" + searchValue + "%";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt("COUNT");
			
			rs.close();
			pstmt.close();
			
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 4. 특정 영역의 게시물 목록을 읽어오기
	public ArrayList<BoardDTO> getLists(int start, int end, String searchKey, String searchValue)
	{
		ArrayList<BoardDTO> result = new ArrayList<BoardDTO>();
		
		String sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED"
				   + " FROM "
				   + " ("
				   + " 		SELECT ROWNUM RNUM, DATA.*"
				   + " 		FROM"
				   + " 		("
				   + " 		SELECT NUM, NAME, SUBJECT, HITCOUNT,"
				   + " 		TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
				   + " 		FROM TBL_BOARD"
				   + "      WHERE " + searchKey + " LIKE ?"
				   + "      ORDER BY NUM DESC"
				   + " 		) DATA"
				   + " )"
				   + " WHERE RNUM >= ? AND RNUM <= ?";
		
		try
		{
			searchValue = "%" + searchValue + "%";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchValue);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				BoardDTO board = new BoardDTO();
				
				board.setNum(rs.getInt("NUM"));
				board.setName(rs.getString("NAME"));
				board.setSubject(rs.getString("SUBJECT"));
				board.setViewCount(rs.getInt("HITCOUNT"));
				board.setCreated(rs.getString("CREATED"));
				
				result.add(board);
			}
			
			rs.close();
			pstmt.close();
			
		} 
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 5. 특정 게시물 조회수 증가
	public void updateViewCount(int num)
	{
		String sql = "UPDATE TBL_BOARD"
				  + " SET HITCOUNT = HITCOUNT + 1"
				  + " WHERE NUM=?";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt.close();
			
		} 
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 6. 특정 게시물 내용 가져오기
	public BoardDTO getBoard(int num)
	{
		BoardDTO result = new BoardDTO();
		String sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR,"
				  + " HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
				  + " FROM TBL_BOARD"
				  + " WHERE NUM=?";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				result.setNum(rs.getInt("NUM"));
				result.setName(rs.getString("NAME"));
				result.setPassword(rs.getString("PWD"));
				result.setEmail(rs.getString("EMAIL"));
				result.setSubject(rs.getString("SUBJECT"));
				result.setContent(rs.getString("CONTENT"));
				result.setIp(rs.getString("IPADDR"));
				result.setViewCount(rs.getInt("HITCOUNT"));
				result.setCreated(rs.getString("CREATED"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		} 
		
		return result;
	}
	
	// 7. 특정 게시물 삭제
	public int delete(int num)
	{
		int result = 0;
		String sql = "DELETE FROM TBL_BOARD"
				  + " WHERE NUM=?";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		} 
		
		return result;
	}
	
	// 8. 특정 게시물 수정
	public int updateData(BoardDTO board)
	{
		int result = 0;
		
		String sql = "UPDATE TBL_BOARD"
				+ " SET NAME=?, PWD=?, EMAIL=?,"
				+ " SUBJECT=?, CONTENT=?"
				+ " WHERE NUM=?";
				
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getPassword());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setInt(6, board.getNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 9. 다음 게시물 번호 얻어오기
	public int getNextNum(int num)
	{
		int result = 0;
		
		String sql = "SELECT NVL(MIN(NUM), -1) NEXTNUM "
				  + " FROM TBL_BOARD"
				  + " WHERE NUM > ?";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,  num);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt("NEXTNUM");
			
			rs.close();
			pstmt.close();
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 10.이전 게시물 번호 얻어오기
	public int getBeforeNum(int num)
	{
		int result = 0;

		String sql = "SELECT NVL(MAX(NUM), -1) BEFORENUM "
					+ " FROM TBL_BOARD"
					+ " WHERE NUM < ?";

		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next())
				result = rs.getInt("BEFORENUM");
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return result;
	}
}
