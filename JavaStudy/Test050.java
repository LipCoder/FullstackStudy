/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - �ݺ��� �ǽ�
=========================================================*/

// ����ڷκ��� ������ ������ �Է¹޾�
// �Է¹��� ������ �Ҽ����� �ƴ����� �Ǻ��Ͽ�
// ����� ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// ������ ���� �Է� : 100
// 100 -> �Ҽ� �ƴ�
// ����Ϸ��� �ƹ� Ű�� ��������...

// ������ ���� �Է� : 11
// 11 -> �Ҽ�
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test050
{
	public static void main(String[] args) throws IOException
	{	
		// teacher's code
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int num;

		System.out.print("������ ���� �Է� : ");
		num = Integer.parseInt(br.readLine());
		
		int n = 2;
		
		//String flag = "�Ҽ���";
		boolean flag = true;

		// �ݺ����� ���� ������ ���ҽ� �Ҹ� ���� (������)
		while(n < num) // num = 7 -> n = 2 ~ 6 / num = 50 -> n = 2 ~ 49
		{
			if(num % n == 0)
			{
				flag = false;
				break;
			}

			n++;
		}

		// ��� ���
		if(flag && num != 1)
		{
			System.out.printf("%d -> �Ҽ�\n", num);
		}
		else
		{
			System.out.printf("%d -> �Ҽ��ƴϴ�\n", num);
		}
		

		// my code
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int inputNum;
		// 1�� �׻� �������Ƿ� 2���� ����
		int compNum = 2, count = 0;

		System.out.print("������ ���� �Է� : ");
		inputNum = Integer.parseInt(br.readLine());

		while(compNum <= inputNum)
		{
			if(inputNum % compNum == 0) ++count;
			++compNum;
		}
			
		// �ڱ� �ڽŸ� ���� ���ٸ� count�� �ѹ��� ������ ���̹Ƿ� 
		if(count == 1) System.out.printf("%d -> �Ҽ�\n", inputNum);
		else  System.out.printf("%d -> �Ҽ� �ƴ�\n", inputNum);
		*/

	}
}