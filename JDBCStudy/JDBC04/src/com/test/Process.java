package com.test;

import java.util.ArrayList;
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
				if (name.equals("."))
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
				if (result > 0)
					System.out.println(">> 성적 입력이 완료되었습니다.");
			} while (true);

			dao.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}

	// - 성적 전체 출력
	public void sungjukSelectAll()
	{
		try
		{
			dao.connection();

			System.out.printf("전체인원 %d명\n", dao.count());
			System.out.println("번호    이름    국어  영어  수학  총점    평균  석차");
			for (ScoreDTO obj : dao.lists())
			{
				System.out.printf("%s      %3s    %3d   %3d   %3d   %3d   %5.1f   %3d\n", obj.getSid(), obj.getName(),
						obj.getKor(), obj.getEng(), obj.getMat(), obj.getTot(), obj.getAvg(), obj.getRank());
			}

			dao.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}

	// - 이름 검색 출력
	public void sungjukSearchName()
	{
		try
		{
			sc = new Scanner(System.in);

			System.out.print("검색할 이름을 입력하세요 : ");
			String name = sc.next();

			// -- 필요한 경우 이 과정에서 프로그래밍적으로 검증(검사) 수행

			// -- DB 연결
			dao.connection();

			// lists() 메소드 호출 -> 매개변수로 검색할 이름 넘겨주기
			ArrayList<ScoreDTO> arr = dao.lists(name);
			System.out.printf("검색된 인원 %d명\n", arr.size());
			System.out.println("번호    이름    국어  영어  수학  총점    평균  석차");
			for (ScoreDTO obj : arr)
			{
				System.out.printf("%s      %3s    %3d   %3d   %3d   %3d   %5.1f   %3d\n", obj.getSid(), obj.getName(),
						obj.getKor(), obj.getEng(), obj.getMat(), obj.getTot(), obj.getAvg(), obj.getRank());
			}

			dao.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}

	// - 성적 수정
	public void sungjukUpdate()
	{
		// 코드가 많이 달라서 쎔 코드 작성
		try
		{
			// 수정할 학생의 번호 입력
			sc = new Scanner(System.in);
			System.out.print("수정할 학생의 번호를 입력하세요 : ");
			int sid = sc.nextInt();
			
			// -- 입력받은 번호로 체크(검증)해야 할 로직 적용 및 삽입 가능
			
			dao.connection();
			
			ArrayList<ScoreDTO> arrayList = dao.lists(sid);
			if(arrayList.size() > 0)
			{
				System.out.println("번호    이름    국어  영어  수학  총점    평균  석차");
				for (ScoreDTO obj : arrayList)
				{
					System.out.printf("%s      %3s    %3d   %3d   %3d   %3d   %5.1f   %3d\n"
							, obj.getSid(), obj.getName()
							,obj.getKor(), obj.getEng(), obj.getMat()
							, obj.getTot(), obj.getAvg(), obj.getRank());
				}
				
				System.out.print("수정 데이터 입력(이름 국어 영어 수학) : ");
				String name = sc.next();
				int kor = sc.nextInt();
				int eng = sc.nextInt();
				int mat = sc.nextInt();
				
				ScoreDTO dto = new ScoreDTO();
				dto.setName(name);
				dto.setKor(kor);
				dto.setEng(eng);
				dto.setMat(mat);
				dto.setSid(String.valueOf(sid));	// check~!!!
				
				int result = dao.modify(dto);

				if(result > 0)
					System.out.println(">> 수정이 완료되었습니다.");
				
			}
			else
			{
				System.out.println("수정 대상이 존재하지 않습니다.");
			}
			
			dao.close();
			
		} catch (Exception e)
		{
			// TODO: handle exception
			System.out.println(e.toString());
		}
		
		
		// 내 코드
		/*
		try
		{
			dao.connection();
			
			sc = new Scanner(System.in);

			System.out.println();
			System.out.print("수정할 정보 입력(번호 이름 국어 영어 수학) : ");
			String sid = sc.next();
			String name = sc.next();
			int kor = sc.nextInt();
			int eng = sc.nextInt();
			int mat = sc.nextInt();

			ScoreDTO dto = new ScoreDTO();
			dto.setSid(sid);
			dto.setName(name);
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMat(mat);

			int result = dao.modify(dto);
			if (result > 0)
				System.out.println(">> 성적 수정이 완료되었습니다.");
			else
				System.out.println(">> 잘못 입력하였거나 데이터가 존재하지 않습니다.");

			dao.close();
			
		} catch(Exception e)
		{
			System.out.println(e.toString());
		}
		*/
	}

	// - 성적 삭제
	public void sungjukDelete()
	{
		try
		{
			
			sc = new Scanner(System.in);

			System.out.println();
			System.out.print(">> 삭제할 번호 입력 : ");
			int sid = sc.nextInt();

			//-- 필요한 유효성 검사 수행
			
			// 데이터베이스 연결
			dao.connection();

			// dao 의 list() 메소드 호출 -> sid 를 매개변수로 넘기기
			ArrayList<ScoreDTO> arrayList = dao.lists(sid);
			if(arrayList.size() > 0)
			{
				System.out.println("번호    이름    국어  영어  수학  총점    평균  석차");
				for (ScoreDTO obj : arrayList)
				{
					System.out.printf("%s      %3s    %3d   %3d   %3d   %3d   %5.1f   %3d\n"
							, obj.getSid(), obj.getName()
							,obj.getKor(), obj.getEng(), obj.getMat()
							, obj.getTot(), obj.getAvg(), obj.getRank());
				}
				
				System.out.print("정말 삭제하시겠습니까?(Y/N) : ");
				String response = sc.next(); 		// Y or y or N or n or etc...
				
				if(response.contentEquals("Y") || response.equals("y"))
				{
					int result = dao.remove(sid);
					if(result > 0)
						System.out.println(">> 삭제가 완료되었습니다.");
				}
				else
				{
					System.out.println(">> 취소되었습니다.");
				}
			}
			else
			{
				System.out.println(">> 삭제 대상이 존재하지 않습니다.");
			}
			
			dao.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}

}
