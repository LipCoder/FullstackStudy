/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - �ݺ��� �ǽ�
=========================================================*/

// �� ����
// ����ڷκ��� ������ ������ �Է¹޾�
// 1���� �Է¹��� �� �� ������ 
// ��ü �հ�, ¦���� �հ�, Ȧ���� ���� 
// ���� ��������� ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// ������ ���� �Է� : 270
// 1 ~ 270 ���� ������ �� : xxxxx
// 1 ~ 270 ���� ¦���� �� : xxxx
// 1 ~ 270 ���� Ȧ���� �� : xxxx
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test052
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int inputNum, num, even, odd, sum;
		even = odd = num = sum = 0;
		
		System.out.print("������ ���� �Է� : ");
		inputNum = Integer.parseInt(br.readLine());
		
		// 1 ~ inputNum ������ ����, ¦��, Ȧ���� ���� ���Ѵ�.
		while(num <= inputNum)
		{
			sum += num;
			if(num % 2 == 0) 
				even += num;
			else 
				odd += num;
			++num;
		}

		System.out.printf("1 ~ %d ���� ������ �� : %d\n", inputNum, sum);
		System.out.printf("1 ~ %d ���� ¦���� �� : %d\n", inputNum, even);
		System.out.printf("1 ~ %d ���� Ȧ���� �� : %d\n", inputNum, odd);
	}
}