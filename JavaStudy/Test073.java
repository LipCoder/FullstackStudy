/*=======================================================
	 ■■■ 클래스와 인스턴스 ■■■
=========================================================*/

// 원의 넓이와 둘레 구하기
// 원의 넓이와 둘레를 구할 수 있는 클래스를 설계한다.
// (클래스명 : CircleTest)
//  -> CircleTest.java

// 원의 넓이 = 반지름 * 반지름 * 3.141592
// 원의 둘레 = 반지름 * 2 * 3.141592

// 실행 예)
// 반지름 입력 : xx

// 반지름이 xx인 원의
// 넓이 : xxx.xx
// 둘레 : xxx.xx
// 계속하려면 아무 키나 누르세요...

/* java.io. --> package라고 부른다 */
import java.io.IOException;

public class Test073
{
	public static void main(String[] args) throws IOException
	{
		CircleTest c = new CircleTest();
		
		c.input();		
		// input 메서드 내에서 IOException이 throw 되므로 이를 main에서 받아서 throw해줘야 한다.
		// 왜냐하면 main 메서드가 input 메서드를 품고 있기 때문이다.

		double a  = c.calcArea();
		double r = c.calcRound();

		c.print(a, r);
	}
}
