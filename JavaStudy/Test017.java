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

public class Test017
{
	public static void main(String[] args)
	{
		// Scanner �ν��Ͻ� ����
		Scanner sc = new Scanner(System.in);

		// �ֿ� ���� ����
		String name;				// -- �̸�
		int kor, eng, math, total;  // -- ����, ����, ����, ����

		// ���� �� ó��
		// 1. ����ڿ��� �ȳ� �޼��� ���
		System.out.print("�̸� ���� ���� ���� �����Է�(���鱸��) : ");
		// ������ 90 80 70

		// 2. ����ڰ� �Է��� �����͸� �� ������ ��Ƴ���
		name = sc.next();
		kor = sc.nextInt();
		eng = sc.nextInt();
		math = sc.nextInt();

		// 3. ���� ����
		total = kor + eng + math;
		
		// ��� ���
		System.out.println();
		System.out.println(">> �̸� : " + name);
		System.out.println(">> ���� : " + total);

	}
}

/*
�̸� ���� ���� ���� �����Է�(���鱸��) : ������ 90 80 70

>> �̸� : ������
>> ���� : 240
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/