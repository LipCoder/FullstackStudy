/*=======================================================
	 ���� �迭 ����
	 - �迭�� �⺻�� Ȱ��
=========================================================*/

// [char] �ڷ����� �迭�� �����
// �� �迭�� �� �濡 ���ĺ� �빮�ڸ� ä��� 
// ä���� �� �迭�� ��ü ��Ҹ� ����ϴ� ���α׷��� �����Ѵ�.
// ��, ä��� ������ ����ϴ� ������ ���� �и��Ͽ� ó���Ѵ�.

public class Test083
{
	public static void main(String[] args)
	{
		// ��� 1
		/*
		char[] c = new char[26];
		c[0] = 'A';
		//...
		c[25] = 'Z';
		*/

		// ��� 2
		/*
		char[] c = {'A', 'B' , ..., 'Z'};
		*/

		// ��� 3
		char[] arr3 = new char[26];
		for(int i = 0, ch = 65; i < arr3.length; i++, ch++)
			arr3[i] = (char)ch;


		// �迭 ��� ��ü ���
		for(int i = 0; i < arr3.length; ++i)
		{
			System.out.printf("%c ", arr3[i]);
		}
		System.out.println();

		// my code
		/*
		char[] c = new char[('Z' - 'A') + 1];

		for(int i = 0; i < c.length; ++i)
		{
			c[i] = (char)('A' + i);
		}

		for(int i = 0; i < c.length; ++i)
		{
			System.out.printf("%c ", c[i]);
		}
		System.out.println();
		*/
	}
}

/*
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/