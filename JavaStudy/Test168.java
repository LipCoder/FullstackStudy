/*=======================================================
      ���� �÷��� �����ӿ�ũ(Collection Framework) ����
=========================================================*/

// Test168 Ŭ������ �ϼ��Ͽ� ���� ����� ���� ���α׷��� �����Ѵ�.

/*
���� ��)

	[�޴� ����]
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	>> �޴� ����(1~6) : 1

	1��° ��� �Է� : �����
	1��° ��� �Է� ����~!!!
	��� �Է� ���(Y/N)? : y

	2��° ��� �Է� : ������
	2��° ��� �Է� ����~!!!
	��� �Է� ���(Y/N)? : n

	[�޴� ����]
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	>> �޴� ����(1~6) : 2

	[���� ��ü ���]
	    �����
		������
	���� ��ü ��� �Ϸ�~!!!

	[�޴� ����]
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	>> �޴� ����(1~6) : 3

	�˻��� ��� �Է� : �����

	[�˻� ��� ���]
	�׸��� �������� �ʽ��ϴ�.

	[�޴� ����]
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	>> �޴� ����(1~6) : 4

	������ ��� �Է� : ���ΰ�

	[���� ��� ���]
	�׸��� �������� �ʾ� ������ �� �����ϴ�.

	[�޴� ����]
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	>> �޴� ����(1~6) : 4

	������ ��� �Է� : �����

	[���� ��� ���]
	����� �׸��� �����Ǿ����ϴ�.

	[�޴� ����]
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	>> �޴� ����(1~6) : 5

	������ ��� �Է� : ������

	[���� ��� ���]
	������ ����� �������� �ʽ��ϴ�.

    [�޴� ����]
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	>> �޴� ����(1~6) : 5

	������ ��� �Է� : ������
	������ ���� �Է� : ������

	[���� ��� ���]
	������ �Ϸ�Ǿ����ϴ�.
	
	[�޴� ����]
	1. ��� �߰�
	2. ��� ���
	3. ��� �˻�
	4. ��� ����
	5. ��� ����
	6. ����
	>> �޴� ����(1~6) : 6
	
	���α׷� ����
	����Ϸ��� �ƹ� Ű�� ��������...
*/

import java.util.Vector;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Enumeration;

// -> �ϼ�
class Menus
{
	public static final int E_ADD = 1;		//-- ��� �߰�
	public static final int E_DISP = 2;		//-- ��� ���
	public static final int E_FIND = 3;		//-- ��� �˻�
	public static final int E_DEL = 4;		//-- ��� ����
	public static final int E_CHA = 5;		//-- ��� ����
	public static final int E_EXIT = 6;		//-- ����

}

public class Test168
{
	// �ֿ� �Ӽ� ���� -> �ϼ�
	private static final Vector<Object>vt;
	private static BufferedReader br;
	private static Integer sel;			//-- ���ð�
	private static String con;			//-- ��� ����

	// static �ʱ�ȭ ��
	static
	{
		// Vector �ڷᱸ�� ����
		vt = new Vector<Object>();

		// BufferedReader Ŭ���� �ν��Ͻ� ����
		br = new BufferedReader(new InputStreamReader(System.in));

		// ����� �Է°� �ʱ�ȭ
		sel = 1;
		con = "Y";
	}

	// �޴� ��� �޼ҵ�
	public static void menuDisp()
	{
		System.out.println("[�޴� ����]");
		System.out.println("1. ��� �߰�");
		System.out.println("2. ��� ���");
		System.out.println("3. ��� �˻�");
		System.out.println("4. ��� ����");
		System.out.println("5. ��� ����");
		System.out.println("6. ����");
	}

	// �޴� ���� �޼ҵ�
	public static void menuSelect() throws IOException
	{	
		boolean isNotNumber = false;
		do
		{
			System.out.print(">> �޴� ����(1~6) : ");
		
			isNotNumber = false;
			try
			{
				sel = Integer.parseInt(br.readLine());
			}
			catch (NumberFormatException e) // �Է��� ���� ���ڰ� �ƴ� ����
			{
				System.out.print("\n���ڸ� �Է��� �ּ���.\n\n");
				// �޴� �ٽ� ���
				menuDisp();
				isNotNumber = true;
			}	
		}
		while (isNotNumber);
		
	}
	
	// ���õ� �޴� ���࿡ ���� ��� ȣ�� �޼ҵ�
	public static void menuRun() throws IOException
	{
		System.out.println();
		switch(sel)
		{
			case Menus.E_ADD: addElement(); break;
			case Menus.E_DISP: dispElement(); break;
			case Menus.E_FIND: findElement(); break;
			case Menus.E_DEL: delElement(); break;
			case Menus.E_CHA: chaElement(); break;
			case Menus.E_EXIT: exit();
			default : 
				System.out.println("�߸��� �Է��Դϴ�.");
		}
		System.out.println();
	}

