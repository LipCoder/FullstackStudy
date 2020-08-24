/*=======================================================
      ���� Ŭ���� ��� ����
	  - �߻� Ŭ����(Abstract)
=========================================================*/
// �߻� Ŭ���� -> �̿ϼ��� ���赵(Ŭ����) 

/*
�� �߻� Ŭ����(Abstract)��
   ���� �ְ� ���ǰ� ���� �ϳ� �̻��� �޼ҵ�(�߻� �޼ҵ�)�� ���� Ŭ������
   ���� Ŭ�������� �������̵�(Overriding)�� ������ ����Ǵ� �޼ҵ忡 ����
   �޸� ���� ���� �̸� ȣ�� ��ȹ�� �����α� ���� �����.


�� ���� �� ����
   [��������������] abstract class Ŭ������
   {
	   [��������������] abstract �ڷ��� �޼ҵ��([�Ű�����], ...);
   }

�� Ư¡
   Ŭ������ ��� �ϳ� �̻��� �߻� �޼ҵ带 ������ ��
   �� Ŭ������ Ŭ���� �տ� [abstract] Ű���带 �ٿ�
   �߻� Ŭ������ ����ؾ� �ϸ�,
   �߻� Ŭ������ ������ ��쿡��
   �ҿ����� ������ Ŭ�����̹Ƿ� ��ü�� ������ �� ����.
   �߻� �޼ҵ尡 �������� �ʴ� �߻� Ŭ����������
   ��ü�� ������ �� ���� ���̴�.

   ��, �߻� Ŭ������ ���������� ������ �� ���� ������
   *����� ���ؼ��� �����ϸ�*
   �߻� Ŭ�������� ��ӹ��� ���� Ŭ����������
   *�ݵ�� �߻� �޼ҵ带 �������̵�(Overriding)*�ؾ� �Ѵ�.

�� [abstract] Ű�����
   Ŭ������ �޼ҵ忡���� ����� �� ������
   ��� ������ ���� ���������� ��� �Ұ����ϴ�.

*/

// �߻� Ŭ����
abstract class SortInt120
{
	private int[] value;

	protected void sort(int[] value)
	{
		this.value = value;
		sorting();
	}

	// �߻� �޼ҵ�
	protected abstract void sorting();
	// �װ� ��ȣ�ϴ� �ɷ�
	// ������ �ؼ� ���~

	protected int dataLength()
	{
		return value.length;
	}

	// [final] Ű����� ����
	// �� Ŭ���� SortInt120 �� ��ӹ޴� Ŭ��������
	// �� �޼ҵ带 ������(Method Overriding) �� �� ����.
	protected final int compare(int i, int j)
	{
		int x = value[i];
		int y = value[j];
		if(x == y)
			return 0;
		else if(x > y)
			return 1;
		else 
			return -1;
	}

	// [final] Ű����� ����
	// �� Ŭ���� SortInt120 �� ��ӹ޴� Ŭ��������
	// �� �޼ҵ带 ������(Method Overriding) �� �� ����.
	protected final void swap(int i, int j)
	{
		int temp = value[i];
		value[i] = value[j];
		value[j] = temp;
	}
}


// SortInt120 Ŭ����(�߻� Ŭ����)�� ��ӹ��� Ŭ���� -> �ϴ��� �߻� Ŭ����
// -> �߻� �޼ҵ� [sorting()] �� Overriding -> �Ϲ� ���� Ŭ����
public class Test120 extends SortInt120
{
	/*
	protected void sort(int[] value)
	{
		this.value = value;
		sorting();
	}

	// �߻� �޼ҵ�
	protected abstract void sorting();

	protected int dataLength();
	{
		return value.length;
	}

	protected final int compare(int i, int j)
	{
		int x = value[i];
		int y = value[j];
		if(x == y)
			return 0;
		else if(x > y)
			return 1;
		else 
			return -1;
	}

	protected final void swap(int i, int j)
	{
		int temp = value[i];
		value[i] = value[j];
		value[j] = temp;
	}
	*/

	int i, j;
	static int[] data = {7, 10, 3, 8, 7};

	@Override
	protected void sorting()
	{
		// ���� -> �ϼ�

		for(i = 0; i < dataLength() - 1; ++i)
		{
			for(j = i + 1; j < dataLength(); ++j)
			{
				if(compare(i, j) == 1)
					swap(i, j);
			}
		}
	}

	public static void main(String[] args)
	{
		System.out.print("Source Data : ");
		for(int n : data)
			System.out.print(n + " ");
		System.out.println();

		Test120 ob = new Test120();
		ob.sort(data);

		System.out.print("Sorted Data : ");
		for(int n : data)
			System.out.print(n + " ");
		System.out.println();
	}
}

// ������
/*
Source Data : 7 10 3 8 7
Sorted Data : 3 7 7 8 10
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/