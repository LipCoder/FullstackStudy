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
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
				                + " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')",
				                dto.getName(), dto.getTel() );
		
		// 쿼리문 실행
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		// 결과값 반환
		return result;
		
	}// end add
	
	// (완료)
	// 기능 -> 메소드 정의 -> 인원 수를 파악하는 기능 -> select 쿼리문 수행
	public int count() throws SQLException
	{
		// 결과값으로 반환하게 될 변수 선언 및 초기화
		int result = 0;

		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		// 쿼리문 실행 -> select 쿼리문 -> ResultSet 반환
		ResultSet rs = stmt.executeQuery(sql);
		
		// ResultSet 처리 -> 반복문 구성
		while(rs.next())
		{
			result = rs.getInt("COUNT");	// result = rs.getInt(1);
		}
		
		rs.close();
		stmt.close();
		
		// 결과값 반환
		return result;
	}
	
	// (완료)
	// 기능 -> 메소드 정의 -> 데이터 전체를 조회하는 기능 -> select 쿼리문 수행
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		// 결과값으로 반환하게 될 변수 선언 및 초기화
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		// 쿼리문 실행
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			// MemberDTO 인스턴스 생성
			MemberDTO dto = new MemberDTO();
			
			// 생성된 MemberDTO 객체에 속성들 채워넣기
			dto.setSid(rs.getString("SID"));			// dto.setSid(rs.getString(1));
			dto.setName(rs.getString("NAME"));			// dto.setSid(rs.getString(2));
			dto.setTel(rs.getString("TEL"));			// dto.setSid(rs.getString(3));
														// ※ 컬럼의 인덱스는 0이 아닌 1부터
			
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

/*
 
※ 반환 자료형에 대한 고찰
SELECT NAME
FROM TBL_MEMBER
WHERE SID = 1;
-> String

SELECT NAME
FROM TBL_MEMBER;
-> String들 -> String 배열이나... String 을 요소로 취하는 자료구조

SELECT SID, NAME, TEL
FROM TBL_MEMBER
WHERE SID = 1;
-> MemberDTO

SELECT SID, NAME, TEL
FROM TBL_MEMBER;
-> MemberDTO 들

*/
