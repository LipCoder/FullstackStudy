/*=======================================================
     ���� �ڹ� �⺻ ���α׷��� ����
	 - ������ �ڷ���
	 - �ڹ��� �⺻ ����� : BufferedRender Ŭ����
=========================================================*/

// ����ڷκ��� �̸�, ��������, ��������, ���������� �Է¹޾�
// �̸��� ������ ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// �̸��� �Է��ϼ��� : ������
// ���� ���� �Է� : 90
// ���� ���� �Է� : 80
// ���� ���� �Է� : 70
// 
// ====[���]====
// �̸� : ������
// ���� : 240
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test013
{
	public static void main(String[] args) throws IOException
	{
		// BufferedReader Instance ����
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader buffReader = new BufferedReader(isr);
		// == BufferedReader buffReader = new BufferedReader(new InputStreadReader(System.in));

		String name;							// strName (�밡����)
		int korScore, engScore, mathScore;		// nKor, nEng, nMath (�밡����)
		int totalScore;							// nTotal (�밡����)

		// �߰� ���� ����
		String strTemp;							// -- ���ڿ� �����͸� �ӽ÷� ������ ����

		// 1. ����ڿ��� �ȳ� �޽��� ��� -> �̸� �Է� �ȳ�
		System.out.print("�̸��� �Է��ϼ��� : ");
		// 2. ����ڰ� �Է��� ��(�ܺ� ������)�� ������ ��Ƴ���
		name = buffReader.readLine();
		
		System.out.print("���� ���� �Է� : ");
		// 3. �Է¹��� �ܺ� �����͸� �ӽ� ���ڿ��� �޾Ƴ���
		//    ���������� �ٲ� �˸��� ������ ����
		strTemp = buffReader.readLine();
		korScore = Integer.parseInt(strTemp);

		System.out.print("���� ���� �Է� : ");
		strTemp = buffReader.readLine();
		engScore = Integer.parseInt(strTemp);

		System.out.print("���� ���� �Է� : ");
		strTemp = buffReader.readLine();
		mathScore = Integer.parseInt(strTemp);

		// 4. �� ���� ������ ����ִ� ������(�Է� ������)���� 
		//    �����Ͽ� ���� ������ �����ϴ� ������ ���� ������ �����ϰ�
		//    �� ����� ���� ������ ��Ƴ���
		totalScore = korScore + engScore + mathScore;

		// 5. ��� ���
		System.out.print("\n====[���]====\n");
		System.out.printf("�̸� : %s\n", name);
		System.out.printf("���� : %d\n", totalScore);
	}
}