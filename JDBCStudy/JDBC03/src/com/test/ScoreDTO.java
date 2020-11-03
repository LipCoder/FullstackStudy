package com.test;

// 번호    이름    국어    영어    수학    총점    평균

public class ScoreDTO
{
	private String name;
	private int sid, kor, eng, mat;
	
	public String getName()
	{
		return name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public int getSid()
	{
		return sid;
	}
	
	public void setSid(int sid)
	{
		this.sid = sid;
	}
	
	public int getKor()
	{
		return kor;
	}
	
	public void setKor(int kor)
	{
		this.kor = kor;
	}
	
	public int getEng()
	{
		return eng;
	}
	public void setEng(int eng)
	{
		this.eng = eng;
	}
	
	public int getMat()
	{
		return mat;
	}
	
	public void setMat(int mat)
	{
		this.mat = mat;
	}
	
	public int getTot()
	{
		return kor + eng + mat;
	}
	public double getAvg()
	{
		return (kor + eng + mat) / 3.0;
	}
}
