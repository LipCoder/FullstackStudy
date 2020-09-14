/*=======================================================
      ���� �÷��� �����ӿ�ũ(Collection Framework) ����
=========================================================*/

/*
�� ť(Queue)

  ť(Queue)�� FIFO(First Input First Output) ������
  ���� �Էµ� �ڷḦ ���� ����ϸ�
  Queue �������̽��� ������ Ŭ������ ť�� ���õ� �پ��� ����� �����Ѵ�.

  �� Queue �������̽� �ν��Ͻ��� �����ϱ� ���ؼ��� 
    new �����ڸ� �̿��Ͽ� Queue �������̽��� ������(implements)
	Ŭ������ �����ڸ� ȣ���Ѵ�.

	ex) Queue ob = new LinkedList();

�� �ֿ� �޼ҵ�
  
  - E element()
    ť�� head ��Ҹ� ��ȯ�ϸ� �������� �ʴ´�.

  - boolean offer(E o)
    ������ ��Ҹ� ť�� �����Ѵ�.
  
  - E peek()
    ť�� head ��Ҹ� ��ȯ�ϰ� �������� ������
	ť �ڷᱸ���� empty �� ��� null�� ��ȯ�Ѵ�.

  - E poll()
    ť�� head ��Ҹ� ��ȯ�ϰ� �����ϸ�
	ť �ڷᱸ���� empty �� ��� null �� ��ȯ�Ѵ�.

  - E remove()
    ť�� head ��Ҹ� ��ȯ�ϰ� �����Ѵ�.
*/

import java.util.Queue;
import java.util.LinkedList;

public class Test161
{
	public static void main(String[] args)
	{
		// Queue �ڷᱸ�� ����
		//Queue myQueue = new Queue();
		//--==>> ����
		// ���׸��� ��������
		// Queue�� �������̽��̱� ������ ��ü�� �ν��Ͻ� ���� �� �� ����

		Queue<Object> myQueue = new LinkedList<Object>();

		// ������ �غ�
		String str1 = "���ر�";
		String str2 = "������";
		String str3 = "������";
		String str4 = "������";

		// myQueue ��� Queue �ڷᱸ���� ������ �߰�
		myQueue.offer(str1);
		myQueue.offer(str2);
		myQueue.offer(str3);
		myQueue.offer(str4);
		
		// Queue �ڷᱸ������ ��Ҹ� �������� �ʰ� head ��� ��ȯ
		System.out.println("��1 : " + (String)myQueue.element());
		System.out.println("��2 : " + (String)myQueue.element());
		//--==>> ��1 : ���ر�
		//		 ��2 : ���ر�

		System.out.println();

		String val;

		// 1
		// peek()
		//-- ť�� head ��� ��ȯ. ���� ����.
		//   ť�� empty �� ���. null ��ȯ.
		
		/*
		while(myQueue.peek() != null)
		{
			// poll()
			//-- ť�� head ��� ��ȯ. ������.
			//   ť�� empty �� ���. null ��ȯ.
			val = (String)myQueue.poll();
			System.out.println("��� : " + val);
		}
		*/
		//--==>> ��� : ���ر�
		//		 ��� : ������
		//		 ��� : ������
		//		 ��� : ������

		// ( X )
		/*
		while(myQueue.poll() != null)
		{
			// poll()
			//-- ť�� head ��� ��ȯ. ������.
			//   ť�� empty �� ���. null ��ȯ.
			val = (String)myQueue.poll();
			System.out.println("��� : " + val);
		}
		*/
		//--==>> ��� : ������
		//		 ��� : ������


		// 2
		/*
		while(true)
		{
			val = (String)myQueue.poll();

			if(val == null)
				break;
			else
				System.out.println("��� : " + val);
		}
		System.out.println();
		*/
		//--==>> ��� : ���ر�
		//		 ��� : ������
		//		 ��� : ������
		//		 ��� : ������


		// 3
		while(!myQueue.isEmpty())
		{
			val =(String)myQueue.poll();
			System.out.println("��� : " + val);
		}
		System.out.println();
		//--==>> ��� : ���ر�
		//		 ��� : ������
		//		 ��� : ������
		//		 ��� : ������
	}
}