/*========================================
 * Test002.java
 * - 데이터 입력 실습 진행
 *========================================*/


package com.test;

import java.sql.Connection;
import java.sql.Statement;

import com.util.DBConn;

// 데이터 입력 쿼리 실행 과정
// 한 번 실행하면 다시 실행하지 모산다.
// 즉, 다시 실행하면 에러 발생한다.
// -> 기본키 제약조건이 설정되어 있으므로...

public class Test002
{
	public static void main(String[] args)
	{
		// 커넥션 생성
		// (ex. 탄광의 갱도레일 생성)
		Connection conn = DBConn.getConnection();
		
		if(conn == null)
		{
			System.out.println("데이터베이스 연결 실패~!!!");
			System.exit(0);
			// System.exit는 프로그램을 빠져나오는 메서드이다.
			// 매개변수로 받는 0은 어떤 값을 주면서 리소스를 종료 시키겠다는 뜻이다.
		}
		
		//System.out.println("데이터베이스 연결 성공~!!!");
		
		try
		{
			// 작업 객체 준비
			// Statement java.sql.Connection.createStatement() throws SQLException
			// (ex. 탄광의 갱도열차 생성)
			Statement stmt = conn.createStatement();
			
			// 쿼리문 준비
			String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(2, '박다빈', '010-2222-2222')";
			//-- 주의. 쿼리문 끝에 [ ; ] 절대 붙이지 않는다.
			//-- 주의. 자바에서 실행한 DML 구문은 내부적으로 자동 COMMIT 된다.
			//-- 주의. 오라클에서 트랜잭션 처리가 끝나지 않으면 
			//         데이터 액션 처리가 이루어지지 않는다.
			//         (즉, 오라클에서 직접 쿼리문을 테스트할 경우
			//          COMMIT 또는 ROLLBACK 을 반드시 수행할 수 있도록 한다.)
			//         (해주지 않는다면 무한루프가 돌 수 있다. (쿼리문은 계속 보내고 오라클에서는 계속 제한하고 반복...) )
			
			
			// 작업 객체를 활용하여 쿼리문 실행
			// -> 적용된 행의 갯수 반환
			int result = stmt.executeUpdate(sql);
			// 업데이트 되는 행의 갯수는 1개 이므로 result는 1이다.
			
			if(result > 0)
			{
				System.out.println("데이터 입력 성공~!!!");
			}
			else
			{
				System.out.println("데이터 입력 실패 ㅠ_ㅠ");
			}
			
		} catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		// 커넥션 종료
		DBConn.close();
	}
}
