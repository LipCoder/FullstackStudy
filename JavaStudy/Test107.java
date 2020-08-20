
/*=======================================================
 ■■■ 메소드 중복정의(Method Overloading) ■■■
 - Method Overloadiing이 가능한 형태와 불가능한 형태
=========================================================*/


public class Test107
{
	public static void main(String[] args)
	{
		print('A');

		double result = print(10.0);
		print(10.0);
	}
	
	public static void print() {};
	public static void print(int i) {}
	// public static void print(int j) {}					// (X)
	public static void print(char c) {}						// 자동 형 변환 규칙 check~!!!
	public static void print(int i, int j){}
	public static void print(double d) {}					// 자동 형 변환 규칙 check~!!!
	//public static double print(double d) {return 3.14;}	// (X)
	//public static void print(double d) {return 3.14;}		// 정의 불가
	//public static void print(double e) {}					// (X)

































}