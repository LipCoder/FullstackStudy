/*=======================================================
	 ���� ���ҵ�� ������ ������ ����
	 - �޼ҵ��� ���ȣ��
=========================================================*/


public class Test069
{
	public static void main(String[] args)
	{
		showHi(5);
	}

	public static void showHi(int cnt)
	{
		System.out.println("Hi~");
		if(cnt==1) return;
		showHi(--cnt);
	}
}