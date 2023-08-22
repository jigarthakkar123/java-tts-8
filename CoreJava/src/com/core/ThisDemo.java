package com.core;

class Student
{
	int rno;
	String sname;
	public Student() {
		System.out.println("Default Constructor");
	}
	public Student(int rno, String sname) {
		this();
		System.out.println("Parameterized Constructor");
		this.rno = rno;
		this.sname = sname;
		
	}
	void show()
	{
		System.out.println("Roll No : "+rno);
		System.out.println("Student Name : "+sname);
	}
}
public class ThisDemo {
	public static void main(String[] args) {
		Student s1=new Student(1,"Jigar");
		s1.show();
	}
}
