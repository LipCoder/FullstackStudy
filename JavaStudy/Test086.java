/*=======================================================
	 ���� �迭 ����
	 - �迭�� �⺻�� Ȱ��
=========================================================*/

// �� ����
// ����ڷκ��� �л� ���� �Է¹ް�
// �� ��ŭ�� ����(���� ����)�� �Է¹޾�
// ��ü �л� ������ ��, ���, ������ ���Ͽ� 
// ����� ����ϴ� ���α׷��� �����Ѵ�. 
// ��, �迭�� Ȱ���Ͽ� ó���� �� �ֵ��� �Ѵ�.

// ���� ��)
// �л� �� �Է� : 5
// 1�� �л��� ���� �Է� : 90
// 2�� �л��� ���� �Է� : 82
// 3�� �л��� ���� �Է� : 64
// 4�� �л��� ���� �Է� : 36
// 5�� �л��� ���� �Է� : 98

// >> �� : 370
// >> ��� : 74.0
// >> ����
// 90 : -16.0
// 82 : -8.0
// 64 : 10.0
// 36 : 38.0
// 98 : -24.0
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.util.Scanner;
public class Test086
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);

		int studentCount = 0;
		
		System.out.print("�л� �� �Է� : ");
		studentCount = sc.nextInt();
		
		int sumOfScore = 0;
		// �л�����ŭ ���ھ ���� �迭 �Ҵ�
		int[] arrScore = new int[studentCount];
		for(int i = 0; i < arrScore.length; ++i)
		{
			System.out.printf("%d�� �л��� ���� �Է� : ", i + 1);
			arrScore[i] = sc.nextInt();
			sumOfScore += arrScore[i];
		}
		
		double avgScore = sumOfScore / (double)studentCount;
		
		System.out.println();
		System.out.println(">> �� : " + sumOfScore);
		System.out.printf(">> ��� : %.1f\n", avgScore);
		System.out.println(">> ����");
		
		// ��� - �������� ����Ͽ� ������ ���Ѵ�
		for(int i = 0; i < arrScore.length; ++i)
		{
			System.out.printf("%d : %.1f\n", arrScore[i], avgScore - arrScore[i]);
		}
	}
}