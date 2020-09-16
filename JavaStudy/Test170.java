/*=======================================================
      ���� �÷��� �����ӿ�ũ(Collection Framework) ����
=========================================================*/

// List -> Vector, ArrayList ...
// - ���� ����
// - �迭�� ����
// - �ߺ� ���

/*
�� ArrayList Ŭ����

  - ArrayList �� Vector Ŭ������
    List �� ũ�� ������ ������ �迭�� ������ ������
	�������� Vector Ŭ������ ��ü�� �⺻������ ����ȭ ������,
	ArrayList�� �׷��� �ʴٴ� ���̴�. (�񵿱�)

  - �񵿱�ȭ �÷����� ����ȭ�� �÷��Ǻ��� �� ���� ������ �����ϸ�
    ��������� �÷����� �������� �ʴ� ���α׷�������
	�Ϲ������� ArrayList �� Vector ���� �� ��ȣ�ϸ�,
	ArrayList �� ����ȭ�� �������� ���� Vector ó�� ���������ν�
	������ ����ȭ�� ������ �δ��� ������ �ʱ� ������
	Vector ���� �� ������ ����ȴ�.

  - null �� ������ ��� ��Ҹ� ����Ͽ�
    List �������̽��� �����ϴ� �� �ܿ� ����Ʈ�� �ݳ��ϱ� ����
	���������� ���Ǵ� �迭�� ����� �����ϴ� �޼ҵ带 �����Ѵ�.
*/

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

public class Test170
{
	public static void main(String[] args)
	{
		// ArrayList �ڷᱸ�� �ν��Ͻ� ����
		//ArrayList<String> list = new ArrayList<String>();
		//Vector<String> list = new Vector<String>();
		List<String> list1 = new ArrayList<String>();

		// list1�� ��� �߰� -> add()
		list1.add("�ٸ��ǿ������ϼҼ�");
		list1.add("������Ʈ");
		list1.add("����");

		
		// ArrayList �ڷᱸ�� �ν��Ͻ� ����
		List<String> list2 = new ArrayList<String>(list1);

		// list2�� ��� �߰�
		list2.add("���̾��Ϻ����ϱ�");


		// ArrayList �ڷᱸ�� �ν��Ͻ� ����
		List<String> list3 = new ArrayList<String>();

		// list3�� list2�� ��ü ��� �߰�  ->  addAll();
		list3.addAll(list2);

		// "������Ʈ" �տ� "��ũ������2" �߰�
		// 1. ������Ʈ ã�� -> indexOf() -> ��ġ�� �ε��� ��ȯ
		int n = list3.indexOf("������Ʈ");

		// �׽�Ʈ
		//System.out.println("������Ʈ ��ġ �ε��� : " + n);
		//--==>> ������Ʈ ��ġ �ε��� : 1
		
		// 2. "������Ʈ" ã�� �ε��� ��ġ�� "��ũ������2" ����(����)
		list3.add(n, "��ũ������2");

		// ��� -> ���� ������ Ȯ��
		System.out.println("===============================");
		System.out.println(list1);
		//--==>> [�ٸ��ǿ������ϼҼ�, ������Ʈ, ����]
		System.out.println(list2);
		//--==>> [�ٸ��ǿ������ϼҼ�, ������Ʈ, ����, ���̾��Ϻ����ϱ�]
		System.out.println(list3);
		//--==>> [�ٸ��ǿ������ϼҼ�, ������Ʈ, ����, ���̾��Ϻ����ϱ�]
		// ��ũ������2 ���� �� Ȯ��
		//--==>> [�ٸ��ǿ������ϼҼ�, ��ũ������2, ������Ʈ, ����, ���̾��Ϻ����ϱ�]

		System.out.println();

		// ��� -> listIterator() �޼ҵ� Ȱ��
		System.out.println("===============================");

		ListIterator<String> li = list3.listIterator();
		while(li.hasNext())
		{
			System.out.print(li.next() + " ");
		}
		System.out.println();
		//--==>> �ٸ��ǿ������ϼҼ� ��ũ������2 ������Ʈ ���� ���̾��Ϻ����ϱ�

		// ��� -> �������� ���
		System.out.println("===============================");
		while(li.hasPrevious())
		{
			System.out.print(li.previous() + " ");
		}
		System.out.println();
		//--==>> ���̾��Ϻ����ϱ� ���� ������Ʈ ��ũ������2 �ٸ��ǿ������ϼҼ�


	}
}