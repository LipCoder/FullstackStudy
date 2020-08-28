/*=======================================================
      ���� �ڹ��� �ֿ�(�߿�) Ŭ���� ����
	  - Random Ŭ����
=========================================================*/

/*
�� java.util.Random Ŭ������
   ���� ������ ������ �߻����� �����ϴ� Ŭ�����̴�.
   Math  Ŭ������ ���� �޼ҵ��� random() �޼ҵ嵵
   ������ �����ϴ� �޼ҵ�����
   0.0 ~ 1.0 ������ �Ǽ� ���¸� �߻��ϰ� �ǹǷ�
   �ʿ��� ���� ������ ������ ������ ���ؼ���
   �߰����� ������� �����ؾ� �Ѵ�.
   �׷��� �ڹٴ� ���� ������ ������ �߻������ִ�
   ���� Ŭ������ Random Ŭ������ ������ �����ϰ� �ִ�.

*/

// �ζ� ��ȣ ������(���� �߻� ���α׷�)

// ���α׷��� ����Ǹ� �⺻������ �ζǸ�
// 5���� �����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// 3 5 12 24 31 41
// 1 2 8 23 35 38
// 4 9 11 13 22 30
// 5 10 13 15 27 40
// 22 31 32 33 40 45
// ����Ϸ��� �ƹ� Ű�� ��������...

// �ߺ� ����
// ��������

import java.util.Random;
import java.util.Arrays;

class Lotto
{
	// �迭 ���� ���� �� �޸� �Ҵ�
	// -> �ζ� ��ȣ�� ��Ƶ� �迭�� 6ĭ
	private int[] num = new int[6];

	// private���� ����� num ���� ���� ���� �޼Ҥ�
	// -> getter
	public int[] getNum()
	{
		return num;
	}
	
	// 6���� ������ �߻���Ű�� ���� �޼ҵ�
	public void start()
	{
		Random rd = new Random();
		int n;
		int cnt = 0;

		jump:

		while(cnt < 6)
		{
			n = rd.nextInt(45) + 1;		// 1 ~ 45 �� �� �� �߻�

			for(int i = 0; i < cnt; i++)
			{
				if(num[i] == n)
				{
					continue jump;
				}
			}

			num[cnt++] = n;
		}
		// {10, 7, 11, 20}

		// ���� �޼ҵ� ȣ��
		sorting();
	}
	
	// ���� �޼ҵ� 
	private void sorting()
	{
		// Arrays Ŭ������ ���� �޼ҵ� sort() ȣ���ϸ�
		// ����� num �� �Ű������� �Ѱ��ֱ�
		Arrays.sort(num);
	}

}

public class Test151
{
	public static void main(String[] args)
	{
		// Lotto Ŭ���� ��� �ν��Ͻ� ����
		Lotto lotto = new Lotto();

		// �⺻ 5����
		for(int i = 1; i <= 5; i++)
		{
			lotto.start();

			// ��� ���
			for(int n : lotto.getNum())
			{
				System.out.printf("%4d", n);
			}
			System.out.println();
		}
	}
}


/*
public class Test151
{
	
	public static void sort(int[] arr)
	{
		for(int i = 0; i < arr.length - 1; ++i)
		{
			for(int j = 0; j < arr.length - i - 1; ++j)
			{
				if(arr[j] > arr[j + 1])
				{
					int temp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = temp;
				}
			}
		}
	}

	public static void Initialize(boolean[] check)
	{
		for(int i = 0; i < check.length; ++i)
			check[i] = true;
	}

	public static void main(String[] args)
	{
		Random r = new Random();
		int testCase = 5;
		
		boolean[] check = new boolean[45 + 1];
		int[] numArr = new int[6];

		for(int i = 0; i < testCase; ++i)
		{
			Initialize(check);

			// add
			for(int j = 0; j < numArr.length; ++j)
			{
				int randomNum = r.nextInt(45) + 1;
				if(!check[randomNum]) 
				{
					--j;
					continue;
				}

				numArr[j] = randomNum;
				check[randomNum] = false;				
			}

			// sort
			sort(numArr);
		
			// print
			for(int num : numArr)
				System.out.print(num + " ");
			System.out.println();
		}
	}
}
*/

