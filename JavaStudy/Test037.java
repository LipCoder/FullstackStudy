/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - ���ǹ�(�б⹮)
	 - if��, if-else��
=========================================================*/

// ����
// ����ڷκ��� ������ ���� 5���� �Է¹޾�
// ¦��, Ȧ���� �հ踦 ����ϴ� ���α׷��� �����Ѵ�.
// ��, Scanner�� Ȱ���Ͽ� �������� ���е� �����͸�
// �ѹ��� �Է¹޾� ó���� �� �ֵ��� �Ѵ�.

// ���� ��)
// ���� 5��(���鱸��)�� �Է��ϼ��� : 12 3 4 5 6

// >> ¦���� ���� 22 �̰�, Ȧ���� ���� 8 �Դϴ�.
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.util.Scanner;
import java.io.IOException;

public class Test037
{
    public static void main(String[] args) throws IOException
    {
		Scanner sc = new Scanner(System.in);

		int a, b, c, d, e;			// �Է¹��� ����
		int oddSum = 0, evenSum = 0; // Ȧ����, ¦����

		// Scanner Ŭ���� nextInt() �޼��带 ���
		// ������ �����Ͽ� ���� 5���� �Է¹޾� 
		// �ټ� ���� ������ �־��ش�.
		a = sc.nextInt();
		b = sc.nextInt();
		c = sc.nextInt();
		d = sc.nextInt();
		e = sc.nextInt();
		
		// ������ ���� Ȧ��, ¦������ �Ǻ��ϰ�
		// Ȧ����, ¦���տ� �����ش�.
		if(a % 2 == 0) evenSum += a;
		else oddSum += a;

		if(b % 2 == 0) evenSum += b;
		else oddSum += b;

		if(c % 2 == 0) evenSum += c;
		else oddSum += c;

		if(d % 2 == 0) evenSum += d;
		else oddSum += d;

		if(e % 2 == 0) evenSum += e;
		else oddSum += e;

		System.out.printf("\n>> ¦���� ���� %d �̰�, Ȧ���� ���� %d �Դϴ�.\n", evenSum, oddSum);
    }
}