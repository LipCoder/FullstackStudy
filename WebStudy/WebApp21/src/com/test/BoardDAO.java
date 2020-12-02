package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO
{
	private Connection conn;
	
	// 사용자 정의 생성자
	public BoardDAO(Connection conn)
	{
		this.conn = conn;
	}
	
	// 게시물 번호의 최대값 얻어내기
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
			{
				result = rs.getInt("MAXNUM");
			}
			
			rs.close();
			pstmt.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 게시물 작성 → 데이터 입력
	public int insertData(BoardDTO dto)
	{
		int result = 0;
		
		String sql = "INSERT INTO TBL_BOARD"
				+ " (NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED)"
				+ " VALUES(?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIpAddr());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// DB 레코드의 갯수(게시물 수)를 가져오는 메소드 정의
	// → 검색 기능을 추가 후 변경하게 될 경우 수정해야 할 메소드
	// 변경 이후 코드	
	public int getDataCount(String searchKey, String searchValue)
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
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	// 변경 이전 코드
	/*
	public int getDataCount()
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT"
				   + " FROM TBL_BOARD";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt("COUNT");
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	*/
	
	
	// 특정 영역의(시작번호 ~ 끝번호) 게시물의 목록을 읽어오는 메소드 정의
	// → 검색 기능을 추가 후 변경하게 될 경우 수정해야 할 메소드
	// 이후 코드
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
				board.setHitCount(rs.getInt("HITCOUNT"));
				board.setCreated(rs.getString("CREATED"));
				
				result.add(board);
			}
			
			rs.close();
			pstmt.close();
			
		} catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	// 이전 코드
	/*
	public ArrayList<BoardDTO> getLists(int start, int end)
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
				   + " 		FROM TBL_BOARD ORDER BY NUM DESC"
				   + " 		) DATA"
				   + " )"
				   + " WHERE RNUM >= ? AND RNUM <= ?";
		
		try
		{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				BoardDTO board = new BoardDTO();
				
				board.setNum(rs.getInt("NUM"));
				board.setName(rs.getString("NAME"));
				board.setSubject(rs.getString("SUBJECT"));
				board.setHitCount(rs.getInt("HITCOUNT"));
				board.setCreated(rs.getString("CREATED"));
				
				result.add(board);
			}
			
			rs.close();
			pstmt.close();
			
		} catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	*/
	
	
	// 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의
	public void updateHitCount(int num)
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
			
		} catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	
	// 특정 게시물의 내용을 읽어오는 메소드 정의
	public BoardDTO getReadData(int num)
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
				result.setPwd(rs.getString("PWD"));
				result.setEmail(rs.getString("EMAIL"));
				result.setSubject(rs.getString("SUBJECT"));
				result.setContent(rs.getString("CONTENT"));
				result.setIpAddr(rs.getString("IPADDR"));
				result.setHitCount(rs.getInt("HITCOUNT"));
				result.setCreated(rs.getString("CREATED"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		} 
		
		return result;
	}
	
	
	// 특정 게시물을 삭제하는 기능의 메소드 정의
	public int deleteData(int num)
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
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		} 
		
		return result;
	}
	
	
	// 특정 게시물의 내용을 수정하는 메소드 정의
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
			pstmt.setString(2, board.getPwd());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setInt(6, board.getNum());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	// 다음 게시물 번호를 얻어오는 메소드 정의
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
			
		} catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		return result;
	}

	// 이전 게시물 번호를 얻어오는 메소드 정의
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
			System.out.println(e.toString());
		}

		return result;
	}
}
