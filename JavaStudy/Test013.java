/*=======================================================
     ■■■ 자바 기본 프로그래밍 ■■■
	 - 변수와 자료형
	 - 자바의 기본 입출력 : BufferedRender 클래스
=========================================================*/

// 사용자로부터 이름, 국어점수, 영어점수, 수학점수를 입력받아
// 이름과 총점을 출력하는 프로그램을 구현한다.

// 실행 예)
// 이름을 입력하세요 : 주제완
// 국어 점수 입력 : 90
// 영어 점수 입력 : 80
// 수학 점수 입력 : 70
// 
// ====[결과]====
// 이름 : 주제완
// 총점 : 240
// 계속하려면 아무 키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test013
{
	public static void main(String[] args) throws IOException
	{
		// BufferedReader Instance 생성
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader buffReader = new BufferedReader(isr);
		// == BufferedReader buffReader = new BufferedReader(new InputStreadReader(System.in));

		String name;							// strName (헝가리안)
		int korScore, engScore, mathScore;		// nKor, nEng, nMath (헝가리안)
		int totalScore;							// nTotal (헝가리안)

		// 추가 변수 선언
		String strTemp;							// -- 문자열 데이터를 임시로 저장할 변수

		// 1. 사용자에게 안내 메시지 출력 -> 이름 입력 안내
		System.out.print("이름을 입력하세요 : ");
		// 2. 사용자가 입력한 값(외부 데이터)를 변수에 담아내기
		name = buffReader.readLine();
		
		System.out.print("국어 점수 입력 : ");
		// 3. 입력받은 외부 데이터를 임시 문자열에 받아내고
		//    정수형으로 바꿔 알맞은 변수에 대입
		strTemp = buffReader.readLine();
		korScore = Integer.parseInt(strTemp);

		System.out.print("영어 점수 입력 : ");
		strTemp = buffReader.readLine();
		engScore = Integer.parseInt(strTemp);

		System.out.print("수학 점수 입력 : ");
		strTemp = buffReader.readLine();
		mathScore = Integer.parseInt(strTemp);

		// 4. 각 점수 변수에 담겨있는 데이터(입력 데이터)들을 
		//    종합하여 덧셈 연산을 수행하는 과정을 거쳐 총점을 산출하고
		//    그 결과를 총점 변수에 담아내기
		totalScore = korScore + engScore + mathScore;

		// 5. 결과 출력
		System.out.print("\n====[결과]====\n");
		System.out.printf("이름 : %s\n", name);
		System.out.printf("총점 : %d\n", totalScore);
	}
}