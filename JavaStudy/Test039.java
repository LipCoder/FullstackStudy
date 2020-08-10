/*=======================================================
	 ���� ���� �帧�� ��Ʈ�� (���) ����
	 - ���ǹ�(�б⹮)
	 - switch �� �ǽ�
=========================================================*/

/*
�� ���� ���ù��̶� �ϸ�, switch �� ������ ���� ���� ����
   ���� ������ ���� �������� �б��� �� ����ϴ� �����̴�.

�� ���� �� ����
   switch(����)
   {
	   case ���1 : ����1; [break;]
	   case ���2 : ����2; [break;]
	   			  .
				  .
	   [default : ���� n+1; [break;]]
   }

   switch ���� [����]�� case�� [���]��
   byte, short, int, long ���̾�� �Ѵ�.

   case �� �ڿ� [break;]�� ���� ������ ���
   ���� case ������ ����ؼ�(�̾) �����ϰ� ���ϴ�. (-> �⺻ ��)



*/
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;
public class Test039
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String name;
		int kor, eng, math, avg;
		char grade;

		System.out.print("�̸� �Է� : ");
		name = br.readLine();
		System.out.print("�������� �Է� : ");
		kor = Integer.parseInt(br.readLine());
		System.out.print("�������� �Է� : ");
		eng = Integer.parseInt(br.readLine());
		System.out.print("�������� �Է� : ");
		math = Integer.parseInt(br.readLine());

		avg = (kor + eng + math) / 3;
		grade = 'F';

		/*
		if(avg >= 90)
			grade = 'A';
		else if(avg >= 80)
			grade = 'B';
		else if(avg >= 70)
			grade = 'C';
		else if(avg >= 60)
			grade = 'D';
		else
			grade = 'F';
		*/

		switch((avg / 10) * 10)
		{
			case 100: 
			case 90: grade = 'A'; break;
			case 80: grade = 'B'; break;
			case 70: grade = 'C'; break;
			case 60: grade = 'D'; break;
			// default: grade = 'F'; // �ʱ�ȭ�� �̹� �����Ƿ� ���� ����
		}
		
		System.out.println();
		System.out.printf("����� �̸��� %s �Դϴ�.\n", name);
		System.out.printf("������ %d, ����� %d �Դϴ�.\n", (kor + eng + math), avg);
		System.out.printf("����� %c �Դϴ�.\n", grade);
	}
}