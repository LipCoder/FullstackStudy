/*=======================================================
	 ���� �ڹ� �⺻ ���α׷��� ����
	 - �ڹ��� �⺻ ����� : java.util.Scanner
=========================================================*/

// �� java.util.Scanner
//	  �ܶ� ���� ������ ����Ͽ� �Է��� ��ū�� ���� �����ϸ�
//    ����Ʈ(default)�� ���Ǵ� �ܶ����ڴ� �����̴�.
//    �ۼ��� ���� ��ū�� [next()] �޼ҵ带 ���
//    �ٸ� ����(�ڷ���)�� ������ ��ȯ�� �� �ִ�.

import java.util.Scanner;

public class Test018
{
	public static void main(String[] args)
	{
		// Scanner �ν��Ͻ� ����
		Scanner sc = new Scanner(System.in);

		// �ֿ� ���� ����
		String name;
		int kor, eng, math, total;


		// ���� �� ó��
		System.out.print("�̸�, ����, ����, ���� �Է�([,] ����) : ");
		sc = new Scanner(sc.next()).useDelimiter("\\s*,\\s*");		// -- Delimiter(������)	// "\\" => \
		//				 ---------               --------------
		//               ��¹�,90,80,70		 � �����̵��� ,�� �������� �ɰ��ڴ�.

		name = sc.next();
		kor = sc.nextInt();
		eng = sc.nextInt();
		math = sc.nextInt();

		total = kor + eng + math;
		
		// ��� ���
		System.out.println();
		System.out.println(">> �̸� : " + name);
		System.out.println(">> ���� : " + total);

	}
}

/*
�̸�, ����, ����, ���� �Է�([,] ����) : ��¹�,90,80,70

>> �̸� : ��¹�
>> ���� : 240
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/