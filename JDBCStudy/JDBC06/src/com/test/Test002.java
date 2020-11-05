
/*
실행 예)

번호 입력(-1 종료) : 11
이름 입력 : 조영욱
전화번호 입력 : 010-1234-1234
>> 데이터베이스 연결 성공~!!!
>> 회원 정보 입력 완료~!!!

번호 입력(-1 종료) : 12
이름 입력 : 조윤상
전화번호 입력 : 010-2345-2345
>> 데이터베이스 연결 성공~!!!
>> 회원 정보 입력 완료~!!!

번호 입력(-1 종료) : -1
>> 데이터베이스 연결 닫힘~!!!
>> 프로그램 종료됨~!!!
*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

import com.util.DBConn;

public class Test002
{
	public static void main(String[] args) throws SQLException
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			Connection conn = DBConn.getConnection();
			int inputNum = 0;
			String name, phone;

			do
			{
				System.out.println();
				System.out.print("번호 입력(-1 종료) : ");
				inputNum = sc.nextInt();

				if (inputNum == -1)
					break;

				System.out.print("이름 입력 : ");
				name = sc.next();

				System.out.print("전화번호 입력 : ");
				phone = sc.next();

				String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)" 
				          + " VALUES(?, ?, ?)";

				try
				{
					System.out.println(">> 데이터베이스 연결 성공~!!!");

					PreparedStatement pstmt = conn.prepareStatement(sql);

					pstmt.setInt(1, inputNum);
					pstmt.setString(2, name);
					pstmt.setString(3, phone);

					int result = pstmt.executeUpdate();
					if (result > 0)
						System.out.println(">> 회원 정보 입력 완료~!!!");
					pstmt.close();
				} catch (Exception e)
				{
					e.printStackTrace();
				}

			} while (true);

			DBConn.close();
			System.out.println(">> 데이터베이스 연결 닫힘~!!!");
			System.out.println(">> 프로그램 종료됨~!!!");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
}
