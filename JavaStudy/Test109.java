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
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

class Identifier
{
	private String first, last;
	// �ֹι�ȣ Ȯ������
	private final int[] firstIdentifyInfo = {2, 3, 4, 5, 6, 7};
	private final int[] lastIdentifyInfo = {8, 9, 2, 3, 4, 5};

	private boolean input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("�ֹι�ȣ �Է�(xxxxxx-xxxxxxx) : ");
		String temp = sc.next();

		// ���� �Է¹��� ���̰� �ֹι�ȣ ���̿� ������ 
		// ����� �Էµ� ��
		if(temp.length() == 14) 
		{
			// �� �� ��ȣ�� �ɰ���.
			first = temp.substring(0, 7);
			last = temp.substring(7);

			return true;
		}

		System.out.println(">> �Է� ����");
		return false;
	}
	// �ڵ�� 100�� -> ���ؾ˰���(�˰��� ������ ���� ����) -> ���α׷��ӽ�(����ڵ��׽�Ʈ ����)

	// �ùٸ��� ���� Ȯ��
	private boolean isReal()
	{
		int sum = 0;

		for(int i = 0; i < 6; ++i)
		{
			sum += toNum(first.charAt(i)) * firstIdentifyInfo[i];
			sum += toNum(last.charAt(i)) * lastIdentifyInfo[i];
		}

		int rest = sum % 11;
		int lastNum = toNum(last.charAt(6));
		int checkNum = (11 - rest) % 10;

		// ���� �������� �ֹι�ȣ �� ���ڸ� ���ڿ� ���ٸ�
		// �ùٸ� �ֹι�ȣ
		return (lastNum == checkNum);
	}
	
	// Ȯ�ΰ�� ���
	private void print(boolean check)
	{
		if(check) 
			System.out.println(">> ��Ȯ�� �ֹι�ȣ");
		else
			System.out.println(">> �߸��� �ֹι�ȣ");
	}
	
	// �������� ���ڸ� ���������� �ٲ��ش�.
	private int toNum(char c)
	{
		return (c - '0');
	}
	
	public void logic()
	{
		if(!input()) 
			return;

		boolean check = isReal();
		print(check);
	}
}

public class Test109
{
	public static void main(String[] args) throws IOException
	{
		//Identifier id = new Identifier();
		//id.logic();

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

		// teacher's code 

		// BufferedReader
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// �Է¹޴� �ֹι�ȣ(���ڿ� ����)
		String str;

		// �ֹι�ȣ �� �ڸ����� ���ϰ� �� �� -> �迭 ���·� ����
		//		     2  3  4  5  6  7     8  9  2  3  4  5
		int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5};
		//                            --- check~!!!

		// ���� ���� �� ������ (�� ���� ����� ���� ������...)
		int tot = 0;

		System.out.print("�ֹι�ȣ �Է�(xxxxxx-xxxxxxx) : ");
		//str = Integer.parseInt(br.readLine());
		str = br.readLine();

		if(str.length() != 14)
		{
			System.out.println(">> �Է� ����~!!!");
			return; // -- �޼ҵ� ���� -> main() �޼ҵ� ���� -> ���α׷� ����
		}

		// �׽�Ʈ (Ȯ��)
		//System.out.println(">> �ڸ��� ����~!!!");
		
		for(int i = 0; i < 13; i++)
		{	
			if(i == 6) continue;
							// �ֹι�ȣ Ư�� �ڸ��� ����
			tot += chk[i] * Integer.parseInt(str.substring(i, (i + 1)));
		}
		
		// -----------������� �����ϸ� 1�� 2�� ��� ���� ��Ȳ�̸�
		//			  ��Ģ�� �°� ���� ������ ������ ����� ��� ���� ����
		//            ���� tot�� ����ִ� ��Ȳ�� �ȴ�.

		// 3, 4 ���� ���� ����
		int su = 11 - tot % 11;

		// ���� ��� ��� ������... �߰� ���� �ʿ�~!!!
		// su�� ���� ���� ����� �� �ڸ��� ���� ���
		// �ֹι�ȣ ������ �ڸ��� ���ڿ� ���� �� ���� ��Ȳ
		su = su % 10;

		// �׽�Ʈ(Ȯ��)
		//System.out.println(su);

		if(su == Integer.parseInt(str.substring(13)))
			System.out.println(">> ��Ȯ�� �ֹι�ȣ~!!!");
		else
			System.out.println(">> �߸��� �ֹι�ȣ~!!!");
	}
}

