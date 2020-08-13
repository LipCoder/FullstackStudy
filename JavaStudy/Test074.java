/*=======================================================
	 ���� Ŭ������ �ν��Ͻ� ����
=========================================================*/

// ����ڷκ��� ������ ������ �Է¹޾�
// 1 ���� �Է¹��� �� ������ ���� �����Ͽ�
// ������� ����ϴ� ���α׷��� �����Ѵ�.

// ��, Ŭ������ �ν��Ͻ��� ������ Ȱ���Ͽ� ó���� �� �ֵ��� �Ѵ�.
// ����, �Է� ó�� �������� BufferedReader �� ����ϸ�,
// �Է� �����Ͱ� 1 ���� �۰ų� 1000 ���� ū ���
// �ٽ� �Է¹��� �� �ִ� ó���� �����Ͽ� ���α׷��� ������ �� �ֵ��� �Ѵ�.

// ���� ��)
// ������ ���� �Է�(1~1000) : 1022
// ������ ���� �Է�(1~1000) : -23
// ������ ���� �Է�(1~1000) : 100
// >> 1 ~ 100 ������ �� : 5050
// ����Ϸ��� �ƹ� Ű�� ��������

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/*
class Hap
{
	// �ֿ� ���� ����(�Ӽ� ����)
	// -- ������� �Է°��� ��Ƶ� ����
	int su;

	// �ֿ� �޼��� ����(��� ����)
	// -- �Է� ����� ������ �޼���
	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		do
		{
			System.out.print("������ ���� �Է�(1~1000) : ");
			su = Integer.parseInt(br.readLine());
		}
		while (su < 1 || su > 1000);
	}

	// �ֿ� �޼��� ����(��� ����)
	// -- ���� ó�� ����� ������ �޼���
	int calculate()
	{
		int result = 0;

		for(int i = 1; i <= su; i++)
			result += i;

		return result;
	}

	// �ֿ� �޼��� ����(��� ����)
	// -- ��� ��� ����� ������ �޼���
	void print(int sum)
	{
		System.out.printf(">> 1 ~ %d ������ �� : %d\n", su, sum);
	}
}

public class Test074
{
	public static void main(String[] args) throws IOException
	{
		// Hap Ŭ������ ������� �� �ν��Ͻ� ����
		Hap ob = new Hap();

		// ������ �ν��Ͻ��� ���ؼ� �Է� �޼ҵ� ȣ��
		ob.input();
		
		// ������ �ν��Ͻ��� ���� ���� �޼ҵ� ȣ��
		int sum = ob.calculate();

		// ������ �ν��Ͻ��� ���� ��� �޼ҵ� ȣ��
		ob.print(sum);
	}
}
*/

// my code

class Hap
{
	final int LIMIT = 1000;
	int inputNum, sumNum;

	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.printf("������ ���� �Է�(1~%d) : ", LIMIT);
		inputNum = Integer.parseInt(br.readLine());
	}

	boolean isInLimit()
	{
		return (1 <= inputNum && inputNum <= LIMIT);
	}

	void calcSum()
	{
		sumNum = 0;
		for(int i = 1; i <= inputNum; ++i)
		{
			sumNum += i;
		}
	}
	
	void printSum()
	{
		System.out.printf(">> 1 ~ %d ������ �� : %d\n", inputNum, sumNum);
	}

	void logic() throws IOException
	{
		while(true)
		{
			input();

			if(isInLimit())
			{
				calcSum();
				printSum();
				break;
			}
		}
	}
}

public class Test074
{
	public static void main(String[] args) throws IOException
	{
		Hap h = new Hap();
		h.logic();
	}
}

/*
������ ���� �Է�(1~1000) : -100
������ ���� �Է�(1~1000) : 101010
������ ���� �Է�(1~1000) : 1000
>> 1 ~ 1000 ������ �� : 500500
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/
