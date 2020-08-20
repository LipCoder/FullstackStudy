
// 프로그램을 구성하는 클래스
// 1. Record 클래스
//	  -> 속성만 존재하는 클래스로 설계할 것~!!!

public class Record
{
	// 학생 1명을 표현할 수 있는 속성들로 구성~!!! check~!!!

	String name;				// 이름
	int[] score = new int[3];	// 각 과목의 점수 -> int kor, eng, mat;
	int tot;					// 총점 
	double avg;					// 평균
	int rank;					// 등수(석차)
}