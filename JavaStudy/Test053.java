/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - �ݺ��� �ǽ�
=========================================================*/

// �� ����
// ����ڷκ��� ���ϴ� ��(������)�� �Է¹޾�
// �̿� �ش��ϴ� �������� ����ϴ� ���α׷��� �����Ѵ�.
// ��, 1 ~ 9�� ������ ���� �Է¹��� ��Ȳ�� �ƴ϶��
// ���α׷��� ������ ���� �� �ֵ��� ó���Ѵ�.

// ���� ��)
// ���ϴ� ��(������) �Է� : 7
// 7 * 1 = 7
// 7 * 2 = 14
// ...
// 7 * 9 = 63
// ����Ϸ��� �ƹ� Ű�� ��������...

// ���ϴ� ��(������) �Է� : 11
// 1���� 9������ ������ �Է��� �����մϴ�.
// ����Ϸ��� �ƹ� Ű�� ��������...

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test053
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int num;
		int count = 1;

		System.out.print("���ϴ� ��(������) �Է� : ");
		num = Integer.parseInt(br.readLine());
		
		// 1 ~ 9�� �ƴ� ��� �������� ������� �ʴ´�.
		if(num < 1 || num > 9)
		{
			System.out.println("1���� 9������ ������ �Է��� �����մϴ�.");
			return;
		}

		while(count <= num)
		{
			System.out.printf("%d * %d = %d\n", num, count, (num * count));
			++count;
		}
	}
}