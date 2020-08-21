/*=======================================================
      ���� ����(sort) �˰��� ����
	  - ���� ���� ����(Bubble Sort)
=========================================================*/

/*
�� �տ��� Ȯ���� �� Selection Sort(Test110) �� Bubble Sort(Test111)�� ������ ����.
   (-> �ݺ��� Ƚ���� ����)
   ������, ���� Bubble Sort�� ��� �������� ������ ����
   �Ϲ� Bubble Sort �� Selection Sort ���� ������ ���� ��Ÿ�� �� �ִ�.

���� ������ : 61 15 20 22 30
              15 20 22 30 61 - 1ȸ�� (���� �߻� -> true)	-> ���� ȸ�� ���� O
			  15 20 22 30 61 - 2ȸ�� (���� �߻� -> false)	-> ���� ȸ�� ���� X 

=> 1ȸ�� ����... 2ȸ�� ����... �� �غ��Ҵ���...
   2ȸ������ ����(�ڸ��ٲ�)�� ���� �Ͼ�� �ʾұ� ������
   ���ʿ��� �߰� ����(�� �̻��� ȸ��)�� ���ǹ��� ������ �Ǵ��Ͽ�
   �������� �ʴ´�.
*/

// ���� ��)
// Source Data : 52 42 12 62 60
// Sorted Data : 12 42 52 60 62
// ����Ϸ��� �ƹ� Ű�� ��������...


public class Test113
{
	public static void main(String[] args)
	{
		int[] a = {52, 42, 12, 62, 60};

		System.out.print("Source Data : ");
		for(int n : a)
			System.out.print(n + " ");
		System.out.println();

		boolean flag;
		int pass = 0;

		// ���� Bubble Sort ����
		do
		{
			flag = false;	// -- �ڸ��ٲ��� �߻��� ��� true�� ����
			pass++;

			for(int i = 0; i < a.length - pass; i++) // 0 1 2 3 / 0 1 2 / 0 1 / 0
			{
				//System.out.println("��");

				if(a[i] > a[i + 1]) // 01 12 23 34
									// 01 12 23
									// 01 12
									// 01
				{
					// �ڸ� �ٲٱ�
					a[i] = a[i] ^ a[i + 1];
					a[i + 1] = a[i + 1] ^ a[i];
					a[i] = a[i] ^ a[i + 1];

					flag = true;
					// -- �� �� ���̶� ������ �߻��ϰ� �Ǹ�
					//    flag ������ true�� �����Ͽ�
					//    ���� ȸ���� �߰��� ������ �� �ֵ��� ó��
				}
			
			
			}						
		
			

		}
		while (flag);
		// -- flag ������ false ��� ����
		//    ȸ���� ���������� �߻��ϴ� ���� ������ �Ͼ�� ���� ����
		//    �� �̻��� �ݺ��� ������ ���ǹ��� ������ �Ǵ� ����~!!!

		/*
		for(int i = 1; i < a.length; ++i)
		{
			boolean isEnd = true;

			for(int j = 0; j < a.length - i; ++j)
			{
				if(a[j] > a[j + 1])
				{
					int temp  = a[j + 1];
					a[j + 1] = a[j];
					a[j] = temp;

					isEnd = false;
				}
			}

			if(isEnd) break;
		}
		*/

		System.out.print("Sorted Data : ");
		for(int n : a)
			System.out.print(n + " ");
		System.out.println();
	}
}

// ���� ���
/*
Source Data : 52 42 12 62 60
Sorted Data : 12 42 52 60 62
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/