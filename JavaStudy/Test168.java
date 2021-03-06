/*=======================================================
      ■■■ 컬렉션 프레임워크(Collection Framework) ■■■
=========================================================*/

// Test168 클래스를 완성하여 다음 기능을 가진 프로그램을 구현한다.

/*
실행 예)

	[메뉴 선택]
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	>> 메뉴 선택(1~6) : 1

	1번째 요소 입력 : 허수민
	1번째 요소 입력 성공~!!!
	요소 입력 계속(Y/N)? : y

	2번째 요소 입력 : 진영은
	2번째 요소 입력 성공~!!!
	요소 입력 계속(Y/N)? : n

	[메뉴 선택]
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	>> 메뉴 선택(1~6) : 2

	[벡터 전체 출력]
	    허수민
		진영은
	벡터 전체 출력 완료~!!!

	[메뉴 선택]
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	>> 메뉴 선택(1~6) : 3

	검색할 요소 입력 : 주재완

	[검색 결과 출력]
	항목이 존재하지 않습니다.

	[메뉴 선택]
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	>> 메뉴 선택(1~6) : 4

	삭제할 요소 입력 : 조인경

	[삭제 결과 출력]
	항목이 존재하지 않아 삭제할 수 없습니다.

	[메뉴 선택]
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	>> 메뉴 선택(1~6) : 4

	삭제할 요소 입력 : 허수민

	[삭제 결과 출력]
	허수민 항목이 삭제되었습니다.

	[메뉴 선택]
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	>> 메뉴 선택(1~6) : 5

	변경할 요소 입력 : 조윤상

	[변경 결과 출력]
	변경할 대상이 존재하지 않습니다.

    [메뉴 선택]
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	>> 메뉴 선택(1~6) : 5

	변경할 요소 입력 : 진영은
	수정할 내용 입력 : 조영욱

	[변경 결과 출력]
	변경이 완료되었습니다.
	
	[메뉴 선택]
	1. 요소 추가
	2. 요소 출력
	3. 요소 검색
	4. 요소 삭제
	5. 요소 변경
	6. 종료
	>> 메뉴 선택(1~6) : 6
	
	프로그램 종료
	계속하려면 아무 키나 누르세요...
*/

import java.util.Vector;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Enumeration;

// -> 완성
class Menus
{
	public static final int E_ADD = 1;		//-- 요소 추가
	public static final int E_DISP = 2;		//-- 요소 출력
	public static final int E_FIND = 3;		//-- 요소 검색
	public static final int E_DEL = 4;		//-- 요소 삭제
	public static final int E_CHA = 5;		//-- 요소 변경
	public static final int E_EXIT = 6;		//-- 종료

}

public class Test168
{
	// 주요 속성 구성 -> 완성
	private static final Vector<Object>vt;
	private static BufferedReader br;
	private static Integer sel;			//-- 선택값
	private static String con;			//-- 계속 여부

	// static 초기화 블럭
	static
	{
		// Vector 자료구조 생성
		vt = new Vector<Object>();

		// BufferedReader 클래스 인스턴스 생성
		br = new BufferedReader(new InputStreamReader(System.in));

		// 사용자 입력값 초기화
		sel = 1;
		con = "Y";
	}

	// 메뉴 출력 메소드
	public static void menuDisp()
	{
		System.out.println("[메뉴 선택]");
		System.out.println("1. 요소 추가");
		System.out.println("2. 요소 출력");
		System.out.println("3. 요소 검색");
		System.out.println("4. 요소 삭제");
		System.out.println("5. 요소 변경");
		System.out.println("6. 종료");
	}

	// 메뉴 선택 메소드
	public static void menuSelect() throws IOException
	{	
		boolean isNotNumber = false;
		do
		{
			System.out.print(">> 메뉴 선택(1~6) : ");
		
			isNotNumber = false;
			try
			{
				sel = Integer.parseInt(br.readLine());
			}
			catch (NumberFormatException e) // 입력한 값이 숫자가 아닌 예외
			{
				System.out.print("\n숫자를 입력해 주세요.\n\n");
				// 메뉴 다시 출력
				menuDisp();
				isNotNumber = true;
			}	
		}
		while (isNotNumber);
		
	}
	
	// 선택된 메뉴 실행에 따른 기능 호출 메소드
	public static void menuRun() throws IOException
	{
		System.out.println();
		switch(sel)
		{
			case Menus.E_ADD: addElement(); break;
			case Menus.E_DISP: dispElement(); break;
			case Menus.E_FIND: findElement(); break;
			case Menus.E_DEL: delElement(); break;
			case Menus.E_CHA: chaElement(); break;
			case Menus.E_EXIT: exit();
			default : 
				System.out.println("잘못된 입력입니다.");
		}
		System.out.println();
	}

