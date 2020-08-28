/*=======================================================
      ■■■ 예외(Exception) 처리 ■■■
=========================================================*/

import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

public class Test154
{
	private String[] data = new String[3];

	public void proc() // throws IOException	// check~!!!
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String str;
		int n = 0;

		try
		{
			System.out.print("이름 입력[종료 : Ctrl+z] : ");

			while((str = br.readLine()) != null)
			{
				data[n++] = str;
				System.out.print("이름 입력[종료 : Ctrl+z] : ");
			}

		}
		catch (ArrayIndexOutOfBoundsException e)
		{
			System.out.println("======[예외 발생]======");
			System.out.println("getMessage : " + e.getMessage());
			System.out.println("toString   : " + e.toString());
			System.out.println("printStackTrace.............");
			e.printStackTrace();
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}

		
		System.out.println("\n입력된 내용...");
		for(String s : data)
		{
			if(s != null)
				System.out.println(s);
		}

	}

	public static void main(String[] args) // throws IOException	// check~!!!
	{
		Test154 ob = new Test154();
		ob.proc();
	}
}