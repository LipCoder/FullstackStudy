// ○ 실습 문제
//    성적 처리 프로그램을 구현한다. -> 데이터베이스 연동 -> ScoreDAO, ScoreDTO 활용

//    여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
//    총점, 평균을 연산하여 출력하는 프로그램을 구현한다.
//    출력 시 번호(이름, 총점 등) 오름차순 정렬하여 출력한다.

// 실행 예)
/*
1번 학생 성적 입력(이름 국어 영어 수학) : 안혜지 80 75 60
2번 학생 성적 입력(이름 국어 영어 수학) : 허수민 100 90 80
3번 학생 성적 입력(이름 국어 영어 수학) : 박해진 80 85 80
4번 학생 성적 입력(이름 국어 영어 수학) : .

-----------------------------------------------------------------
번호    이름    국어    영어    수학    총점    평균
-----------------------------------------------------------------
1  	   안혜지    80      75      60     xxx     xx.x 
2      허수민   100      90      80     xxx     xx.x
3      박해진    80      85      80     xxx     xx.x
-----------------------------------------------------------------

*/

package com.test;

import java.sql.SQLException;
import java.util.Scanner;

public class ScoreMain
{
	public static void main(String[] args) throws ClassNotFoundException, SQLException
	{
		Scanner sc = new Scanner(System.in);
		ScoreDAO dao = new ScoreDAO();
		
		int num = dao.count();
		
		do
		{
			System.out.printf("%d번 학생 성적 입력(이름 국어 영어 수학) : ", (++num));

			String name = sc.next();

			if (name.equals("."))
				break;

			int kor = sc.nextInt();
			int eng = sc.nextInt();
			int mat = sc.nextInt();

			ScoreDTO dto = new ScoreDTO();
			dto.setSid(num);
			dto.setName(name);
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMat(mat);

			dao.insert(dto);
		} while (true);
		
		// 출력
		System.out.println("----------------------------------------------------------------- ");
		System.out.println("번호    이름    국어    영어    수학    총점    평균                            ");
		System.out.println("----------------------------------------------------------------- ");
		
		for(ScoreDTO obj : dao.lists())
		{
			System.out.printf("%2d\t %3s\t %3d\t %3d\t %3d\t %3d\t %2.1f\n"
					        , obj.getSid(), obj.getName()
					        , obj.getKor(), obj.getEng(), obj.getMat()
					        , obj.getTot(), obj.getAvg());
		}
		
		System.out.println("----------------------------------------------------------------- ");
		
	}
	
}
