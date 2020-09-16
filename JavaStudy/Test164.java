/*=======================================================
      ���� �÷��� �����ӿ�ũ(Collection Framework) ����
=========================================================*/

// Vector v = new Vector();
//-- ����ִ� Vector �ڷᱸ�� ����

// Vector v = new Vector(8);
//-- 8���� �ʱ� elements �� ���� Vector �ڷᱸ�� ����
//   8���� ��� ä������ �Ǹ�(���ڶ�� �Ǹ�) �ڵ����� Ȯ��ȴ�.

// Vector v = new Vector(3, 5);
//-- 3���� �ʱ� elements�� ���� Vector �ڷᱸ�� ����
//   3���� ��� ä������ �Ǹ�(���ڶ�� �Ǹ�) �ڵ����� 5�� ����(Ȯ��)�ϰ� �ȴ�.

// �� ���ʹ� ������ ��ҷμ� ������, �Ǽ���, ���ڿ�... ����
//   ��Ƴ��� ���� �����ϴ�.
//   -> ������ ������ Ȯ�� check~!!!

import java.util.Vector;
import java.util.Iterator;

// MyVector Ŭ���� ���� -> Vector Ŭ���� ���
class MyVector extends Vector<Object>
{
	// ������
	MyVector()
	{
		// Vector(���� Ŭ����) ������ ȣ��
		super(1, 1);	// Vector(1, 1);
		//-- ù ��° ���� : �־��� �뷮
		//   �� ��° ���� : ������
	}

	void addInt(int i)
	{
		addElement(new Integer(i));
	}

	void addFloat(float f)
	{
		addElement(new Float(f));
	}

	void addString(String s)
	{
		addElement(s);
	}

	void addCharArray(char[] a)
	{
		addElement(a);
	}

	void write()
	{
		Object o;
		int length = size();

		System.out.println("���� ��� ���� : " + length);

		for(int i = 0; i < length; ++i)
		{
			o = elementAt(i);
			
			// instanceof Ű����
			if(o instanceof char[])
			{
				//System.out.println("���� �迭 : " + o);
				//System.out.println("���� �迭 : " + o.toString());
				System.out.println("���� �迭 : " + String.copyValueOf((char[])o));
			}
			else if(o instanceof String)
			{
				System.out.println("���ڿ� : " + o);
			}
			else if(o instanceof Integer)
			{
				System.out.println("������ : " + o);
			}
			else if(o instanceof Float)
			{
				System.out.println("�Ǽ��� : " + o);
			}
			else
			{
				System.out.println("Ÿ�� Ȯ�� �Ұ�");
			}

		}

		// teacher's code
		/*
		Iterator<Object> it = this.iterator();
		while(it.hasNext())
		{
			System.out.println(it.next());
		}
		*/

		// my Code
		/*
		for(int i = 0; i < super.size(); ++i)
		{
			System.out.print(super.get(i));
			System.out.print(' ');
		}
		System.out.println();
		*/
	}
}

public class Test164
{
	public static void main(String[] args)
	{
		// MyVector Ŭ���� ��� �ν��Ͻ� ����
		MyVector v = new MyVector();

		// �ֿ� ���� ���� �� �ʱ�ȭ
		int digit = 5;
		float real = 3.14f;
		String s = new String("�ȳ��ϼ���");
		char[] letters = {'s', 't', 'u', 'd', 'y'};

		// ���� �ڷᱸ�� v�� ��� �߰�
		v.addInt(digit);	//-- ���� �ڷᱸ���� ���� ����
		v.addFloat(real);	//-- ���� �ڷᱸ���� �Ǽ� ����
		v.addString(s);		//-- ���� �ڷᱸ���� ���ڿ� ����
		v.addCharArray(letters);	//-- ���� �ڷᱸ���� ���ڿ� ����

		v.write();
		//--==>>
		/*
		���� ��� ���� : 4
		������ : 5
		�Ǽ��� : 3.14
		���ڿ� : �ȳ��ϼ���
		���� �迭 : study
		����Ϸ��� �ƹ� Ű�� ��������...
		*/
	}
}