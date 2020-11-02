/*==========================================
 *   MemberDAO.java
 *   - 데이터베이스 액션 처리 전용 객체 구성
 *==========================================
 * */

package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
    // 주요 변수 선언 -> DB 연결 객체 
	private Connection conn;

	// 생성자 정의 -> 사용자 정의 생성자
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		// DB 연결
		this.conn = DBConn.getConnection();
	}
	
	// (완료)
	// 기능 -> 메소드 정의 -> 데이터를 입력하는 기능 -> insert 쿼리문 수행
	public int add(MemberDTO dto) throws SQLException
	{
		// 결과값으로 반환하게 될 변수 선언 및 초기화
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
				                + " VALUES(%s, '%s', '%s')",
				                dto.getSid(), dto.getName(), dto.getTel() );
		
		result = stmt.executeUpdate(sql);
		
		// 결과값 반환
		return result;
	}
	
	// (완료)
	// 기능 -> 메소드 정의 -> 인원 수를 파악하는 기능 -> select 쿼리문 수행
	public int count() throws SQLException
	{
		// 결과값으로 반환하게 될 변수 선언 및 초기화
		int result = 0;

		Statement stmt = conn.createStatement();
		
		String sql = "SELECT COUNT(*) FROM TBL_MEMBER";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		result = rs.getInt(1);
		
		// 결과값 반환
		return result;
	}
	
	// (완료)
	// 기능 -> 메소드 정의 -> 데이터 전체를 조회하는 기능 -> select 쿼리문 수행
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		// 결과값으로 반환하게 될 변수 선언 및 초기화
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			result.add(dto);
		}
		
		// 결과값 반환
		return result;
	}
	
	// (완료)
	// 기능 -> 메소드 정의 -> 데이터베이스 연결 종료 -> select 쿼리문 수행
	public void close() throws SQLException
	{
		DBConn.close();
	}
}
