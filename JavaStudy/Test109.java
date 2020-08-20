/*=======================================================
      ���� �ֹε�Ϲ�ȣ ��ȿ�� �˻� ����
=========================================================*/

/*
��	�ֹε�Ϲ�ȣ ���� ����
	
	1. ������ �ڸ��� ������ ���ڸ� ���� ��Ģ�� �°� ���Ѵ�.
		
		123456-1234567 (�ֹι�ȣ)
		****** ******* ------------------- �� �ڸ����� ���ϱ�
		234567 892345  (�� �ڸ��� ������ ��)

	2. ��Ģ�� �°� ���� ������ ������ ����� ��� ���Ѵ�.

	ex) 7 5 0 6 1 5 - 1 8 6 2 1 3 3
		* * * * * *   * * * * * *
		2 3 4 5 6 7   8 9 2 3 4 5
	---------------------------------------
	-> 14 + 15 + 0 + 30 + 6 + 35 + 8 + 72 + 12 + 6 + 4 + 15

	   == 217

	3. ������ ������� 11�� ������ ������������ ���Ѵ�

			19
	   -------------
	11 |   217
	       11
       -------------
	       107
		    99
	   -------------
	         8 -> ������

	4. 11���� ������(8)�� �� ������� ���Ѵ�.

		11 - 8 -> 3

		�� 3�� ó�� �������� �������� 0�� ��� -> 11 - 0 -> 11 -> 1
									  1�� ��� -> 11 - 1 -> 10 -> 0
		   �̸� �ٽ� 10���� ������ �������� ���Ѵ�.

	5. 4�� ���� ����� �ֹι�ȣ�� �����ϴ� ������ ���ڿ�
	   ��ġ�ϴ����� ���θ� Ȯ���Ѵ�.

	   ��ġ   -> ��ȿ�� �ֹι�ȣ
	   ����ġ -> �߸��� �ֹι�ȣ


*/

// ���� ��)
// �ֹι�ȣ �Է�(xxxxxx-xxxxxxx) : 123456-12345678 -> �Է� ���� �ʰ�
// >> �Է� ����
// ����Ϸ��� �ƹ� Ű�� ��������...

// �ֹι�ȣ �Է�(xxxxxx-xxxxxxx) : 123456-123456   -> �Է� ���� �̴�
// >> �Է� ����
// ����Ϸ��� �ƹ� Ű�� ��������...

// �ֹι�ȣ �Է�(xxxxxx-xxxxxxx) : 750615-1252085  -> ��ȿ�� �ֹι�ȣ
// >> ��Ȯ�� �ֹι�ȣ
// ����Ϸ��� �ƹ� Ű�� ��������...

// �ֹι�ȣ �Է�(xxxxxx-xxxxxxx) : 750615-1252084  -> ��ȿ���� ���� �ֹι�ȣ
// >> �߸��� �ֹι�ȣ
// ����Ϸ��� �ƹ� Ű�� ��������...


// �߰� ��~!!!

// �迭.length		  -> �迭�� ����(�迭���� ����) ��ȯ
// ���ڿ�.length()	  -> ���ڿ��� ���� ��ȯ
// ���ڿ�.substring() -> ���ڿ� ����

import java.util.Scanner;

class Identifier
{
	private String first, last;
	private final int[] firstArr = {2, 3, 4, 5, 6, 7};
	private final int[] secondArr = {8, 9, 2, 3, 4, 5};

	private boolean input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("�ֹι�ȣ �Է�(xxxxxx-xxxxxxx) : ");
		String temp = sc.next();

		if(temp.length() < 14 || temp.length() > 14) 
		{
			System.out.println(">> �Է� ����");
			return false;
		}

		first = temp.substring(0, 7);
		last = temp.substring(7);

		return true;
	}

	private int toNum(char c)
	{
		return (c - '0');
	}
}

public class Test109
{
	public static void main(String[] args)
	{
		/*
		String tmp = "study-hard";
		System.out.println(tmp.length());

		tmp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		System.out.println(tmp.substring(3, 5));	// 3 ~ 4��°����
		// --==>> DE
		// ABCDEFGHIJKLMNOPQRSTUVWXYZ
		// 0123456789...
		//    DE

		tmp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		System.out.println(tmp.substring(13, 17)); // 13 ~ 16��°����

		//int[] arr = {1, 2, 3};
		//System.out.println(arr[5]);
		//--==>> ���� �߻� -> ArrayIndexOUtOfBoundsException

		//tmp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		//System.out.println(tmp.substring(13, 57)); // 13 ~ 56��°����
		//--==>> ���� �߻� -> StringIndexOUtOfBoundsException

		tmp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		System.out.println(tmp.substring(15)); // 15 ~ ������
		*/

	}
}