	// ��� �߰�(�Է�) �޼ҵ�
	public static void addElement() throws IOException
	{
		// teacher's code
		do
		{
			System.out.printf("\n\t%d ��° ��� �Է� : ", vt.size() + 1);
			String element = br.readLine();
			boolean b = vt.add(element);
			if(b)
			{
				System.out.printf("\t%d ��° ��� �Է� ���� !!!", vt.size());
			}
			System.out.printf("%n%n\t��� �Է� ��� (Y/N)? : ");
			con = br.readLine().toUpperCase();
		
		} while (con.equals("Y"));
		/*
		int inputCount = 1;
		do
		{
			System.out.printf("%d��° ��� �Է� : ", inputCount);
			vt.add(br.readLine());
			System.out.printf("%d��° ��� �Է� ����~!!!\n", inputCount);
			++inputCount;
			
			boolean checkFail = true;
			String checkArr[] = {"y", "Y", "n", "N"};

			do
			{
				checkFail = true;
				System.out.print("��� �Է� ���(Y/N)? : ");
				con = br.readLine();
				
				// ���ϴ� �Է°����� �ԷµǾ����� Ȯ��
				for(String s : checkArr)
				{
					if(con.equals(s))
					{
						System.out.println();
						checkFail = false;
						break;
					}
				}

				if(checkFail) System.out.println("�߸��� �Է�");
			} while (checkFail);	
				
		} while (con.equals("Y") || con.equals("y"));
		*/
	}

	// ��� ��� �޼ҵ�
	public static void dispElement()
	{
		// teacher's code
		System.out.printf("\n\n\t[���� ��ü ���]\n");
		for(Enumeration e = vt.elements(); e.hasMoreElements() ;)
		{
			System.out.printf("\t%10s \n", e.nextElement());
		}
		System.out.printf("\t���� ��ü ��� �Ϸ�~!!!\n");
		/*
		System.out.println("[���� ��ü ���]");

		for(Object obj : vt)
			System.out.printf("      %s\n", obj);

		System.out.println("���� ��ü ��� �Ϸ�~!!!");
		*/
	}

	// ��� �˻� �޼ҵ�
	public static void findElement() throws IOException
	{
		System.out.print("\n\t�˻��� ��� �Է� : ");
		String element = br.readLine();

		System.out.println("\n\t[�˻� ��� ���]");
		if(vt.contains(element))
		{
			System.out.println("\t�׸��� �����մϴ�.");

			// �׽�Ʈ(Ȯ��)
			int i = vt.indexOf(element);
			System.out.println("\t(" + element + "��ġ : " + i + ")");
		}
		else
		{
			System.out.println("\t�׸��� �������� �ʽ��ϴ�.");
		}

		/*
		System.out.print("�˻��� ��� �Է� : ");
		String inputStr = br.readLine(); 
		
		System.out.println();
		System.out.println("[�˻� ��� ���]");
		if(vt.contains(inputStr))
			System.out.println(inputStr + " �׸��� �����մϴ�!");
		else
			System.out.println("�׸��� �������� �ʽ��ϴ�.");
		*/
	}

	// ��� ���� �޼ҵ�
	public static void delElement() throws IOException
	{
		System.out.print("������ ��� �Է� : ");
		String inputStr = br.readLine(); 
		
		boolean isDeleted = vt.removeElement(inputStr);

		System.out.println();
		System.out.println("[���� ��� ���]");
		if(isDeleted)
			System.out.println(inputStr + " �׸��� �����Ǿ����ϴ�.");
		else
			System.out.println("�׸��� �������� �ʾ� ������ �� �����ϴ�.");
		
	}

	// ��� ����(����) �޼ҵ�
	public static void chaElement() throws IOException
	{
		System.out.print("������ ��� �Է� : ");
		String inputStr = br.readLine(); 
		
		int idx = vt.indexOf(inputStr);
		if(idx >= 0)
		{
			System.out.print("������ ���� �Է� : ");
			String changeStr = br.readLine();

			vt.set(idx, changeStr);
		}

		System.out.println();
		System.out.println("[���� ��� ���]");
		if(idx >= 0)
			System.out.println("������ �Ϸ�Ǿ����ϴ�.");
		else
			System.out.println("������ ����� �������� �ʽ��ϴ�.");
		
	}

	// ���α׷� ���� �޼ҵ� -> �ϼ�
	public static void exit()
	{
		System.out.println("\n\t���α׷� ����~!!!");
		System.exit(-1);
	}
	
	// main() �޼ҵ� -> �ϼ�
	public static void main(String[] args) throws IOException
	{
		do
		{
			menuDisp();
			menuSelect();
			menuRun();
		}
		while (true);
	}
}
*/