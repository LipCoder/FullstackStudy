/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - �ݺ��� �ǽ�
=========================================================*/

// ����ڷκ��� ������ �� ������ �Է¹޾�
// ���� �� ���� ū �� ������ ���� ���Ͽ�
// ����� ����ϴ� ���α׷��� �����Ѵ�.

// ���� ��)
// ù ��° ���� �Է� : 10
// �� ��° ���� �Է� : 20
// >> 10 ~ 20 ������ �� : xxxx
// ����Ϸ��� �ƹ� Ű�� ��������...

// ù ��° ���� �Է� : 10
// �� ��° ���� �Է� : 2
// >> 2 ~ 10 ������ �� : 54
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test051
{
	public static void main(String[] args) throws IOException
	{
		// teacher's code

		// �ֿ� ���� ����
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int n;				// -- ���� ������ Ȱ���� ����
		int su1, su2;		// -- ù ��°, �� ��° �Է°�
		int result = 0;		// -- ������

		// ���� �Է� ����
		System.out.print("ù ��° ���� �Է� : ");
		su1 = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		su2 = Integer.parseInt(br.readLine());

		// �Է¹��� �� ���� ũ�� �� �� �ڸ� �ٲ�
		// ��, su1�� su2���� ū ��� �� ���� �ڸ��� �ٲ� �� �ֵ��� ó��
		if(su1 > su2)
		{
			// �ڸ� �ٲ�
			su1 = su1 ^ su2;
			su2 = su1 ^ su2;
			su1 = su1 ^ su2;
		}

		// �ݺ� ���� ����
		// �ݺ� ������ �����ϱ� ����
		// ���� ���� ���� �����Ͽ� ���� ������ Ȱ���Ѵ�.
		// (������... ����� ����� �ִ� �������� ���� ���� �ʿ��ѵ�...
		//  ���� �� ���� �������� ���� ��� ... ���� ��� ����� �Ұ����ϱ� ������...)
		n = su1;

		while(n <= su2)
		{
			result += n;
			n++;
		}
	
		System.out.printf(">> %d ~ %d ������ �� : %d\n", su1, su2, result);


		// my code
		
		/*
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);

		int min, max;
		
		System.out.print("ù ��° ���� �Է� : ");
		min = Integer.parseInt(br.readLine());

		System.out.print("�� ��° ���� �Է� : ");
		max = Integer.parseInt(br.readLine());

		if(min > max)
		{
			min = min ^ max;
			max = min ^ max;
			min = min ^ max;
		}
			
		
		// 1
		int num = min, sum = 0;
		
		while(num <= max)
		{
			sum += num;
			++num;
		}
		
		System.out.printf(">> %d ~ %d ������ �� : %d\n", min, max, sum);
		/*
		// 2 
		int numMin = min, numMax = max, sum = 0;
		while(numMin < numMax)
		{
			sum += (numMin++) + (numMax--);
		}

		System.out.printf(">> %d ~ %d ������ �� : %d\n", min, max, sum);
		*/

		/*
		//3
		int num = min + max, sum = 0;
		int count = (max - min + 1);
		sum = num * (count / 2) + (count % 2 == 0 ? 0 : num / 2);

		System.out.printf(">> %d ~ %d ������ �� : %d\n", min, max, sum);
		*/		
	}
}