/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - ���ǹ�(�б⹮)
	 - if��, if-else��
=========================================================*/

// ����ڷκ��� ������ ������ �Է¹޾�
// �Է¹��� ������... ¦������, Ȧ������, ������
// ����� �Ǻ��Ͽ� ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// ������ ���� �Է� : 4
// 4 -> ¦��
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test032
{
	public static void main(String[] args) throws IOException
	{
		// teacher's code 
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int n;

		System.out.print("������ ���� �Է� : ");
		n = Integer.parseInt(br.readLine());

		/*
		if(n % 2 == 0)
		{
			System.out.println(n + " -> ¦��");
		}
		else if(n % 2 != 0)
		{
			System.out.println(n + " -> Ȧ��");
		}
		else if(n == 0)
		{
			System.out.println(n + " -> ��");
		}
		*/

		// else ���� �����Ƿ� ���� �ʱ�ȭ �����ش�.
		String result = "�Ǻ� �Ұ�";

		if(n == 0)
		{
			result = "��";
		}
		else if(n % 2 == 0)
		{
			result = "¦��";
		}
		else if(n % 2 != 0)
		{
			result = "Ȧ��";
		}

		System.out.println(n + " -> " + result);

		// my code 
		/*
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);
		
		int num;
		String type;

		System.out.print("������ ���� �Է� : ");
		num = Integer.parseInt(br.readLine());
	
		if(num == 0)
		{
			type = "��";
		}
		else
		{
			type = (num % 2 == 0) ? "¦��" : "Ȧ��";
		}
		
		System.out.printf("%d -> %s\n", num, type);
		*/
	}
}

// �� ���ǹ��� ������ ������ �׻� ������ ���� ������ �����ؾ� �Ѵ�.

// �� ���ǹ��� ���� �������� �̿��� ����(else)��
//    ������ ���Ե� �������� ó���ϴ� ���� �ٶ������� ���� ��찡 �ִ�.
//    �Ұ����� ���� ��¿ �� ������
//    �������̸� ������ ���Ե��� ���� ������
//    �̿��� ����(else)���� ó���� �� �ֵ��� ����.

