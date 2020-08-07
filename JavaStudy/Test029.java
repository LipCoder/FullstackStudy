/*=======================================================
	 ���� ������(Operator) ����
	 - ���� ������(-> ���� ������)
=========================================================*/

// ����ڷκ��� ������ ������ �Է¹޾�
// �Է¹��� ������... �������� ������� �Ǻ��Ͽ�
// �� ����� ����ϴ� ���α׷��� �����Ѵ�.
// ��, �Է��� BufferedReader�� Ȱ���ϰ�
// ���ǿ����ڸ� Ȱ���Ͽ� ������ ������ �� �ֵ��� �Ѵ�.

// ���� ��)
// ������ ���� �Է� : 2000
// 2000�� -> ����
// ����Ϸ��� �ƹ� Ű�� ��������...

// ������ ���� �Է� : 2012
// 2012�� -> ����
// ����Ϸ��� �ƹ� Ű�� ��������...

// * 2�� 28�� ���� �ִ� �� -> ���
//		 29�� ���� �ִ� �� -> ����

// * ������ �Ǻ� ����
//   ������ 4�� ����̸鼭 100�� ����� �ƴϰų�
//   400�� ����̸� ����
//   �׷��� ������ ���

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test029
{
	public static void main(String[] args) throws IOException
	{
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);
		int year;
		
		System.out.print("������ ���� �Է� : ");
		year = Integer.parseInt(br.readLine());

		String yearType;
		// 400�� ����̰ų� or (4�� ���������, 100�� ����� �ƴ�) ��
		boolean isLeap = (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0);
		yearType = isLeap ? "����" : "���";

		System.out.printf("%d�� -> %s\n", year, yearType);
	}
}

/*
������ ���� �Է� : 2000
2000�� -> ����
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .


������ ���� �Է� : 3000
3000�� -> ���
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/