// RecordViewImpl2.java
// - 클래스
// - RecordView 인터페이스를 구현하는 클래스로 설계

package com.test.spr;

import java.util.Scanner;

public class RecordViewImpl2 implements RecordView
{
	// check~!!!
	// 주요 속성 구성 → 인터페이스 형태의 자료형 구성
	private Record record;
	
	@Override
	public void setRecord(Record record)
	{
		this.record = record;
	}

	@Override
	public void input()
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.print("국어 점수를 입력하세요 : ");
		String kor = sc.next();
		System.out.print("영어 점수를 입력하세요 : ");
		String eng = sc.next();
		System.out.print("수학 점수를 입력하세요 : ");
		String mat = sc.next();
		
		record.setKor(Integer.parseInt(kor));
		record.setEng(Integer.parseInt(eng));
		record.setMat(Integer.parseInt(mat));
		
		sc.close();
	}

	@Override
	public void output()
	{
		System.out.printf("국어 점수 : %4d%n", record.getKor());
		System.out.printf("영어 점수 : %4d%n", record.getEng());
		System.out.printf("수학 점수 : %4d%n", record.getMat());
		System.out.printf("총점 : %5d%n", record.getTotal());
		System.out.printf("평균 : %5.1f%n", record.getAvg());
	}

}
