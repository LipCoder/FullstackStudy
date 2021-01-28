package com.test.mybatis;

import java.util.ArrayList;

public interface IGradeDAO
{
	public int add(GradeDTO g);
	public int count();
	public ArrayList<GradeDTO> list();
	public int modify(GradeDTO g);
	public int remove(GradeDTO g);
	public GradeDTO search(GradeDTO g);
}
