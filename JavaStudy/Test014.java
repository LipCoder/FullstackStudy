/*=======================================================
     ���� �ڹ� �⺻ ���α׷��� ����
	 - �ڹ��� �⺻ ����� : testTwoystem.in.read()
=========================================================*/

// ���� ��)
// �� ���� �Է� : A
// �� �ڸ� ���� �Է� : 7

// >> �Է��� ���� : A
// >> �Է��� ���� : 7
// ����Ϸ��� �ƹ� Ű�� ��������...

// �� [System.in.read()] �޼ҵ�� �� ���ڸ� �����´�.
//    ��, �ϳ��� ���ڸ� �Է¹޾� �Է¹��� �ش� ������
//    ASCII Code ���� ��ȯ�ϰ� �ȴ�.

// �Է� ��⿭ ���۰� ��� ������ ���α׷��� ��ٸ���.
// Enter => \n  +  \r (���� �ٲް� ���ÿ� ĳ���� �����Ѵ�)
import java.io.IOException;

public class Test014
{
	public static void main(String[] args) throws IOException
	{
		char testOne, testTwo;
		
		System.out.print("�� ���� �Է� : ");
		testOne = (char)System.in.read();
		
		// -- �Ű����� (=> ����) ��ŭ �ǳ� �ڴ�.(������)
		System.in.skip(2);

		System.out.print("�� �ڸ� ���� �Է� : ");
		testTwo = (char)System.in.read();

		System.out.println();
		System.out.printf(">> �Է��� ���� : %c\n", testOne);
		System.out.printf(">> �Է��� ���� : %c\n", testTwo);
	}
}

/*
�� ���� �Է� : A
�� �ڸ� ���� �Է� : 7

>> �Է��� ���� : A
>> �Է��� ���� : 7
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/