	// 요소 추가(입력) 메소드
	public static void addElement() throws IOException
	{
		// teacher's code
		do
		{
			System.out.printf("\n\t%d 번째 요소 입력 : ", vt.size() + 1);
			String element = br.readLine();
			boolean b = vt.add(element);
			if(b)
			{
				System.out.printf("\t%d 번째 요소 입력 성공 !!!", vt.size());
			}
			System.out.printf("%n%n\t요소 입력 계속 (Y/N)? : ");
			con = br.readLine().toUpperCase();
		
		} while (con.equals("Y"));
		/*
		int inputCount = 1;
		do
		{
			System.out.printf("%d번째 요소 입력 : ", inputCount);
			vt.add(br.readLine());
			System.out.printf("%d번째 요소 입력 성공~!!!\n", inputCount);
			++inputCount;
			
			boolean checkFail = true;
			String checkArr[] = {"y", "Y", "n", "N"};

			do
			{
				checkFail = true;
				System.out.print("요소 입력 계속(Y/N)? : ");
				con = br.readLine();
				
				// 원하는 입력값으로 입력되었는지 확인
				for(String s : checkArr)
				{
					if(con.equals(s))
					{
						System.out.println();
						checkFail = false;
						break;
					}
				}

				if(checkFail) System.out.println("잘못된 입력");
			} while (checkFail);	
				
		} while (con.equals("Y") || con.equals("y"));
		*/
	}

	// 요소 출력 메소드
	public static void dispElement()
	{
		// teacher's code
		System.out.printf("\n\n\t[벡터 전체 출력]\n");
		for(Enumeration e = vt.elements(); e.hasMoreElements() ;)
		{
			System.out.printf("\t%10s \n", e.nextElement());
		}
		System.out.printf("\t벡터 전체 출력 완료~!!!\n");
		/*
		System.out.println("[벡터 전체 출력]");

		for(Object obj : vt)
			System.out.printf("      %s\n", obj);

		System.out.println("벡터 전체 출력 완료~!!!");
		*/
	}

	// 요소 검색 메소드
	public static void findElement() throws IOException
	{
		System.out.print("\n\t검색할 요소 입력 : ");
		String element = br.readLine();

		System.out.println("\n\t[검색 결과 출력]");
		if(vt.contains(element))
		{
			System.out.println("\t항목이 존재합니다.");

			// 테스트(확인)
			int i = vt.indexOf(element);
			System.out.println("\t(" + element + "위치 : " + i + ")");
		}
		else
		{
			System.out.println("\t항목이 존재하지 않습니다.");
		}

		/*
		System.out.print("검색할 요소 입력 : ");
		String inputStr = br.readLine(); 
		
		System.out.println();
		System.out.println("[검색 결과 출력]");
		if(vt.contains(inputStr))
			System.out.println(inputStr + " 항목이 존재합니다!");
		else
			System.out.println("항목이 존재하지 않습니다.");
		*/
	}

	// 요소 삭제 메소드
	public static void delElement() throws IOException
	{
		System.out.print("삭제할 요소 입력 : ");
		String inputStr = br.readLine(); 
		
		boolean isDeleted = vt.removeElement(inputStr);

		System.out.println();
		System.out.println("[삭제 결과 출력]");
		if(isDeleted)
			System.out.println(inputStr + " 항목이 삭제되었습니다.");
		else
			System.out.println("항목이 존재하지 않아 삭제할 수 없습니다.");
		
	}

	// 요소 수정(변경) 메소드
	public static void chaElement() throws IOException
	{
		System.out.print("변경할 요소 입력 : ");
		String inputStr = br.readLine(); 
		
		int idx = vt.indexOf(inputStr);
		if(idx >= 0)
		{
			System.out.print("수정할 내용 입력 : ");
			String changeStr = br.readLine();

			vt.set(idx, changeStr);
		}

		System.out.println();
		System.out.println("[변경 결과 출력]");
		if(idx >= 0)
			System.out.println("변경이 완료되었습니다.");
		else
			System.out.println("변경할 대상이 존재하지 않습니다.");
		
	}

	// 프로그램 종료 메소드 -> 완성
	public static void exit()
	{
		System.out.println("\n\t프로그램 종료~!!!");
		System.exit(-1);
	}
	
	// main() 메소드 -> 완성
	public static void main(String[] args) throws IOException
	{
		do
		{
			menuDisp();
			menuSelect();
			menuRun();
		}
		while (true);
	}
}
*/