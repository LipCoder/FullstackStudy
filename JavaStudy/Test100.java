/*=======================================================
	 ���� �迭 ����
	 - �迭�� ����
=========================================================*/

// �� �迭 ������ ���翡�� ������ ����, �ּҰ� ���� �� ���� ���°� �����Ѵ�.
//	  �ּҰ� ���� -> ���� ���� -> ������ �����ϸ� ���纻�� ������ ��ġ�� �Ǵ� ���� ���
//								  (�迭 �� �ƴ϶� ��� ������ �����Ϳ� �ش��ϴ� ���)
//    ������ ���� -> ���� ���� -> ���� ��Ұ� ����ִ� ���� ���� ����� 
//								  ������ �����ص� ���纻�� ������ ��ġ�� �ʴ� ���� ���

// Test099.java ���ϰ� ��~!!!

// ������ ����
// -- int�� �迭�� ���� ���� �ǹ��� ���縦 ó���ϴ�
//	  �޼ҵ带 �����ϴ� ���·� �ǽ��� �����Ѵ�.


public class Test100
{
	public static void main(String[] args)
	{
		int[] nums = {10, 20, 30, 40, 50};		// -- �迭 ����

		int[] copys1 = nums;					// -- ���� �ǹ��� �迭 ���� ����
												//    (�ּҰ� ����)
		int[] copys2 = copyArray(nums);			// -- ���� �ǹ��� �迭 ���� ����
												//    (����� ���� �޼ҵ� ȣ��)
		int[] copys3 = (int[])nums.clone();		// -- ���� �ǹ��� �迭 ���� ����
												//	  (�ڹ� ���� -> clone() �޼ҵ� ȣ��)

		// ���� �迭 ����� ����~!!!
		nums[1] = 2;
		
		System.out.print("copys1 : ");
		for(int i = 0; i < copys1.length; i++)
			System.out.print(copys1[i] + " ");
		System.out.println();
		//--==>> 10 2 30 40 50

		System.out.print("copys2 : ");
		for(int i = 0; i < copys2.length; i++)
			System.out.print(copys2[i] + " ");
		System.out.println();
		// --==>> copys2 : 10 20 30 40 50
		
		System.out.print("copys3 : ");
		for(int i = 0; i < copys3.length; i++)
			System.out.print(copys3[i] + " ");
		System.out.println();
		// --==>> copys3 : 10 20 30 40 50
	}

	// �Ű������� int �迭 Ÿ���� �Ѱܹ޾�
	// �̸� ������ ��
	// ������ �迭�� ��������� ��ȯ�ϴ� ����� ���� �޼ҵ� ����
	public static int[] copyArray(int[] os)	// {10, 20, 30, 40, 50}
	{
		// �Ű������� �Ѱܹ��� �迭(os)
		// ��, ���� �迭 ��ŭ�� �迭��(�޸� ����, ����)�� Ȯ����
		// ������ �迭�� ����
		int[] result = new int[os.length];  // int[] result = new int[5];

		// ���� �迭(os)�� ����ִ� ������ ��ҵ��� ���� �迭(result)�� ��Ƴ���
		for(int i = 0; i < os.length; i++)		// for(int i = 0; i < result.length; i++)
		{
			result[i] = os[i];
		}

		// ������ �迭(result) ��ȯ
		return result;
	}
}