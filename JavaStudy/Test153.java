/*=======================================================
      ■■■ 예외(Exception) 처리 ■■■
=========================================================*/

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

public class Test153
{
	private String[] data = new String[3];

	public void proc() throws IOException	// check~!!!
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String str;
		int n = 0;

		System.out.print("이름 입력[종료 : Ctrl+z] : ");

		while((str = br.readLine()) != null)
		{
			data[n++] = str;
			System.out.print("이름 입력[종료 : Ctrl+z] : ");
		}

		System.out.println("입력된 내용...");
		for(String s : data)
		{
			if(s != null)
			{
				System.out.println(s);
			}
		}
	}

	public static void main(String[] args) throws IOException	// check~!!!
	{
		Test153 ob = new Test153();
		ob.proc();
	}
}