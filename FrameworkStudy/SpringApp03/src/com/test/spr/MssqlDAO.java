// MssqlDAO.java
// - DAO 구성
// - MssqlDAO 와 다른 설정으로 구성.

package com.test.spr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MssqlDAO implements IDAO
{

	@Override
	public List<MemberDTO> list() throws ClassNotFoundException, SQLException
	{
		List<MemberDTO> result = new ArrayList<MemberDTO>();
		
		// 데이터베이스 연결
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@211.238.142.168:1521:xe", "scott", "tiger");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@211.238.142.168:1521:xe", "scott", "tiger");
		
		// SELECT 쿼리문 준비 및 실행
		String sql = "SELECT ID, NAME, TEL, EMAIL FROM TBL_MEMBERLIST ORDER BY ID";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		// 결과 집합(resultSet)을 컬렉션(result)에 추가
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setId(rs.getString("ID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			dto.setEmail(rs.getString("EMAIL"));
			
			result.add(dto);
		}
		
		// 리소스 반납
		rs.close();
		stmt.close();
		
		// 데이터베이스 연결 종료
		if(!conn.isClosed())
			conn.close();
		
		return result;
	}
	
}
