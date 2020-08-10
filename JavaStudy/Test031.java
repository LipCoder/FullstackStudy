/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - ���ǹ�(�б⹮)
	 - if��, if-else��
=========================================================*/

// ����ڷκ��� �̸�, ��������, ��������, ���������� �Է¹޾�
// ������ ���� ���·� ����ϴ� ���α׷��� �ۼ��Ѵ�.
// �� ��, ����� ��� ������ �������� ó���Ѵ�.

// 90�� ~ 100�� : A		80 ~ 89�� : B
// 70�� ~ 79��  : C		60 ~ 69�� : B
// 60���̸�     : F

// �Է¹޴� ������ BufferedReader�� Ȱ���� �� �ֵ��� �ϸ�,
// printf() �޼ҵ带 ���� ����� �� �ֵ��� �����Ѵ�.

// ���� ��)
// �̸� �Է� : ������
// ���� ���� : 90
// ���� ���� : 80
// ���� ���� : 70

// >> ����� �̸��� ������ �Դϴ�.
// >> ���� ������ 90,
// >> ���� ������ 80,
// >> ���� ������ 70,
// >> ������ 240, ����� 80�Դϴ�.
// >> ����� B �Դϴ�.
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test031
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		String name;
		int korScore, engScore, mathScore, totalScore;
		double avrScore;
		char grade;

		// ����ڿ��� �ȳ� �޼��� ���
		System.out.print("�̸� �Է� : ");
		// ������� �Է°��� ������ ���
		name = br.readLine();
		
		// �Ʒ��� ���� ����
		System.out.print("���� ���� : ");
		// readLine() �޼���� ���ڿ��� ���� �޾ƿ��Ƿ� 
		// �̰��� parseInt�� ����Ͽ� ���������� �ٲ�� �Ѵ�.
		korScore = Integer.parseInt(br.readLine());

		System.out.print("���� ���� : ");
		engScore = Integer.parseInt(br.readLine());
	
		System.out.print("���� ���� : ");
		mathScore = Integer.parseInt(br.readLine());

		// ����
		// ���� ���
		totalScore = korScore + engScore + mathScore;
		// ������ Ȱ���Ͽ� ��� �����ϱ�
		avrScore = totalScore / 3.0;
		
		if(avrScore >= 90) 
		{
			grade = 'A';
		}
		// else if (80 <= avg < 90)
		// else if (avg >= 80 && avg < 90)
		else if(avrScore >= 80)
		{
			grade = 'B';
		}
		else if(avrScore >= 70)
		{
			grade = 'C';
		}
		else if(avrScore >= 60)
		{
			grade = 'D';
		}
		// else�� ���� ��� ������ ������Ű�� ���ϴ���
		// grade�� ���� ���� �� �����Ƿ�
		// �ʱ�ȭ ������ ������ �������.
		else
		{
			grade = 'F';
		}
		
		// ������ ���� ������ �ʴ� ������ �ִٸ�
		// ������ ����� ���ÿ� �ʱ�ȭ����� �Ѵ�.

		// ���� ��� ���
		System.out.println();
		System.out.printf(">> ����� �̸��� %s�Դϴ�.\n", name);
		System.out.printf(">> ���� ������ %d\n", korScore);
		System.out.printf(">> ���� ������ %d\n", engScore);
		System.out.printf(">> ���� ������ %d\n", mathScore);
		System.out.printf(">> ������ %d, ����� %.2f �Դϴ�.\n", totalScore, avrScore);
		System.out.printf(">> ����� %c �Դϴ�.\n", grade);
	}
}

/*

*/