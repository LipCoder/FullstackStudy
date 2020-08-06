/*=======================================================
     ���� �ڹ� �⺻ ���α׷��� ����
	 - ������ �ڷ���
	 - �ڹ��� �⺻ ����� : BufferedReader Ŭ����
=========================================================*/
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test011
{
	public static void main(String[] args) throws IOException // IO ���ܻ�Ȳ �޴����� ���ܻ�Ȳ�� �߻��ϸ� �ܺη� �����ڴ�.
	{
		// ��ü Ŭ���� : Scanner
		// Buffering : Buffer�� �����͸� ������ ����
		
		// new BuffereReader(������ �Է� �帧)
		// System.in : ����Ʈ �Է� �帧
		// InputStreamReader : ����Ʈ�� ���ڿ��� ,������ (System.in)
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		// ���� : BufferedReader br = new BufferReader( ������ (System.in));
		// BufferedReader �ν��Ͻ� ��������

		// �ֿ� ���� ����
		int r;							// --������
		final double PI = 3.141592;		// --������
		double a, l;					// --����, �ѷ�

		// ���� �� ó��
		
		
		// 1. ����ڿ��� �ȳ� �޼��� ���
		System.out.print("���� ������ �Է� : ");
		
		
		// 2. ����ڰ� �Է��� ���� �޾ƿ� ������ ���� r�� ��Ƴ���
		// BufferedReader �ȿ�... readLine() �޼ҵ�... �ܺ� �Է°� ��������
		// r = br.readLine();
		// r = "30"; -----------(X)
		// r = parseInt();			-> �Ű������� �Ѱܹ��� 
		//							   ���� ����� ���ڿ� �����͸� ���������� ��ȯ
		// r = Integer.parseInt();	-> Integer�� ����ִ� parseInt();
		// r = Integer.parseInt("30");
		r = Integer.parseInt(br.readLine());
		// r = Integer.parseInt("30");
		// r = 30;

		// -- ����ڰ� �Է��� ���� BufferedReader(br)�� [readLine()]
		//    �޼ҵ带 Ȱ���Ͽ� �о���� ��
		//    �� ���� [Integer.parseInt()]�� ���� ������(������)���� ��ȯ�� ��
		//    ���� ������ ������ ���� r�� ��Ƴ���


		// 3. ���� ���� �� �ѷ� ����
		a = r * r * PI;
		l = 2 * r * PI;
		

		// 4. ���� ��� �� ���
		/*
		System.out.println(">> ���� : " + a);
		System.out.println(">> �ѷ� : " + l);
		*/

		/*
		System.out.printf(">> ���� : %f\n", a);
		System.out.printf(">> �ѷ� : %f\n", l);
		*/
		
		System.out.printf(">> ���� : %.4f\n", a);
		System.out.printf(">> �ѷ� : %.4f\n", l);
		// -- [%f]�� �Ǽ����� ��Ƴ��� �ɼ� ����
		//    [%.4f]�� �Ҽ��� ���� �� ��° �ڸ����� ǥ���ϰڴٴ� �ǹ�
		// -- 5��° �ڸ����� �ݿø�

	}
}

/*
���� ������ �Է� : 30
>> ���� : 2827.4328
>> �ѷ� : 188.4955
����Ϸ��� �ƹ� Ű�� �����ʽÿ� . . .
*/