/*=======================================================
      ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
	  - Calendar Ŭ����
=========================================================*/

// ���� ��¥�� ��������
// �Է¹޴� ��¥��ŭ ���� ��, ��, ��, ������
// Ȯ���ѿ� ����� ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// ���� ��¥ : 2020-8-28 �ݿ���
// �� �� ���� ��¥�� Ȯ���ϰ��� �Ͻʴϱ�? : 200

// ========[ Ȯ�� ��� ]========
// 200�� �� : 2021-xx-xx x����
// =============================
// ����Ϸ��� �ƹ� Ű�� ��������...

// �� ���� ��¥�� �������� �� ���� ���ϴ� ���� �޼ҵ�
//    [��ü.add(Calendar.DATE, �� ��)]

import java.util.Calendar;
import java.util.Scanner;

public class Test149
{
	public static void main(String[] args)
	{
		// Scanner Ŭ���� ��� �ν��Ͻ� ����
		Scanner sc = new Scanner(System.in);

		// Calendar Ŭ���� ��� �ν��Ͻ� ����
		Calendar now = Calendar.getInstance();

		// �ֿ� ���� ����
		int nalsu;			//-- ����ڷκ��� �Է¹��� �� ��
		int y, m, d, w;		//-- ��, ��, ��, ����
		String[] week = {"��", "��", "ȭ", "��", "��", "��", "��"};

		// ������ ��, ��, ��, ���� Ȯ�� (�������� -> get())
		y = now.get(Calendar.YEAR);
		m = now.get(Calendar.MONTH) + 1; // check~!!!
		d = now.get(Calendar.DATE);
		w = now.get(Calendar.DAY_OF_WEEK);

		// ������ ��, ��, ��, ���� Ȯ�ΰ�� ���
		System.out.println("���� ��¥ : " + y + "-" + m + "-" + d
							+ " " + week[w-1] + "����");

		do
		{
			System.out.print("�� �� ���� ��¥�� Ȯ���ϰ��� �Ͻʴϱ�? : ");
			nalsu = sc.nextInt();
		}
		while (nalsu < 1);

		// check~!!!
		now.add(Calendar.DATE, nalsu);


		// ���� ��� ���
		System.out.println();
		System.out.println("========[ Ȯ�� ��� ]========");
		System.out.printf("%d�� �� : %tF %tA\n", nalsu, now, now);	// %tF -> ��¥ ��� ����, %tA -> ���� ��� ���� 
		System.out.println("=============================");

		/*
		Calendar c = Calendar.getInstance();
		Scanner s = new Scanner(System.in);

		int y = c.get(Calendar.YEAR);
		int m = c.get(Calendar.MONTH);
		int d = c.get(Calendar.DATE);

		char[] wArr = { '\0', '��', '��', 'ȭ', '��', '��', '��', '��' };
		int w = c.get(Calendar.DAY_OF_WEEK);

		System.out.printf("���� ��¥ : %d-%d-%d %c����\n", y, m + 1, d, wArr[w]);

		int dayAfter;
		System.out.print("�� �� ���� ��¥�� Ȯ���ϰ��� �Ͻʴϱ�? : ");
		dayAfter = s.nextInt();

		c.add(Calendar.DATE, dayAfter);

		y = c.get(Calendar.YEAR);
		m = c.get(Calendar.MONTH);
		d = c.get(Calendar.DATE);
	    w = c.get(Calendar.DAY_OF_WEEK);

		System.out.print("\n========[ Ȯ�� ��� ]========\n");
		System.out.printf("%d�� �� : %d-%d-%d %c����\n", dayAfter, y, m + 1, d, wArr[w]);
		System.out.println("=============================");
		*/
	}
}

/*
���� ��¥ : 2020-8-28 �ݿ���
�� �� ���� ��¥�� Ȯ���ϰ��� �Ͻʴϱ�? : 200

========[ Ȯ�� ��� ]========
200�� �� : 2021-03-16 ȭ����
=============================
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/