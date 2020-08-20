
// 2. Sungjuk Ŭ����
//    -> �ο� ���� �Է¹޾�, �Է¹��� �ο� �� ��ŭ
//		 �̸�, ��������, ��������, ���������� �Է¹ް�
//       ������ ����� �����ϴ� Ŭ������ ������ ��~!!!
//		  * �Ӽ� : �ο���, Record ������ �迭
//		  * ��� : �ο��� �Է�, �� ������ �Է�, ���� �� ��� ����, ��� ���

import java.util.Scanner;

public class Sungjuk
{
	// �ֿ� �Ӽ� ����(�ֿ� ���� ����)
	int inwon;			// �ο� ��
	Record[] rec;		// Record �迭 (�л� �� �� �� Record �迭 �� �� �� Ȱ��)
						// Record�� ������� ������ ��ü�� ��Ƴ� �� �ִ� �迭

	// �ֿ� �޼ҵ� ����(��� ���� -> �޼ҵ� ����)
	// 1. �ο� �� �Է�
	public void set()
	{
		Scanner sc = new Scanner(System.in);
		
		do
		{
			System.out.print("�ο� �� �Է�(1~100) : ");
			inwon = sc.nextInt();	
		}
		while (inwon < 1 || inwon > 100);
		
		// check~!!!
		// Record Ŭ������ ������� ������ ��ü(�ν��Ͻ�)�� ���� �� �ִ�
		// �迭���� inwon ��ŭ ������ ������
		// Record Ŭ������ �ν��Ͻ��� ������ ���� �ƴϴ�.
		rec = new Record[inwon];
	}

	// 2. �� ������ �Է� (�̸�, ��������, ��������, �������� �Է�) + ���� ��� ����
	public void input()
	{
		Scanner sc = new Scanner(System.in);

		String[] title = {"���� ���� : ", "���� ���� : ", "���� ���� : "};

		// �ο� �� ��ŭ �ݺ� -> �ο� ���� ����Ͽ� ������� �迭�� ���̸�ŭ �ݺ�
		for(int i = 0 ; i < inwon; i++)
		{
			// Record Ŭ���� ����� �ν��Ͻ� ����

			//Record ob = new Record();
			//rec[i] = ob;
			rec[i] = new Record();

			//rec[i].name = "ȫ�浿"
			System.out.printf("%d��° �л��� �̸� �Է� : ", (i + 1));
			rec[i].name = sc.next();

			/*
			System.out.print("���� ���� : ");
			rec[i].kor = sc.nextInt();
			System.out.print("���� ���� : ");
			rec[i].eng = sc.nextInt();
			System.out.print("���� ���� : ");
			rec[i].math = sc.nextInt();
			*/
			
			/*
			System.out.print("���� ���� : ");
			rec[i].score[0] = sc.nextInt();
			System.out.print("���� ���� : ");
			rec[i].score[1] = sc.nextInt();
			System.out.print("���� ���� : ");
			rec[i].score[2] = sc.nextInt();
			*/

			for(int j = 0; j < title.length; j++)
			{
				// �ȳ� �޼��� ���
				System.out.print(title[j]);

				// ����ڰ� �Է��� �����͸� ���ھ�(score) �迭�� ��Ƴ���
				rec[i].score[j] = sc.nextInt();	// score[0] -> ���� ����
												// score[1] -> ���� ����
												// socre[2] -> ���� ����

				// ����, ����, ���� ���� �����͸� �Է� �޴� ����
				// ���� �����ϱ�
				rec[i].tot += rec[i].score[j];
			}

			// ��� �����ϱ�
			rec[i].avg = rec[i].tot / 3.0;
		}
	}// end input()

	// 3. ��� ���
	// ��ȫ��  90  80  70  240  xx.xx  2
	// ��¹�  82  72  62  xxx  xx.xx  3
	// �̿���  98  88  78  xxx  xx.xx  1
	
	public void print()
	{
		// ���� ���� �޼ҵ� ȣ��~!!! (���� �߰�
		ranking();

		System.out.println();	// ����

		// �л� �� �� �� �ݺ� ��� ���� ����
		for(int i = 0; i < inwon; i++)
		{
			// �̸� ���
			System.out.printf("%5s", rec[i].name);

			// ����(����, ����, ����) �ݺ� ���
			for(int j = 0; j < 3; j++)
			{
				System.out.printf("%4d", rec[i].score[j]);
			}

			// ����, ��� ���
			System.out.printf("%5d", rec[i].tot);
			System.out.printf("%6.2f", rec[i].avg);

			// ���� ��±��� �߰�~!!! (���� �߰�)
			System.out.printf("%5d", rec[i].rank);

			System.out.println();
		}
	}

	// 4. ���� ���� �޼ҵ� �߰�~!!!
	// - Record �迭�� rank �Ӽ� �ʱ�ȭ�� �����ϴ� ��� -> ��ȯ �ڷ��� void
	// - Ŭ���� ���ο��� Ȱ���� �޼ҵ�� ����
	//   ��, �ܺο� ������ �޼ҵ尡 �ƴ� ���·� ���� -> �������� ������ private
	//   -> �ܺο��� ����(ȣ��) �Ұ�
	private void ranking()
	{
		int i , j;
		
		// ���� 1�� �ʱ�ȭ
		for(i = 0; i < inwon; i++)
			rec[i].rank = 1;
		
		// ��� ����
		for(i = 0; i < inwon-1; i++)
		{
			for(j = i + 1; j < inwon; j++)
			{
				// ������ ����� ����� ��պ��� ũ�ٸ�...
				if(rec[i].avg > rec[j].avg)
				{
					// ����� rank�� 1��ŭ ����
					rec[j].rank++;
				}
				// ����� ����� ������ ��պ��� ũ�ٸ�...
				else
				{
					// ������ rank�� 1��ŭ ����
					rec[i].rank++;
				}
			}
		}

		// my code
		/*
		for(int i = 0; i < rec.length; ++i) 
		{
			rec[i].rank = 1;
		}

		for(int i= 0; i < rec.length; ++i)
		{
			for(int j = i + 1; j < rec.length; ++j)
			{
				if(rec[i].tot < rec[j].tot) ++rec[i].rank;
				else if(rec[i].tot > rec[j].tot) ++rec[j].rank;
			}
		}
		*/
	}
}