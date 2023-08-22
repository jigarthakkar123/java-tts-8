package com.core;

public class StaticMathod {

	static int a=10;
	static int b;
	
	static
	{
		System.out.println("Static Block Initialized 1");
	}
	{
		System.out.println("Block 1");
	}
	static void meth(int x)
	{
		System.out.println("A : "+a);
		System.out.println("B : "+b);
		System.out.println("X : "+x);
	}
	static
	{
		System.out.println("Static Block Initialized");
		b=a*4;
	}
	
	public static void main(String[] args) {
		meth(12);
		StaticMathod s1=new StaticMathod();
	}
	public StaticMathod() {
		System.out.println("Default Constructor");
	}
	{
		System.out.println("Block 2");
	}
}
