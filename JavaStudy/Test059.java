/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - �ݺ��� �ǽ�
	 - ���� for��(�ݺ����� ��ø) Ȱ��
=========================================================*/

// 1���� 100���� �� �� �Ҽ��� ����ϴ� ���α׷��� �����Ѵ�.
// ��, for���� ��ø ������ Ȱ���Ͽ� �ۼ��� �� �ֵ��� �ϸ�
// 5���� ��µ� �� ���� ���� ó���� �� �ֵ��� �Ѵ�.

// ���� ��)
// ====[1���� 100������ �Ҽ�]====
//    2    3    5    7    11
//   13  ...
// ����Ϸ��� �ƹ� Ű�� ��������...

public class Test059
{
	public static void main(String[] args)
	{
		int divisor;
		int count = 0;

		System.out.println("====[1���� 100������ �Ҽ�]====");
		for(int number = 2; number <= 100; number++)
		{
			for(divisor = 2; number % divisor != 0; divisor++);

			if(divisor == number)
			{
				System.out.printf("%5d", number);
				
				// Ȯ�� 
				// System.out.printf("number : %d, divisor : %d\n", number, divisor);

				if(++count % 5 == 0)
					System.out.println();
			}
		}
	

		// my code
		/*
		int newLineCount = 0;
		System.out.println("====[1���� 100������ �Ҽ�]====");
		
		

		for(int i = 1; i <= 100; ++i)
		{
			for(int j = 2; j <= i; ++j)
			{
				if(i % j == 0) 
				{
					// �ڱ� �ڽ��ϰ� �������� ��� �Ҽ�
					if(i == j)
					{
						System.out.printf("%4d", i);
						++newLineCount;
					}
					else break;
				}
			}	

			if(newLineCount >= 5)
			{
				System.out.println();
				newLineCount = 0;
			}
		}
		*/
		

		/*
		for(int i = 1; i <= 100; ++i)
		{
			boolean isPrime = false;
			if(i == 1 || i % 2 == 0 || i % 3 == 0 || i % 5 == 0 || i % 7 == 0)
			{
				if(i == 2 || i == 3 || i == 5 || i == 7)
				{
					isPrime = true;
				}
			}
			else
			{
				isPrime = true;
			}
			
			if(isPrime)
			{
				System.out.printf("%4d", i);
			}
		}
		*/
	}
}

/*
====[1���� 100������ �Ҽ�]====
    2    3    5    7   11
   13   17   19   23   29
   31   37   41   43   47
   53   59   61   67   71
   73   79   83   89   97
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/












