/*===========================
  #10. DepartmentDAO.java         
  - 데이터베이스 액션 처리 클래스.
  - 부서 데이터 입출력 및 수정 삭제.
  - Connection 객체에 대한 의존성 주입 준비 
    →인터페이스 자료형 / setter 구성 
 ===========================*/

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

   
   // ※ Override
   
   // 부서 전체 리스트 출력
   @Override
   public ArrayList<Department> list() throws SQLException
   {
      ArrayList<Department> result = new ArrayList<Department>();
      
      // DB conn, sql set for dataSource
      Connection conn = dataSource.getConnection();
      String sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK"
            + " FROM DEPARTMENTVIEW"
            + " ORDER BY DEPARTMENTID";
      
      // pstmt
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      // ResultSet
      ResultSet rs = pstmt.executeQuery();
      
      while (rs.next())
      {
         Department department = new Department();
         
         department.setDepartmentId(rs.getString("DEPARTMENTID"));
         department.setDepartmentName(rs.getString("DEPARTMENTNAME"));
         department.setDelCheck(rs.getInt("DELCHECK"));
         
         result.add(department);
      }
      // close
      rs.close();
      pstmt.close();
      conn.close();
            
      return result;
   }
   
   // 부서 데이터 입력(등록, 추가)
   @Override
   public int add(Department department) throws SQLException
   {
      int result = 0;
      
      // db conn, sql
      Connection conn = dataSource.getConnection();
      String sql = "INSERT INTO DEPARTMENT"
            + "(DEPARTMENTID, DEPARTMENTNAME)"
            + " VALUES(DEPARTMENTSEQ.NEXTVAL, ?)"; 
            
            /*"INSERT INTO DEPARTMENT"
            + "(DEPARTMENTID, DEPARTMENTNAME)"
            + " VALUES(DEPARTMENTSEQ.NEXTVAL, '사업부')";*/
      
      // 작업 객체 생성, db에 sql 연결, index 세팅
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, department.getDepartmentName());
      
      // sql 문 실행
      result = pstmt.executeUpdate();
      
      // close
      pstmt.close();
      conn.close();
      
      return result;
   }

   // 부서 데이터 삭제(제거)
   @Override
   public int remove(String departmentId) throws SQLException
   {
      int result = 0;
      
      // db conn, sql setting
      Connection conn = dataSource.getConnection();
      String sql = "DELETE"
            + " FROM DEPARTMENT"
            + " WHERE DEPARTMENTID = ?";
      
      // 작업객체 PrepareStatement, db에 sql 문 연결
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      // pstmt 인자값 set
      pstmt.setInt(1, Integer.parseInt(departmentId));
      
      // sql execute
      result = pstmt.executeUpdate();
      
      return result;
   }

   // 부서 데이터 수정(변경)
   @Override
   public int modify(Department department) throws SQLException
   {
      int result = 0;
      
      // DB conn, sql setting
      Connection conn = dataSource.getConnection();
      String sql = "UPDATE DEPARTMENT"
            + " SET DEPARTMENTNAME=?"
            + " WHERE DEPARTMENTID=?";
      
      // 작업객체 PreparedStatement 로 구성, 그 작업객체에 db, sql 문 연결
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      // 작업객체 pstmt의 인자값 set
      pstmt.setString(1, department.getDepartmentName());
      pstmt.setInt(2, Integer.parseInt(department.getDepartmentId()));
      
      // execute
      result = pstmt.executeUpdate();
      
      // resource return(close())
      pstmt.close();
      conn.close();
      
      
      return result;
   }


   
	@Override
	public Department searchId(String departmentId) throws SQLException
	{
		Department department = new Department();
		
		Connection conn = dataSource.getConnection();
		String sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK"
				+ " FROM DEPARTMENTVIEW"
				+ " WHERE DEPARTMENTID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, departmentId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			department.setDepartmentId(rs.getString("DEPARTMENTID"));
			department.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			department.setDelCheck(rs.getInt("DELCHECK"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return department;
	}
   
}