/*=======================================================
 ���� Ŭ������ �ν��Ͻ� ����
 - Ŭ������ �ν��Ͻ� Ȱ��
=========================================================*/

// 1 ~ 3 ������ ������ �߻����Ѽ�
// ����, ����, �� ���� ���α׷��� �����Ѵ�.
// ��, Ŭ������ ������ Ȱ���Ͽ� ó���� �� �ֵ��� �Ѵ�.
// ����, �迭�� Ȱ���Ͽ� ó���� �� �ֵ��� �Ѵ�.
// ���������� Rps Ŭ������ �ϼ��� �� �ֵ��� �Ѵ�.

// �� ���� ������ -> 1:����, 2:����, 3:��

// ���� ��)
// 1:���� 2:���� 3:�� �� �Է�(1~3) : 4
// 1:���� 2:���� 3:�� �� �Է�(1~3) : -2
// 1:���� 2:���� 3:�� �� �Է�(1~3) : 2

// - ����    : ����
// - ��ǻ��  : ��

// >> �º� ���� ��� : ��ǻ�Ͱ� �̰���ϴ�~!!!
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.util.Scanner;
import java.util.Random;

class RpsGame
{
	// �ֿ� �Ӽ� ����(���� ����)
	private int user;
	private int com;

	// �ֿ� ��� ����(�޼ҵ� ����)
	// - ������� ���� ������ �Է¹޴� ����� �޼ҵ�
	public void input()
	{
		runCom();

		Scanner sc = new Scanner(System.in);

		do
		{
			System.out.print("1:����, 2:����, 3:�� �� �Է�(1~3) : ");
			user = sc.nextInt();
		}
		while (user < 1 || user > 3);
	}
	
	// �ֿ� ��� ����(�޼ҵ� ����)
	// - ��ǻ���� ���� ������ �Է¹޴� ����� �޼ҵ�
	private void runCom()
	{
		Random rd = new Random();
		com = rd.nextInt(3) + 1;	// -- [+1] : 0 1 2 -> 1 2 3
	}

	// �ֿ� ��� ����(�޼ҵ� ����)
	// - �߰� ��� ���(������ ���� ���� Ȯ��)
	public void middleCalc()
	{
		String[] str = {"����", "����", "��"};

		System.out.println();
		System.out.println(" - ����   : " + str[user - 1]);
		System.out.println(" - ��ǻ�� : " + str[com - 1]);
		// -- [1] : str[1] str[2] str[3] -> str[0] str[1] str[2]
	}

	// �ֿ� ��� ����(�޼ҵ� ����)
	// - �ºο� ���� ����
	public String resultCalc()
	{
		String result = "���º� ��Ȳ�Դϴ�~!!!";

		// (���� == "���� && �� == "��") || (���� == "���� && �� == "����") || (���� == "�� && �� == "����")
		if((user ==  1 && com == 3) || (user == 2 && com == 1) || (user == 3 && com == 2) )	// ����� �¸��� ��Ȳ
		{
			result = "����� �¸��߽��ϴ�~!!!";
		}
		// (���� == "���� && �� == "����") || (���� == "���� && �� == "��") || (���� == "�� && �� == "����")
		else if((user == 1 && com == 2) || (user == 2 && com == 3) || (user == 3 && com == 1))	// ��ǻ�Ͱ� �¸��� ��Ȳ
		{
			result = "��ǻ�Ͱ� �¸��߽��ϴ�~!!!";
		}

		return result;
	}

	// �ֿ� ��� ����(�޼ҵ� ����)
	// - ���� ��� ���
	public void print(String str)
	{
		System.out.printf("\n>> �º� ���� ��� : %s\n", str);	//
	}
}

// main() �޼ҵ带 �����ϰ� �ִ� �ܺ��� �ٸ� Ŭ����
public class Test105
{
	public static void main(String[] args)
	{
		RpsGame ob = new RpsGame();

		ob.input();
		ob.middleCalc();
		String result = ob.resultCalc();
		ob.print(result);
		//System.out.println(result);
		
	}
}

/*
class RpsGame
{
	private final String[] STATE = {"none", "����", "����", "��"};
 	private int user, computer;
	
	// �Է�
	public void input()
	{
		inputUser();
		inputComputer();
	}
	// ���� �Է�
	private void inputUser()
	{
		Scanner sc = new Scanner(System.in);
		do
		{
			System.out.print("1:���� 2:���� 3:�� �� �Է�(1~3) : ");
			user = sc.nextInt();
		}
		while (user < 1 || user > 3);
	}
	// ��ǻ�� �Է�
	private void inputComputer()
	{
		Random r = new Random();
		computer = r.nextInt(3) + 1;
	}


	// ���
	public void print()
	{
		System.out.println();
		System.out.println(" - ����   : " + STATE[user]);
		System.out.println(" - ��ǻ�� : " + STATE[computer]);
		System.out.println();

		String judge = judgeWin(user, computer);
		System.out.println(">> �º� ���� ��� : " +  judge);
	}

	// ���� �̰���� �Ǻ�
	private String judgeWin(int user, int computer)
	{
		String result = "�� �̰���ϴ�~!!!";
		int gap = user - computer;
	
		switch(gap)
		{
			case -2: 
				result = "����" + result; 
				break;
			case -1: 
				result = "��ǻ��" + result; 
				break;
			case 1: 
				result = "����" + result; 
				break;
			case 2:  
				result = "��ǻ��" + result; 
				break;
			default : 
				result = "�����ϴ�~!!!";
		}

		return result;
	}
}

public class Test105
{
	public static void main(String[] args)
	{
		RpsGame rg = new RpsGame();

		rg.input();
		rg.print();
	}
}
*/