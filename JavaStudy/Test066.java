/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - break
=========================================================*/

// ������ ���� ó���� �̷������ ���α׷��� �����Ѵ�.
// ��, �Է¹޴� ������ 1 ~ 100 ���� �ȿ�����
// �����ϵ��� ó���Ѵ�.

// ���� ��)

// ������ ���� �Է� : -10

// ������ ���� �Է� : 0

// ������ ���� �Է� : 2020

// ������ ���� �Է� : 10
// >> 1 ~ 10 ������ �� : 55
// ����Ͻðڽ��ϱ�?(Y/N) : Y

// ������ ���� �Է� : 100
// >> 1 ~ 100 ������ �� : 5050
// ����Ͻðڽ��ϱ�?(Y/N) : N
// ����Ͻ÷��� �ƹ� Ű�� ��������...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test066
{
	public static void main(String[] args) throws IOException
	{
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int n, s, i;
		// -- n : �ܺηκ��� ������� �Է°��� ��Ƶ� ����
		//    s : ������ ���� ����� ��Ƶ� ����
		//    i : 1���� 1�� ������� �Է°����� ������ ����

		char ch;
		// -- ���μ����� ��� ���������� ���θ� ��Ƶ� ����
		//    (Y / y / N / n)
		
		while(true)
		{
			do
			{
				System.out.print("\n������ ���� �Է� : ");
				n = Integer.parseInt(br.readLine());
			}
			while (n < 1 || n > 100);
	
			s = 0;

			for(i = 1; i <= n; i++)
				s += i;

			System.out.printf(">> 1 ~ %d ������ �� : %d\n", n, s);

			System.out.print("����Ͻðڽ��ϱ�?(Y/N) : ");
			ch = (char)System.in.read();

			if(ch != 'Y' && ch != 'y')
			{
				// �ݺ���(while)�� �������� �� �ִ� �ڵ� �ۼ� �ʿ�
				// -- ���� ���� �ǻ�ǥ���� �ߴٸ�
				//    �׵��� �����ߴ� �ݺ����� ���߰� ���������� �Ѵ�.
				break;
				// -- �����. ( + �׸��� ����������.) check~!!!
			}
		} // while_end

		

		// my code
		/*
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);

		int num;
		char isExit;
		
		while(true)
		{
			System.out.print("\n������ ���� �Է� : ");
			num = Integer.parseInt(br.readLine());
			
			boolean isDone = false;
			
			if(1 <= num && num <= 100) 
			{
				int sum = 0;
				for(int i = 1; i <= num; ++i) sum += i;

				System.out.printf(">> 1 ~ %d ������ �� : %d\n", num, sum);
				isDone = true;
			}
		
			if(isDone)
			{
				while(true)
				{
					System.out.print("����Ͻðڽ��ϱ�?(Y/N) : ");
					isExit = (char)System.in.read();
				
					// ù��°�� �Է¹��� ���ڸ� ������ �������� ���ۿ��� ������
					br.readLine();	
					//System.in.skip(2);

					if(isExit == 'Y' || isExit == 'y') break;
					else if(isExit == 'N' || isExit == 'n') return;
					else System.out.println("�߸��� �Է�!!!");
				}
			}
		}
		*/
	} // main()_end
} // calss_end
