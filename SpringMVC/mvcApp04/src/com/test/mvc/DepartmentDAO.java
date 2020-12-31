/*===========================
  #08. DepartmentDAO.java         
  - 데이터베이스 액션 처리 클래스.
  - 부서 데이터 입출력 및 수정 삭제.
  - Connection 객체에 대한 의존성 주입 준비 
    →인터페이스 자료형 / setter 구성 
 ===========================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class DepartmentDAO implements IDepartmentDAO
{
	// 인터페이스 자료형 기반 속성 구성
		private DataSource dataSource;
		
		// setter 메소드 구성
		public void setDataSource(DataSource dataSource)
		{
			this.dataSource = dataSource;
		}
		
		// 부서 데이터 리스트 출력
		@Override
		public ArrayList<Department> list() throws SQLException
		{
			
		}
			
		// 부서 데이터 입력(등록, 추가)
		@Override
		public int add(Department department) throws SQLException
		{
			
		}
		
		// 부서 데이터 삭제(제거)
		@Override
		public int remove(String departmentId) throws SQLException
		{
			
		}

		// 부서 데이터 수정
		@Override
		public int modify(Department department) throws SQLException
		{
			
		}
}
