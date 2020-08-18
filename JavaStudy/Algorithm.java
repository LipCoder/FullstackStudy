import java.lang.Math;

class Solution
{
	public int solution(int N) 
	{
		int left = 0, right = 0;
		int min = (N + 1) * 2;
		int beforeNum = 0;
		for(int i = 1; i <= Math.sqrt(N); ++i)
		{
			if(N % i == 0)
			{
				left = i;
				right = N / i;
				if(beforeNum == right) break;

				int result = (left + right) * 2;
				if(min > result) min = result;
				beforeNum = i;
			}
		}

		return min;
	}
}