package com.test;

import java.util.Scanner;

public class Process
{
	// 주요 속성 구성
	private ScoreDAO dao;
	private Scanner sc;

	// 생성자 정의 -> 사용자 정의 생성자
	public Process()
	{
		dao = new ScoreDAO();
	}
	
	// 주요 기능 구성
	// - 성적 입력
	public void sungjukInsert()
	{
		try
		{
			dao.connection();
			
			int count = dao.count();
			sc = new Scanner(System.in);
			
			do
			{
				System.out.println();
				System.out.printf("%d번 학생 성적 입력(이름 국어 영어 수학) : ", (++count));
				String name = sc.next();
				if(name.equals("."))
					break;
				int kor = sc.nextInt();
				int eng = sc.nextInt();
				int mat = sc.nextInt();
				
				ScoreDTO dto = new ScoreDTO();
				dto.setName(name);
				dto.setKor(kor);
				dto.setEng(eng);
				dto.setMat(mat);
				
				int result = dao.add(dto);
				if(result > 0)
					System.out.println(">> 성적 입력이 완료되었습니다.");
			} while(true);
			
			dao.close();
			
		} catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
}
