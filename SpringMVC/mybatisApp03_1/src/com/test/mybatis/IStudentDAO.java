package com.test.mybatis;

import java.util.ArrayList;

public interface IStudentDAO
{
	public int add(StudentDTO s);
	public int count();
	public ArrayList<StudentDTO> list();
	public int modify(StudentDTO s);
	public int remove(StudentDTO s);
	public StudentDTO search(StudentDTO s);
}
