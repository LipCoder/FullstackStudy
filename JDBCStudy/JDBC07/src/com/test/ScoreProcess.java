package com.test;

import java.util.ArrayList;
import java.util.Scanner;

import com.util.DBConn;

public class ScoreProcess
{
	private ScoreDAO dao;
	private Scanner sc;
	
	public ScoreProcess()
	{
		try
		{
			dao = new ScoreDAO();
			System.out.println("DB 접속 성공");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		sc = new Scanner(System.in);
	}
	
	// 입력
	public void insert()
	{
		try
		{
			ScoreDTO dto = new ScoreDTO();
			System.out.println();
			System.out.printf("%d번째 학생 정보를 입력하세요(이름, 국어, 영어, 수학점수) : ", dao.count());
			
            String name = sc.next();
            int kor = sc.nextInt();
            int eng = sc.nextInt();
            int mat = sc.nextInt();
			
			dto.setName(name);
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMat(mat);
			
			int result = dao.insertScore(dto);
			
			if(result > 0)
			{
				System.out.println("학생 정보 입력이 완료되었습니다.");
			}
			else
			{
				System.out.println("학생 정보 입력에 문제가 있습니다. 다시 시도해주세요.");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
	}
	
	// 전체출력
	public void printAll()
	{
		try
		{
			ArrayList<ScoreDTO> list = dao.lists();
			
			System.out.println();
			System.out.println("총 인원수 : " + list.size());
			System.out.println("--------------------------------------------------------------");
			System.out.println("SID  이름  국어  영어  수학  총점  평균  등수");
			for(ScoreDTO obj : list)
			{
				System.out.printf("%d   %4s  %3d  %3d  %3d  %3d  %5.1f  %3d\n"
						          , obj.getSid(), obj.getName()
						          , obj.getKor(), obj.getEng(), obj.getMat()
						          , obj.getTot(), obj.getAvg(), obj.getRank());
			}
			
			System.out.println("--------------------------------------------------------------");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 검색출력
	public void printSearch()
	{
		try
		{
			System.out.println();
			System.out.print("검색할 이름을 입력해주세요 : ");
			String name = sc.next();
			
			ArrayList<ScoreDTO> list = dao.lists(name);
			
			System.out.println(name + "의 총 검색 결과 : " + list.size());
			System.out.println("--------------------------------------------------------------");
			System.out.println("SID   이름   국어 영어 수학 총점 평균 등수");
			for(ScoreDTO obj : list)
			{
				System.out.printf("%d   %4s  %3d  %3d  %3d  %3d  %5.1f  %3d\n"
						          , obj.getSid(), obj.getName()
						          , obj.getKor(), obj.getEng(), obj.getMat()
						          , obj.getTot(), obj.getAvg(), obj.getRank());
			}
			
			System.out.println("--------------------------------------------------------------");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 수정
	public void modify()
	{
		try
		{
			ScoreDTO dto = new ScoreDTO();
			System.out.println();
			System.out.print("수정할 SID번호와 학생 정보를 입력하세요(SID, 이름, 국어, 영어, 수학점수) : ");
			
			int sid = sc.nextInt();
            String name = sc.next();
            int kor = sc.nextInt();
            int eng = sc.nextInt();
            int mat = sc.nextInt();
			
            dto.setSid(sid);
			dto.setName(name);
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMat(mat);
			
			int result = dao.modifyScore(dto);
			
			if(result > 0)
			{
				System.out.println("학생 정보 수정이 완료되었습니다.");
			}
			else
			{
				System.out.println("학생 정보 수정에 문제가 있습니다. 다시 시도해주세요.");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 삭제
	public void delete()
	{
		try
		{
			System.out.println();
			System.out.print("삭제할 학생 정보의 SID 번호를 입력해주세요 : ");
			
			int sid = sc.nextInt();
            
			int result = dao.deleteScore(sid);
			
			if(result > 0)
			{
				System.out.println("학생 정보 삭제가 완료되었습니다.");
			}
			else
			{
				System.out.println("학생 정보 삭제에 문제가 있습니다. 다시 시도해주세요.");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	public void close()
	{
		try
		{
			DBConn.close();
			System.out.println("DB 접속 해제");
		} catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
}
