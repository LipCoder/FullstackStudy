//import java.util.Scanner;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

class CircleTest
{
	final double PI = 3.141592;
	int r = 0;
	
	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		//Scanner sc = new Scanner(System.in);
		
		System.out.print("반지름 입력 : ");
		//r = sc.nextInt();
		r = Integer.parseInt(br.readLine());
	}

	double calcArea()
	{
		return r * r * PI;
	}

	double calcRound()
	{
		return 2 * r * PI;
	}

	void print(double area, double round)
	{
		System.out.printf("\n반지름이 %d인 원의\n", r);
		System.out.printf("넓이 : %.2f\n", area);
		System.out.printf("둘레 : %.2f\n", round);
	}
}