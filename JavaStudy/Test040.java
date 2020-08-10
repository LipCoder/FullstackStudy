/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - ���ǹ�(�б⹮)
	 - switch �� �ǽ�
=========================================================*/

// 1���� 3������ ���� �� �ϳ��� ����ڷκ��� �Է¹޾�
// �Է¹��� ������ŭ�� �����ڰ� ��µǴ� ���α׷��� �ۼ��Ѵ�
// ��, �� ���� ������� ������ �� �ֵ��� �Ѵ�.

// 1. switch ���� �Ϲ� ���� ����Ͽ� ������ �ذ��Ѵ�.
// 2. switch ���� �⺻ ���� ����ϵ�,
//    [break]�� �� �� ���� ����Ͽ� ������ �ذ��Ѵ�. 

// ���� ��)
// ������ ���� �Է�(1~3) : 3
// �ڡڡ�
// ����Ϸ��� �ƹ� Ű�� ��������...

// ���� ��)
// ������ ���� �Է�(1~3) : 1
// ��
// ����Ϸ��� �ƹ� Ű�� ��������...

// ���� ��)
// ������ ���� �Է�(1~3) : 7
// �Է� ����~!!!
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

public class Test040
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int count;

		System.out.print("������ ���� �Է�(1~3) : ");
		count = Integer.parseInt(br.readLine());

		// 1
		/*
		switch(count)
		{
			case 1: System.out.println("��"); break;
			case 2: System.out.println("�ڡ�"); break;
			case 3: System.out.println("�ڡڡ�"); break;
			default: System.out.println("�Է� ����~!!!");
		}
		*/

		// 2
		switch(count)
		{
			case 3: System.out.print("��"); 
			case 2: System.out.print("��"); 
			case 1: System.out.print("��"); break;
			default: System.out.print("�Է� ����~!!!");
		}
		System.out.println();
	}
}